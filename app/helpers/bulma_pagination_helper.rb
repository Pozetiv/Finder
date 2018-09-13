module BulmaPaginationHelper
    class LinkRenderer < WillPaginate::ActionView::LinkRenderer
        protected

      def page_number(page)
        unless page == current_page
          link(page, page, :rel => rel_value(page))
        else
          link(page, "#", :class => 'pagination-link is-current')
        end
      end

      def gap
        text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
        %(<li class="disabled"><a>#{text}</a></li>)
      end

      def previous_page
        num = @collection.current_page > 1 && @collection.current_page - 1
        previous_or_next_page(num, @options[:previous_label], 'pagination-previous')
      end

      def next_page
        num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
        previous_or_next_page(num, @options[:next_label], 'pagination-next')
      end

      def previous_or_next_page(page, text, classname)
        if page
          link(text, page, :class => classname)
        else
          link(text, "#", :class => classname + ' is-static')
        end
      end

      def html_container(html)
        tag(:nav, tag(:ul, html, class: 'pagination-list'), container_attributes)
      end

    private

        def link(text, target, attributes = {})
        if target.is_a? Fixnum
          attributes[:rel] = rel_value(target)
          target = url(target)
        end

                unless target == "#"
                    attributes[:href] = target
                end

        classname = attributes[:class]
        attributes.delete(:classname)
        tag(:li, tag(:a, text, attributes))
        end
    end
end