local parent = script:FindFirstAncestor("GameTile").Parent
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local appPage = robloxAppEnumsModule.AppPage
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local responsiveModule = require(parent.Responsive)
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var2 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0) --[[ line: 16 ]]
	-- upvalues: responsiveModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var2 (ref), navigateDown (ref), setCentralOverlay (ref), centralOverlayType (ref)
	return function(p1) --[[ line: 17 ]]
		-- upvalues: p0 (ref), responsiveModule (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var2 (copy), navigateDown (copy), setCentralOverlay (copy), centralOverlayType (copy)
		if p0 ~= responsiveModule.Input.Touch then
			p1:dispatch(setCentralOverlay(centralOverlayType.SponsoredTooltip))
			
			return
		end
		local t = { name = appPage.SponsoredTooltipPeekView }
		
		if fFlagSignalsNavP3Dispatch then
			var2.down(var2.fromLegacyPage(t))
			
			return
		end
		p1:dispatch(navigateDown(t))
	end
end