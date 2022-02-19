defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split(~r/[^[:alnum:]-']/u, trim: true)
    |> Enum.reduce(
         %{},
         fn (word, counter) ->
           Map.update(counter, String.replace(word, ~r/^'|'$/, ""), 1, &(&1 + 1))
         end
       )
  end
end
