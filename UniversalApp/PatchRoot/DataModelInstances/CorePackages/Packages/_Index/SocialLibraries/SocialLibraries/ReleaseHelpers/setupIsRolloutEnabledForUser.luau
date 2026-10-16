local DependenciesModule = require(script.Parent.Parent.dependencies)
local ThrottleUserIdModule = require(script.Parent.throttleUserId)

return function(Callback) --[[ Line: 5 ]]
	-- upvalues: DependenciesModule (copy), ThrottleUserIdModule (copy)
	return function() --[[ Line: 6 ]]
		-- upvalues: DependenciesModule (upval), ThrottleUserIdModule (upval), Callback (copy)
		local LocalPlayer = DependenciesModule.Players.LocalPlayer
		
		return if LocalPlayer and LocalPlayer.UserId then ThrottleUserIdModule({ throttle = Callback(), userId = LocalPlayer.UserId }) else false
	end
end