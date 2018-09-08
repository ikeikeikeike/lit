module ApplicationHelper

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


end
