local Parent = script.Parent.Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
local JestGlobalsModule = require(Parent.Dev.JestGlobals)
local Expect = JestGlobalsModule.expect
local TestUtilsModule = require(Parent.Dev.TestUtils)
Expect.extend(LuaSocialLibrariesDepsModule.CollisionMatchers.Jest)

return {
	Mock = LuaSocialLibrariesDepsModule.Mock,
	CollisionMatchers = LuaSocialLibrariesDepsModule.CollisionMatchers,
	UnitTestHelpers = require(Parent.Dev.SocialTestHelpers).TestHelpers,
	Rhodium = require(Parent.Dev.Rhodium),
	RhodiumHelpers = function()
		-- upvalues: Parent (copy)
		return require(Parent.Dev.RhodiumHelpers)
	end,
	JestGlobals = JestGlobalsModule,
	jestExpect = Expect,
	jest = JestGlobalsModule.jest,
	findImageSet = require(Parent.Dev.SocialTestHelpers).TestHelpers.findImageSet,
	DeferredLuaHelpers = TestUtilsModule.DeferredLuaHelpers,
	waitUntil = TestUtilsModule.waitUntil
}