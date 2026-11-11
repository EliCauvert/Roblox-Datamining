local SetSignUpPasswordModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.Authentication.SetSignUpPassword)

return function(p1, p2)
	-- upvalues: SetSignUpPasswordModule (copy)
	local P0 = p1 or ""
	
	return if p2.type == SetSignUpPasswordModule.name then p2.signupPassword else P0
end