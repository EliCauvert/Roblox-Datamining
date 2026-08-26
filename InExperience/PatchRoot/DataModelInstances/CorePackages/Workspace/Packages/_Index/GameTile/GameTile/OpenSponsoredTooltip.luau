local parent = script:FindFirstAncestor("GameTile").Parent
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local appPage = robloxAppEnumsModule.AppPage
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local responsiveModule = require(parent.Responsive)
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1)
	-- upvalues: responsiveModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), setCentralOverlay (ref), centralOverlayType (ref)
	return function(p2)
		-- upvalues: p1 (ref), responsiveModule (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy), setCentralOverlay (copy), centralOverlayType (copy)
		if p1 ~= responsiveModule.Input.Touch then
			p2:dispatch(setCentralOverlay(centralOverlayType.SponsoredTooltip))
			
			return
		end
		local t = { name = appPage.SponsoredTooltipPeekView }
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		p2:dispatch(navigateDown(t))
	end
end