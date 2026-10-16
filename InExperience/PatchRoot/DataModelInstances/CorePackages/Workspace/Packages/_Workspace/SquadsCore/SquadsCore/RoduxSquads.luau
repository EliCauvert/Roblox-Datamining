local SquadsCore = script:FindFirstAncestor("SquadsCore")

return require(SquadsCore.Parent.RoduxSquads).config({
	keyPath = require(SquadsCore.Common.Constants).RODUX_KEY .. ".Squad"
})