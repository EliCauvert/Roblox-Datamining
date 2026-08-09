local guiService = game:GetService("GuiService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local roact = require(parent.PurchasePromptDeps).Roact
local reactModule = require(parent.React)
local _ = require(parent.IAPExperience)
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local coreScriptsRootProvider = require(parent.CoreScriptsRoactCommon).CoreScriptsRootProvider
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local navigationModule = require(parent.Navigation)
local cryoModule = require(parent.Cryo)
local selectPriceModule = require(purchasePrompt.Selectors.selectPrice)
local promptNativeUpsellSuggestionsModule = require(purchasePrompt.Actions.PromptNativeUpsellSuggestions)
local setPostPurchaseActionsModule = require(purchasePrompt.Actions.SetPostPurchaseActions)
local purchaseFlowModule = require(purchasePrompt.Enums.PurchaseFlow)
local _ = require(purchasePrompt.Models.RobuxUpsell)
local completeRequestModule = require(purchasePrompt.Thunks.completeRequest)
local purchaseItemModule = require(purchasePrompt.Thunks.purchaseItem)
local launchRobuxUpsellModule = require(purchasePrompt.Thunks.launchRobuxUpsell)
local openRobuxStoreModule = require(purchasePrompt.Thunks.openRobuxStore)
local openSecuritySettingsModule = require(purchasePrompt.Thunks.openSecuritySettings)
local openTermsOfUseModule = require(purchasePrompt.Thunks.openTermsOfUse)
local _ = require(purchasePrompt.Thunks.initiatePurchasePrecheck)
local initiateUserPurchaseSettingsPrecheckModule = require(purchasePrompt.Thunks.initiateUserPurchaseSettingsPrecheck)
local fetchCartPricingModule = require(purchasePrompt.Thunks.fetchCartPricing)
local selectCartPricingResponseModule = require(purchasePrompt.Selectors.selectCartPricingResponse)
local selectIsCartPricingFetchingModule = require(purchasePrompt.Selectors.selectIsCartPricingFetching)
local sendEventModule = require(purchasePrompt.Thunks.sendEvent)
local isMockingPurchasesModule = require(purchasePrompt.Utils.isMockingPurchases)
local getPlayerPriceModule = require(purchasePrompt.Utils.getPlayerPrice)
local isLinksAllowedModule = require(purchasePrompt.Utils.isLinksAllowed)
local selectedRobuxPackageModule = require(purchasePrompt.Utils.SelectedRobuxPackage)
local fFlagEnableUnifiedProductPurchaseFlow = require(parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local connectToStoreModule = require(purchasePrompt.connectToStore)
local externalEventConnectionModule = require(purchasePrompt.Components.Connection.ExternalEventConnection)
local getFFLagUseCoreScriptsRootProviderForUpsellModalModule = require(purchasePrompt.Flags.GetFFLagUseCoreScriptsRootProviderForUpsellModal)
local fFlagSetMenuOnPurchasePromptModule = require(purchasePrompt.Flags.FFlagSetMenuOnPurchasePrompt)
local upsellSuggestionsAPIMaxPackages = require(parent.SharedFlags).UpsellSuggestionsAPIMaxPackages
local robuxUpsellOverlayModule = require(script.Parent.RobuxUpsellOverlay)
local appPage = require(parent.RobloxAppEnums).AppPage
local fFlagEnableDiscountInfoInUnifiedPurchaseModal = require(parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local name = roact.Component:extend(script.Name)

function name.init(p0) --[[ line: 62 ]]
	-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), appPage (ref)
	p0.state = { screenSize = Vector2.new(0, 0) }
	
	function p0.changeScreenSize(p1) --[[ line: 70 ]]
		-- upvalues: p0 (ref)
		if p0.state.screenSize ~= p1.AbsoluteSize then
			p0:setState({ screenSize = p1.AbsoluteSize })
		end
	end
	
	if fFlagEnableUnifiedProductPurchaseFlow then
		if fFlagPurchasePromptCartPricingEnabledModule then
			function p0.fetchCartPricingForPurchasePrompt(_, p2) --[[ line: 80 ]]
				-- upvalues: p0 (ref)
				return if p2 == nil then nil else p0.props.fetchCartPricing(p2)
			end
		end
		function p0.navigateToBuyRobux() --[[ line: 90 ]]
			-- upvalues: p0 (ref), appPage (copy)
			p0.props.navigation.navigate(appPage.PurchaseRobux)
		end
		
		function p0.navigateToTermsOfUse() --[[ line: 94 ]]
			-- upvalues: p0 (ref)
			p0.props.openTermsOfUse(p0.props.navigation)
		end
	end
end

function name.createElement(p3) --[[ line: 100 ]]
	-- upvalues: purchaseFlowModule (ref), isLinksAllowedModule (ref), roact (ref), robuxUpsellOverlayModule (ref), fFlagEnableDiscountInfoInUnifiedPurchaseModal (ref), upsellSuggestionsAPIMaxPackages (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), getPlayerPriceModule (ref), externalEventConnectionModule (ref), guiService (ref), fFlagSetMenuOnPurchasePromptModule (ref)
	local props = p3.props
	local state = p3.state
	
	if props.purchaseFlow ~= purchaseFlowModule.RobuxUpsellV2 and props.purchaseFlow ~= purchaseFlowModule.LargeRobuxUpsell then
		return nil
	end
	local var33 = isLinksAllowedModule()
	
	return roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		[roact.Change.AbsoluteSize] = p3.changeScreenSize,
		BackgroundTransparency = 1
	}, {
		Prompt = roact.createElement(robuxUpsellOverlayModule, {
			screenSize = state.screenSize,
			virtualItemPrice = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then props.virtualItemPrice else nil,
			requestType = props.requestType,
			promptState = props.promptState,
			purchaseFlow = props.purchaseFlow,
			purchaseError = props.purchaseError,
			economicRestrictionError = props.economicRestrictionError,
			useUpsellSuggestions = upsellSuggestionsAPIMaxPackages > 1,
			upsellSuggestions = props.robuxSuggestions,
			selectedUpsellIndex = props.robuxPackageSelection,
			virtualItemBadgeType = props.virtualItemBadgeType,
			onUpsellSuggestionsSelected = function(p4) --[[ line: 136 ]]
				-- upvalues: props (ref)
				props.onUpsellSuggestionsSelected(props.robuxSuggestions, p4, props.virtualItemBadgeType)
			end,
			useUnifiedProductPurchaseModal = if fFlagEnableUnifiedProductPurchaseFlow then p3.props.isUserEligibleForUnifiedPurchaseFlow else nil,
			purchaseAnalyticsMetadata = if fFlagEnableUnifiedProductPurchaseFlow then p3.props.purchaseAnalyticsMetadata else nil,
			cartPricingResponse = if fFlagPurchasePromptCartPricingEnabledModule then props.cartPricingResponse else nil,
			collectibleItemId = if fFlagPurchasePromptCartPricingEnabledModule then props.collectibleItemId else nil,
			isCartPricingLoading = if fFlagPurchasePromptCartPricingEnabledModule then props.isCartPricingLoading else nil,
			onCartOfferAppliedChanged = if fFlagPurchasePromptCartPricingEnabledModule then p3.fetchCartPricingForPurchasePrompt else nil,
			postPurchaseActions = if fFlagPurchasePromptCartPricingEnabledModule then props.postPurchaseActions else nil,
			setPostPurchaseActions = if fFlagPurchasePromptCartPricingEnabledModule then props.setPostPurchaseActions else nil,
			robuxProviderId = props.robuxProductId,
			robuxProductId = props.productId,
			itemIcon = if string.find(props.productInfo.imageUrl, "assetid=0") then nil else props.productInfo.imageUrl,
			itemProductId = props.productInfo.productId,
			itemName = props.productInfo.name,
			itemRobuxCost = getPlayerPriceModule(props.productInfo, props.accountInfo.membershipType == 4, props.expectedPrice),
			iapRobuxAmount = props.robuxPurchaseAmount or 0,
			iapCostStr = props.price,
			beforeRobuxBalance = props.accountInfo.balance,
			isTestPurchase = props.isTestPurchase,
			isGamepadEnabled = props.isGamepadEnabled,
			purchaseItem = props.purchaseItem,
			promptRobuxPurchase = props.promptRobuxPurchase,
			openRobuxStore = if fFlagEnableUnifiedProductPurchaseFlow and p3.props.isUserEligibleForUnifiedPurchaseFlow then p3.navigateToBuyRobux else props.openRobuxStore,
			openTermsOfUse = if var33 then if fFlagEnableUnifiedProductPurchaseFlow then p3.navigateToTermsOfUse else props.openTermsOfUse else nil,
			openSecuritySettings = if var33 then props.openSecuritySettings else nil,
			dispatchFetchPurchaseWarning = props.dispatchFetchPurchaseWarning,
			endPurchase = props.completeRequest,
			onAnalyticEvent = props.onAnalyticEvent,
			humanoidModel = props.humanoidModel
		}),
		ModalFix = roact.createElement("ImageButton", {
			BackgroundTransparency = 0,
			Modal = true,
			Size = UDim2.new(0, 0, 0, 0)
		}),
		OnCoreGuiMenuOpened = roact.createElement(externalEventConnectionModule, {
			event = guiService.MenuOpened,
			callback = function() --[[ line: 201 ]]
				-- upvalues: fFlagSetMenuOnPurchasePromptModule (copy), p3 (ref), props (ref)
				if fFlagSetMenuOnPurchasePromptModule and p3.menuOpenedBySelf then
					p3.menuOpenedBySelf = false
					
					return
				end
				props.completeRequest()
			end
		})
	})
