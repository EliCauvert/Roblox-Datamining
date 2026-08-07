local squadsCore = script:FindFirstAncestor("SquadsCore")

return require(squadsCore.Parent.RoduxSquads).config({
	keyPath = require(squadsCore.Common.Constants).RODUX_KEY .. ".Squad"
})