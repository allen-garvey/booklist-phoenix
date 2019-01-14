defmodule BooklistWeb.ReportsView do
  use BooklistWeb, :view

  @doc """
  Returns a link to the reports for the current year
  """
  def reports_for_current_year_path(conn) do
    current_year = Date.utc_today.year
    Routes.reports_path(conn, :show, current_year)
  end

end
