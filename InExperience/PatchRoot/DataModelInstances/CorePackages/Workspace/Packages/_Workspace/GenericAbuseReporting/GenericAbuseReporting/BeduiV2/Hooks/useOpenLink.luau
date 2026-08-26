local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local VRService = game:GetService("VRService")
local appLinking = require(parent.RoactServiceTags).AppLinking
local default = require(parent.LinkingProtocol).LinkingProtocol.default
local navigationRoduxModule = require(parent.NavigationRodux)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local usePreferredInput = responsiveModule.usePreferredInput
local useRoactService = robloxAppHooksModule.useRoactService
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function()
	-- upvalues: useDispatch (ref), useRoactService (ref), appLinking (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), VRService (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), default (ref)
	local var2 = useDispatch()
	local var3 = useRoactService(appLinking)
	local var4 = usePreferredInput() == responsiveModule.Input.Directional
	
	return reactModule.useCallback(function(p1, p2)
		-- upvalues: var3 (ref), var4 (ref), VRService (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateDown (copy), default (copy)
		if p2 then
			if var3 then
				if var4 or VRService.VREnabled then
					var3:openURL(p2)
					
					return
				end
				local t = {
					name = appPage.GenericWebPage,
					detail = p2,
					extraProps = { title = p1 }
				}
				
				if fFlagSignalsNavP3Dispatch then
					var1.down(var1.fromLegacyPage(t))
					
					return
				end
				var2(navigateDown(t))
				
				return
			else
				default:openURL(p2)
			end
		end
	end, { var3, var2, var4 })
end