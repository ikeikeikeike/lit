Rails.application.configure do
  config.after_initialize do
    if ActiveRecord::Base.connection.active?
      Spree::Property.all.each do |prop|
        Spree::Product.add_search_scope :"#{prop.name}_anything" do |*opts|
          conds = opts.map { |o| Spree::Core::ProductFilters.brand_filter[:conds][o] }.reject(&:nil?)
          scope = conds.shift
          conds.each do |new_scope|
            scope = scope.or(new_scope)
          end
          Spree::Product.with_property(prop.name).where(scope)
        end
      end
    end
  end
end

