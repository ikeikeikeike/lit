module ApplicationHelper
  include Spree::Core::ControllerHelpers::Search

  def lit_breadcrumbs(taxon, separator='&nbsp;', breadcrumb_class='breadcrumbs')
    return '' if current_page?('/') || taxon.nil?

    crumbs = [[t('spree.home'), spree.root_path]]

    crumbs << [t('spree.products'), products_path]
    if taxon
      crumbs += taxon.ancestors.collect { |a| [a.name, spree.nested_taxons_path(a.permalink)] } unless taxon.ancestors.empty?
      crumbs << [taxon.name, spree.nested_taxons_path(taxon.permalink)]
    end

    separator = raw(separator)

    items = crumbs.each_with_index.collect do |crumb, i|
      content_tag(:li, itemprop: 'itemListElement', itemscope: '', itemtype: 'https://schema.org/ListItem') do
        link_to(crumb.last, itemprop: 'item') do
          content_tag(:span, crumb.first, itemprop: 'name') + tag('meta', { itemprop: 'position', content: (i + 1).to_s }, false, false)
        end
      end + (unless crumb == crumbs.last
        content_tag(:li, class: 'separator') do
         separator
        end
      end)
    end

    content_tag :nav,
      content_tag(:ul, raw(items.map(&:mb_chars).join), class: breadcrumb_class, itemscope: '', itemtype: 'https://schema.org/BreadcrumbList')
  end

  def lit_tree(root_taxon, current_taxon, max_level = 1, klass='sub-menu')
    return '' if max_level < 1 || root_taxon.children.empty?
    content_tag :ul, class: klass do
      taxons = root_taxon.children.map do |taxon|
        css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'current active' : nil
        content_tag :li, class: css_class do
         link_to(taxon.name, seo_url(taxon)) +
           lit_tree(taxon, current_taxon, max_level - 1, klass)
        end
      end
      safe_join(taxons, "\n")
    end
  end

end
