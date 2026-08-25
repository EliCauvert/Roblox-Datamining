local editProfileBackground = script:FindFirstAncestor("EditProfileBackground")
local roduxModule = require(editProfileBackground.Parent.Rodux)
local profileRoduxNetworkingModule = require(editProfileBackground.Networking.ProfileRoduxNetworking)

return function()
	-- upvalues: roduxModule (ref), profileRoduxNetworkingModule (ref)
	return roduxModule.combineReducers({
		NetworkStatus = profileRoduxNetworkingModule.installReducer()
	})
end