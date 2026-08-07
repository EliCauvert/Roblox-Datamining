local parent = script:FindFirstAncestor("SocialLuaAnalytics").Parent
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)

return {
	t = require(parent.t),
	tutils = require(parent.tutils),
	RoduxPresence = luaSocialLibrariesDepsModule.RoduxPresence.config({ keyPath = "SocialLuaAnalytics.Presence" }),
	llama = luaSocialLibrariesDepsModule.llama,
	enumerate = require(parent.enumerate),
	LuauPolyfill = require(parent.LuauPolyfill),
	Rodux = require(parent.Rodux),
	Dash = require(parent.Dash)
}