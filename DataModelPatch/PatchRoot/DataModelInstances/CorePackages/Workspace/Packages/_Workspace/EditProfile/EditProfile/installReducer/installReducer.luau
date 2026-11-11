local EditProfile = script:FindFirstAncestor("EditProfile")
local RoduxModule = require(EditProfile.Parent.Rodux)
local ProfileRoduxNetworkingModule = require(EditProfile.Networking.ProfileRoduxNetworking)

return function()
	-- upvalues: RoduxModule (copy), ProfileRoduxNetworkingModule (copy)
	return RoduxModule.combineReducers({
		NetworkStatus = ProfileRoduxNetworkingModule.installReducer()
	})
end