end

function name.render(p5) --[[ line: 212 ]]
	-- upvalues: fFlagSetMenuOnPurchasePromptModule (ref), guiService (ref), getFFLagUseCoreScriptsRootProviderForUpsellModalModule (ref), roact (ref), coreScriptsRootProvider (ref), reactModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var34 = p5:createElement()
	
	if fFlagSetMenuOnPurchasePromptModule then
		if var34 ~= nil then
			p5.menuOpenedBySelf = true
		end
		guiService:SetMenuIsOpen(var34 ~= nil, "RobuxUpsellContainer")
	end
	return if getFFLagUseCoreScriptsRootProviderForUpsellModalModule() then roact.createElement(coreScriptsRootProvider, {}, {
		FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { RobuxUpsellContainer = var34 })
	}) else var34
end

if fFlagEnableUnifiedProductPurchaseFlow then
	local var32 = name
	
	name = function(p6) --[[ line: 238 ]]
		-- upvalues: navigationModule (ref), roact (ref), var32 (ref), cryoModule (ref)
		return roact.createElement(var32, cryoModule.Dictionary.join(p6, { navigation = navigationModule.useNavigation() }))
	end
end
return connectToStoreModule(function(p7) --[[ line: 251 ]]
	-- upvalues: isMockingPurchasesModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), selectedRobuxPackageModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagEnableDiscountInfoInUnifiedPurchaseModal (ref), selectPriceModule (ref), selectCartPricingResponseModule (ref), selectIsCartPricingFetchingModule (ref)
	local var35 = isMockingPurchasesModule(p7.promptRequest.requestType)
	local var36 = nil
	
	if fFlagPurchasePromptCartPricingEnabledModule then
		var36 = p7.productInfo.collectibleItemId
		
		if type(var36) ~= "string" or var36 == "" then
			local collectibleItemId = p7.promptRequest.collectibleItemId
			var36 = if type(collectibleItemId) == "string" and collectibleItemId ~= "" then collectibleItemId else nil
		end
	end
	return {
		purchaseFlow = p7.purchaseFlow,
		requestType = p7.promptRequest.requestType,
		expectedPrice = p7.promptRequest.expectedPrice,
		promptState = p7.promptState,
		purchaseError = p7.purchaseError,
		economicRestrictionError = p7.economicRestrictionError,
		productInfo = p7.productInfo,
		accountInfo = p7.accountInfo,
		robuxSuggestions = p7.robuxUpsellSuggestions.products,
		robuxPackageSelection = p7.robuxUpsellSuggestions.selection,
		virtualItemBadgeType = p7.robuxUpsellSuggestions.virtualItemBadgeType,
		robuxProductId = selectedRobuxPackageModule.getRobuxProductId(p7),
		productId = selectedRobuxPackageModule.getProductId(p7),
		robuxPurchaseAmount = selectedRobuxPackageModule.getRobuxPurchaseAmount(p7),
		robuxAmountBeforeBonus = selectedRobuxPackageModule.getRobuxAmountBeforeBonus(p7),
		price = selectedRobuxPackageModule.getPrice(p7),
		isTestPurchase = var35,
		isGamepadEnabled = p7.gamepadEnabled,
		humanoidModel = p7.promptRequest.humanoidModel,
		isUserEligibleForUnifiedPurchaseFlow = if fFlagEnableUnifiedProductPurchaseFlow then p7.isUserEligibleForUnifiedPurchaseFlow else nil,
		purchaseAnalyticsMetadata = if fFlagEnableUnifiedProductPurchaseFlow then p7.purchaseAnalyticsMetadata else nil,
		virtualItemPrice = if fFlagEnableDiscountInfoInUnifiedPurchaseModal then selectPriceModule(p7) else nil,
		collectibleItemId = if fFlagPurchasePromptCartPricingEnabledModule then var36 else nil,
		cartPricingResponse = if fFlagPurchasePromptCartPricingEnabledModule then selectCartPricingResponseModule(p7) else nil,
		isCartPricingLoading = if fFlagPurchasePromptCartPricingEnabledModule then selectIsCartPricingFetchingModule(p7) else nil,
		postPurchaseActions = if fFlagPurchasePromptCartPricingEnabledModule then p7.postPurchaseActions else nil
	}
