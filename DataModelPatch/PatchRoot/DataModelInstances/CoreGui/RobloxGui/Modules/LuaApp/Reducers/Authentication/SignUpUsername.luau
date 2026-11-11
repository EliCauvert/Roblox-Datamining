local SetSignUpUsernameModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.Authentication.SetSignUpUsername)

return function(p1, p2)
	-- upvalues: SetSignUpUsernameModule (copy)
	local P0 = p1 or ""
	
	return if p2.type == SetSignUpUsernameModule.name then p2.signupUsername else P0
end