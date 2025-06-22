using Genie.Router
using Genie.Assets

using GojuMan.BooksController

Genie.config.websockets_server = true

route("/") do
  serve_static_file("welcome.html")
end


channel("/____/echo") do
  @info "Received: $(params(:payload))"
  # Genie.WebChannels.broadcast("____", "echo", Dict("Foo" => "Bar"))
  Genie.WebChannels.broadcast("____", "echo", Dict("Foo" => "Bar"))
end


route("/hello") do
  @info Genie.WebChannels.connected_clients()
  Genie.WebChannels.broadcast("____", "Hey!")
  "Welcome to Genie!"
end


route("/books", BooksController.books)
