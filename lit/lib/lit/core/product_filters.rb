# frozen_string_literal: true

module Lit
  module Core
    module ProductFilters
      # @see lit/config/initializers/product_filters.rb

      def self.property_filters
        pp = Spree::ProductProperty.arel_table

        Spree::Property.all.map do |prop|
          props = Spree::ProductProperty.where(property_id: prop.id).pluck(:value).uniq.map(&:to_s)
          conds = Hash[*props.map { |b| [b, pp[:value].eq(b)] }.flatten]

          {
            name:   prop.presentation,
            scope:  :"#{prop.name}_anything",
            conds:  conds,
            labels: props.sort.map { |k| [k, k] }
          }
        end
      end

    end
  end
end
