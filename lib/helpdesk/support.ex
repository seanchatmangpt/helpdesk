defmodule Helpdesk.Support do
  use Ash.Domain, extensions: [AshJsonApi.Domain]

  resources do
    resource(Helpdesk.Support.Ticket)
    resource(Helpdesk.Support.Representative)
  end

  json_api do
    routes do
      # in the domain `base_route` acts like a scope
      base_route "/tickets", Helpdesk.Support.Ticket do
        get :read
        index :read
        post :open
        patch :close
        patch :assign
      end

      base_route "/representatives", Helpdesk.Support.Representative do
        get :read
        index :read
      end
    end
  end
end
