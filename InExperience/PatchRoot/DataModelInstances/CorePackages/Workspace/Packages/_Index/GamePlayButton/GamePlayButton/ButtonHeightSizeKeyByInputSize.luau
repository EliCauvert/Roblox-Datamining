local InputSize = require(script:FindFirstAncestor("GamePlayButton").Parent.Foundation).Enums.InputSize

return {
	[InputSize.XSmall] = "Size_600",
	[InputSize.Small] = "Size_800",
	[InputSize.Medium] = "Size_1000",
	[InputSize.Large] = "Size_1200"
}