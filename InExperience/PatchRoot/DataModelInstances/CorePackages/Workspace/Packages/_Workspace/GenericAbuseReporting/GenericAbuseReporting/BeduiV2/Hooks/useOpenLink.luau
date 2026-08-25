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
local var6 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function()
	-- upvalues: useDispatch (ref), useRoactService (ref), appLinking (ref), usePreferredInput (ref), responsiveModule (ref), reactModule (ref), VRService (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var6 (ref), navigateDown (ref), default (ref)
	local var7 = useDispatch()
	local var8 = useRoactService(appLinking)
	local var9 = usePreferredInput() == responsiveModule.Input.Directional
	
	return reactModule.useCallback(function(p0, p1)
		-- upvalues: var8 (ref), var9 (ref), VRService (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var6 (copy), var7 (ref), navigateDown (copy), default (copy)
		if p1 then
			if var8 then
				if var9 or VRService.VREnabled then
					var8:openURL(p1)
					
					return
				end
				local t = {
					name = appPage.GenericWebPage,
					detail = p1,
					extraProps = { title = p0 }
				}
				
				if fFlagSignalsNavP3Dispatch then
					var6.down(var6.fromLegacyPage(t))
					
					return
				end
				var7(navigateDown(t))
				
				return
			else
				default:openURL(p1)
			end
		end
	end, { var8, var7, var9 })
end