local guiService = game:GetService("GuiService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local IAPExperienceModule = require(parent.IAPExperience)
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
local setPromptStateModule = require(purchasePrompt.Actions.SetPromptState)
local setWindowStateModule = require(purchasePrompt.Actions.SetWindowState)
local purchaseFlowModule = require(purchasePrompt.Enums.PurchaseFlow)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local _ = require(purchasePrompt.Models.RobuxUpsell)
local getUpsellSuggestionsTypes = IAPExperienceModule.Api.PaymentsGateway.GetUpsellSuggestionsTypes
local completeRequestModule = require(purchasePrompt.Thunks.completeRequest)
local purchaseItemModule = require(purchasePrompt.Thunks.purchaseItem)
local launchRobuxUpsellModule = require(purchasePrompt.Thunks.launchRobuxUpsell)
local openRobuxStoreModule = require(purchasePrompt.Thunks.openRobuxStore)
local openSecuritySettingsModule = require(purchasePrompt.Thunks.openSecuritySettings)
local openTermsOfUseModule = require(purchasePrompt.Thunks.openTermsOfUse)
local initiateUserPurchaseSettingsPrecheckModule = require(purchasePrompt.Thunks.initiateUserPurchaseSettingsPrecheck)
local retryPurchaseAfterUpsellModule = require(purchasePrompt.Thunks.retryPurchaseAfterUpsell)
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
local connectToStoreModule = require(purchasePrompt.connectToStore)
local externalEventConnectionModule = require(purchasePrompt.Components.Connection.ExternalEventConnection)
local getFFLagUseCoreScriptsRootProviderForUpsellModalModule = require(purchasePrompt.Flags.GetFFLagUseCoreScriptsRootProviderForUpsellModal)
local fFlagSetMenuOnPurchasePromptModule = require(purchasePrompt.Flags.FFlagSetMenuOnPurchasePrompt)
local upsellSuggestionsAPIMaxPackages = require(parent.SharedFlags).UpsellSuggestionsAPIMaxPackages
local robuxUpsellOverlayModule = require(script.Parent.RobuxUpsellOverlay)
local appPage = require(parent.RobloxAppEnums).AppPage
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableInExperienceOffersPurchaseFlow = sharedFlagsModule.FFlagEnableInExperienceOffersPurchaseFlow
local fFlagEnableRobuxUpsellPlusButtonExperiment = IAPExperienceModule.Flags.FFlagEnableRobuxUpsellPlusButtonExperiment
local fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal = sharedFlagsModule.FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local fFlagSkipBuyDelayForExperienceShopModule = require(purchasePrompt.Flags.FFlagSkipBuyDelayForExperienceShop)
local getBlackbirdUpsellBannerProductInfoModule = require(purchasePrompt.Utils.getBlackbirdUpsellBannerProductInfo)
local startRobuxUpsellPlusPurchaseModule = require(purchasePrompt.Utils.startRobuxUpsellPlusPurchase)
local name = roact.Component:extend(script.Name)

function name.init(p1)
	-- upvalues: fFlagPurchasePromptCartPricingEnabledModule (ref), fFlagEnableInExperienceOffersPurchaseFlow (ref), requestTypeModule (ref), appPage (ref), startRobuxUpsellPlusPurchaseModule (ref)
	p1.state = { screenSize = Vector2.new(0, 0) }
	p1.isRobloxPlusUpsellStarting = false
	
	function p0.changeScreenSize(p2)
		-- upvalues: p1 (ref)
		if p1.state.screenSize ~= p2.AbsoluteSize then
			p1:setState({ screenSize = p2.AbsoluteSize })
		end
	end
	
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
	
	function p0.openRobloxPlusUpsell()
		-- upvalues: p1 (ref), startRobuxUpsellPlusPurchaseModule (copy)
		if p1.isRobloxPlusUpsellStarting then
			return
		end
		p1.isRobloxPlusUpsellStarting = true
		startRobuxUpsellPlusPurchaseModule({
			purchaseFlowUUID = p1.props.purchaseFlowUUID,
			setPromptState = p1.props.setPromptState,
			setWindowState = p1.props.setWindowState,
			onRobloxSubscriptionUpsellSuccess = p1.props.onRobloxSubscriptionUpsellSuccess,
			retryPurchaseAfterUpsell = p1.props.retryPurchaseAfterUpsell,
			completeRequest = p1.props.completeRequest,
			onFlowEnded = function()
				-- upvalues: p1 (copy)
				p1.isRobloxPlusUpsellStarting = false
			end
		})
	end
end

function name.getRobloxPlusPromptKey(p1)
	local purchaseFlowUUID = p1.props.purchaseFlowUUID
	
	if type(purchaseFlowUUID) == "string" and purchaseFlowUUID ~= "" then
		return purchaseFlowUUID
	end
	local productPayload = p1.props.productPayload
	local var1 = if type(productPayload) == "table" then productPayload.id else nil
	
	return if var1 == nil then nil else tostring(var1)
end

function name.isRobuxUpsellModalVisible(p1)
	-- upvalues: purchaseFlowModule (ref), promptStateModule (ref)
	local var1
	local purchaseFlow = p1.props.purchaseFlow
	
	if purchaseFlow ~= purchaseFlowModule.RobuxUpsellV2 then
		var1 = purchaseFlow == purchaseFlowModule.LargeRobuxUpsell and p1.props.promptState == promptStateModule.RobuxUpsell
	end
	return var1
end

function name.createElement(p1)
	-- upvalues: getUpsellSuggestionsTypes (ref), getBlackbirdUpsellBannerProductInfoModule (ref), purchaseFlowModule (ref), fFlagEnableRobuxUpsellPlusButtonExperiment (ref), promptStateModule (ref), isLinksAllowedModule (ref), roact (ref), robuxUpsellOverlayModule (ref), upsellSuggestionsAPIMaxPackages (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), getPlayerPriceModule (ref), fFlagSkipBuyDelayForExperienceShopModule (ref), externalEventConnectionModule (ref), guiService (ref), fFlagSetMenuOnPurchasePromptModule (ref)
	local props = p1.props
	local state = p1.state
	local var1 = (if p1:isRobuxUpsellModalVisible() then p1:getRobloxPlusPromptKey() else nil) ~= nil and (props.isUserEligibleForUnifiedPurchaseFlow and props.experimentVariant == getUpsellSuggestionsTypes.ExperimentVariant.PlusPromotion)
	local var2 = getBlackbirdUpsellBannerProductInfoModule(props.robloxSubscriptionProducts)
	local var3 = if var2 then var2.initialDiscountPercentage else nil
	local var4 = if type(var3) == "number" then var3 else nil
	
	if props.purchaseFlow ~= purchaseFlowModule.RobuxUpsellV2 and props.purchaseFlow ~= purchaseFlowModule.LargeRobuxUpsell then
		return nil
	elseif fFlagEnableRobuxUpsellPlusButtonExperiment and props.promptState == promptStateModule.BlackbirdUpsellInProgress then
		return nil
	end
	local var5 = isLinksAllowedModule()
	
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
				props.onUpsellSuggestionsSelected(props.robuxSuggestions, p2, props.virtualItemBadgeType, props.experimentVariant)
			end,
			useUnifiedProductPurchaseModal = p1.props.isUserEligibleForUnifiedPurchaseFlow,
			purchaseAnalyticsMetadata = p1.props.purchaseAnalyticsMetadata,
			cartPricingResponse = if fFlagPurchasePromptCartPricingEnabledModule then props.cartPricingResponse else nil,
			collectibleItemId = if fFlagPurchasePromptCartPricingEnabledModule then props.collectibleItemId else nil,
			isCartPricingLoading = if fFlagPurchasePromptCartPricingEnabledModule then props.isCartPricingLoading else nil,
			onCartOfferAppliedChanged = if fFlagPurchasePromptCartPricingEnabledModule then p1.fetchCartPricingForPurchasePrompt else nil,
			postPurchaseActions = if fFlagPurchasePromptCartPricingEnabledModule then props.postPurchaseActions else nil,
			setPostPurchaseActions = if fFlagPurchasePromptCartPricingEnabledModule then props.setPostPurchaseActions else nil,
			onRobloxPlusButtonActivated = if var1 then p1.openRobloxPlusUpsell else nil,
			robloxPlusDiscountPercentage = var4,
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
			openRobuxStore = if p1.props.isUserEligibleForUnifiedPurchaseFlow then p1.navigateToBuyRobux else props.openRobuxStore,
			openTermsOfUse = if var5 then p1.navigateToTermsOfUse else nil,
			openSecuritySettings = if var5 then props.openSecuritySettings else nil,
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

return connectToStoreModule(function(p1)
	-- upvalues: isMockingPurchasesModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), selectedRobuxPackageModule (ref), fFlagSkipBuyDelayForExperienceShopModule (ref), selectPriceModule (ref), selectCartPricingResponseModule (ref), selectIsCartPricingFetchingModule (ref), fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (ref)
	local collectibleItemId
	local var1 = isMockingPurchasesModule(p1.promptRequest.requestType)
	local var2 = nil
	
	if fFlagPurchasePromptCartPricingEnabledModule then
		var2 = p1.productInfo.collectibleItemId
		
		if type(var2) ~= "string" or var2 == "" then
			collectibleItemId = p1.promptRequest.collectibleItemId
			var2 = if type(collectibleItemId) == "string" and collectibleItemId ~= "" then collectibleItemId else nil
		end
	end
	collectibleItemId = {
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
		experimentVariant = p1.robuxUpsellSuggestions.experimentVariant,
		robuxProductId = selectedRobuxPackageModule.getRobuxProductId(p1),
		productId = selectedRobuxPackageModule.getProductId(p1),
		robuxPurchaseAmount = selectedRobuxPackageModule.getRobuxPurchaseAmount(p1),
		robuxAmountBeforeBonus = selectedRobuxPackageModule.getRobuxAmountBeforeBonus(p1),
		price = selectedRobuxPackageModule.getPrice(p1),
		isTestPurchase = var1,
		isGamepadEnabled = p1.gamepadEnabled,
		isFromInExperienceShop = if fFlagSkipBuyDelayForExperienceShopModule then p1.productPayload and p1.productPayload.isFromInExperienceShop else nil,
		humanoidModel = p1.promptRequest.humanoidModel,
		isUserEligibleForUnifiedPurchaseFlow = p1.isUserEligibleForUnifiedPurchaseFlow,
		purchaseAnalyticsMetadata = p1.purchaseAnalyticsMetadata,
		purchaseFlowUUID = p1.purchaseFlowUUID,
		virtualItemPrice = selectPriceModule(p1),
		collectibleItemId = if fFlagPurchasePromptCartPricingEnabledModule then var2 else nil,
		cartPricingResponse = if fFlagPurchasePromptCartPricingEnabledModule then selectCartPricingResponseModule(p1) else nil,
		isCartPricingLoading = if fFlagPurchasePromptCartPricingEnabledModule then selectIsCartPricingFetchingModule(p1) else nil,
		postPurchaseActions = if fFlagPurchasePromptCartPricingEnabledModule then p1.postPurchaseActions else nil,
		productPayload = p1.productPayload,
		robloxSubscriptionProducts = p1.robloxSubscriptionProducts,
		onRobloxSubscriptionUpsellSuccess = if fFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal and p1.purchaseCallbacks then p1.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess else nil
	}
	
	return collectibleItemId
end, function(p1)
	-- upvalues: purchaseItemModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), fetchCartPricingModule (ref), fFlagEnableInExperienceOffersPurchaseFlow (ref), fetchInGameItemCartPricingModule (ref), launchRobuxUpsellModule (ref), openRobuxStoreModule (ref), openSecuritySettingsModule (ref), openTermsOfUseModule (ref), initiateUserPurchaseSettingsPrecheckModule (ref), guiService (ref), completeRequestModule (ref), retryPurchaseAfterUpsellModule (ref), setPromptStateModule (ref), setWindowStateModule (ref), promptNativeUpsellSuggestionsModule (ref), sendEventModule (ref), setPostPurchaseActionsModule (ref)
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
			-- upvalues: p1 (ref), openTermsOfUseModule (copy)
			return p1(openTermsOfUseModule(p2))
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
		retryPurchaseAfterUpsell = function()
			-- upvalues: p1 (ref), retryPurchaseAfterUpsellModule (copy)
			return p1(retryPurchaseAfterUpsellModule())
		end,
		setPromptState = function(value)
			-- upvalues: p1 (ref), setPromptStateModule (copy)
			return p1(setPromptStateModule(value))
		end,
		setWindowState = function(value)
			-- upvalues: p1 (ref), setWindowStateModule (copy)
			return p1(setWindowStateModule(value))
		end,
		onUpsellSuggestionsSelected = function(p2, p3, p4, p5)
			-- upvalues: p1 (ref), promptNativeUpsellSuggestionsModule (copy)
			return p1(promptNativeUpsellSuggestionsModule(p2, p3, p4, p5))
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
end)(function(p1)
	-- upvalues: navigationModule (ref), roact (ref), name (ref), cryoModule (ref)
	return roact.createElement(name, cryoModule.Dictionary.join(p1, { navigation = navigationModule.useNavigation() }))
end)