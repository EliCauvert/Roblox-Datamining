local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local roduxModule = require(socialTabsPage.Parent.Rodux)
local myRoduxNetworkingModule = require(socialTabsPage.Networking.myRoduxNetworking)
local presenceModule = require(socialTabsPage.Rodux.Presence)

return function() --[[ line: 8 ]]
	-- upvalues: roduxModule (ref), presenceModule (ref), myRoduxNetworkingModule (ref)
	return roduxModule.combineReducers({
		Presence = presenceModule,
		NetworkStatus = myRoduxNetworkingModule.installReducer()
	})
end