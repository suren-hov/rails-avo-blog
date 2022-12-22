class CategoryResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  self.search_query = -> do
    scope.ransack(id_eq: params[:q],title_cont: params[:q], m: "or").result(distinct: false)
  end

  field :id, as: :id
  # Fields generated from the model
  field :title, as: :text
  field :description, as: :textarea
  field :posts_count, as: :text do |model| 
    model.posts.count
  end

  field :posts, as: :has_many, attach_scope: -> { query.where.not(category_id: 
  parent.id).or( query.where(category_id: nil))}
end
