local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local _ = require(AmpUpsell.Common.Types)
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local NavigateFromWebViewFunction = require(Parent.NavigationRodux).Thunks.NavigateFromWebView
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local Selectors = require(Parent.NavigationRodux).Selectors
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAmpWizardDeepLinkReplaceOnlyWebViewModule = require(AmpUpsell.Flags.FFlagAmpWizardDeepLinkReplaceOnlyWebView)
local FFlagEnableAmpWizardDeepLink = SharedFlagsModule.FFlagEnableAmpWizardDeepLink
local FFlagLuaAppWizardContainerBypassNavigationLock = require(Parent.SharedFlags).FFlagLuaAppWizardContainerBypassNavigationLock
local FFlagLuaAppPlayButtonWizardCloseDelay = SharedFlagsModule.FFlagLuaAppPlayButtonWizardCloseDelay
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local GetLegacyNavigationStore = if FFlagSignalsNavP3Dispatch then require(Parent.NavigationRodux).GetLegacyNavigationStore else nil

return function(FeatureName, Callback1, RecourseData, EntryPointEventCtx, ExtraParameters, NameSpace, SkipFacialAgeEstimationWebLinkModal, Metadata, Callback, UsePrologue, PrologueOptions)
	-- upvalues: FFlagEnableAmpWizardDeepLink (copy), AppPage (copy), FFlagLuaAppPlayButtonWizardCloseDelay (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), FFlagLuaAppWizardContainerBypassNavigationLock (copy), NavigateBackFunction (copy), FFlagAmpWizardDeepLinkReplaceOnlyWebViewModule (copy), GetLegacyNavigationStore (copy), Selectors (copy), NavigateFromWebViewFunction (copy), NavigateDownFunction (copy)
	local HasReturnPage: boolean = FFlagEnableAmpWizardDeepLink and (Metadata ~= nil and Metadata.returnPage ~= nil)
	
	return function(p1)
		-- upvalues: AppPage (upval), FeatureName (copy), RecourseData (copy), EntryPointEventCtx (copy), NameSpace (copy), ExtraParameters (copy), Metadata (copy), FFlagLuaAppPlayButtonWizardCloseDelay (upval), Callback (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), FFlagLuaAppWizardContainerBypassNavigationLock (upval), NavigateBackFunction (upval), Callback1 (copy), SkipFacialAgeEstimationWebLinkModal (copy), UsePrologue (copy), PrologueOptions (copy), FFlagAmpWizardDeepLinkReplaceOnlyWebViewModule (upval), HasReturnPage (ref), GetLegacyNavigationStore (upval), Selectors (upval), NavigateFromWebViewFunction (upval), NavigateDownFunction (upval)
		local config = {
			name = AppPage.AmpWizardContainer,
			extraProps = {
				featureName = FeatureName,
				recourseData = RecourseData,
				entryPointEventCtx = EntryPointEventCtx,
				nameSpace = NameSpace,
				extraParameters = ExtraParameters,
				metadata = Metadata,
				completionCallback = function(p2, p3)
					-- upvalues: FFlagLuaAppPlayButtonWizardCloseDelay (upval), Callback (upval), p1 (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), FFlagLuaAppWizardContainerBypassNavigationLock (upval), NavigateBackFunction (upval), Callback1 (upval)
					if FFlagLuaAppPlayButtonWizardCloseDelay and Callback then
						Callback(p1, p2, p3)
						
						return
					end
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.back(if FFlagLuaAppWizardContainerBypassNavigationLock then true else nil)
					else
						p1:dispatch(NavigateBackFunction(if FFlagLuaAppWizardContainerBypassNavigationLock then true else nil))
					end
					Callback1(p2, p3)
				end,
				skipFacialAgeEstimationWebLinkModal = SkipFacialAgeEstimationWebLinkModal,
				usePrologue = UsePrologue,
				prologueOptions = PrologueOptions
			}
		}
		
		if FFlagAmpWizardDeepLinkReplaceOnlyWebViewModule and HasReturnPage then
			local IsGenericWebPageMatch = (if FFlagSignalsNavP3Dispatch then GetLegacyNavigationStore(false).getCurrentPageName(false) else Selectors.selectCurrentPageName(p1:getState())) == AppPage.GenericWebPage
			HasReturnPage = HasReturnPage and IsGenericWebPageMatch
		end
		if HasReturnPage then
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.fromWebView(NavigationCommands.fromLegacyPage(config), true)
				
				return
			else
				p1:dispatch(NavigateFromWebViewFunction(config, true))
				
				return
			end
		elseif FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config), true)
			
			return
		else
			p1:dispatch(NavigateDownFunction(config, true))
		end
	end
end