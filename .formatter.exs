[
  import_deps: [:ash_postgres, :ash, :ecto, :ecto_sql, :phoenix, :ash_phoenix, :ash_json_api, :picosat_elixir],
  subdirectories: ["priv/*/migrations"],
  plugins: [Spark.Formatter, Phoenix.LiveView.HTMLFormatter],
  inputs: ["*.{heex,ex,exs}", "{config,lib,test}/**/*.{heex,ex,exs}", "priv/*/seeds.exs"]
]
