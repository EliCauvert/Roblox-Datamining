local Parent = script:FindFirstAncestor("AuthCommon").Parent
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(ExtraProps, p1, p2)
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	return function(p3)
		-- upvalues: p1 (copy), p2 (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), ExtraProps (copy), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
		if not p1 then
			p3:dispatch(SetCentralOverlayFunction(CentralOverlayType.AccountSelector, ExtraProps))
			
			return
		end
		if p2 then
			p3:dispatch(SetCentralOverlayFunction(CentralOverlayType.AccountSwitcher, ExtraProps))
			
			return
		end
		local config = {
			name = AppPage.AccountSelectorPeekView,
			extraProps = ExtraProps
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			p3:dispatch(NavigateDownFunction(config))
		end
	end
end