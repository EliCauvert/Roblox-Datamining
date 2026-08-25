local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local dependenciesModule = require(authCommon.dependencies)
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local appPage = require(parent.RobloxAppEnums).AppPage
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var2 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local getFFlagEnableAccountSwitcherFoundationDesign = dependenciesModule.SharedFlags.GetFFlagEnableAccountSwitcherFoundationDesign

return function(p0, p1, p2)
	-- upvalues: getFFlagEnableAccountSwitcherFoundationDesign (ref), setCentralOverlay (ref), centralOverlayType (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var2 (ref), navigateDown (ref)
	return function(p3)
		-- upvalues: p1 (ref), getFFlagEnableAccountSwitcherFoundationDesign (copy), p2 (ref), setCentralOverlay (copy), centralOverlayType (copy), p0 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var2 (copy), navigateDown (copy)
		if not p1 then
			p3:dispatch(setCentralOverlay(centralOverlayType.AccountSelector, p0))
			
			return
		elseif getFFlagEnableAccountSwitcherFoundationDesign() and p2 then
			p3:dispatch(setCentralOverlay(centralOverlayType.AccountSwitcher, p0))
			
			return
		end
		local t = { name = appPage.AccountSelectorPeekView, extraProps = p0 }
		
		if fFlagSignalsNavP3Dispatch then
			var2.down(var2.fromLegacyPage(t))
			
			return
		end
		p3:dispatch(navigateDown(t))
	end
end