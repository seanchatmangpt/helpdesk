defmodule HelpdeskWeb.JsonApiRouter do
  use AshJsonApi.Router,
    # The api modules you want to serve
    domains: [Helpdesk.Support],
    # optionally an open_api route
    open_api: "/open_api"
end
