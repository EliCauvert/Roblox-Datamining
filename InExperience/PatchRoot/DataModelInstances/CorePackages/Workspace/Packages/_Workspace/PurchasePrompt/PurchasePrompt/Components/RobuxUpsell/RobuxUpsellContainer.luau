local guiService = game:GetService("GuiService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local roact = require(parent.PurchasePromptDeps).Roact
local reactModule = require(parent.React)
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
local initiateUserPurchaseSettingsPrecheckModule = require(purchasePrompt.Thunks.initiateUserPurchaseSettingsPrecheck)
local fetchCartPricingModule = require(purchasePrompt.Thunks.fetchCartPricing)
local fetchInGameItemCartPricingModule = require(purchasePrompt.Thunks.fetchInGameItemCartPricing)
local requestTypeModule = require(purchasePrompt.Enums.RequestType)
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
local fFlagEnableInExperienceOffersPurchaseFlow = require(parent.SharedFlags).FFlagEnableInExperienceOffersPurchaseFlow
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local fFlagSkipBuyDelayForExperienceShopModule = require(purchasePrompt.Flags.FFlagSkipBuyDelayForExperienceShop)
local name = roact.Component:extend(script.Name)

function name.init(p1)
	-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), fFlagEnableInExperienceOffersPurchaseFlow (ref), requestTypeModule (ref), appPage (ref)
	p1.state = { screenSize = Vector2.new(0, 0) }
	
	function p0.changeScreenSize(p2)
		-- upvalues: p1 (ref)
		if p1.state.screenSize ~= p2.AbsoluteSize then
			p1:setState({ screenSize = p2.AbsoluteSize })
		end
	end
	
	if fFlagEnableUnifiedProductPurchaseFlow then
		if fFlagPurchasePromptCartPricingEnabledModule then
			function p0.fetchCartPricingForPurchasePrompt(_, p2)
				-- upvalues: p1 (ref), fFlagEnableInExperienceOffersPurchaseFlow (copy), requestTypeModule (copy)
				if p2 == nil then
					return nil
				end
				local requestType = p1.props.requestType
				
				return if fFlagEnableInExperienceOffersPurchaseFlow and (requestType == requestTypeModule.GamePass or requestType == requestTypeModule.Product) then p1.props.fetchInGameItemCartPricing(p2) else p1.props.fetchCartPricing(p2)
			end
		end
		function p0.navigateToBuyRobux()
			-- upvalues: p1 (ref), appPage (copy)
			p1.props.navigation.navigate(appPage.PurchaseRobux)
		end
		
		function p0.navigateToTermsOfUse()
			-- upvalues: p1 (ref)
			p1.props.openTermsOfUse(p1.props.navigation)
		end
	end
end

function name.createElement(p1)
	-- upvalues: purchaseFlowModule (ref), isLinksAllowedModule (ref), roact (ref), robuxUpsellOverlayModule (ref), upsellSuggestionsAPIMaxPackages (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), getPlayerPriceModule (ref), fFlagSkipBuyDelayForExperienceShopModule (ref), externalEventConnectionModule (ref), guiService (ref), fFlagSetMenuOnPurchasePromptModule (ref)
	local props = p1.props
	local state = p1.state
	
	if props.purchaseFlow ~= purchaseFlowModule.RobuxUpsellV2 and props.purchaseFlow ~= purchaseFlowModule.LargeRobuxUpsell then
		return nil
	end
	local var1 = isLinksAllowedModule()
	
	return roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		[roact.Change.AbsoluteSize] = p1.changeScreenSize,
		BackgroundTransparency = 1
	}, {
		Prompt = roact.createElement(robuxUpsellOverlayModule, {
			screenSize = state.screenSize,
			virtualItemPrice = props.virtualItemPrice,
			requestType = props.requestType,
			promptState = props.promptState,
			purchaseFlow = props.purchaseFlow,
			purchaseError = props.purchaseError,
			economicRestrictionError = props.economicRestrictionError,
			useUpsellSuggestions = upsellSuggestionsAPIMaxPackages > 1,
			upsellSuggestions = props.robuxSuggestions,
			selectedUpsellIndex = props.robuxPackageSelection,
			virtualItemBadgeType = props.virtualItemBadgeType,
			onUpsellSuggestionsSelected = function(p2)
				-- upvalues: props (ref)
				props.onUpsellSuggestionsSelected(props.robuxSuggestions, p2, props.virtualItemBadgeType)
			end,
			useUnifiedProductPurchaseModal = if fFlagEnableUnifiedProductPurchaseFlow then p1.props.isUserEligibleForUnifiedPurchaseFlow else nil,
			purchaseAnalyticsMetadata = if fFlagEnableUnifiedProductPurchaseFlow then p1.props.purchaseAnalyticsMetadata else nil,
			cartPricingResponse = if fFlagPurchasePromptCartPricingEnabledModule then props.cartPricingResponse else nil,
			collectibleItemId = if fFlagPurchasePromptCartPricingEnabledModule then props.collectibleItemId else nil,
			isCartPricingLoading = if fFlagPurchasePromptCartPricingEnabledModule then props.isCartPricingLoading else nil,
			onCartOfferAppliedChanged = if fFlagPurchasePromptCartPricingEnabledModule then p1.fetchCartPricingForPurchasePrompt else nil,
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
			isFromInExperienceShop = if fFlagSkipBuyDelayForExperienceShopModule then props.isFromInExperienceShop else nil,
			purchaseItem = props.purchaseItem,
			promptRobuxPurchase = props.promptRobuxPurchase,
			openRobuxStore = if fFlagEnableUnifiedProductPurchaseFlow and p1.props.isUserEligibleForUnifiedPurchaseFlow then p1.navigateToBuyRobux else props.openRobuxStore,
			openTermsOfUse = if var1 then if fFlagEnableUnifiedProductPurchaseFlow then p1.navigateToTermsOfUse else props.openTermsOfUse else nil,
			openSecuritySettings = if var1 then props.openSecuritySettings else nil,
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
			callback = function()
				-- upvalues: fFlagSetMenuOnPurchasePromptModule (copy), p1 (ref), props (ref)
				if fFlagSetMenuOnPurchasePromptModule and p1.menuOpenedBySelf then
					p1.menuOpenedBySelf = false
					
					return
				end
				props.completeRequest()
			end
		})
	})
