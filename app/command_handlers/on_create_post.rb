class OnCreatePost < CommandHandler
  NoAuthorFound = Class.new(SerializedError)

  def call(command)
    author = Author.find_by!(id: command.author_id)

    raise NoAuthorFound if author.nil?

    Post.new(
      title: command.title,
      body: command.body,
      author: author,
      deleted_at: nil
    )
  end
end
