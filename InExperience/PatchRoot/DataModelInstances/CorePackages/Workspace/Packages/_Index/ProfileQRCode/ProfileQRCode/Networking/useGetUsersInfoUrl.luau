local profileQRCode = script:FindFirstAncestor("ProfileQRCode")
local configureRoduxUsersModule = require(profileQRCode.Networking.configureRoduxUsers)
local useDispatch = require(profileQRCode.Parent.RoactUtils).Hooks.RoactRodux.useDispatch

return function() --[[ line: 7 ]]
	-- upvalues: useDispatch (ref), configureRoduxUsersModule (ref)
	local var2 = useDispatch()
	
	return function(p0) --[[ line: 10 ]]
		-- upvalues: var2 (ref), configureRoduxUsersModule (copy)
		return var2(configureRoduxUsersModule.GetUserV2FromUserId.API(p0))
	end
end