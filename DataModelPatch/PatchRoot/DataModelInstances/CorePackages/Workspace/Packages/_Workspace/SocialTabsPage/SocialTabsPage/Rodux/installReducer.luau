local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local RoduxModule = require(SocialTabsPage.Parent.Rodux)
local MyRoduxNetworkingModule = require(SocialTabsPage.Networking.myRoduxNetworking)
local PresenceModule = require(SocialTabsPage.Rodux.Presence)

return function()
	-- upvalues: RoduxModule (copy), PresenceModule (copy), MyRoduxNetworkingModule (copy)
	return RoduxModule.combineReducers({
		Presence = PresenceModule,
		NetworkStatus = MyRoduxNetworkingModule.installReducer()
	})
end