end

function name.render(p1)
	-- upvalues: fFlagSetMenuOnPurchasePromptModule (ref), guiService (ref), getFFLagUseCoreScriptsRootProviderForUpsellModalModule (ref), roact (ref), coreScriptsRootProvider (ref), reactModule (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var1 = p1:createElement()
	
	if fFlagSetMenuOnPurchasePromptModule then
		if var1 ~= nil then
			p1.menuOpenedBySelf = true
		end
		guiService:SetMenuIsOpen(var1 ~= nil, "RobuxUpsellContainer")
	end
	return if getFFLagUseCoreScriptsRootProviderForUpsellModalModule() then roact.createElement(coreScriptsRootProvider, {}, {
		FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { RobuxUpsellContainer = var1 })
	}) else var1
end

if fFlagEnableUnifiedProductPurchaseFlow then
	local var1 = name
	
	name = function(p1)
		-- upvalues: navigationModule (ref), roact (ref), var1 (ref), cryoModule (ref)
		return roact.createElement(var1, cryoModule.Dictionary.join(p1, { navigation = navigationModule.useNavigation() }))
	end
end
return connectToStoreModule(function(p1)
	-- upvalues: isMockingPurchasesModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), selectedRobuxPackageModule (ref), fFlagSkipBuyDelayForExperienceShopModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), selectPriceModule (ref), selectCartPricingResponseModule (ref), selectIsCartPricingFetchingModule (ref)
	local var2 = isMockingPurchasesModule(p1.promptRequest.requestType)
	local var3 = nil
	
	if fFlagPurchasePromptCartPricingEnabledModule then
		var3 = p1.productInfo.collectibleItemId
		
		if type(var3) ~= "string" or var3 == "" then
			local collectibleItemId = p1.promptRequest.collectibleItemId
			var3 = if type(collectibleItemId) == "string" and collectibleItemId ~= "" then collectibleItemId else nil
		end
	end
	return {
		purchaseFlow = p1.purchaseFlow,
		requestType = p1.promptRequest.requestType,
		expectedPrice = p1.promptRequest.expectedPrice,
		promptState = p1.promptState,
		purchaseError = p1.purchaseError,
		economicRestrictionError = p1.economicRestrictionError,
		productInfo = p1.productInfo,
		accountInfo = p1.accountInfo,
		robuxSuggestions = p1.robuxUpsellSuggestions.products,
		robuxPackageSelection = p1.robuxUpsellSuggestions.selection,
		virtualItemBadgeType = p1.robuxUpsellSuggestions.virtualItemBadgeType,
		robuxProductId = selectedRobuxPackageModule.getRobuxProductId(p1),
		productId = selectedRobuxPackageModule.getProductId(p1),
		robuxPurchaseAmount = selectedRobuxPackageModule.getRobuxPurchaseAmount(p1),
		robuxAmountBeforeBonus = selectedRobuxPackageModule.getRobuxAmountBeforeBonus(p1),
		price = selectedRobuxPackageModule.getPrice(p1),
		isTestPurchase = var2,
		isGamepadEnabled = p1.gamepadEnabled,
		isFromInExperienceShop = if fFlagSkipBuyDelayForExperienceShopModule then p1.productPayload and p1.productPayload.isFromInExperienceShop else nil,
		humanoidModel = p1.promptRequest.humanoidModel,
		isUserEligibleForUnifiedPurchaseFlow = if fFlagEnableUnifiedProductPurchaseFlow then p1.isUserEligibleForUnifiedPurchaseFlow else nil,
		purchaseAnalyticsMetadata = if fFlagEnableUnifiedProductPurchaseFlow then p1.purchaseAnalyticsMetadata else nil,
		virtualItemPrice = selectPriceModule(p1),
		collectibleItemId = if fFlagPurchasePromptCartPricingEnabledModule then var3 else nil,
		cartPricingResponse = if fFlagPurchasePromptCartPricingEnabledModule then selectCartPricingResponseModule(p1) else nil,
		isCartPricingLoading = if fFlagPurchasePromptCartPricingEnabledModule then selectIsCartPricingFetchingModule(p1) else nil,
		postPurchaseActions = if fFlagPurchasePromptCartPricingEnabledModule then p1.postPurchaseActions else nil
	}
