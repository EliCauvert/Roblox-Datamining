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
local var3 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local var4 = require(parent.UrlBuilder).UrlBuilder.new({
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

return function(p0, _, p1) --[[ line: 45 | named "SduiOpenFaeTrialUpsellAction" ]]
	-- upvalues: fFlagRobloxPlusUpsellRefreshOnComplete (ref), appPage (ref), surfaceName (ref), surfaceContext (ref), var4 (ref), fFlagSignalsNavP3Dispatch (ref), var3 (ref), navigateDown (ref), claimTrial (ref), subscriptionGrantType (ref), getSduiApiStore (ref), sduiErrorType (ref), sduiActionType (ref), sduiParseHelpers (ref), startFacialAgeEstimation (ref)
	local dispatch = p1.dependencies.dispatch
	local localization = p1.dependencies.localization
	local var5 = if fFlagRobloxPlusUpsellRefreshOnComplete then if p0 then p0.actionParams else nil else nil
	local var6 = if fFlagRobloxPlusUpsellRefreshOnComplete then var5 and var5.promptType else nil
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
			onCtaOverride = function(p2, p3) --[[ line: 79 ]]
				-- upvalues: appPage (copy), var4 (copy), fFlagSignalsNavP3Dispatch (copy), var3 (copy), dispatch (ref), navigateDown (copy), claimTrial (copy), subscriptionGrantType (copy), fFlagRobloxPlusUpsellRefreshOnComplete (copy), getSduiApiStore (copy), var6 (ref), p1 (ref), sduiErrorType (copy), sduiActionType (copy), sduiParseHelpers (copy), startFacialAgeEstimation (copy)
				local function openConfirmationWebview(p4) --[[ line: 80 ]]
					-- upvalues: appPage (copy), var4 (copy), fFlagSignalsNavP3Dispatch (copy), var3 (copy), dispatch (copy), navigateDown (copy)
					local t = {
						name = appPage.GenericWebPage,
						detail = var4({ t = tostring(os.time()) }),
						extraProps = { title = "", onClose = p4 }
					}
					
					if fFlagSignalsNavP3Dispatch then
						var3.down(var3.fromLegacyPage(t))
						
						return
					end
					dispatch(navigateDown(t))
				end
				
				dispatch(startFacialAgeEstimation("FacialAgeEstimationHomepagePlusFreeTrialBanner", function() --[[ line: 96 | named "onFaeSuccess" ]]
					-- upvalues: claimTrial (copy), subscriptionGrantType (copy), p2 (ref), fFlagRobloxPlusUpsellRefreshOnComplete (copy), getSduiApiStore (copy), var6 (copy), openConfirmationWebview (ref), p1 (copy), sduiErrorType (copy), sduiActionType (copy), sduiParseHelpers (copy)
					claimTrial(subscriptionGrantType.FaeFreeTrial):andThen(function() --[[ line: 102 ]]
						-- upvalues: p2 (copy), fFlagRobloxPlusUpsellRefreshOnComplete (copy), getSduiApiStore (copy), var6 (copy), openConfirmationWebview (copy)
						local var10 = if fFlagRobloxPlusUpsellRefreshOnComplete then function() --[[ line: 110 ]]
							-- upvalues: getSduiApiStore (copy), var6 (copy), p2 (copy)
							local dismissEntry = getSduiApiStore().dismissEntry
							
							if dismissEntry and typeof(var6) == "string" then
								dismissEntry(var6)
							end
							p2()
						end else p2
						task.delay(1, function() --[[ line: 122 ]]
							-- upvalues: openConfirmationWebview (copy), var10 (write)
							openConfirmationWebview(var10)
						end)
					end):catch(function(p5) --[[ line: 126 ]]
						-- upvalues: p1 (copy), sduiErrorType (copy), sduiActionType (copy), sduiParseHelpers (copy)
						p1.dependencies.logger.reportError(sduiErrorType.ActionNetworkRequestFailed, {
							name = sduiActionType.OpenFaeTrialUpsell,
							message = `claimTrial failed: {sduiParseHelpers.stringifyValue(p5)}`
						}, p1.appPage)
					end)
				end, p3, "HomepagePlusFreeTrialBanner", false, true))
			end
		}
	}
	
	if fFlagSignalsNavP3Dispatch then
		var3.down(var3.fromLegacyPage(t))
		
		return
	end
	dispatch(navigateDown(t))
end