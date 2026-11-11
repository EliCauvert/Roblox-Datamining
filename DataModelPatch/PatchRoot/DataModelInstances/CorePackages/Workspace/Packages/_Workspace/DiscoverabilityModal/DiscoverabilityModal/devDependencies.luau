local Parent = script.Parent.Parent

return {
	JestGlobals = require(Parent.Dev.JestGlobals),
	ReactRoblox = require(Parent.Dev.ReactRoblox),
	Mock = require(Parent.LuaSocialLibrariesDeps).Mock,
	UnitTestHelpers = require(Parent.Dev.SocialTestHelpers).TestHelpers,
	RhodiumHelpers = function()
		-- upvalues: Parent (copy)
		return require(Parent.Dev.RhodiumHelpers)
	end,
	DeferredLuaHelpers = require(Parent.Dev.TestUtils).DeferredLuaHelpers
}