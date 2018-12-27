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
  	Used when no to_s function for item is passed
  	"""
	def default_item_to_s(item) do
		item.name
	end
end
