local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local _ = require(ampUpsell.Common.Types)
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local navigateFromWebView = require(parent.NavigationRodux).Thunks.NavigateFromWebView
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableAmpWizardDeepLink = sharedFlagsModule.FFlagEnableAmpWizardDeepLink
local fFlagLuaAppWizardContainerBypassNavigationLock = require(parent.SharedFlags).FFlagLuaAppWizardContainerBypassNavigationLock
local fFlagLuaAppPlayButtonWizardCloseDelay = sharedFlagsModule.FFlagLuaAppPlayButtonWizardCloseDelay
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var2 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10) --[[ line: 19 ]]
	-- upvalues: fFlagEnableAmpWizardDeepLink (ref), appPage (ref), fFlagLuaAppPlayButtonWizardCloseDelay (ref), fFlagSignalsNavP3Dispatch (ref), var2 (ref), fFlagLuaAppWizardContainerBypassNavigationLock (ref), navigateBack (ref), navigateFromWebView (ref), navigateDown (ref)
	local var3 = fFlagEnableAmpWizardDeepLink and (p7 ~= nil and p7.returnPage ~= nil)
	
	return function(p11) --[[ line: 34 ]]
		-- upvalues: appPage (copy), p0 (ref), p2 (ref), p3 (ref), p5 (ref), p4 (ref), p7 (ref), fFlagLuaAppPlayButtonWizardCloseDelay (copy), p8 (ref), fFlagSignalsNavP3Dispatch (copy), var2 (copy), fFlagLuaAppWizardContainerBypassNavigationLock (copy), navigateBack (copy), p1 (ref), p6 (ref), p9 (ref), p10 (ref), var3 (ref), navigateFromWebView (copy), navigateDown (copy)
		local t = {
			name = appPage.AmpWizardContainer,
			extraProps = {
				featureName = p0,
				recourseData = p2,
				entryPointEventCtx = p3,
				nameSpace = p5,
				extraParameters = p4,
				metadata = p7,
				completionCallback = function(p12, p13) --[[ line: 44 ]]
					-- upvalues: fFlagLuaAppPlayButtonWizardCloseDelay (copy), p8 (copy), p11 (ref), fFlagSignalsNavP3Dispatch (copy), var2 (copy), fFlagLuaAppWizardContainerBypassNavigationLock (copy), navigateBack (copy), p1 (copy)
					if fFlagLuaAppPlayButtonWizardCloseDelay and p8 then
						p8(p11, p12, p13)
						
						return
					elseif fFlagSignalsNavP3Dispatch then
						var2.back(if fFlagLuaAppWizardContainerBypassNavigationLock then true else nil)
					else
						p11:dispatch(navigateBack(if fFlagLuaAppWizardContainerBypassNavigationLock then true else nil))
					end
					p1(p12, p13)
				end,
				skipFacialAgeEstimationWebLinkModal = p6,
				usePrologue = p9,
				prologueOptions = p10
			}
		}
		
		if var3 then
			if fFlagSignalsNavP3Dispatch then
				var2.fromWebView(var2.fromLegacyPage(t), true)
				
				return
			end
			p11:dispatch(navigateFromWebView(t, true))
			
			return
		elseif fFlagSignalsNavP3Dispatch then
			var2.down(var2.fromLegacyPage(t), true)
			
			return
		end
		p11:dispatch(navigateDown(t, true))
	end
end