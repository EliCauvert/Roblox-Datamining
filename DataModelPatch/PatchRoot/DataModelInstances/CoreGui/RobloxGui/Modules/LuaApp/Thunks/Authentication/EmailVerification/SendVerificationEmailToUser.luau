local SendUserVerifyEmailModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Requests.SendUserVerifyEmail)

return function(p1)
	-- upvalues: SendUserVerifyEmailModule (copy)
	return function(_)
		-- upvalues: SendUserVerifyEmailModule (upval), p1 (copy)
		return SendUserVerifyEmailModule(p1)
	end
end