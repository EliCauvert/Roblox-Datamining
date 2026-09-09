local PYMKCarousel = script:FindFirstAncestor("PYMKCarousel")

return require(PYMKCarousel.Parent.LuaSocialLibrariesDeps).RoduxPresence.config({
	keyPath = require(PYMKCarousel.Common.Constants).RODUX_KEY .. ".Presence"
})