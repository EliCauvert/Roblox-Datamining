local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local roactNavigationModule = require(parent.RoactNavigation)
local reactModule = require(parent.React)
local wizardContainerModule = require(ampUpsell.Components.WizardContainer)
local actionTypeEnum = require(ampUpsell.Common.Enums).ActionTypeEnum
local useNavigation = require(parent.Navigation).useNavigation
local createLazyComponent = require(parent.RoactUtils).Components.createLazyComponent
local FAEUpsellContainerModule = require(ampUpsell.Components.Upsells.FacialAgeEstimation.FAEUpsellContainer)
local IDVUpsellContainerModule = require(ampUpsell.Components.Upsells.IdentityVerification.IDVUpsellContainer)
local cryoModule = require(parent.Cryo)
local appScreensModule = require(ampUpsell.Common.AppScreens)
local webViewServiceWrapperModule = require(ampUpsell.Components.WebViewServiceWrapper)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local accountSettingsUpsellModule = require(ampUpsell.Components.Upsells.AccountSettingsUpsell)
local VPCUpsellContainerModule = require(ampUpsell.Components.Upsells.ParentalRequest.VPCUpsellContainer)
local robloxSubscriptionPurchaseAppModule = require(parent.RobloxSubscriptionPurchaseApp)
local robloxSubscriptionFlowCompleteReason = robloxSubscriptionPurchaseAppModule.RobloxSubscriptionFlowCompleteReason
local surfaceName = robloxSubscriptionPurchaseAppModule.SurfaceName
local _ = {
	Wizard = "Wizard",
	FAEUpsell = "FAEUpsell",
	IDVUpsell = "IDVUpsell",
	AccountSettingsUpsell = "AccountSettingsUpsell",
	SubscriptionUpsell = "SubscriptionUpsell",
	VPCUpsell = "VPCUpsell"
}

local var1 = function(p1)
	-- upvalues: useNavigation (ref), reactModule (ref), appScreensModule (ref), urlBuilder (ref), cryoModule (ref), actionTypeEnum (ref), wizardContainerModule (ref)
	local var2 = useNavigation()
	
	return reactModule.createElement(wizardContainerModule, cryoModule.Dictionary.join(p1 or {}, {
		openUpsells = {
			[actionTypeEnum.AgeEstimation] = reactModule.useCallback(function(p2)
				-- upvalues: var2 (ref)
				var2.push("FAEUpsell", { extraProps = p2 })
			end, { var2 }),
			[actionTypeEnum.GovernmentId] = reactModule.useCallback(function(p2)
				-- upvalues: var2 (ref)
				var2.push("IDVUpsell", { extraProps = p2 })
			end, { var2 }),
			[actionTypeEnum.Subscription] = reactModule.useCallback(function(p2)
				-- upvalues: var2 (ref)
				var2.push("SubscriptionUpsell", { extraProps = p2 })
			end, { var2 }),
			[actionTypeEnum.ParentConsent] = reactModule.useCallback(function(p2)
				-- upvalues: var2 (ref)
				var2.push("VPCUpsell", { extraProps = p2 })
			end, { var2 }),
			[actionTypeEnum.ParentLink] = reactModule.useCallback(function(p2)
				-- upvalues: var2 (ref)
				var2.push("VPCUpsell", { extraProps = p2 })
			end, { var2 })
		},
		openAccountSettingsUpsell = reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref), appScreensModule (copy), urlBuilder (copy), cryoModule (copy)
			var2.push("AccountSettingsUpsell", {
				extraProps = cryoModule.Dictionary.join(p2 or {}, {
					openAccountSettings = function(p3)
						-- upvalues: var2 (copy), appScreensModule (copy), urlBuilder (copy)
						var2.push(appScreensModule.GenericWebPage, {
							detail = urlBuilder.static.settings.account(),
							extraProps = { title = p3 }
						})
					end
				})
			})
		end, { var2 })
	}))
end

