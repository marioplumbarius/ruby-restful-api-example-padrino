class Paginator

  DEFAULT_PAGE = 1

  def self.paginate_relation(kaminari_relation, params)
    map_from_relation_to_hash(
      kaminari_relation,
      params[:page].try(:to_i) || DEFAULT_PAGE,
      params[:per_page].try(:to_i) || kaminari_relation.default_per_page,
      kaminari_relation.total_count
    )
  end

  def self.map_from_relation_to_hash(items, page, per_page, total_items)
    {
      items: items,
      meta: {
        page: page,
        per_page: per_page,
        total_items: total_items
      }
    }
  end

end
