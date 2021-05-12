defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    # Using Erlang :lists.map for working with charlists
    # Using function pattern matching to return the correct value
    :lists.map(
      fn
        ?G -> ?C
        ?C -> ?G
        ?T -> ?A
        ?A -> ?U
      end,
      dna
    )
  end
end
