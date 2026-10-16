local ProfileShareLinks = script:FindFirstAncestor("ProfileShareLinks")
local RoduxModule = require(ProfileShareLinks.Parent.Rodux)
local ConfiguredRoduxNetworkingModule = require(ProfileShareLinks.Networking.configuredRoduxNetworking)
local ProfileShareLinksReducerModule = require(script.Parent.ProfileShareLinksReducer)

return function() --[[ Line: 8 ]]
	-- upvalues: RoduxModule (copy), ProfileShareLinksReducerModule (copy), ConfiguredRoduxNetworkingModule (copy)
	return RoduxModule.combineReducers({
		ProfileShareLinks = ProfileShareLinksReducerModule,
		NetworkingStatus = ConfiguredRoduxNetworkingModule.installReducer()
	})
end