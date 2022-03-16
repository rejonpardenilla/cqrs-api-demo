class CreatePost < Command
  attribute :title, Types::String.optional
  attribute :body, Types::String
  attribute :author_id, Types::UUID
end
