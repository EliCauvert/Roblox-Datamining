local profileShareLinks = script:FindFirstAncestor("ProfileShareLinks")
local roduxModule = require(profileShareLinks.Parent.Rodux)
local configuredRoduxNetworkingModule = require(profileShareLinks.Networking.configuredRoduxNetworking)
local profileShareLinksReducerModule = require(script.Parent.ProfileShareLinksReducer)

return function()
	-- upvalues: roduxModule (ref), profileShareLinksReducerModule (ref), configuredRoduxNetworkingModule (ref)
	return roduxModule.combineReducers({
		ProfileShareLinks = profileShareLinksReducerModule,
		NetworkingStatus = configuredRoduxNetworkingModule.installReducer()
	})
end