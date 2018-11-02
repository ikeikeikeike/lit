# frozen_string_literal: true

module Lit
  module Core
    module ProductFilters

      Spree::Product.add_search_scope :brand_any do |*opts|
        conds = opts.map { |o| ProductFilters.brand_filter[:conds][o] }.reject(&:nil?)
        scope = conds.shift
        conds.each do |new_scope|
          scope = scope.or(new_scope)
        end
        Spree::Product.with_property('brand').where(scope)
      end

      def self.brand_filter
        brand_property = Spree::Property.where('LOWER(name) = ?', 'brand').first
        brands = brand_property ? Spree::ProductProperty.where(property_id: brand_property.id).pluck(:value).uniq.map(&:to_s) : []
        pp = Spree::ProductProperty.arel_table
        conds = Hash[*brands.map { |b| [b, pp[:value].eq(b)] }.flatten]
        {
          name:   'Brands',
          scope:  :brand_any,
          conds:  conds,
          labels: brands.sort.map { |k| [k, k] }
        }
      end

      Spree::Product.add_search_scope :selective_brand_any do |*opts|
        Spree::Product.brand_any(*opts)
      end

      def self.selective_brand_filter(taxon = nil)
        taxon ||= Spree::Taxonomy.first.root
        brand_property = Spree::Property.where('LOWER(name) = ?', 'brand').first
        scope = Spree::ProductProperty.where(property: brand_property).
          joins(product: :taxons).
          where("#{Spree::Taxon.table_name}.id" => [taxon] + taxon.descendants)
        brands = scope.pluck(:value).uniq
        {
          name:   'Applicable Brands',
          scope:  :selective_brand_any,
          labels: brands.sort.map { |k| [k, k] }
        }
      end

    end
  end
end
