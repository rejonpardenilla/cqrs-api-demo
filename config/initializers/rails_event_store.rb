require 'arkency/command_bus'

Rails.configuration.to_prepare do
  Rails.configuration.command_bus = Arkency::CommandBus.new

  Rails.configuration.command_bus.tap do |bus|
    bus.register(CreatePost, OnCreatePost.new)

    # We should be able to map commands (actions) with their command handlers (reactions) with a domain-ish language
    # Some examples are:
    bus.register(UpdatePost, OnUpdatePost.new)
    bus.register(HidePost, OnHidePost.new)
    bus.register(PublishPost, OnPublishPost.new)
  end
end
