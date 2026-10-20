local Modules = game:GetService("CoreGui").RobloxGui.Modules
local LoginResultModule = require(Modules.LuaApp.Models.Authentication.LoginResult)

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(LoginResultModule.new(), {
	[require(Modules.LuaApp.Actions.Authentication.SetLoginResult).name] = function(_, p1)
		-- upvalues: LoginResultModule (copy)
		assert(LoginResultModule.is(p1.loginResult), "LoginResult must be a LoginResult model")
		
		return p1.loginResult
	end
})