local Parent = script.Parent.Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
local JestGlobalsModule = require(Parent.Dev.JestGlobals)
JestGlobalsModule.expect.extend(LuaSocialLibrariesDepsModule.CollisionMatchers.Jest)

return {
	JestGlobals = JestGlobalsModule,
	ReactRoblox = require(Parent.Dev.ReactRoblox),
	Mock = LuaSocialLibrariesDepsModule.Mock,
	UnitTestHelpers = require(Parent.Dev.SocialTestHelpers).TestHelpers,
	Rhodium = require(Parent.Dev.Rhodium),
	RhodiumHelpers = function()
		-- upvalues: Parent (copy)
		return require(Parent.Dev.RhodiumHelpers)
	end,
	createTreeWithProviders = require(Parent.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders,
	DeferredLuaHelpers = require(Parent.Dev.TestUtils).DeferredLuaHelpers
}