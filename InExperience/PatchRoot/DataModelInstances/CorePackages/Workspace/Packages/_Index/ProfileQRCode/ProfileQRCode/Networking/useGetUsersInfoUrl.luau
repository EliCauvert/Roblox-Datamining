local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local configureRoduxUsersModule = require(profileQRCode.Networking.configureRoduxUsers)
local useDispatch = require(profileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function()
	-- upvalues: useDispatch (ref), configureRoduxUsersModule (ref)
	local var1 = useDispatch()
	
	return function(p1)
		-- upvalues: var1 (ref), configureRoduxUsersModule (copy)
		return var1(configureRoduxUsersModule.GetUserV2FromUserId.API(p1))
	end
end