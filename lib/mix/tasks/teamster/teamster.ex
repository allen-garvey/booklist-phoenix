defmodule Mix.Tasks.Teamster do
  use Mix.Task

  import Ecto.Query, warn: false

  alias Booklist.Repo
  alias Booklist.RepoLegacy

  alias Teamster.Models.LegacyGenre
  alias Teamster.Models.LegacyAuthor

  @moduledoc """
  Mix tasks to migrate the book_list rails database data to the booklist phoenix application 
  """

  @shortdoc "Migrates data from book_list rails to current booklist phoenix application"
  def run(_) do
    #start app so repo is available
    Mix.Task.run "app.start", []

    genres = RepoLegacy.all(from(LegacyGenre, order_by: [:id]))
    migrate_legacy_models(genres, LegacyGenre)

    authors = RepoLegacy.all(from(LegacyAuthor, order_by: [:id]))
    migrate_legacy_models(authors, LegacyAuthor)
  end


  defp migrate_legacy_models(legacy_models, module_name) when is_atom(module_name) do
  	for legacy_model <- legacy_models do
		Kernel.apply(module_name, :migrate, [legacy_model])
			|> Repo.insert!
    end
  end
end