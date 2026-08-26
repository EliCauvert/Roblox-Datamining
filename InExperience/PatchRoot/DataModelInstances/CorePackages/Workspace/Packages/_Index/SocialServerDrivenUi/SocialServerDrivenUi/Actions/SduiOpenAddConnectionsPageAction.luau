local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local _ = require(parent.SduiCoreSystem)
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(_, _, p1, _)
	-- upvalues: fFlagCreateConnectionsHub (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	if fFlagCreateConnectionsHub then
		p1.dependencies.getNavigation().navigate(appPage.CoHubAddConnections)
		
		return
	end
	local t = { name = appPage.AddFriendsPage }
	
	if fFlagSignalsNavP3Dispatch then
		var1.down(var1.fromLegacyPage(t))
		
		return
	end
	p1.dependencies.dispatch(navigateDown(t))
end