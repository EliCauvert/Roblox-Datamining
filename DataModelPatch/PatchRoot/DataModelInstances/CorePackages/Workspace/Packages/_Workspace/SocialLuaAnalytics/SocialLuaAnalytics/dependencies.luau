local Parent = script:FindFirstAncestor("SocialLuaAnalytics").Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)

return {
	t = require(Parent.t),
	tutils = require(Parent.tutils),
	RoduxPresence = LuaSocialLibrariesDepsModule.RoduxPresence.config({ keyPath = "SocialLuaAnalytics.Presence" }),
	llama = LuaSocialLibrariesDepsModule.llama,
	enumerate = require(Parent.enumerate),
	LuauPolyfill = require(Parent.LuauPolyfill),
	Rodux = require(Parent.Rodux),
	Dash = require(Parent.Dash)
}