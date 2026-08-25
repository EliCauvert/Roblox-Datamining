local editProfile = script:FindFirstAncestor("EditProfile")
local roduxModule = require(editProfile.Parent.Rodux)
local profileRoduxNetworkingModule = require(editProfile.Networking.ProfileRoduxNetworking)

return function()
	-- upvalues: roduxModule (ref), profileRoduxNetworkingModule (ref)
	return roduxModule.combineReducers({
		NetworkStatus = profileRoduxNetworkingModule.installReducer()
	})
end