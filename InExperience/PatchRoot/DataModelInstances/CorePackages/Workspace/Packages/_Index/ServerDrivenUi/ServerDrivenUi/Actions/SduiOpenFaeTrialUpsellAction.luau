local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local _ = require(parent.SduiCoreSystem)
local startFacialAgeEstimation = require(parent.SocialUpsell).Thunks.startFacialAgeEstimation
local robloxSubscriptionPurchaseAppModule = require(parent.RobloxSubscriptionPurchaseApp)
local surfaceName = robloxSubscriptionPurchaseAppModule.SurfaceName
local surfaceContext = robloxSubscriptionPurchaseAppModule.SurfaceContext
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(_, _, p0) --[[ line: 24 | named "SduiOpenFaeTrialUpsellAction" ]]
	-- upvalues: appPage (ref), surfaceName (ref), surfaceContext (ref), startFacialAgeEstimation (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref)
	local dispatch = p0.dependencies.dispatch
	local localization = p0.dependencies.localization
	local t = {
		name = appPage.RobloxSubscriptionUpsell,
		extraProps = {
			purchaseUIOptions = {
				showLegalDisclosure = false,
				title = localization:Format("Feature.RobloxSubscription.Title.AgeCheckTrial"),
				description = localization:Format("Feature.RobloxSubscription.Description.AgeCheckTrial"),
				ctaText = localization:Format("Feature.FAE.Action.UnlockTrial")
			},
			surfaceName = surfaceName.HomepageFaeTrialBanner,
			surfaceContext = surfaceContext.InApp,
			onCtaOverride = function(p1, p2) --[[ line: 47 ]]
				-- upvalues: dispatch (ref), startFacialAgeEstimation (copy)
				dispatch(startFacialAgeEstimation("FacialAgeEstimationHomepagePlusFreeTrialBanner", p1, p2, "HomepagePlusFreeTrialBanner", false))
			end
		}
	}
	
	if fFlagSignalsNavP3Dispatch then
		var1.down(var1.fromLegacyPage(t))
		
		return
	end
	dispatch(navigateDown(t))
end