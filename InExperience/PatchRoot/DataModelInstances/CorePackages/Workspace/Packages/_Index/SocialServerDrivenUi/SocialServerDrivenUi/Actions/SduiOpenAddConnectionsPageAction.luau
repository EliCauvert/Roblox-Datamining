local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local _ = require(parent.SduiCoreSystem)
local fFlagCreateConnectionsHub = require(parent.SharedFlags).FFlagCreateConnectionsHub
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var0 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(_, _, p0, _) --[[ line: 18 ]]
	-- upvalues: fFlagCreateConnectionsHub (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var0 (ref), navigateDown (ref)
	if fFlagCreateConnectionsHub then
		p0.dependencies.getNavigation().navigate(appPage.CoHubAddConnections)
		
		return
	end
	local t = { name = appPage.AddFriendsPage }
	
	if fFlagSignalsNavP3Dispatch then
		var0.down(var0.fromLegacyPage(t))
		
		return
	end
	p0.dependencies.dispatch(navigateDown(t))
end