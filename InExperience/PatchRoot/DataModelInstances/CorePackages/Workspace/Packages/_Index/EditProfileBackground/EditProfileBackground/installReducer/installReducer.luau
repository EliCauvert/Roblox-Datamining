local EditProfileBackground = script:FindFirstAncestor("EditProfileBackground")
local RoduxModule = require(EditProfileBackground.Parent.Rodux)
local ProfileRoduxNetworkingModule = require(EditProfileBackground.Networking.ProfileRoduxNetworking)

return function() --[[ Line: 6 ]]
	-- upvalues: RoduxModule (copy), ProfileRoduxNetworkingModule (copy)
	return RoduxModule.combineReducers({
		NetworkStatus = ProfileRoduxNetworkingModule.installReducer()
	})
end