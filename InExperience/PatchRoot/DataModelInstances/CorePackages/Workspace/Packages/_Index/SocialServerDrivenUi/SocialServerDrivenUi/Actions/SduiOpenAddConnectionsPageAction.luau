local Parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local _ = require(Parent.SduiCoreSystem)
local FFlagCreateConnectionsHub = require(Parent.SharedFlags).FFlagCreateConnectionsHub
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(_, _, p1, _) --[[ Line: 18 ]]
	-- upvalues: FFlagCreateConnectionsHub (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	if FFlagCreateConnectionsHub then
		p1.dependencies.getNavigation().navigate(AppPage.CoHubAddConnections)
		
		return
	end
	local config = { name = AppPage.AddFriendsPage }
	
	if FFlagSignalsNavP3Dispatch then
		NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
		
		return
	else
		p1.dependencies.dispatch(NavigateDownFunction(config))
	end
end