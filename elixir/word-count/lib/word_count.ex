defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do

    puntuation = String.graphemes("_:,.!&@$%^&")

    words = String.replace(sentence, puntuation, " ") |>
            String.trim |>
            String.downcase |>
            String.split

    Enum.reduce(words, %{},
      fn(word, counter) ->
          # Ensure that the word has at least 0 counts
          temp = Map.put_new(counter, word, 0)

          # Sum 1 to the word counter
          count = Map.fetch!(temp, word) + 1

          # Update the counter for the word
          Map.put(counter, word, count)
      end
    )
  end
end
