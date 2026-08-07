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

local var12 = function(p0) --[[ line: 45 ]]
	-- upvalues: useNavigation (ref), reactModule (ref), appScreensModule (ref), urlBuilder (ref), cryoModule (ref), actionTypeEnum (ref), wizardContainerModule (ref)
	local var13 = useNavigation()
	
	return reactModule.createElement(wizardContainerModule, cryoModule.Dictionary.join(p0 or {}, {
		openUpsells = {
			[actionTypeEnum.AgeEstimation] = reactModule.useCallback(function(p1) --[[ line: 67 ]]
				-- upvalues: var13 (ref)
				var13.push("FAEUpsell", { extraProps = p1 })
			end, { var13 }),
			[actionTypeEnum.GovernmentId] = reactModule.useCallback(function(p2) --[[ line: 62 ]]
				-- upvalues: var13 (ref)
				var13.push("IDVUpsell", { extraProps = p2 })
			end, { var13 }),
			[actionTypeEnum.Subscription] = reactModule.useCallback(function(p3) --[[ line: 71 ]]
				-- upvalues: var13 (ref)
				var13.push("SubscriptionUpsell", { extraProps = p3 })
			end, { var13 }),
			[actionTypeEnum.ParentConsent] = reactModule.useCallback(function(p4) --[[ line: 74 ]]
				-- upvalues: var13 (ref)
				var13.push("VPCUpsell", { extraProps = p4 })
			end, { var13 }),
			[actionTypeEnum.ParentLink] = reactModule.useCallback(function(p5) --[[ line: 77 ]]
				-- upvalues: var13 (ref)
				var13.push("VPCUpsell", { extraProps = p5 })
			end, { var13 })
		},
		openAccountSettingsUpsell = reactModule.useCallback(function(p6) --[[ line: 48 ]]
			-- upvalues: var13 (ref), appScreensModule (copy), urlBuilder (copy), cryoModule (copy)
			var13.push("AccountSettingsUpsell", {
				extraProps = cryoModule.Dictionary.join(p6 or {}, {
					openAccountSettings = function(p7) --[[ line: 49 ]]
						-- upvalues: var13 (copy), appScreensModule (copy), urlBuilder (copy)
						var13.push(appScreensModule.GenericWebPage, {
							detail = urlBuilder.static.settings.account(),
							extraProps = { title = p7 }
						})
					end
				})
			})
		end, { var13 })
	}))
end

return roactNavigationModule.createAppContainer(roactNavigationModule.createRobloxStackNavigator({
	{
		Wizard = {
			screen = function(p8) --[[ line: 93 ]]
				-- upvalues: useNavigation (ref), reactModule (ref), var12 (ref)
				local extraProps = useNavigation().getParam("extraProps")
				
				if not extraProps and p8 and p8.screenProps then
					extraProps = p8.screenProps.extraProps
				end
				return reactModule.createElement(var12, extraProps)
			end,
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	},
	{
		FAEUpsell = {
			screen = createLazyComponent(function() --[[ line: 110 ]]
				-- upvalues: FAEUpsellContainerModule (ref)
				return FAEUpsellContainerModule
			end),
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	},
	{
		IDVUpsell = {
			screen = createLazyComponent(function() --[[ line: 121 ]]
				-- upvalues: useNavigation (ref), reactModule (ref), IDVUpsellContainerModule (ref)
				return function() --[[ line: 122 ]]
					-- upvalues: useNavigation (copy), reactModule (copy), IDVUpsellContainerModule (copy)
					return reactModule.createElement(IDVUpsellContainerModule, useNavigation().getParam("extraProps"))
				end
			end),
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	},
	{
		SubscriptionUpsell = {
			screen = function(p9) --[[ line: 136 ]]
				-- upvalues: reactModule (ref), robloxSubscriptionPurchaseAppModule (ref), robloxSubscriptionFlowCompleteReason (ref), surfaceName (ref)
				local extraProps = p9.navigation.getParam("extraProps") or {}
				reactModule.useEffect(function() --[[ line: 152 ]]
					-- upvalues: robloxSubscriptionPurchaseAppModule (copy), extraProps (ref), robloxSubscriptionFlowCompleteReason (copy), surfaceName (copy)
					local var16 = robloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase(extraProps.purchaseUIOptions, {
						onFlowComplete = function(p10) --[[ line: 156 ]]
							-- upvalues: robloxSubscriptionFlowCompleteReason (copy), extraProps (copy)
							if p10 == robloxSubscriptionFlowCompleteReason.UpsellPurchaseSucceeded then
								if extraProps.onSuccess then
									extraProps.onSuccess()
									
									return
								end
							elseif p10 == robloxSubscriptionFlowCompleteReason.UpsellPurchaseFailed then
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
					
					return function() --[[ line: 186 ]]
						-- upvalues: var16 (ref)
						if var16 then
							var16()
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
			screen = createLazyComponent(function() --[[ line: 214 ]]
				-- upvalues: useNavigation (ref), reactModule (ref), accountSettingsUpsellModule (ref)
				return function() --[[ line: 215 ]]
					-- upvalues: useNavigation (copy), reactModule (copy), accountSettingsUpsellModule (copy)
					return reactModule.createElement(accountSettingsUpsellModule, useNavigation().getParam("extraProps"))
				end
			end),
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	},
	{
		VPCUpsell = {
			screen = createLazyComponent(function() --[[ line: 229 ]]
				-- upvalues: useNavigation (ref), reactModule (ref), VPCUpsellContainerModule (ref)
				return function() --[[ line: 230 ]]
					-- upvalues: useNavigation (copy), reactModule (copy), VPCUpsellContainerModule (copy)
					return reactModule.createElement(VPCUpsellContainerModule, useNavigation().getParam("extraProps"))
				end
			end),
			navigationOptions = { transparent = true, overlayEnabled = true }
		}
	},
	{
		[appScreensModule.GenericWebPage] = {
			screen = function() --[[ line: 245 ]]
				-- upvalues: useNavigation (ref), webViewServiceWrapperModule (ref)
				local var17 = useNavigation()
				local extraProps = var17.getParam("extraProps")
				webViewServiceWrapperModule.new({
					url = var17.getParam("detail"),
					title = extraProps.title or "",
					closeCallback = function() --[[ line: 252 ]]
						-- upvalues: var17 (ref), extraProps (ref)
						var17.pop()
						
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
	transitionConfig = function() --[[ line: 272 ]]
		return {
			transitionSpec = { frequency = 100000, dampingRatio = 1 }
		}
	end
}))