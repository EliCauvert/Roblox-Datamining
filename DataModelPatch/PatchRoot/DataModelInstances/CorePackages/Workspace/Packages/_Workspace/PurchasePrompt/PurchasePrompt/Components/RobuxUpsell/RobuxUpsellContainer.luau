local GuiService = game:GetService("GuiService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local Roact = require(Parent.PurchasePromptDeps).Roact
local ReactModule = require(Parent.React)
local _ = require(Parent.IAPExperience)
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local CoreScriptsRootProvider = require(Parent.CoreScriptsRoactCommon).CoreScriptsRootProvider
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local NavigationModule = require(Parent.Navigation)
local CryoModule = require(Parent.Cryo)
local SelectPriceModule = require(PurchasePrompt.Selectors.selectPrice)
local PromptNativeUpsellSuggestionsModule = require(PurchasePrompt.Actions.PromptNativeUpsellSuggestions)
local SetPostPurchaseActionsModule = require(PurchasePrompt.Actions.SetPostPurchaseActions)
local PurchaseFlowModule = require(PurchasePrompt.Enums.PurchaseFlow)
local _ = require(PurchasePrompt.Models.RobuxUpsell)
local CompleteRequestModule = require(PurchasePrompt.Thunks.completeRequest)
local PurchaseItemModule = require(PurchasePrompt.Thunks.purchaseItem)
local LaunchRobuxUpsellModule = require(PurchasePrompt.Thunks.launchRobuxUpsell)
local OpenRobuxStoreModule = require(PurchasePrompt.Thunks.openRobuxStore)
local OpenSecuritySettingsModule = require(PurchasePrompt.Thunks.openSecuritySettings)
local OpenTermsOfUseModule = require(PurchasePrompt.Thunks.openTermsOfUse)
local _ = require(PurchasePrompt.Thunks.initiatePurchasePrecheck)
local InitiateUserPurchaseSettingsPrecheckModule = require(PurchasePrompt.Thunks.initiateUserPurchaseSettingsPrecheck)
local FetchCartPricingModule = require(PurchasePrompt.Thunks.fetchCartPricing)
local SelectCartPricingResponseModule = require(PurchasePrompt.Selectors.selectCartPricingResponse)
local SelectIsCartPricingFetchingModule = require(PurchasePrompt.Selectors.selectIsCartPricingFetching)
local SendEventModule = require(PurchasePrompt.Thunks.sendEvent)
local IsMockingPurchasesModule = require(PurchasePrompt.Utils.isMockingPurchases)
local GetPlayerPriceModule = require(PurchasePrompt.Utils.getPlayerPrice)
local IsLinksAllowedModule = require(PurchasePrompt.Utils.isLinksAllowed)
local SelectedRobuxPackageModule = require(PurchasePrompt.Utils.SelectedRobuxPackage)
local FFlagEnableUnifiedProductPurchaseFlow = require(Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local ConnectToStoreModule = require(PurchasePrompt.connectToStore)
local ExternalEventConnectionModule = require(PurchasePrompt.Components.Connection.ExternalEventConnection)
local GetFFLagUseCoreScriptsRootProviderForUpsellModalModule = require(PurchasePrompt.Flags.GetFFLagUseCoreScriptsRootProviderForUpsellModal)
local FFlagSetMenuOnPurchasePromptModule = require(PurchasePrompt.Flags.FFlagSetMenuOnPurchasePrompt)
local UpsellSuggestionsAPIMaxPackages = require(Parent.SharedFlags).UpsellSuggestionsAPIMaxPackages
local RobuxUpsellOverlayModule = require(script.Parent.RobuxUpsellOverlay)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagEnableDiscountInfoInUnifiedPurchaseModal = require(Parent.SharedFlags).FFlagEnableDiscountInfoInUnifiedPurchaseModal
local FFlagPurchasePromptCartPricingEnabledModule = require(PurchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)
local ExtendResult: (any) -> any = Roact.Component:extend(script.Name)

function ExtendResult.init(p1)
	-- upvalues: FFlagEnableUnifiedProductPurchaseFlow (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), AppPage (copy)
	p1.state = { screenSize = Vector2.new(0, 0) }
	
	function p1.changeScreenSize(Frame: Frame)
		-- upvalues: p1 (copy)
		if p1.state.screenSize ~= Frame.AbsoluteSize then
			p1:setState({ screenSize = Frame.AbsoluteSize })
		end
	end
	
	if FFlagEnableUnifiedProductPurchaseFlow then
		if FFlagPurchasePromptCartPricingEnabledModule then
			function p1:fetchCartPricingForPurchasePrompt(p2)
				-- upvalues: p1 (copy)
				return if p2 == nil then nil else p1.props.fetchCartPricing(p2)
			end
		end
		function p1.navigateToBuyRobux()
			-- upvalues: p1 (copy), AppPage (upval)
			p1.props.navigation.navigate(AppPage.PurchaseRobux)
		end
		
		function p1.navigateToTermsOfUse()
			-- upvalues: p1 (copy)
			p1.props.openTermsOfUse(p1.props.navigation)
		end
	end
end

function ExtendResult.createElement(CoreScriptsRootProvider)
	-- upvalues: PurchaseFlowModule (copy), IsLinksAllowedModule (copy), Roact (copy), RobuxUpsellOverlayModule (copy), FFlagEnableDiscountInfoInUnifiedPurchaseModal (copy), UpsellSuggestionsAPIMaxPackages (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), GetPlayerPriceModule (copy), ExternalEventConnectionModule (copy), GuiService (copy), FFlagSetMenuOnPurchasePromptModule (copy)
	local Props = CoreScriptsRootProvider.props
	local State = CoreScriptsRootProvider.state
	
	if Props.purchaseFlow == PurchaseFlowModule.RobuxUpsellV2 or Props.purchaseFlow == PurchaseFlowModule.LargeRobuxUpsell then
		local IsLinksAllowedModule1 = IsLinksAllowedModule()
		
		return Roact.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			[Roact.Change.AbsoluteSize] = CoreScriptsRootProvider.changeScreenSize,
			BackgroundTransparency = 1
		}, {
			Prompt = Roact.createElement(RobuxUpsellOverlayModule, {
				screenSize = State.screenSize,
				virtualItemPrice = if FFlagEnableDiscountInfoInUnifiedPurchaseModal then Props.virtualItemPrice else nil,
				requestType = Props.requestType,
				promptState = Props.promptState,
				purchaseFlow = Props.purchaseFlow,
				purchaseError = Props.purchaseError,
				economicRestrictionError = Props.economicRestrictionError,
				useUpsellSuggestions = UpsellSuggestionsAPIMaxPackages > 1,
				upsellSuggestions = Props.robuxSuggestions,
				selectedUpsellIndex = Props.robuxPackageSelection,
				virtualItemBadgeType = Props.virtualItemBadgeType,
				onUpsellSuggestionsSelected = function(p1)
					-- upvalues: Props (copy)
					Props.onUpsellSuggestionsSelected(Props.robuxSuggestions, p1, Props.virtualItemBadgeType)
				end,
				useUnifiedProductPurchaseModal = if FFlagEnableUnifiedProductPurchaseFlow then CoreScriptsRootProvider.props.isUserEligibleForUnifiedPurchaseFlow else nil,
				purchaseAnalyticsMetadata = if FFlagEnableUnifiedProductPurchaseFlow then CoreScriptsRootProvider.props.purchaseAnalyticsMetadata else nil,
				cartPricingResponse = if FFlagPurchasePromptCartPricingEnabledModule then Props.cartPricingResponse else nil,
				collectibleItemId = if FFlagPurchasePromptCartPricingEnabledModule then Props.collectibleItemId else nil,
				isCartPricingLoading = if FFlagPurchasePromptCartPricingEnabledModule then Props.isCartPricingLoading else nil,
				onCartOfferAppliedChanged = if FFlagPurchasePromptCartPricingEnabledModule then CoreScriptsRootProvider.fetchCartPricingForPurchasePrompt else nil,
				postPurchaseActions = if FFlagPurchasePromptCartPricingEnabledModule then Props.postPurchaseActions else nil,
				setPostPurchaseActions = if FFlagPurchasePromptCartPricingEnabledModule then Props.setPostPurchaseActions else nil,
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
				purchaseItem = Props.purchaseItem,
				promptRobuxPurchase = Props.promptRobuxPurchase,
				openRobuxStore = if FFlagEnableUnifiedProductPurchaseFlow and CoreScriptsRootProvider.props.isUserEligibleForUnifiedPurchaseFlow then CoreScriptsRootProvider.navigateToBuyRobux else Props.openRobuxStore,
				openTermsOfUse = IsLinksAllowedModule1 and (if FFlagEnableUnifiedProductPurchaseFlow then CoreScriptsRootProvider.navigateToTermsOfUse else Props.openTermsOfUse) or nil,
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
				callback = function()
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
	else
		return nil
	end
end

function ExtendResult.render(p1)
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

if FFlagEnableUnifiedProductPurchaseFlow then
	ExtendResult = function(p1)
		-- upvalues: NavigationModule (copy), Roact (copy), ExtendResult (copy), CryoModule (copy)
		return Roact.createElement(ExtendResult, CryoModule.Dictionary.join(p1, { navigation = NavigationModule.useNavigation() }))
	end
end
return (ConnectToStoreModule(function(p1)
	-- upvalues: IsMockingPurchasesModule (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), SelectedRobuxPackageModule (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), FFlagEnableDiscountInfoInUnifiedPurchaseModal (copy), SelectPriceModule (copy), SelectCartPricingResponseModule (copy), SelectIsCartPricingFetchingModule (copy)
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
		robuxProductId = SelectedRobuxPackageModule.getRobuxProductId(p1),
		productId = SelectedRobuxPackageModule.getProductId(p1),
		robuxPurchaseAmount = SelectedRobuxPackageModule.getRobuxPurchaseAmount(p1),
		robuxAmountBeforeBonus = SelectedRobuxPackageModule.getRobuxAmountBeforeBonus(p1),
		price = SelectedRobuxPackageModule.getPrice(p1),
		isTestPurchase = IsMockingPurchasesModule1,
		isGamepadEnabled = p1.gamepadEnabled,
		humanoidModel = p1.promptRequest.humanoidModel,
		isUserEligibleForUnifiedPurchaseFlow = if FFlagEnableUnifiedProductPurchaseFlow then p1.isUserEligibleForUnifiedPurchaseFlow else nil,
		purchaseAnalyticsMetadata = if FFlagEnableUnifiedProductPurchaseFlow then p1.purchaseAnalyticsMetadata else nil,
		virtualItemPrice = if FFlagEnableDiscountInfoInUnifiedPurchaseModal then SelectPriceModule(p1) else nil,
		collectibleItemId = if FFlagPurchasePromptCartPricingEnabledModule then CollectibleItemId else nil,
		cartPricingResponse = if FFlagPurchasePromptCartPricingEnabledModule then SelectCartPricingResponseModule(p1) else nil,
		isCartPricingLoading = if FFlagPurchasePromptCartPricingEnabledModule then SelectIsCartPricingFetchingModule(p1) else nil,
		postPurchaseActions = if FFlagPurchasePromptCartPricingEnabledModule then p1.postPurchaseActions else nil
	}
end, function(Callback)
	-- upvalues: PurchaseItemModule (copy), FFlagPurchasePromptCartPricingEnabledModule (copy), FetchCartPricingModule (copy), LaunchRobuxUpsellModule (copy), OpenRobuxStoreModule (copy), OpenSecuritySettingsModule (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), OpenTermsOfUseModule (copy), InitiateUserPurchaseSettingsPrecheckModule (copy), GuiService (copy), CompleteRequestModule (copy), PromptNativeUpsellSuggestionsModule (copy), SendEventModule (copy), SetPostPurchaseActionsModule (copy)
	return {
		purchaseItem = function()
			-- upvalues: Callback (copy), PurchaseItemModule (upval)
			return Callback(PurchaseItemModule())
		end,
		fetchCartPricing = if FFlagPurchasePromptCartPricingEnabledModule then function(p1)
			-- upvalues: Callback (copy), FetchCartPricingModule (upval)
			return Callback(FetchCartPricingModule(p1))
		end else nil,
		promptRobuxPurchase = function()
			-- upvalues: Callback (copy), LaunchRobuxUpsellModule (upval)
			return Callback(LaunchRobuxUpsellModule())
		end,
		openRobuxStore = function()
			-- upvalues: Callback (copy), OpenRobuxStoreModule (upval)
			return Callback(OpenRobuxStoreModule())
		end,
		openSecuritySettings = function()
			-- upvalues: Callback (copy), OpenSecuritySettingsModule (upval)
			return Callback(OpenSecuritySettingsModule())
		end,
		openTermsOfUse = function(p1)
			-- upvalues: FFlagEnableUnifiedProductPurchaseFlow (upval), Callback (copy), OpenTermsOfUseModule (upval)
			return if FFlagEnableUnifiedProductPurchaseFlow then Callback(OpenTermsOfUseModule(p1)) else Callback(OpenTermsOfUseModule())
		end,
		dispatchFetchPurchaseWarning = function()
			-- upvalues: Callback (copy), InitiateUserPurchaseSettingsPrecheckModule (upval)
			return Callback(InitiateUserPurchaseSettingsPrecheckModule())
		end,
		completeRequest = function()
			-- upvalues: GuiService (upval), Callback (copy), CompleteRequestModule (upval)
			GuiService.SelectedCoreObject = nil
			
			return Callback(CompleteRequestModule())
		end,
		onUpsellSuggestionsSelected = function(p1, p2, p3)
			-- upvalues: Callback (copy), PromptNativeUpsellSuggestionsModule (upval)
			return Callback(PromptNativeUpsellSuggestionsModule(p1, p2, p3))
		end,
		onAnalyticEvent = function(p1, p2)
			-- upvalues: Callback (copy), SendEventModule (upval)
			return Callback(SendEventModule(p1, p2))
		end,
		setPostPurchaseActions = if FFlagPurchasePromptCartPricingEnabledModule then function(p1)
			-- upvalues: Callback (copy), SetPostPurchaseActionsModule (upval)
			Callback(SetPostPurchaseActionsModule(p1))
		end else nil
	}
end)(ExtendResult))