local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local VRService = game:GetService("VRService")
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local Default = require(Parent.LinkingProtocol).LinkingProtocol.default
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function()
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), AppLinking (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), ReactModule (copy), VRService (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), Default (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	
	return ReactModule.useCallback(function(Title, Detail)
		-- upvalues: UseRoactServiceResult (copy), IsUsePreferredInputResultMatch (copy), VRService (upval), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval), Default (upval)
		if Detail then
			if not UseRoactServiceResult then
				Default:openURL(Detail)
			elseif IsUsePreferredInputResultMatch or VRService.VREnabled then
				UseRoactServiceResult:openURL(Detail)
				
				return
			else
				local config = {
					name = AppPage.GenericWebPage,
					detail = Detail,
					extraProps = { title = Title }
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					
					return
				else
					UseDispatchResult(NavigateDownFunction(config))
					
					return
				end
			end
		end
	end, {
		UseRoactServiceResult,
		UseDispatchResult,
		IsUsePreferredInputResultMatch
	})
end