Rails.application.configure do
  config.after_initialize do
    begin
      Spree::Property.all.each do |prop|
        Spree::Product.add_search_scope :"#{prop.name}_anything" do |*opts|
          filter = Lit::Core::ProductFilters.property_filters.select{|cond| cond[:scope] == __method__ }
          filter = filter.first || {}

          conds = opts.map { |o| filter[:conds][o] }.reject(&:nil?)
          scope = conds.shift
          conds.each do |new_scope|
            scope = scope.or(new_scope)
          end
          Spree::Product.with_property(prop.name).where(scope)
        end
      end
    rescue
    end
  end
end

