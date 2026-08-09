local parent = script:FindFirstAncestor("AmpUpsell").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local navigateFromWebView = require(parent.NavigationRodux).Thunks.NavigateFromWebView
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableAmpWizardDeepLink = sharedFlagsModule.FFlagEnableAmpWizardDeepLink
local fFlagLuaAppWizardContainerBypassNavigationLock = require(parent.SharedFlags).FFlagLuaAppWizardContainerBypassNavigationLock
local fFlagLuaAppPlayButtonWizardCloseDelay = sharedFlagsModule.FFlagLuaAppPlayButtonWizardCloseDelay
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9) --[[ line: 18 ]]
	-- upvalues: fFlagEnableAmpWizardDeepLink (ref), appPage (ref), fFlagLuaAppPlayButtonWizardCloseDelay (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), fFlagLuaAppWizardContainerBypassNavigationLock (ref), navigateBack (ref), navigateFromWebView (ref), navigateDown (ref)
	local var2 = fFlagEnableAmpWizardDeepLink and (p7 ~= nil and p7.returnPage ~= nil)
	
	return function(p10) --[[ line: 32 ]]
		-- upvalues: appPage (copy), p0 (ref), p2 (ref), p3 (ref), p5 (ref), p4 (ref), p7 (ref), fFlagLuaAppPlayButtonWizardCloseDelay (copy), p8 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), fFlagLuaAppWizardContainerBypassNavigationLock (copy), navigateBack (copy), p1 (ref), p6 (ref), p9 (ref), var2 (ref), navigateFromWebView (copy), navigateDown (copy)
		local t = {
			name = appPage.AmpWizardContainer,
			extraProps = {
				featureName = p0,
				recourseData = p2,
				entryPointEventCtx = p3,
				nameSpace = p5,
				extraParameters = p4,
				metadata = p7,
				completionCallback = function(p11, p12) --[[ line: 42 ]]
					-- upvalues: fFlagLuaAppPlayButtonWizardCloseDelay (copy), p8 (copy), p10 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), fFlagLuaAppWizardContainerBypassNavigationLock (copy), navigateBack (copy), p1 (copy)
					if fFlagLuaAppPlayButtonWizardCloseDelay and p8 then
						p8(p10, p11, p12)
						
						return
					elseif fFlagSignalsNavP3Dispatch then
						var1.back(if fFlagLuaAppWizardContainerBypassNavigationLock then true else nil)
					else
						p10:dispatch(navigateBack(if fFlagLuaAppWizardContainerBypassNavigationLock then true else nil))
					end
					p1(p11, p12)
				end,
				skipFacialAgeEstimationWebLinkModal = p6,
				usePrologue = p9
			}
		}
		
		if var2 then
			if fFlagSignalsNavP3Dispatch then
				var1.fromWebView(var1.fromLegacyPage(t), true)
				
				return
			end
			p10:dispatch(navigateFromWebView(t, true))
			
			return
		elseif fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t), true)
			
			return
		end
		p10:dispatch(navigateDown(t, true))
	end
end