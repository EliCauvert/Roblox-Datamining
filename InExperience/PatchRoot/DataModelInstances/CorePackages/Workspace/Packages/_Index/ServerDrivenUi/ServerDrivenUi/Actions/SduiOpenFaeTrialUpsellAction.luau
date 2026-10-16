local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local GetSduiApiStoreFunction = require(Parent.SduiSharedUtilities).getSduiApiStore
local SetPromptDismissedInPageScopeFunction = require(Parent.PromptsServerDrivenUi).setPromptDismissedInPageScope
local StartFacialAgeEstimationFunction = require(Parent.SocialUpsell).Thunks.startFacialAgeEstimation
local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
local SurfaceName = RobloxSubscriptionPurchaseAppModule.SurfaceName
local SurfaceContext = RobloxSubscriptionPurchaseAppModule.SurfaceContext
local SubscriptionGrantType = RobloxSubscriptionPurchaseAppModule.SubscriptionGrantType
local ClaimTrialFunction = RobloxSubscriptionPurchaseAppModule.Network.claimTrial
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local FFlagRobloxPlusUpsellRefreshOnComplete = SharedFlagsModule.FFlagRobloxPlusUpsellRefreshOnComplete
local FFlagSduiDismissPromptPageScope = SharedFlagsModule.FFlagSduiDismissPromptPageScope
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "plus",
	base = require(Parent.UrlBuilder).UrlBase.WWW,
	query = {
		{
			name = "faeFreeTrialConfirmation",
			value = "true",
			optional = false
		},
		{ name = "t", value = "{t}", optional = false }
	}
})

return function(p1, _, p2) --[[ Line: 47 | Named "SduiOpenFaeTrialUpsellAction" ]]
	-- upvalues: FFlagRobloxPlusUpsellRefreshOnComplete (copy), AppPage (copy), SurfaceName (copy), SurfaceContext (copy), NewResult (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), ClaimTrialFunction (copy), SubscriptionGrantType (copy), GetSduiApiStoreFunction (copy), FFlagSduiDismissPromptPageScope (copy), SetPromptDismissedInPageScopeFunction (copy), SduiErrorType (copy), SduiActionType (copy), SduiParseHelpers (copy), StartFacialAgeEstimationFunction (copy)
	local DispatchFunction: (any) -> () = p2.dependencies.dispatch
	local Localization = p2.dependencies.localization
	local ActionParams = FFlagRobloxPlusUpsellRefreshOnComplete and (p1 and p1.actionParams) or nil
	local PromptType = if FFlagRobloxPlusUpsellRefreshOnComplete then ActionParams and ActionParams.promptType else nil
	local config = {
		name = AppPage.RobloxSubscriptionUpsell,
		extraProps = {
			purchaseUIOptions = {
				skipGuacPolicy = true,
				showLegalDisclosure = true,
				noPurchaseMethodRequired = true,
				title = Localization:Format("Feature.RobloxSubscription.Title.AgeCheckTrial"),
				description = Localization:Format("Feature.RobloxSubscription.Description.AgeCheckTrial"),
				ctaText = Localization:Format("Feature.FAE.Action.Continue")
			},
			surfaceName = SurfaceName.HomepageFaeTrialBanner,
			surfaceContext = SurfaceContext.InApp,
			onCtaOverride = function(Callback, p3) --[[ Line: 81 ]]
				-- upvalues: AppPage (upval), NewResult (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), DispatchFunction (copy), NavigateDownFunction (upval), ClaimTrialFunction (upval), SubscriptionGrantType (upval), FFlagRobloxPlusUpsellRefreshOnComplete (upval), GetSduiApiStoreFunction (upval), FFlagSduiDismissPromptPageScope (upval), PromptType (copy), p2 (copy), SetPromptDismissedInPageScopeFunction (upval), SduiErrorType (upval), SduiActionType (upval), SduiParseHelpers (upval), StartFacialAgeEstimationFunction (upval)
				local function openConfirmationWebview(OnClose) --[[ Line: 82 ]]
					-- upvalues: AppPage (upval), NewResult (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), DispatchFunction (upval), NavigateDownFunction (upval)
					local config = {
						name = AppPage.GenericWebPage,
						detail = NewResult({ t = tostring(os.time()) }),
						extraProps = { title = "", onClose = OnClose }
					}
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						DispatchFunction(NavigateDownFunction(config))
					end
				end
				
				DispatchFunction(StartFacialAgeEstimationFunction("FacialAgeEstimationHomepagePlusFreeTrialBanner", function() --[[ Line: 98 | Named "onFaeSuccess" ]]
					-- upvalues: ClaimTrialFunction (upval), SubscriptionGrantType (upval), Callback (copy), FFlagRobloxPlusUpsellRefreshOnComplete (upval), GetSduiApiStoreFunction (upval), FFlagSduiDismissPromptPageScope (upval), PromptType (upval), p2 (upval), SetPromptDismissedInPageScopeFunction (upval), openConfirmationWebview (copy), SduiErrorType (upval), SduiActionType (upval), SduiParseHelpers (upval)
					ClaimTrialFunction(SubscriptionGrantType.FaeFreeTrial):andThen(function() --[[ Line: 104 ]]
						-- upvalues: Callback (upval), FFlagRobloxPlusUpsellRefreshOnComplete (upval), GetSduiApiStoreFunction (upval), FFlagSduiDismissPromptPageScope (upval), PromptType (upval), p2 (upval), SetPromptDismissedInPageScopeFunction (upval), openConfirmationWebview (upval)
						local Callback1 = if FFlagRobloxPlusUpsellRefreshOnComplete then function() --[[ Line: 112 ]]
							-- upvalues: GetSduiApiStoreFunction (upval), FFlagSduiDismissPromptPageScope (upval), PromptType (upval), p2 (upval), SetPromptDismissedInPageScopeFunction (upval), Callback (upval)
							local DismissEntryFunction: (any) -> () = GetSduiApiStoreFunction().dismissEntry
							
							if FFlagSduiDismissPromptPageScope then
								if typeof(PromptType) == "string" then
									if DismissEntryFunction then
										DismissEntryFunction(PromptType)
									end
									if typeof(p2.configKey) == "string" and p2.configKey ~= "" then
										SetPromptDismissedInPageScopeFunction(p2.configKey, PromptType)
									end
								end
							elseif DismissEntryFunction and typeof(PromptType) == "string" then
								DismissEntryFunction(PromptType)
							end
							Callback()
						end else Callback
						task.delay(1, function() --[[ Line: 139 ]]
							-- upvalues: openConfirmationWebview (upval), Callback1 (ref)
							openConfirmationWebview(Callback1)
						end)
					end):catch(function(Err) --[[ Line: 143 ]]
						-- upvalues: p2 (upval), SduiErrorType (upval), SduiActionType (upval), SduiParseHelpers (upval)
						p2.dependencies.logger.reportError(SduiErrorType.ActionNetworkRequestFailed, {
							name = SduiActionType.OpenFaeTrialUpsell,
							message = `claimTrial failed: {SduiParseHelpers.stringifyValue(Err)}`
						}, p2.appPage)
					end)
				end, p3, "HomepagePlusFreeTrialBanner", false, true))
			end
		}
	}
	
	if FFlagSignalsNavP3Dispatch then
		NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
		
		return
	else
		DispatchFunction(NavigateDownFunction(config))
	end
end