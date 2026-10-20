local Parent = script:FindFirstAncestor("GameTile").Parent
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local CentralOverlayType = RobloxAppEnumsModule.CentralOverlayType
local AppPage = RobloxAppEnumsModule.AppPage
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local ResponsiveModule = require(Parent.Responsive)
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(Touch)
	-- upvalues: ResponsiveModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	return function(p1)
		-- upvalues: Touch (copy), ResponsiveModule (upval), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval)
		if Touch ~= ResponsiveModule.Input.Touch then
			p1:dispatch(SetCentralOverlayFunction(CentralOverlayType.SponsoredTooltip))
			
			return
		end
		local config = { name = AppPage.SponsoredTooltipPeekView }
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			p1:dispatch(NavigateDownFunction(config))
		end
	end
end