local editProfile = script:FindFirstAncestor("EditProfile")
local roduxModule = require(editProfile.Parent.Rodux)
local profileRoduxNetworkingModule = require(editProfile.Networking.ProfileRoduxNetworking)

return function() --[[ line: 6 ]]
	-- upvalues: roduxModule (ref), profileRoduxNetworkingModule (ref)
	return roduxModule.combineReducers({
		NetworkStatus = profileRoduxNetworkingModule.installReducer()
	})
end