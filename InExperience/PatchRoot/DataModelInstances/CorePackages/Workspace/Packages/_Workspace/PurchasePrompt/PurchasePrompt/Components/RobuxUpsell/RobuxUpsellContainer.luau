local GuiService = game:GetService("GuiService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local IAPExperienceModule = require(Parent.IAPExperience)
local Roact = require(Parent.PurchasePromptDeps).Roact
local ReactModule = require(Parent.React)
local CoreScriptsRootProvider = require(Parent.CoreScriptsRoactCommon).CoreScriptsRootProvider
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local NavigationModule = require(Parent.Navigation)
local CryoModule = require(Parent.Cryo)
local SelectPriceModule = require(PurchasePrompt.Selectors.selectPrice)
local PromptNativeUpsellSuggestionsModule = require(PurchasePrompt.Actions.PromptNativeUpsellSuggestions)
local SetPostPurchaseActionsModule = require(PurchasePrompt.Actions.SetPostPurchaseActions)
local SetPromptStateModule = require(PurchasePrompt.Actions.SetPromptState)
local SetWindowStateModule = require(PurchasePrompt.Actions.SetWindowState)
local PurchaseFlowModule = require(PurchasePrompt.Enums.PurchaseFlow)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local _ = require(PurchasePrompt.Models.RobuxUpsell)
local GetUpsellSuggestionsTypes = IAPExperienceModule.Api.PaymentsGateway.GetUpsellSuggestionsTypes
local CompleteRequestModule = require(PurchasePrompt.Thunks.completeRequest)
local PurchaseItemModule = require(PurchasePrompt.Thunks.purchaseItem)
local LaunchRobuxUpsellModule = require(PurchasePrompt.Thunks.launchRobuxUpsell)
local OpenRobuxStoreModule = require(PurchasePrompt.Thunks.openRobuxStore)
local OpenSecuritySettingsModule = require(PurchasePrompt.Thunks.openSecuritySettings)
local OpenTermsOfUseModule = require(PurchasePrompt.Thunks.openTermsOfUse)
local InitiateUserPurchaseSettingsPrecheckModule = require(PurchasePrompt.Thunks.initiateUserPurchaseSettingsPrecheck)
local RetryPurchaseAfterUpsellModule = require(PurchasePrompt.Thunks.retryPurchaseAfterUpsell)
local FetchCartPricingModule = require(PurchasePrompt.Thunks.fetchCartPricing)
local FetchInGameItemCartPricingModule = require(PurchasePrompt.Thunks.fetchInGameItemCartPricing)
local RequestTypeModule = require(PurchasePrompt.Enums.RequestType)
local SelectCartPricingResponseModule = require(PurchasePrompt.Selectors.selectCartPricingResponse)
local SelectIsCartPricingFetchingModule = require(PurchasePrompt.Selectors.selectIsCartPricingFetching)
local SendEventModule = require(PurchasePrompt.Thunks.sendEvent)
local IsMockingPurchasesModule = require(PurchasePrompt.Utils.isMockingPurchases)
local GetPlayerPriceModule = require(PurchasePrompt.Utils.getPlayerPrice)
local IsLinksAllowedModule = require(PurchasePrompt.Utils.isLinksAllowed)
local SelectedRobuxPackageModule = require(PurchasePrompt.Utils.SelectedRobuxPackage)
local ConnectToStoreModule = require(PurchasePrompt.connectToStore)
local ExternalEventConnectionModule = require(PurchasePrompt.Components.Connection.ExternalEventConnection)
local GetFFLagUseCoreScriptsRootProviderForUpsellModalModule = require(PurchasePrompt.Flags.GetFFLagUseCoreScriptsRootProviderForUpsellModal)
local FFlagSetMenuOnPurchasePromptModule = require(PurchasePrompt.Flags.FFlagSetMenuOnPurchasePrompt)
local UpsellSuggestionsAPIMaxPackages = require(Parent.SharedFlags).UpsellSuggestionsAPIMaxPackages
local RobuxUpsellOverlayModule = require(script.Parent.RobuxUpsellOverlay)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableInExperienceOffersPurchaseFlow = SharedFlagsModule.FFlagEnableInExperienceOffersPurchaseFlow
local FFlagLuaAppsEnablePromptVIPServerPurchase = SharedFlagsModule.FFlagLuaAppsEnablePromptVIPServerPurchase
local FFlagEnableRobuxUpsellPlusButtonExperiment = IAPExperienceModule.Flags.FFlagEnableRobuxUpsellPlusButtonExperiment
local FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal = SharedFlagsModule.FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal
local FFlagPurchasePromptCartPricingEnabledModule = require(PurchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local FFlagSkipBuyDelayForExperienceShopModule = require(PurchasePrompt.Flags.FFlagSkipBuyDelayForExperienceShop)
local GetBlackbirdUpsellBannerProductInfoModule = require(PurchasePrompt.Utils.getBlackbirdUpsellBannerProductInfo)
local StartRobuxUpsellPlusPurchaseModule = require(PurchasePrompt.Utils.startRobuxUpsellPlusPurchase)
local ExtendResult = Roact.Component:extend(script.Name)

function ExtendResult.init(p1) --[[ Line: 72 ]]
	-- upvalues: FFlagPurchasePromptCartPricingEnabledModule (copy), FFlagEnableInExperienceOffersPurchaseFlow (copy), RequestTypeModule (copy), AppPage (copy), StartRobuxUpsellPlusPurchaseModule (copy)
	p1.state = { screenSize = Vector2.new(0, 0) }
	p1.isRobloxPlusUpsellStarting = false
	
	function p1.changeScreenSize(Frame: Frame) --[[ Line: 81 ]]
		-- upvalues: p1 (copy)
		if p1.state.screenSize ~= Frame.AbsoluteSize then
			p1:setState({ screenSize = Frame.AbsoluteSize })
		end
	end
	
	if FFlagPurchasePromptCartPricingEnabledModule then
		function p1:fetchCartPricingForPurchasePrompt(p2) --[[ Line: 89 ]]
			-- upvalues: p1 (copy), FFlagEnableInExperienceOffersPurchaseFlow (upval), RequestTypeModule (upval)
			if p2 == nil then
				return nil
			else
				local RequestType = p1.props.requestType
				
				return if FFlagEnableInExperienceOffersPurchaseFlow and (RequestType == RequestTypeModule.GamePass or RequestType == RequestTypeModule.Product) then p1.props.fetchInGameItemCartPricing(p2) else p1.props.fetchCartPricing(p2)
			end
		end
	end
	function p1.navigateToBuyRobux() --[[ Line: 108 ]]
		-- upvalues: p1 (copy), AppPage (upval)
		p1.props.navigation.navigate(AppPage.PurchaseRobux)
	end
	
	function p1.navigateToTermsOfUse() --[[ Line: 112 ]]
		-- upvalues: p1 (copy)
		p1.props.openTermsOfUse(p1.props.navigation)
	end
	
	function p1.openRobloxPlusUpsell() --[[ Line: 116 ]]
		-- upvalues: p1 (copy), StartRobuxUpsellPlusPurchaseModule (upval)
		if not p1.isRobloxPlusUpsellStarting then
			p1.isRobloxPlusUpsellStarting = true
			StartRobuxUpsellPlusPurchaseModule({
				purchaseFlowUUID = p1.props.purchaseFlowUUID,
				setPromptState = p1.props.setPromptState,
				setWindowState = p1.props.setWindowState,
				onRobloxSubscriptionUpsellSuccess = p1.props.onRobloxSubscriptionUpsellSuccess,
				retryPurchaseAfterUpsell = p1.props.retryPurchaseAfterUpsell,
				completeRequest = p1.props.completeRequest,
				onFlowEnded = function() --[[ Line: 129 ]]
					-- upvalues: p1 (upval)
					p1.isRobloxPlusUpsellStarting = false
				end
			})
			
			return
		end
	end
end

function ExtendResult.getRobloxPlusPromptKey(p1) --[[ Line: 136 ]]
	local PurchaseFlowUUID = p1.props.purchaseFlowUUID
	
	if type(PurchaseFlowUUID) == "string" and PurchaseFlowUUID ~= "" then
		return PurchaseFlowUUID
	else
		local ProductPayload = p1.props.productPayload
		local Id = if type(ProductPayload) == "table" then ProductPayload.id else nil
		
		return if Id == nil then nil else tostring(Id)
	end
end

function ExtendResult.isRobuxUpsellModalVisible(p1): boolean --[[ Line: 149 ]]
	-- upvalues: PurchaseFlowModule (copy), PromptStateModule (copy)
	local PurchaseFlow = p1.props.purchaseFlow
	
	return if PurchaseFlow == PurchaseFlowModule.RobuxUpsellV2 then p1.props.promptState == PromptStateModule.RobuxUpsell else PurchaseFlow == PurchaseFlowModule.LargeRobuxUpsell and p1.props.promptState == PromptStateModule.RobuxUpsell
end

function ExtendResult.createElement(CoreScriptsRootProvider) --[[ Line: 155 ]]
	-- upvalues: GetUpsellSuggestionsTypes (copy), GetBlackbirdUpsellBannerProductInfoModule (copy), PurchaseFlowModule (copy), FFlagEnableRobuxUpsellPlusButtonExperiment (copy), PromptStateModule (copy), IsLinksAllowedModule (copy), Roact (copy), RobuxUpsellOverlayModule (copy), UpsellSuggestionsAPIMaxPackages (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), FFlagLuaAppsEnablePromptVIPServerPurchase (copy), GetPlayerPriceModule (copy), FFlagSkipBuyDelayForExperienceShopModule (copy), ExternalEventConnectionModule (copy), GuiService (copy), FFlagSetMenuOnPurchasePromptModule (copy)
	local Props = CoreScriptsRootProvider.props
	local State = CoreScriptsRootProvider.state
	local IsExperimentVariantMatch: boolean = (if CoreScriptsRootProvider:isRobuxUpsellModalVisible() then CoreScriptsRootProvider:getRobloxPlusPromptKey() else nil) ~= nil and (Props.isUserEligibleForUnifiedPurchaseFlow and Props.experimentVariant == GetUpsellSuggestionsTypes.ExperimentVariant.PlusPromotion)
	local BlackbirdUpsellBannerProductInfoModule = GetBlackbirdUpsellBannerProductInfoModule(Props.robloxSubscriptionProducts)
	local InitialDiscountPercentage = if BlackbirdUpsellBannerProductInfoModule then BlackbirdUpsellBannerProductInfoModule.initialDiscountPercentage else nil
	local InitialDiscountPercentage1 = if type(InitialDiscountPercentage) == "number" then InitialDiscountPercentage else nil
	
	if Props.purchaseFlow ~= PurchaseFlowModule.RobuxUpsellV2 and Props.purchaseFlow ~= PurchaseFlowModule.LargeRobuxUpsell then
		return nil
	elseif FFlagEnableRobuxUpsellPlusButtonExperiment and Props.promptState == PromptStateModule.BlackbirdUpsellInProgress then
		return nil
	else
		local IsLinksAllowedModule1 = IsLinksAllowedModule()
		
		return Roact.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			[Roact.Change.AbsoluteSize] = CoreScriptsRootProvider.changeScreenSize,
			BackgroundTransparency = 1
		}, {
			Prompt = Roact.createElement(RobuxUpsellOverlayModule, {
				screenSize = State.screenSize,
				virtualItemPrice = Props.virtualItemPrice,
				requestType = Props.requestType,
				promptState = Props.promptState,
				purchaseFlow = Props.purchaseFlow,
				purchaseError = Props.purchaseError,
				economicRestrictionError = Props.economicRestrictionError,
				useUpsellSuggestions = UpsellSuggestionsAPIMaxPackages > 1,
				upsellSuggestions = Props.robuxSuggestions,
				selectedUpsellIndex = Props.robuxPackageSelection,
				virtualItemBadgeType = Props.virtualItemBadgeType,
				onUpsellSuggestionsSelected = function(p1) --[[ Line: 206 ]]
					-- upvalues: Props (copy)
					Props.onUpsellSuggestionsSelected(Props.robuxSuggestions, p1, Props.virtualItemBadgeType, Props.experimentVariant)
				end,
				useUnifiedProductPurchaseModal = CoreScriptsRootProvider.props.isUserEligibleForUnifiedPurchaseFlow,
				purchaseAnalyticsMetadata = CoreScriptsRootProvider.props.purchaseAnalyticsMetadata,
				cartPricingResponse = if FFlagPurchasePromptCartPricingEnabledModule then Props.cartPricingResponse else nil,
				collectibleItemId = if FFlagPurchasePromptCartPricingEnabledModule then Props.collectibleItemId else nil,
				isCartPricingLoading = if FFlagPurchasePromptCartPricingEnabledModule then Props.isCartPricingLoading else nil,
				onCartOfferAppliedChanged = if FFlagPurchasePromptCartPricingEnabledModule then CoreScriptsRootProvider.fetchCartPricingForPurchasePrompt else nil,
				postPurchaseActions = if FFlagPurchasePromptCartPricingEnabledModule then Props.postPurchaseActions else nil,
				setPostPurchaseActions = if FFlagPurchasePromptCartPricingEnabledModule then Props.setPostPurchaseActions else nil,
				onRobloxPlusButtonActivated = if IsExperimentVariantMatch then CoreScriptsRootProvider.openRobloxPlusUpsell else nil,
				robloxPlusDiscountPercentage = InitialDiscountPercentage1,
				isMonthlyPrice = if FFlagLuaAppsEnablePromptVIPServerPurchase then Props.productInfo.isMonthlyPrice else nil,
				robuxProviderId = Props.robuxProductId,
				robuxProductId = Props.productId,
				itemIcon = if string.find(Props.productInfo.imageUrl, "assetid=0") then nil else Props.productInfo.imageUrl,
				itemProductId = Props.productInfo.productId,
				itemName = Props.productInfo.name,
				itemRobuxCost = GetPlayerPriceModule(Props.productInfo, Props.accountInfo.membershipType == 4, Props.expectedPrice),
				iapRobuxAmount = Props.robuxPurchaseAmount or 0,
				iapCostStr = Props.price,
				beforeRobuxBalance = Props.accountInfo.balance,
				isTestPurchase = Props.isTestPurchase,
				isGamepadEnabled = Props.isGamepadEnabled,
				isFromInExperienceShop = if FFlagSkipBuyDelayForExperienceShopModule then Props.isFromInExperienceShop else nil,
				purchaseItem = Props.purchaseItem,
				promptRobuxPurchase = Props.promptRobuxPurchase,
				openRobuxStore = if CoreScriptsRootProvider.props.isUserEligibleForUnifiedPurchaseFlow then CoreScriptsRootProvider.navigateToBuyRobux else Props.openRobuxStore,
				openTermsOfUse = IsLinksAllowedModule1 and CoreScriptsRootProvider.navigateToTermsOfUse or nil,
				openSecuritySettings = IsLinksAllowedModule1 and Props.openSecuritySettings or nil,
				dispatchFetchPurchaseWarning = Props.dispatchFetchPurchaseWarning,
				endPurchase = Props.completeRequest,
				onAnalyticEvent = Props.onAnalyticEvent,
				humanoidModel = Props.humanoidModel
			}),
			ModalFix = Roact.createElement("ImageButton", {
				BackgroundTransparency = 0,
				Modal = true,
				Size = UDim2.new(0, 0, 0, 0)
			}),
			OnCoreGuiMenuOpened = Roact.createElement(ExternalEventConnectionModule, {
				event = GuiService.MenuOpened,
				callback = function() --[[ Line: 275 ]]
					-- upvalues: FFlagSetMenuOnPurchasePromptModule (upval), CoreScriptsRootProvider (copy), Props (copy)
					if FFlagSetMenuOnPurchasePromptModule and CoreScriptsRootProvider.menuOpenedBySelf then
						CoreScriptsRootProvider.menuOpenedBySelf = false
						
						return
					else
						Props.completeRequest()
					end
				end
			})
		})
	end
