local Parent = script.Parent.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigationRoduxModule = require(Parent.NavigationRodux)
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = require(Parent.RobloxAppNavigation).NavigationCommands

return function(ExtraProps)
	-- upvalues: AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationRoduxModule (copy), NavigationCommands (copy)
	return function(p1)
		-- upvalues: AppPage (upval), ExtraProps (copy), FFlagSignalsNavP3Dispatch (upval), NavigationRoduxModule (upval), NavigationCommands (upval)
		local config = { name = AppPage.AmpV2Wizard, extraProps = ExtraProps }
		local CurrentPage = if FFlagSignalsNavP3Dispatch then NavigationRoduxModule.GetLegacyNavigationStore(false).getCurrentPage(false) else NavigationRoduxModule.Selectors.selectCurrentLegacyPage(p1:getState())
		local ExtraProps1 = CurrentPage.extraProps
		local OdpSessionId = if ExtraProps.flow and ExtraProps.flow.name == "OdpCheckpointResume" then ExtraProps.flow.props.odpSessionId else nil
		
		if OdpSessionId and CurrentPage.name == AppPage.AmpV2Wizard and ExtraProps1 and ExtraProps1.flow and ExtraProps1.flow.name == "OdpCheckpointResume" and ExtraProps1.flow.props.odpSessionId == OdpSessionId then return end
		local IsNameMatch = CurrentPage.name == AppPage.GenericWebPage
		
		if FFlagSignalsNavP3Dispatch then
			if IsNameMatch then
				NavigationCommands.fromWebView(NavigationCommands.fromLegacyPage(config), true)
				
				return
			else
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config), true)
				
				return
			end
		elseif IsNameMatch then
			p1:dispatch(NavigationRoduxModule.Thunks.NavigateFromWebView(config, true))
			
			return
		else
			p1:dispatch(NavigationRoduxModule.Thunks.NavigateDown(config, true))
		end
	end
end