end, function(p8) --[[ line: 305 ]]
	-- upvalues: purchaseItemModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), fetchCartPricingModule (ref), launchRobuxUpsellModule (ref), openRobuxStoreModule (ref), openSecuritySettingsModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), openTermsOfUseModule (ref), initiateUserPurchaseSettingsPrecheckModule (ref), guiService (ref), completeRequestModule (ref), promptNativeUpsellSuggestionsModule (ref), sendEventModule (ref), setPostPurchaseActionsModule (ref)
	return {
		purchaseItem = function() --[[ line: 307 ]]
			-- upvalues: p8 (ref), purchaseItemModule (copy)
			return p8(purchaseItemModule())
		end,
		fetchCartPricing = if fFlagPurchasePromptCartPricingEnabledModule then function(p9) --[[ line: 311 ]]
			-- upvalues: p8 (ref), fetchCartPricingModule (copy)
			return p8(fetchCartPricingModule(p9))
		end else nil,
		promptRobuxPurchase = function() --[[ line: 315 ]]
			-- upvalues: p8 (ref), launchRobuxUpsellModule (copy)
			return p8(launchRobuxUpsellModule())
		end,
		openRobuxStore = function() --[[ line: 318 ]]
			-- upvalues: p8 (ref), openRobuxStoreModule (copy)
			return p8(openRobuxStoreModule())
		end,
		openSecuritySettings = function() --[[ line: 321 ]]
			-- upvalues: p8 (ref), openSecuritySettingsModule (copy)
			return p8(openSecuritySettingsModule())
		end,
		openTermsOfUse = function(p10) --[[ line: 324 ]]
			-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (copy), p8 (ref), openTermsOfUseModule (copy)
			return if fFlagEnableUnifiedProductPurchaseFlow then p8(openTermsOfUseModule(p10)) else p8(openTermsOfUseModule())
		end,
		dispatchFetchPurchaseWarning = function() --[[ line: 330 ]]
			-- upvalues: p8 (ref), initiateUserPurchaseSettingsPrecheckModule (copy)
			return p8(initiateUserPurchaseSettingsPrecheckModule())
		end,
		completeRequest = function() --[[ line: 333 ]]
			-- upvalues: guiService (copy), p8 (ref), completeRequestModule (copy)
			guiService.SelectedCoreObject = nil
			
			return p8(completeRequestModule())
		end,
		onUpsellSuggestionsSelected = function(p11, p12, p13) --[[ line: 337 ]]
			-- upvalues: p8 (ref), promptNativeUpsellSuggestionsModule (copy)
			return p8(promptNativeUpsellSuggestionsModule(p11, p12, p13))
		end,
		onAnalyticEvent = function(p14, p15) --[[ line: 344 ]]
			-- upvalues: p8 (ref), sendEventModule (copy)
			return p8(sendEventModule(p14, p15))
		end,
		setPostPurchaseActions = if fFlagPurchasePromptCartPricingEnabledModule then function(p16) --[[ line: 348 ]]
			-- upvalues: p8 (ref), setPostPurchaseActionsModule (copy)
			p8(setPostPurchaseActionsModule(p16))
		end else nil
	}
end)(name)