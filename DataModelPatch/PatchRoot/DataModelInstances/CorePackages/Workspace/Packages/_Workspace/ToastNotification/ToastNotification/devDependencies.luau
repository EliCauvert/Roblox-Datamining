local Parent = script.Parent.Parent
local JestGlobalsModule = require(Parent.Dev.JestGlobals)

return {
	Rhodium = require(Parent.Dev.Rhodium),
	RhodiumHelpers = function()
		-- upvalues: Parent (copy)
		return require(Parent.Dev.RhodiumHelpers)
	end,
	JestGlobals = JestGlobalsModule,
	jestExpect = JestGlobalsModule.expect,
	jest = JestGlobalsModule.jest,
	act = require(Parent.ReactRoblox).act,
	UIBloxUniversalAppConfig = require(Parent.Dev.RobloxAppUIBloxConfig),
	DeferredLuaHelpers = require(Parent.Dev.TestUtils).DeferredLuaHelpers
}