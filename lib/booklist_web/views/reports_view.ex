defmodule BooklistWeb.ReportsView do
  use BooklistWeb, :view

  @doc """
  Returns a link to the reports for the current year
  """
  def reports_for_current_year_path(conn) do
    current_year = Date.utc_today.year
    Routes.reports_path(conn, :show, current_year)
  end

  @doc """
  Rounds decimal
  Safe to use if decimal is nil
  """
  def round_decimal(nil) do
    0
  end 

  def round_decimal(decimal) do
    decimal
      |> Decimal.to_float 
      |> Float.round(2)
  end

  @doc """
  Returns database results as json string
  """
  def ratings_by_week_to_json(results) do
    results
      |> Enum.map(fn result -> result[:count] end)
      |> Poison.encode!(results)
  end

end
