let abbreviate = (word: string) =>
  word
  |> Js.String.splitByRe([%bs.re "/[ -]/"])
  |> Array.map(t => t.[0])
  |> Array.map(Char.uppercase)
  |> Array.map(c => String.make(1, c))
  |> Js.Array.joinWith("");