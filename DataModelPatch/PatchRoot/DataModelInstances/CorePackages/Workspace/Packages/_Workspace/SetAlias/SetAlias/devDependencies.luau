local Parent = script.Parent.Parent
local JestGlobalsModule = require(Parent.Dev.JestGlobals)
local TestUtilsModule = require(Parent.Dev.TestUtils)

return {
	ReactRoblox = require(Parent.Dev.ReactRoblox),
	Rhodium = require(Parent.Dev.Rhodium),
	Mock = require(Parent.LuaSocialLibrariesDeps).Mock,
	UnitTestHelpers = require(Parent.Dev.SocialTestHelpers).TestHelpers,
	jestExpect = JestGlobalsModule.expect,
	jest = JestGlobalsModule.jest,
	describe = JestGlobalsModule.describe,
	it = JestGlobalsModule.it,
	beforeAll = JestGlobalsModule.beforeAll,
	afterAll = JestGlobalsModule.afterAll,
	expect = JestGlobalsModule.expect,
	RhodiumHelpers = function()
		-- upvalues: Parent (copy)
		return require(Parent.Dev.RhodiumHelpers)
	end,
	waitUntil = TestUtilsModule.waitUntil,
	DeferredLuaHelpers = TestUtilsModule.DeferredLuaHelpers
}