local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local roduxModule = require(socialTabsPage.Parent.Rodux)
local myRoduxNetworkingModule = require(socialTabsPage.Networking.myRoduxNetworking)

return function()
	-- upvalues: roduxModule (ref), myRoduxNetworkingModule (ref)
	return roduxModule.combineReducers({ NetworkStatus = myRoduxNetworkingModule.installReducer() })
end