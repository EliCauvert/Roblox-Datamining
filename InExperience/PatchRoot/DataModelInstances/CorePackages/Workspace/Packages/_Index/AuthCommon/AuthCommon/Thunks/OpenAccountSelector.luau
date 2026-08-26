local parent = script:FindFirstAncestor("AuthCommon").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local appPage = require(parent.RobloxAppEnums).AppPage
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1, p2, p3)
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	return function(p4)
		-- upvalues: p2 (ref), p3 (ref), setCentralOverlay (copy), centralOverlayType (copy), p1 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
		if not p2 then
			p4:dispatch(setCentralOverlay(centralOverlayType.AccountSelector, p1))
			
			return
		elseif p3 then
			p4:dispatch(setCentralOverlay(centralOverlayType.AccountSwitcher, p1))
			
			return
		end
		local t = { name = appPage.AccountSelectorPeekView, extraProps = p1 }
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		p4:dispatch(navigateDown(t))
	end
end