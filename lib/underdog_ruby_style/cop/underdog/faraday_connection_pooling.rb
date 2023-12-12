# frozen_string_literal: true

module UnderdogRubyStyle
  module Cop
    module Underdog
      class FaradayConnectionPooling < RuboCop::Cop::Base
        # only run this for #new methods
        RESTRICT_ON_SEND = %i[new].freeze

        def_node_matcher :http_new?, <<~PATTERN
          (send (const _ :Http) :new ...)
        PATTERN

        def on_send(node)
          http_new?(node) do
            block = node.parent
            # ignore if no block given for configuring connection
            return unless block.block_type?

            # 3rd element is the inside of the block
            block_contents = block.to_a[2]

            add_error(block) unless net_http_persistent_configured?(block_contents)
          end
        end

        def net_http_persistent_configured?(block_contents)
          found_net_http_persistent = false
          block_contents.each_node do |n|
            found_net_http_persistent = true if n.to_s.include?("net_http_persistent")
          end
          found_net_http_persistent
        end

        def add_error(node)
          add_offense(
            node,
            message: format("Missing connection pooling config in block, add the following line to the block: " \
                            "`f.adapter(:net_http_persistent, pool_size: POOL_SIZE)`"),
          )
        end
      end
    end
  end
end
