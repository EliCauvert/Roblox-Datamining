local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local _ = require(ampUpsell.Common.Types)
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local navigateFromWebView = require(parent.NavigationRodux).Thunks.NavigateFromWebView
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local selectors = require(parent.NavigationRodux).Selectors
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagAmpWizardDeepLinkReplaceOnlyWebViewModule = require(ampUpsell.Flags.FFlagAmpWizardDeepLinkReplaceOnlyWebView)
local fFlagEnableAmpWizardDeepLink = sharedFlagsModule.FFlagEnableAmpWizardDeepLink
local fFlagLuaAppWizardContainerBypassNavigationLock = require(parent.SharedFlags).FFlagLuaAppWizardContainerBypassNavigationLock
local fFlagLuaAppPlayButtonWizardCloseDelay = sharedFlagsModule.FFlagLuaAppPlayButtonWizardCloseDelay
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
	-- upvalues: fFlagEnableAmpWizardDeepLink (ref), appPage (ref), fFlagLuaAppPlayButtonWizardCloseDelay (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), fFlagLuaAppWizardContainerBypassNavigationLock (ref), navigateBack (ref), fFlagAmpWizardDeepLinkReplaceOnlyWebViewModule (ref), selectors (ref), navigateFromWebView (ref), navigateDown (ref)
	local var2 = fFlagEnableAmpWizardDeepLink and (p8 ~= nil and p8.returnPage ~= nil)
	
	return function(p12)
		-- upvalues: appPage (copy), p1 (ref), p3 (ref), p4 (ref), p6 (ref), p5 (ref), p8 (ref), fFlagLuaAppPlayButtonWizardCloseDelay (copy), p9 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), fFlagLuaAppWizardContainerBypassNavigationLock (copy), navigateBack (copy), p2 (ref), p7 (ref), p10 (ref), p11 (ref), fFlagAmpWizardDeepLinkReplaceOnlyWebViewModule (copy), var2 (write), selectors (copy), navigateFromWebView (copy), navigateDown (copy)
		local t = {
			name = appPage.AmpWizardContainer,
			extraProps = {
				featureName = p1,
				recourseData = p3,
				entryPointEventCtx = p4,
				nameSpace = p6,
				extraParameters = p5,
				metadata = p8,
				completionCallback = function(p13, p14)
					-- upvalues: fFlagLuaAppPlayButtonWizardCloseDelay (copy), p9 (copy), p12 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), fFlagLuaAppWizardContainerBypassNavigationLock (copy), navigateBack (copy), p2 (copy)
					if fFlagLuaAppPlayButtonWizardCloseDelay and p9 then
						p9(p12, p13, p14)
						
						return
					elseif fFlagSignalsNavP3Dispatch then
						var1.back(if fFlagLuaAppWizardContainerBypassNavigationLock then true else nil)
					else
						p12:dispatch(navigateBack(if fFlagLuaAppWizardContainerBypassNavigationLock then true else nil))
					end
					p2(p13, p14)
				end,
				skipFacialAgeEstimationWebLinkModal = p7,
				usePrologue = p10,
				prologueOptions = p11
			}
		}
		
		if fFlagAmpWizardDeepLinkReplaceOnlyWebViewModule and var2 then
			var2 = var2 and selectors.selectCurrentPageName(p12:getState()) == appPage.GenericWebPage
		end
		if var2 then
			if fFlagSignalsNavP3Dispatch then
				var1.fromWebView(var1.fromLegacyPage(t), true)
				
				return
			end
			p12:dispatch(navigateFromWebView(t, true))
			
			return
		elseif fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t), true)
			
			return
		end
		p12:dispatch(navigateDown(t, true))
	end
end