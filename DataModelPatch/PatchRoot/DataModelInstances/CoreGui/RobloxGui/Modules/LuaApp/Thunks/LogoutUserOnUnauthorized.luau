local Modules = game:GetService("CoreGui").RobloxGui.Modules
local LoginStatusModule = require(Modules.LuaApp.Enum.LoginStatus)
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)

return function(p1, p2, p3)
	-- upvalues: LoginStatusModule (copy), LogoutModule (copy), LuaLogoutReasonNamesModule (copy)
	return function(p4)
		-- upvalues: LoginStatusModule (upval), LogoutModule (upval), p1 (copy), p2 (copy), LuaLogoutReasonNamesModule (upval), p3 (copy)
		if p4:getState().AuthenticationStatus.status == LoginStatusModule.LOGGED_IN then
			p4:dispatch(LogoutModule(p1, p2, LuaLogoutReasonNamesModule.UnauthorizedResponse, p3))
		end
	end
end