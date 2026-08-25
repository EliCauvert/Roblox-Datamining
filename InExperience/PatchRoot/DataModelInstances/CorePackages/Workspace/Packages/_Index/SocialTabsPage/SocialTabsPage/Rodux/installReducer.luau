local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local roduxModule = require(socialTabsPage.Parent.Rodux)
local myRoduxNetworkingModule = require(socialTabsPage.Networking.myRoduxNetworking)
local presenceModule = require(socialTabsPage.Rodux.Presence)
local fFlagSocialTabsPagePresenceSignalsMigrationModule = require(socialTabsPage.Flags.FFlagSocialTabsPagePresenceSignalsMigration)

return function()
	-- upvalues: roduxModule (ref), fFlagSocialTabsPagePresenceSignalsMigrationModule (ref), presenceModule (ref), myRoduxNetworkingModule (ref)
	return roduxModule.combineReducers({
		Presence = if not fFlagSocialTabsPagePresenceSignalsMigrationModule then presenceModule else nil,
		NetworkStatus = myRoduxNetworkingModule.installReducer()
	})
end