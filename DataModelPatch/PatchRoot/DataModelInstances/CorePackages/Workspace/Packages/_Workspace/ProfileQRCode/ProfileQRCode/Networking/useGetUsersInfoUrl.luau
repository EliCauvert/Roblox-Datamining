local ProfileQRCode = script:FindFirstAncestor("ProfileQRCode")
local ConfigureRoduxUsersModule = require(ProfileQRCode.Networking.configureRoduxUsers)
local UseDispatchFunction = require(ProfileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function()
	-- upvalues: UseDispatchFunction (copy), ConfigureRoduxUsersModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return function(p1)
		-- upvalues: UseDispatchResult (copy), ConfigureRoduxUsersModule (upval)
		return UseDispatchResult(ConfigureRoduxUsersModule.GetUserV2FromUserId.API(p1))
	end
end