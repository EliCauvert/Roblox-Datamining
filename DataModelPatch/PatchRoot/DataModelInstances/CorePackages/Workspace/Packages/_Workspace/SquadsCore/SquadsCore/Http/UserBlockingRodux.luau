local SquadsCore = script:FindFirstAncestor("SquadsCore")

return (require(SquadsCore.Parent.UserBlockingRodux).config({
	keyPath = require(SquadsCore.Common.Constants).RODUX_KEY .. ".UserBlocking"
}))