end

function ExtendResult.render(p1) --[[ Line: 286 ]]
	-- upvalues: FFlagSetMenuOnPurchasePromptModule (copy), GuiService (copy), GetFFLagUseCoreScriptsRootProviderForUpsellModalModule (copy), Roact (copy), CoreScriptsRootProvider (copy), ReactModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local Element = p1:createElement()
	
	if FFlagSetMenuOnPurchasePromptModule then
		if Element ~= nil then
			p1.menuOpenedBySelf = true
		end
		GuiService:SetMenuIsOpen(Element ~= nil, "RobuxUpsellContainer")
	end
	return if GetFFLagUseCoreScriptsRootProviderForUpsellModalModule() then Roact.createElement(CoreScriptsRootProvider, {}, {
		FocusNavigationCoreScriptsWrapper = ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { RobuxUpsellContainer = Element })
	}) else Element
end

return (ConnectToStoreModule(function(p1) --[[ Line: 322 ]]
	-- upvalues: IsMockingPurchasesModule (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), SelectedRobuxPackageModule (copy), FFlagSkipBuyDelayForExperienceShopModule (copy), SelectPriceModule (copy), SelectCartPricingResponseModule (copy), SelectIsCartPricingFetchingModule (copy), FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (copy)
	local IsMockingPurchasesModule1 = IsMockingPurchasesModule(p1.promptRequest.requestType)
	local CollectibleItemId = nil
	
	if FFlagPurchasePromptCartPricingEnabledModule then
		CollectibleItemId = p1.productInfo.collectibleItemId
		
		if type(CollectibleItemId) ~= "string" or CollectibleItemId == "" then
			local CollectibleItemId1 = p1.promptRequest.collectibleItemId
			CollectibleItemId = if type(CollectibleItemId1) == "string" and CollectibleItemId1 ~= "" then CollectibleItemId1 else nil
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
		experimentVariant = p1.robuxUpsellSuggestions.experimentVariant,
		robuxProductId = SelectedRobuxPackageModule.getRobuxProductId(p1),
		productId = SelectedRobuxPackageModule.getProductId(p1),
		robuxPurchaseAmount = SelectedRobuxPackageModule.getRobuxPurchaseAmount(p1),
		robuxAmountBeforeBonus = SelectedRobuxPackageModule.getRobuxAmountBeforeBonus(p1),
		price = SelectedRobuxPackageModule.getPrice(p1),
		isTestPurchase = IsMockingPurchasesModule1,
		isGamepadEnabled = p1.gamepadEnabled,
		isFromInExperienceShop = if FFlagSkipBuyDelayForExperienceShopModule then p1.productPayload and p1.productPayload.isFromInExperienceShop else nil,
		humanoidModel = p1.promptRequest.humanoidModel,
		isUserEligibleForUnifiedPurchaseFlow = p1.isUserEligibleForUnifiedPurchaseFlow,
		purchaseAnalyticsMetadata = p1.purchaseAnalyticsMetadata,
		purchaseFlowUUID = p1.purchaseFlowUUID,
		virtualItemPrice = SelectPriceModule(p1),
		collectibleItemId = if FFlagPurchasePromptCartPricingEnabledModule then CollectibleItemId else nil,
		cartPricingResponse = if FFlagPurchasePromptCartPricingEnabledModule then SelectCartPricingResponseModule(p1) else nil,
		isCartPricingLoading = if FFlagPurchasePromptCartPricingEnabledModule then SelectIsCartPricingFetchingModule(p1) else nil,
		postPurchaseActions = if FFlagPurchasePromptCartPricingEnabledModule then p1.postPurchaseActions else nil,
		productPayload = p1.productPayload,
		robloxSubscriptionProducts = p1.robloxSubscriptionProducts,
		onRobloxSubscriptionUpsellSuccess = if FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal and p1.purchaseCallbacks then p1.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess else nil
	}
end, function(Callback) --[[ Line: 383 ]]
	-- upvalues: PurchaseItemModule (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), FetchCartPricingModule (copy), FFlagEnableInExperienceOffersPurchaseFlow (copy), FetchInGameItemCartPricingModule (copy), LaunchRobuxUpsellModule (copy), OpenRobuxStoreModule (copy), OpenSecuritySettingsModule (copy), OpenTermsOfUseModule (copy), InitiateUserPurchaseSettingsPrecheckModule (copy), GuiService (copy), CompleteRequestModule (copy), RetryPurchaseAfterUpsellModule (copy), SetPromptStateModule (copy), SetWindowStateModule (copy), PromptNativeUpsellSuggestionsModule (copy), SendEventModule (copy), SetPostPurchaseActionsModule (copy)
	return {
		purchaseItem = function() --[[ Line: 385 ]]
			-- upvalues: Callback (copy), PurchaseItemModule (upval)
			return Callback(PurchaseItemModule())
		end,
		fetchCartPricing = if FFlagPurchasePromptCartPricingEnabledModule then function(p1) --[[ Line: 389 ]]
			-- upvalues: Callback (copy), FetchCartPricingModule (upval)
			return Callback(FetchCartPricingModule(p1))
		end else nil,
		fetchInGameItemCartPricing = if FFlagEnableInExperienceOffersPurchaseFlow then function(p1) --[[ Line: 394 ]]
			-- upvalues: Callback (copy), FetchInGameItemCartPricingModule (upval)
			return Callback(FetchInGameItemCartPricingModule(p1))
		end else nil,
		promptRobuxPurchase = function() --[[ Line: 398 ]]
			-- upvalues: Callback (copy), LaunchRobuxUpsellModule (upval)
			return Callback(LaunchRobuxUpsellModule())
		end,
		openRobuxStore = function() --[[ Line: 401 ]]
			-- upvalues: Callback (copy), OpenRobuxStoreModule (upval)
			return Callback(OpenRobuxStoreModule())
		end,
		openSecuritySettings = function() --[[ Line: 404 ]]
			-- upvalues: Callback (copy), OpenSecuritySettingsModule (upval)
			return Callback(OpenSecuritySettingsModule())
		end,
		openTermsOfUse = function(p1) --[[ Line: 407 ]]
			-- upvalues: Callback (copy), OpenTermsOfUseModule (upval)
			return Callback(OpenTermsOfUseModule(p1))
		end,
		dispatchFetchPurchaseWarning = function() --[[ Line: 410 ]]
			-- upvalues: Callback (copy), InitiateUserPurchaseSettingsPrecheckModule (upval)
			return Callback(InitiateUserPurchaseSettingsPrecheckModule())
		end,
		completeRequest = function() --[[ Line: 413 ]]
			-- upvalues: GuiService (upval), Callback (copy), CompleteRequestModule (upval)
			GuiService.SelectedCoreObject = nil
			
			return Callback(CompleteRequestModule())
		end,
		retryPurchaseAfterUpsell = function() --[[ Line: 417 ]]
			-- upvalues: Callback (copy), RetryPurchaseAfterUpsellModule (upval)
			return Callback(RetryPurchaseAfterUpsellModule())
		end,
		setPromptState = function(p1) --[[ Line: 420 ]]
			-- upvalues: Callback (copy), SetPromptStateModule (upval)
			return Callback(SetPromptStateModule(p1))
		end,
		setWindowState = function(p1) --[[ Line: 423 ]]
			-- upvalues: Callback (copy), SetWindowStateModule (upval)
			return Callback(SetWindowStateModule(p1))
		end,
		onUpsellSuggestionsSelected = function(p1, p2, p3, p4) --[[ Line: 426 ]]
			-- upvalues: Callback (copy), PromptNativeUpsellSuggestionsModule (upval)
			return Callback(PromptNativeUpsellSuggestionsModule(p1, p2, p3, p4))
		end,
		onAnalyticEvent = function(p1, p2) --[[ Line: 434 ]]
			-- upvalues: Callback (copy), SendEventModule (upval)
			return Callback(SendEventModule(p1, p2))
		end,
		setPostPurchaseActions = if FFlagPurchasePromptCartPricingEnabledModule then function(p1) --[[ Line: 438 ]]
			-- upvalues: Callback (copy), SetPostPurchaseActionsModule (upval)
			Callback(SetPostPurchaseActionsModule(p1))
		end else nil
	}
end)(function(p1) --[[ Line: 310 ]]
	-- upvalues: NavigationModule (copy), Roact (copy), ExtendResult (copy), CryoModule (copy)
	return Roact.createElement(ExtendResult, CryoModule.Dictionary.join(p1, { navigation = NavigationModule.useNavigation() }))
end))