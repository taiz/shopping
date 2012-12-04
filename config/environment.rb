# encoding: utf-8
#---
# Excerpted from "Agile Web Development with Rails, 4th Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#
# 日本語版については http://ssl.ohmsha.co.jp/cgi-bin/menu.cgi?ISBN=978-4-274-06866-9
#---

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Depot::Application.initialize!

require 'will_paginate/view_helpers/link_renderer'
require 'will_paginate/view_helpers/link_renderer_base'

module WillPaginate
  module ViewHelpers
    class LinkRenderer

      def page_number(page)
        unless page == current_page
          link_with_sort(page, page, :rel => rel_value(page))
        else
          tag(:em, page, :class => 'current')
        end
      end

      def link_with_sort(text, target, attributes = {})
        if target.is_a? Fixnum
          attributes[:rel] = rel_value(target)
          target = url(target)
          target << ";sort_by=#{@options[:sort_by]};order=#{@options[:order]}"
        end
        attributes[:href] = target
        attributes["data-remote"] = true
        tag(:a, text, attributes)
      end

    end
  end
end

