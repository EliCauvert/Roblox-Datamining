local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiParseHelpers = sduiCoreSystemModule.SduiParseHelpers
local getSduiApiStore = require(parent.SduiSharedUtilities).getSduiApiStore
local startFacialAgeEstimation = require(parent.SocialUpsell).Thunks.startFacialAgeEstimation
local robloxSubscriptionPurchaseAppModule = require(parent.RobloxSubscriptionPurchaseApp)
local surfaceName = robloxSubscriptionPurchaseAppModule.SurfaceName
local surfaceContext = robloxSubscriptionPurchaseAppModule.SurfaceContext
local subscriptionGrantType = robloxSubscriptionPurchaseAppModule.SubscriptionGrantType
local claimTrial = robloxSubscriptionPurchaseAppModule.Network.claimTrial
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local fFlagRobloxPlusUpsellRefreshOnComplete = sharedFlagsModule.FFlagRobloxPlusUpsellRefreshOnComplete
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local var2 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "plus",
	base = require(parent.UrlBuilder).UrlBase.WWW,
	query = {
		{
			name = "faeFreeTrialConfirmation",
			value = "true",
			optional = false
		},
		{ name = "t", value = "{t}", optional = false }
	}
})

return function(p1, _, p2)
	-- upvalues: fFlagRobloxPlusUpsellRefreshOnComplete (ref), appPage (ref), surfaceName (ref), surfaceContext (ref), var2 (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), claimTrial (ref), subscriptionGrantType (ref), getSduiApiStore (ref), sduiErrorType (ref), sduiActionType (ref), sduiParseHelpers (ref), startFacialAgeEstimation (ref)
	local dispatch = p2.dependencies.dispatch
	local localization = p2.dependencies.localization
	local var3 = if fFlagRobloxPlusUpsellRefreshOnComplete then if p1 then p1.actionParams else nil else nil
	local var4 = if fFlagRobloxPlusUpsellRefreshOnComplete then var3 and var3.promptType else nil
	local t = {
		name = appPage.RobloxSubscriptionUpsell,
		extraProps = {
			purchaseUIOptions = {
				skipGuacPolicy = true,
				showLegalDisclosure = true,
				noPurchaseMethodRequired = true,
				title = localization:Format("Feature.RobloxSubscription.Title.AgeCheckTrial"),
				description = localization:Format("Feature.RobloxSubscription.Description.AgeCheckTrial"),
				ctaText = localization:Format("Feature.FAE.Action.Continue")
			},
			surfaceName = surfaceName.HomepageFaeTrialBanner,
			surfaceContext = surfaceContext.InApp,
			onCtaOverride = function(p3, p4)
				-- upvalues: appPage (copy), var2 (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), dispatch (ref), navigateDown (copy), claimTrial (copy), subscriptionGrantType (copy), fFlagRobloxPlusUpsellRefreshOnComplete (copy), getSduiApiStore (copy), var4 (ref), p2 (ref), sduiErrorType (copy), sduiActionType (copy), sduiParseHelpers (copy), startFacialAgeEstimation (copy)
				local function openConfirmationWebview(p5)
					-- upvalues: appPage (copy), var2 (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), dispatch (copy), navigateDown (copy)
					local t = {
						name = appPage.GenericWebPage,
						detail = var2({ t = tostring(os.time()) }),
						extraProps = { title = "", onClose = p5 }
					}
					
					if fFlagSignalsNavP3Dispatch then
						var1.down(var1.fromLegacyPage(t))
						
						return
					end
					dispatch(navigateDown(t))
				end
				
				dispatch(startFacialAgeEstimation("FacialAgeEstimationHomepagePlusFreeTrialBanner", function()
					-- upvalues: claimTrial (copy), subscriptionGrantType (copy), p3 (ref), fFlagRobloxPlusUpsellRefreshOnComplete (copy), getSduiApiStore (copy), var4 (copy), openConfirmationWebview (ref), p2 (copy), sduiErrorType (copy), sduiActionType (copy), sduiParseHelpers (copy)
					claimTrial(subscriptionGrantType.FaeFreeTrial):andThen(function()
						-- upvalues: p3 (copy), fFlagRobloxPlusUpsellRefreshOnComplete (copy), getSduiApiStore (copy), var4 (copy), openConfirmationWebview (copy)
						local var5 = if fFlagRobloxPlusUpsellRefreshOnComplete then function()
							-- upvalues: getSduiApiStore (copy), var4 (copy), p3 (copy)
							local dismissEntry = getSduiApiStore().dismissEntry
							
							if dismissEntry and typeof(var4) == "string" then
								dismissEntry(var4)
							end
							p3()
						end else p3
						task.delay(1, function()
							-- upvalues: openConfirmationWebview (copy), var5 (write)
							openConfirmationWebview(var5)
						end)
					end):catch(function(p5)
						-- upvalues: p2 (copy), sduiErrorType (copy), sduiActionType (copy), sduiParseHelpers (copy)
						p2.dependencies.logger.reportError(sduiErrorType.ActionNetworkRequestFailed, {
							name = sduiActionType.OpenFaeTrialUpsell,
							message = `claimTrial failed: {sduiParseHelpers.stringifyValue(p5)}`
						}, p2.appPage)
					end)
				end, p4, "HomepagePlusFreeTrialBanner", false, true))
			end
		}
	}
	
	if fFlagSignalsNavP3Dispatch then
		var1.down(var1.fromLegacyPage(t))
		
		return
	end
	dispatch(navigateDown(t))
end