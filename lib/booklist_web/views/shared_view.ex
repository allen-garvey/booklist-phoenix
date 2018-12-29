defmodule BooklistWeb.SharedView do
  use BooklistWeb, :view

  	@doc """
  	Naive implementation of function to pluralize string
  	"""
	def naive_pluralize(singular) do
		if String.ends_with? singular, "y" do
		  String.replace_trailing(singular, "y", "ies")
		else
			singular <> "s"
		end
	end

	@doc """
  	Takes date or datetime and
  	returns string date in format MM-DD-YYYY
  	"""
	def us_formatted_date(datetime) do
		String.pad_leading(Integer.to_string(datetime.month), 2, "0") <> 
		"/" <>
		String.pad_leading(Integer.to_string(datetime.day), 2, "0") <> 
		"/" <>
		Integer.to_string(datetime.year)
	end

end
