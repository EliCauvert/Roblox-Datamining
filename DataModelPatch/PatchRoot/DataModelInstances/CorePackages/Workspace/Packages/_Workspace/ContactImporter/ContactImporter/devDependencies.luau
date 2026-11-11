local Parent = script.Parent
local Parent1 = Parent.Parent
local LuaSocialLibrariesDepsModule = require(Parent1.LuaSocialLibrariesDeps)
local ReactRobloxModule = require(Parent1.ReactRoblox)
local JestGlobalsModule = require(Parent1.Dev.JestGlobals)
local Expect = JestGlobalsModule.expect
local MessageBus = require(Parent1.Dev.MessageBus).MessageBus
local CreateTreeWithProvidersModule = require(Parent.TestHelpers.createTreeWithProviders)
Expect.extend(LuaSocialLibrariesDepsModule.CollisionMatchers.Jest)

return {
	Mock = LuaSocialLibrariesDepsModule.Mock,
	UnitTestHelpers = require(Parent1.Dev.SocialTestHelpers).TestHelpers,
	CollisionMatchers = LuaSocialLibrariesDepsModule.CollisionMatchers,
	Rhodium = require(Parent1.Dev.Rhodium),
	RhodiumHelpers = function()
		-- upvalues: Parent1 (copy)
		return require(Parent1.Dev.RhodiumHelpers)
	end,
	JestGlobals = JestGlobalsModule,
	jestExpect = Expect,
	jest = JestGlobalsModule.jest,
	act = ReactRobloxModule.act,
	UIBloxUniversalAppConfig = require(Parent1.Dev.RobloxAppUIBloxConfig),
	createTreeWithProviders = CreateTreeWithProvidersModule,
	MessageBus = MessageBus,
	findImageSet = require(Parent1.Dev.SocialTestHelpers).TestHelpers.findImageSet,
	DeferredLuaHelpers = require(Parent1.Dev.TestUtils).DeferredLuaHelpers,
	MockAppStorageService = require(Parent1.Dev.SocialTestHelpers).TestHelpers.MockAppStorageService
}