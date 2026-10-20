local DependenciesModule = require(script.Parent.Parent.dependencies)
local ThrottleUserIdModule = require(script.Parent.throttleUserId)

return function(Callback)
	-- upvalues: DependenciesModule (copy), ThrottleUserIdModule (copy)
	return function()
		-- upvalues: DependenciesModule (upval), ThrottleUserIdModule (upval), Callback (copy)
		local LocalPlayer = DependenciesModule.Players.LocalPlayer
		
		return if LocalPlayer and LocalPlayer.UserId then ThrottleUserIdModule({ throttle = Callback(), userId = LocalPlayer.UserId }) else false
	end
end