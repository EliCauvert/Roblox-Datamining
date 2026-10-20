local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local VRService = game:GetService("VRService")
local UseCallbackFunction = require(Parent.React).useCallback
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseWebViewModule = require(Parent.NotApprovedPage.Utils.useWebView)
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local FFlagEnableNapNewWebViewModule = require(NotApprovedPage.Flags.FFlagEnableNapNewWebView)

return function(Detail, Title)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), AppLinking (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), FFlagEnableNapNewWebViewModule (copy), UseWebViewModule (copy), UseCallbackFunction (copy), VRService (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	local UseWebViewModuleResult = if FFlagEnableNapNewWebViewModule then UseWebViewModule(Detail, Title) else nil
	
	return (UseCallbackFunction(function()
		-- upvalues: IsUsePreferredInputResultMatch (copy), VRService (upval), UseRoactServiceResult (copy), Detail (copy), FFlagEnableNapNewWebViewModule (upval), UseWebViewModuleResult (copy), AppPage (upval), Title (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		if IsUsePreferredInputResultMatch or VRService.VREnabled then
			UseRoactServiceResult:openURL(Detail)
			
			return
		end
		if FFlagEnableNapNewWebViewModule and UseWebViewModuleResult then
			UseWebViewModuleResult()
			
			return
		end
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
		end
	end, {
		Detail, Title, UseDispatchResult, IsUsePreferredInputResultMatch,
		UseRoactServiceResult, UseWebViewModuleResult
	}))
end