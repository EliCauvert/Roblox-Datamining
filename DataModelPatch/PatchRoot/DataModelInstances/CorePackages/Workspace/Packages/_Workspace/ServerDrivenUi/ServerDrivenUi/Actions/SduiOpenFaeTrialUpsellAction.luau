local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiParseHelpers = SduiCoreSystemModule.SduiParseHelpers
local StartFacialAgeEstimationFunction = require(Parent.SocialUpsell).Thunks.startFacialAgeEstimation
local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
local SurfaceName = RobloxSubscriptionPurchaseAppModule.SurfaceName
local SurfaceContext = RobloxSubscriptionPurchaseAppModule.SurfaceContext
local SubscriptionGrantType = RobloxSubscriptionPurchaseAppModule.SubscriptionGrantType
local ClaimTrialFunction = RobloxSubscriptionPurchaseAppModule.Network.claimTrial
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
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

return function(_, _, p1)
	-- upvalues: AppPage (copy), SurfaceName (copy), SurfaceContext (copy), NewResult (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), ClaimTrialFunction (copy), SubscriptionGrantType (copy), SduiErrorType (copy), SduiActionType (copy), SduiParseHelpers (copy), StartFacialAgeEstimationFunction (copy)
	local DispatchFunction: (any) -> () = p1.dependencies.dispatch
	local Localization = p1.dependencies.localization
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
			onCtaOverride = function(OnClose, p2)
				-- upvalues: AppPage (upval), NewResult (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), DispatchFunction (copy), NavigateDownFunction (upval), ClaimTrialFunction (upval), SubscriptionGrantType (upval), p1 (copy), SduiErrorType (upval), SduiActionType (upval), SduiParseHelpers (upval), StartFacialAgeEstimationFunction (upval)
				local function openConfirmationWebview()
					-- upvalues: AppPage (upval), NewResult (upval), OnClose (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), DispatchFunction (upval), NavigateDownFunction (upval)
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
				
				DispatchFunction(StartFacialAgeEstimationFunction("FacialAgeEstimationHomepagePlusFreeTrialBanner", function()
					-- upvalues: ClaimTrialFunction (upval), SubscriptionGrantType (upval), openConfirmationWebview (copy), p1 (upval), SduiErrorType (upval), SduiActionType (upval), SduiParseHelpers (upval)
					ClaimTrialFunction(SubscriptionGrantType.FaeFreeTrial):andThen(function()
						-- upvalues: openConfirmationWebview (upval)
						task.delay(1, openConfirmationWebview)
					end):catch(function(Err)
						-- upvalues: p1 (upval), SduiErrorType (upval), SduiActionType (upval), SduiParseHelpers (upval)
						p1.dependencies.logger.reportError(SduiErrorType.ActionNetworkRequestFailed, {
							name = SduiActionType.OpenFaeTrialUpsell,
							message = `claimTrial failed: {SduiParseHelpers.stringifyValue(Err)}`
						}, p1.appPage)
					end)
				end, p2, "HomepagePlusFreeTrialBanner", false, true))
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