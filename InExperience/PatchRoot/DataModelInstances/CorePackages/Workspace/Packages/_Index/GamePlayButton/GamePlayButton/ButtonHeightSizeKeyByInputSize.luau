local inputSize = require(script:FindFirstAncestor("GamePlayButton").Parent.Foundation).Enums.InputSize

return {
	[inputSize.XSmall] = "Size_600",
	[inputSize.Small] = "Size_800",
	[inputSize.Medium] = "Size_1000",
	[inputSize.Large] = "Size_1200"
}