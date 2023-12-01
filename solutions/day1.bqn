input ← •file.Lines "../input/day1_input.txt"

Part1 ← {
	nums ← ((𝕩 - '0') ⊸≤ 9) / ¨ 𝕩 
	+´({((10×(⊑𝕩)) + ¯1⊑𝕩)}¨ (nums - '0'))
}

Part2 ← {
	numNames ← ⟨"one", "two", "three", "four", "five", "six", "seven", "eight", "nine"⟩
	ReplaceStringWithNumber ← {
		str ← 𝕩
		mapIndxs ← (⊏⎉1⍋⊸⊏⊢)(⍉(({(/((𝕩)⍷str))}¨numNames) ≍ ((↕9)+1)))
		toReplace ← (¬(⊏⍉(mapIndxs ∊ ⟨⟨⟩⟩)))/(⋈˘mapIndxs)
		isNothingToReplace ← 0=≠⥊toReplace

		CalculateResult ← isNothingToReplace ◶ {
			ReplaceStringWithNumber ((1⊑⊑𝕨) + '0')⌾((⊑⊑⊑𝕨)⊸⊑)str
	}‿{𝕩}

		toReplace CalculateResult str
	} 

	Part1 (res ← ReplaceStringWithNumber ¨𝕩)
}

Part1 input
Part2 input
