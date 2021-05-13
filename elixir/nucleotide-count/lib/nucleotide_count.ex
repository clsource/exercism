defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do

    # Count every nucleotide
    Enum.reduce(strand, %{},
      fn (nucl, counter) ->
        temp = Map.put_new(counter, nucl, 0)
        count = Map.fetch!(temp, nucl) + 1
        Map.put(counter, nucl, count)
      end
    ) |>
    # Fetch the required one
    Map.fetch(nucleotide) |>
    case do
      {:ok, value} -> value
      _ -> 0
    end
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do

    # Converts list to a map filled with 0
    base = Enum.into(
        @nucleotides,
        %{},
        fn item ->
          {item, 0}
        end
    )

    # Counts every nucleotide in the strand
    counts = Enum.reduce(strand, %{},
      fn (nucleotide, counter) ->
        temp = Map.put_new(counter, nucleotide, 0)
        count = Map.fetch!(temp, nucleotide) + 1
        Map.put(counter, nucleotide, count)
      end
    )

    # Merge results with the base
    Map.merge(base, counts)
  end
end
