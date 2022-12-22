class PostResource < Avo::BaseResource
  self.title = :title
  self.includes = [:category]
  self.search_query = -> do
    scope.ransack(id_eq: params[:q], title_cont: params[:q], m: "or").result(distinct: false)
  end

  field :id, as: :id
  # Fields generated from the model
  field :title, as: :text
  field :excerpt, as: :text, only_on: :index
  field :body, as: :trix
  # add fields here

  field :category, as: :belongs_to
end