end, function(p1)
	-- upvalues: purchaseItemModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), fetchCartPricingModule (ref), fFlagEnableInExperienceOffersPurchaseFlow (ref), fetchInGameItemCartPricingModule (ref), launchRobuxUpsellModule (ref), openRobuxStoreModule (ref), openSecuritySettingsModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), openTermsOfUseModule (ref), initiateUserPurchaseSettingsPrecheckModule (ref), guiService (ref), completeRequestModule (ref), promptNativeUpsellSuggestionsModule (ref), sendEventModule (ref), setPostPurchaseActionsModule (ref)
	return {
		purchaseItem = function()
			-- upvalues: p1 (ref), purchaseItemModule (copy)
			return p1(purchaseItemModule())
		end,
		fetchCartPricing = if fFlagPurchasePromptCartPricingEnabledModule then function(p2)
			-- upvalues: p1 (ref), fetchCartPricingModule (copy)
			return p1(fetchCartPricingModule(p2))
		end else nil,
		fetchInGameItemCartPricing = if fFlagEnableInExperienceOffersPurchaseFlow then function(p2)
			-- upvalues: p1 (ref), fetchInGameItemCartPricingModule (copy)
			return p1(fetchInGameItemCartPricingModule(p2))
		end else nil,
		promptRobuxPurchase = function()
			-- upvalues: p1 (ref), launchRobuxUpsellModule (copy)
			return p1(launchRobuxUpsellModule())
		end,
		openRobuxStore = function()
			-- upvalues: p1 (ref), openRobuxStoreModule (copy)
			return p1(openRobuxStoreModule())
		end,
		openSecuritySettings = function()
			-- upvalues: p1 (ref), openSecuritySettingsModule (copy)
			return p1(openSecuritySettingsModule())
		end,
		openTermsOfUse = function(p2)
			-- upvalues: fFlagEnableUnifiedProductPurchaseFlow (copy), p1 (ref), openTermsOfUseModule (copy)
			return if fFlagEnableUnifiedProductPurchaseFlow then p1(openTermsOfUseModule(p2)) else p1(openTermsOfUseModule())
		end,
		dispatchFetchPurchaseWarning = function()
			-- upvalues: p1 (ref), initiateUserPurchaseSettingsPrecheckModule (copy)
			return p1(initiateUserPurchaseSettingsPrecheckModule())
		end,
		completeRequest = function()
			-- upvalues: guiService (copy), p1 (ref), completeRequestModule (copy)
			guiService.SelectedCoreObject = nil
			
			return p1(completeRequestModule())
		end,
		onUpsellSuggestionsSelected = function(p2, p3, p4)
			-- upvalues: p1 (ref), promptNativeUpsellSuggestionsModule (copy)
			return p1(promptNativeUpsellSuggestionsModule(p2, p3, p4))
		end,
		onAnalyticEvent = function(p2, p3)
			-- upvalues: p1 (ref), sendEventModule (copy)
			return p1(sendEventModule(p2, p3))
		end,
		setPostPurchaseActions = if fFlagPurchasePromptCartPricingEnabledModule then function(p2)
			-- upvalues: p1 (ref), setPostPurchaseActionsModule (copy)
			p1(setPostPurchaseActionsModule(p2))
		end else nil
	}
end)(name)