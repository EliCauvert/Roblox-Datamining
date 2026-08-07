local squadsCore = script:FindFirstAncestor("SquadsCore")

return require(squadsCore.Parent.UserBlockingRodux).config({
	keyPath = require(squadsCore.Common.Constants).RODUX_KEY .. ".UserBlocking"
})