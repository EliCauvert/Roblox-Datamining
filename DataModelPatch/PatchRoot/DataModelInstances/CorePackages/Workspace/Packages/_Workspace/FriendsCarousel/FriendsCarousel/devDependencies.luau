local Parent = script.Parent
local Parent1 = Parent.Parent
local LuaSocialLibrariesDepsModule = require(Parent1.LuaSocialLibrariesDeps)
local JestGlobalsModule = require(Parent1.Dev.JestGlobals)
local Expect = JestGlobalsModule.expect
local RODUXKEY = require(Parent.Common.Constants).RODUX_KEY
Expect.extend(LuaSocialLibrariesDepsModule.CollisionMatchers.Jest)
local TestHelpers = require(Parent1.Dev.SocialTestHelpers).TestHelpers

return {
	Mock = LuaSocialLibrariesDepsModule.Mock,
	UnitTestHelpers = TestHelpers,
	CollisionMatchers = LuaSocialLibrariesDepsModule.CollisionMatchers,
	Rhodium = require(Parent1.Dev.Rhodium),
	RhodiumHelpers = function()
		-- upvalues: Parent1 (copy)
		return require(Parent1.Dev.RhodiumHelpers)
	end,
	JestGlobals = JestGlobalsModule,
	jestExpect = Expect,
	jest = JestGlobalsModule.jest,
	UIBloxUniversalAppConfig = require(Parent1.Dev.RobloxAppUIBloxConfig),
	baseTestStates = TestHelpers.getBaseTestStates({ roduxKey = RODUXKEY }),
	mockLocale = function()
		-- upvalues: Parent1 (copy)
		return require(Parent1.Dev.SocialTestHelpers).StoryHelpers.mockLocale
	end,
	findImageSet = require(Parent1.Dev.SocialTestHelpers).TestHelpers.findImageSet,
	MockAppStorageService = require(Parent1.Dev.SocialTestHelpers).TestHelpers.MockAppStorageService
}