local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local RoactNavigationModule = require(Parent.RoactNavigation)
local ReactModule = require(Parent.React)
local WizardContainerModule = require(AmpUpsell.Components.WizardContainer)
local ActionTypeEnum = require(AmpUpsell.Common.Enums).ActionTypeEnum
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local CreateLazyComponentFunction = require(Parent.RoactUtils).Components.createLazyComponent
local FAEUpsellContainerModule = require(AmpUpsell.Components.Upsells.FacialAgeEstimation.FAEUpsellContainer)
local IDVUpsellContainerModule = require(AmpUpsell.Components.Upsells.IdentityVerification.IDVUpsellContainer)
local CryoModule = require(Parent.Cryo)
local AppScreensModule = require(AmpUpsell.Common.AppScreens)
local WebViewServiceWrapperModule = require(AmpUpsell.Components.WebViewServiceWrapper)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local AccountSettingsUpsellModule = require(AmpUpsell.Components.Upsells.AccountSettingsUpsell)
local VPCUpsellContainerModule = require(AmpUpsell.Components.Upsells.ParentalRequest.VPCUpsellContainer)
local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
local RobloxSubscriptionFlowCompleteReason = RobloxSubscriptionPurchaseAppModule.RobloxSubscriptionFlowCompleteReason
local SurfaceName = RobloxSubscriptionPurchaseAppModule.SurfaceName

local function v17(p1) --[[ Line: 45 ]]
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), AppScreensModule (copy), UrlBuilder (copy), CryoModule (copy), ActionTypeEnum (copy), WizardContainerModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	
	return ReactModule.createElement(WizardContainerModule, (CryoModule.Dictionary.join(p1 or {}, {
		openUpsells = {
			[ActionTypeEnum.AgeEstimation] = ReactModule.useCallback(function(ExtraProps) --[[ Line: 67 ]]
				-- upvalues: UseNavigationResult (copy)
				UseNavigationResult.push("FAEUpsell", { extraProps = ExtraProps })
			end, { UseNavigationResult }),
			[ActionTypeEnum.GovernmentId] = ReactModule.useCallback(function(ExtraProps) --[[ Line: 62 ]]
				-- upvalues: UseNavigationResult (copy)
				UseNavigationResult.push("IDVUpsell", { extraProps = ExtraProps })
			end, { UseNavigationResult }),
			[ActionTypeEnum.Subscription] = ReactModule.useCallback(function(ExtraProps) --[[ Line: 71 ]]
				-- upvalues: UseNavigationResult (copy)
				UseNavigationResult.push("SubscriptionUpsell", { extraProps = ExtraProps })
			end, { UseNavigationResult }),
			[ActionTypeEnum.ParentConsent] = ReactModule.useCallback(function(ExtraProps) --[[ Line: 74 ]]
				-- upvalues: UseNavigationResult (copy)
				UseNavigationResult.push("VPCUpsell", { extraProps = ExtraProps })
			end, { UseNavigationResult }),
			[ActionTypeEnum.ParentLink] = ReactModule.useCallback(function(ExtraProps) --[[ Line: 77 ]]
				-- upvalues: UseNavigationResult (copy)
				UseNavigationResult.push("VPCUpsell", { extraProps = ExtraProps })
			end, { UseNavigationResult })
		},
		openAccountSettingsUpsell = ReactModule.useCallback(function(p2) --[[ Line: 48 ]]
			-- upvalues: UseNavigationResult (copy), AppScreensModule (upval), UrlBuilder (upval), CryoModule (upval)
			UseNavigationResult.push("AccountSettingsUpsell", {
				extraProps = CryoModule.Dictionary.join(p2 or {}, {
					openAccountSettings = function(Title) --[[ Line: 49 ]]
						-- upvalues: UseNavigationResult (upval), AppScreensModule (upval), UrlBuilder (upval)
						UseNavigationResult.push(AppScreensModule.GenericWebPage, {
							detail = UrlBuilder.static.settings.account(),
							extraProps = { title = Title }
						})
					end
				})
			})
		end, { UseNavigationResult })
	})))
end

