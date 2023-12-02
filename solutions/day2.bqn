
# Shamelessly taken from BQN crate: https://mlochbaum.github.io/bqncrate/
Split ← {𝕨(⊢-˜+`×¬)⊸⊔𝕩}

ParseToNumColorCols ← {
	games ← ({((𝕩⊐':')+1)↓𝕩}¨𝕩)
	spaces ← (games = ' ') = 0
	games ↩ spaces /¨ games
	games ↩ ((games = ';') ∨ (games = ',')) Split ¨games


	digitMask ← ((games - '0')≤9)
	⟨(digitMask / ¨¨games), ⊑¨¨((digitMask = 0) / ¨¨games)⟩
}

Part1 ← {
	# Remove all characters up to ": "
	cols ← ParseToNumColorCols 𝕩
	nums ← ⊑cols
	colors ← 1⊑cols

	reds ← •Parsefloat¨¨(∾´¨('r'=colors)) / ¨nums
	impossibleReds ← (+´¨(reds > 12) )≠ 0

	greens ← •Parsefloat¨¨(∾´¨('g'=colors)) / ¨nums
	impossibleGreens ← (+´¨(greens > 13) )≠ 0

	blues ← •Parsefloat¨¨(∾´¨('b'=colors)) / ¨nums
	impossibleBlues ← (+´¨(blues > 14)) ≠ 0

	possibleGames ← ((impossibleBlues ∨ impossibleGreens ∨ impossibleReds) = 0)

	+´(possibleGames / (↕(≠𝕩))+1)
}

Part2 ← {
	cols ← ParseToNumColorCols 𝕩
	nums ← ⊑cols
	colors ← 1⊑cols
	reds ← •Parsefloat¨¨(∾´¨('r'=colors)) / ¨nums
	greens ← •Parsefloat¨¨(∾´¨('g'=colors)) / ¨nums
	blues ← •Parsefloat¨¨(∾´¨('b'=colors)) / ¨nums
	+´(⌈´¨reds × ⌈´¨greens × ⌈´¨blues)
}

example ← •file.Lines "../input/day2_example.txt"
Part1 example
Part2 example

input ← •file.Lines "../input/day2_input.txt"
Part1 input
Part2 input
