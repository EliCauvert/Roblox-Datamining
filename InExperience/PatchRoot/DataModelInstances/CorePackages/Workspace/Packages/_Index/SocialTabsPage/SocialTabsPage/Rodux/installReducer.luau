local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local RoduxModule = require(SocialTabsPage.Parent.Rodux)
local MyRoduxNetworkingModule = require(SocialTabsPage.Networking.myRoduxNetworking)

return function()
	-- upvalues: RoduxModule (copy), MyRoduxNetworkingModule (copy)
	return RoduxModule.combineReducers({ NetworkStatus = MyRoduxNetworkingModule.installReducer() })
end