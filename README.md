# Helpdesk

Helpdesk is a Phoenix/Ash example application whose observed support domain models representatives and tickets.

## Observed domain

`Helpdesk.Support.Representative` is an Ash resource backed by `Ash.DataLayer.Ets`. A representative has a UUID identifier and required public `name`, exposes read/create actions, and has many tickets.

`Helpdesk.Support.Ticket` is an Ash resource backed by `Ash.DataLayer.Ets`. A ticket has a UUID identifier, required public `subject`, status defaulting to `:open`, and an optional representative relationship. Its code interface exposes `read`, `read_by_id`, `open`, `close`, and `assign`; closing an already closed ticket is rejected.

Both resources enable `AshJsonApi.Resource`. The repository also contains Phoenix and OpenAPI surfaces; this README does not claim behavior beyond the observed source and successful execution evidence available for a given revision.

## Development

The project declares Elixir `~> 1.14` in `mix.exs`.

```bash
mix setup
mix phx.server
```

The documented project test entry point is:

```bash
mix test
```

`mix test` runs the repository's configured Ecto create/migrate steps before the test suite, so a working test database is required by the current Mix aliases even though the two observed support resources use the ETS data layer.

## Acceptance and standing

For a revision to claim runtime `ALIVE`, observe execution against that exact revision rather than inferring standing from source inspection. At minimum, use the repository's relevant compile/test checks and any exercised HTTP/JSON:API path required by the change. Preserve exact failures rather than treating documentation or inspection as execution evidence.

The canonical project documentation is this root `README.md`; duplicate placeholder READMEs are not authoritative.