return roactNavigationModule.createAppContainer(roactNavigationModule.createRobloxStackNavigator({
	{
		Wizard = {
			screen = function(p1)
				-- upvalues: useNavigation (ref), reactModule (ref), var1 (ref)
				local extraProps = useNavigation().getParam("extraProps")
				
				if not extraProps and p1 and p1.screenProps then
					extraProps = p1.screenProps.extraProps
				end
				return reactModule.createElement(var1, extraProps)
			end,
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	},
	{
		FAEUpsell = {
			screen = createLazyComponent(function()
				-- upvalues: FAEUpsellContainerModule (ref)
				return FAEUpsellContainerModule
			end),
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	},
	{
		IDVUpsell = {
			screen = createLazyComponent(function()
				-- upvalues: useNavigation (ref), reactModule (ref), IDVUpsellContainerModule (ref)
				return function()
					-- upvalues: useNavigation (copy), reactModule (copy), IDVUpsellContainerModule (copy)
					return reactModule.createElement(IDVUpsellContainerModule, useNavigation().getParam("extraProps"))
				end
			end),
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	},
	{
		SubscriptionUpsell = {
			screen = function(p1)
				-- upvalues: reactModule (ref), robloxSubscriptionPurchaseAppModule (ref), robloxSubscriptionFlowCompleteReason (ref), surfaceName (ref)
				local extraProps = p1.navigation.getParam("extraProps") or {}
				reactModule.useEffect(function()
					-- upvalues: robloxSubscriptionPurchaseAppModule (copy), extraProps (ref), robloxSubscriptionFlowCompleteReason (copy), surfaceName (copy)
					local var2 = robloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase(extraProps.purchaseUIOptions, {
						onFlowComplete = function(p2)
							-- upvalues: robloxSubscriptionFlowCompleteReason (copy), extraProps (copy)
							if p2 == robloxSubscriptionFlowCompleteReason.UpsellPurchaseSucceeded then
								if extraProps.onSuccess then
									extraProps.onSuccess()
									
									return
								end
							elseif p2 == robloxSubscriptionFlowCompleteReason.UpsellPurchaseFailed then
								if extraProps.onFailure then
									extraProps.onFailure()
									
									return
								elseif extraProps.onCancel then
									extraProps.onCancel()
									
									return
								end
							elseif extraProps.onCancel then
								extraProps.onCancel()
							end
						end
					}, nil, extraProps.surfaceName or surfaceName.Unspecified, extraProps.surfaceContext or robloxSubscriptionPurchaseAppModule.SurfaceContext.Unspecified, nil, extraProps.analyticsContext)
					
					return function()
						-- upvalues: var2 (ref)
						if var2 then
							var2()
						end
					end
				end, {
					extraProps.analyticsContext, extraProps.onCancel, extraProps.onFailure,
					extraProps.onSuccess, extraProps.purchaseUIOptions, extraProps.surfaceContext,
					extraProps.surfaceName
				})
				
				return reactModule.createElement(reactModule.Fragment, {})
			end,
			navigationOptions = { transparent = true, overlayEnabled = false }
		}
	},
	{
		AccountSettingsUpsell = {
			screen = createLazyComponent(function()
				-- upvalues: useNavigation (ref), reactModule (ref), accountSettingsUpsellModule (ref)
				return function()
					-- upvalues: useNavigation (copy), reactModule (copy), accountSettingsUpsellModule (copy)
					return reactModule.createElement(accountSettingsUpsellModule, useNavigation().getParam("extraProps"))
				end
			end),
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	},
	{
		VPCUpsell = {
			screen = createLazyComponent(function()
				-- upvalues: useNavigation (ref), reactModule (ref), VPCUpsellContainerModule (ref)
				return function()
					-- upvalues: useNavigation (copy), reactModule (copy), VPCUpsellContainerModule (copy)
					return reactModule.createElement(VPCUpsellContainerModule, useNavigation().getParam("extraProps"))
				end
			end),
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	},
	{
		[appScreensModule.GenericWebPage] = {
			screen = function()
				-- upvalues: useNavigation (ref), webViewServiceWrapperModule (ref)
				local var2 = useNavigation()
				local extraProps = var2.getParam("extraProps")
				webViewServiceWrapperModule.new({
					url = var2.getParam("detail"),
					title = extraProps.title or "",
					closeCallback = function()
						-- upvalues: var2 (ref), extraProps (ref)
						var2.pop()
						
						if extraProps.onClose then
							extraProps.onClose()
						end
					end
				}):open()
			end,
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	}
}, {
	initialRouteName = "Wizard",
	transitionConfig = function()
		return {
			transitionSpec = { frequency = 100000, dampingRatio = 1 }
		}
	end
}))