return (RoactNavigationModule.createAppContainer((RoactNavigationModule.createRobloxStackNavigator({
	{
		Wizard = {
			screen = function(p1) --[[ Line: 93 ]]
				-- upvalues: UseNavigationFunction (copy), ReactModule (copy), v17 (copy)
				local ExtraPropsParam = UseNavigationFunction().getParam("extraProps")
				
				if not ExtraPropsParam and p1 and p1.screenProps then
					ExtraPropsParam = p1.screenProps.extraProps
				end
				return ReactModule.createElement(v17, ExtraPropsParam)
			end,
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	},
	{
		FAEUpsell = {
			screen = CreateLazyComponentFunction(function() --[[ Line: 110 ]]
				-- upvalues: FAEUpsellContainerModule (copy)
				return FAEUpsellContainerModule
			end),
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	},
	{
		IDVUpsell = {
			screen = CreateLazyComponentFunction(function() --[[ Line: 121 ]]
				-- upvalues: UseNavigationFunction (copy), ReactModule (copy), IDVUpsellContainerModule (copy)
				return function() --[[ Line: 122 ]]
					-- upvalues: UseNavigationFunction (upval), ReactModule (upval), IDVUpsellContainerModule (upval)
					return ReactModule.createElement(IDVUpsellContainerModule, (UseNavigationFunction().getParam("extraProps")))
				end
			end),
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	},
	{
		SubscriptionUpsell = {
			screen = function(p1) --[[ Line: 136 ]]
				-- upvalues: ReactModule (copy), RobloxSubscriptionPurchaseAppModule (copy), RobloxSubscriptionFlowCompleteReason (copy), SurfaceName (copy)
				local ExtraPropsParam = p1.navigation.getParam("extraProps") or {}
				ReactModule.useEffect(function() --[[ Line: 152 ]]
					-- upvalues: RobloxSubscriptionPurchaseAppModule (upval), ExtraPropsParam (copy), RobloxSubscriptionFlowCompleteReason (upval), SurfaceName (upval)
					local InitiateRobloxSubscriptionPurchaseResult = RobloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase(ExtraPropsParam.purchaseUIOptions, {
						onFlowComplete = function(UpsellPurchaseFailed) --[[ Line: 156 ]]
							-- upvalues: RobloxSubscriptionFlowCompleteReason (upval), ExtraPropsParam (upval)
							if UpsellPurchaseFailed == RobloxSubscriptionFlowCompleteReason.UpsellPurchaseSucceeded then
								if ExtraPropsParam.onSuccess then
									ExtraPropsParam.onSuccess()
									
									return
								end
							elseif UpsellPurchaseFailed == RobloxSubscriptionFlowCompleteReason.UpsellPurchaseFailed then
								if ExtraPropsParam.onFailure then
									ExtraPropsParam.onFailure()
									
									return
								end
								if ExtraPropsParam.onCancel then
									ExtraPropsParam.onCancel()
									
									return
								end
							elseif ExtraPropsParam.onCancel then
								ExtraPropsParam.onCancel()
							end
						end
					}, nil, ExtraPropsParam.surfaceName or SurfaceName.Unspecified, ExtraPropsParam.surfaceContext or RobloxSubscriptionPurchaseAppModule.SurfaceContext.Unspecified, nil, ExtraPropsParam.analyticsContext)
					
					return function() --[[ Line: 186 ]]
						-- upvalues: InitiateRobloxSubscriptionPurchaseResult (copy)
						if InitiateRobloxSubscriptionPurchaseResult then
							InitiateRobloxSubscriptionPurchaseResult()
						end
					end
				end, {
					ExtraPropsParam.analyticsContext, ExtraPropsParam.onCancel,
					ExtraPropsParam.onFailure, ExtraPropsParam.onSuccess,
					ExtraPropsParam.purchaseUIOptions, ExtraPropsParam.surfaceContext,
					ExtraPropsParam.surfaceName
				})
				
				return ReactModule.createElement(ReactModule.Fragment, {})
			end,
			navigationOptions = { transparent = true, overlayEnabled = false }
		}
	},
	{
		AccountSettingsUpsell = {
			screen = CreateLazyComponentFunction(function() --[[ Line: 214 ]]
				-- upvalues: UseNavigationFunction (copy), ReactModule (copy), AccountSettingsUpsellModule (copy)
				return function() --[[ Line: 215 ]]
					-- upvalues: UseNavigationFunction (upval), ReactModule (upval), AccountSettingsUpsellModule (upval)
					return ReactModule.createElement(AccountSettingsUpsellModule, (UseNavigationFunction().getParam("extraProps")))
				end
			end),
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	},
	{
		VPCUpsell = {
			screen = CreateLazyComponentFunction(function() --[[ Line: 229 ]]
				-- upvalues: UseNavigationFunction (copy), ReactModule (copy), VPCUpsellContainerModule (copy)
				return function() --[[ Line: 230 ]]
					-- upvalues: UseNavigationFunction (upval), ReactModule (upval), VPCUpsellContainerModule (upval)
					return ReactModule.createElement(VPCUpsellContainerModule, (UseNavigationFunction().getParam("extraProps")))
				end
			end),
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	},
	{
		[AppScreensModule.GenericWebPage] = {
			screen = function() --[[ Line: 245 ]]
				-- upvalues: UseNavigationFunction (copy), WebViewServiceWrapperModule (copy)
				local UseNavigationResult = UseNavigationFunction()
				local ExtraPropsParam = UseNavigationResult.getParam("extraProps")
				WebViewServiceWrapperModule.new({
					url = UseNavigationResult.getParam("detail"),
					title = ExtraPropsParam.title or "",
					closeCallback = function() --[[ Line: 252 ]]
						-- upvalues: UseNavigationResult (copy), ExtraPropsParam (copy)
						UseNavigationResult.pop()
						
						if ExtraPropsParam.onClose then
							ExtraPropsParam.onClose()
						end
					end
				}):open()
			end,
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	}
}, {
	initialRouteName = "Wizard",
	transitionConfig = function() --[[ Line: 272 ]]
		return {
			transitionSpec = { frequency = 100000, dampingRatio = 1 }
		}
	end
}))))