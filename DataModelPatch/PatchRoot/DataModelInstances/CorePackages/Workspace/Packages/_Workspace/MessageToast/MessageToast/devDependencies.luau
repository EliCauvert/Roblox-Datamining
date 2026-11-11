local Parent = script.Parent.Parent
local JestGlobalsModule = require(Parent.Dev.JestGlobals)
JestGlobalsModule.expect.extend(require(Parent.Dev.LuaSocialLibrariesDeps).CollisionMatchers.Jest)

return {
	JestGlobals = JestGlobalsModule,
	UnitTestHelpers = require(Parent.Dev.SocialTestHelpers).TestHelpers,
	Rhodium = require(Parent.Dev.Rhodium),
	RhodiumHelpers = function()
		-- upvalues: Parent (copy)
		return require(Parent.Dev.RhodiumHelpers)
	end,
	createTreeWithProviders = require(Parent.Dev.SocialTestHelpers).TestHelpers.createTreeWithProviders
}