local MarketplaceService = game:GetService("MarketplaceService")
local BrowserService = game:GetService("BrowserService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local SharedFlagsModule = require(Parent.SharedFlags)

local function _()
	-- upvalues: SharedFlagsModule (copy)
	return SharedFlagsModule.FFlagEnableBuyRobuxNewRouting and SharedFlagsModule.FFlagEnableBuyRobuxNewRoutingInExperience
end

local IsErrorReasonContainsEconomicRestrictionsFunction = require(Parent.IAPExperience).Utility.isErrorReasonContainsEconomicRestrictions
local MutedErrorFunction = require(Parent.Loggers).mutedError
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
local GetRobloxSubscriptionProductsFunction = RobloxSubscriptionPurchaseAppModule.Network.getRobloxSubscriptionProducts
local RobloxSubscriptionSignals = RobloxSubscriptionPurchaseAppModule.RobloxSubscriptionSignals
local RobloxSubscriptionFlowCompleteReason = RobloxSubscriptionPurchaseAppModule.RobloxSubscriptionFlowCompleteReason
local SurfaceName = RobloxSubscriptionPurchaseAppModule.SurfaceName
local SurfaceContext = RobloxSubscriptionPurchaseAppModule.SurfaceContext
local PurchasePromptModule = require(Parent.PurchasePrompt)
local WebViewUtilsModule = require(Parent.WebViewUtils)
local SelectPurchaseResultsModule = require(BulkPurchaseApp.Store.Selectors.selectPurchaseResults)
local SelectOrderRequestModule = require(BulkPurchaseApp.Store.Selectors.selectOrderRequest)
local SelectItemDataModule = require(BulkPurchaseApp.Store.Selectors.selectItemData)
local BulkPurchaseEndedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseEnded)
local BulkPurchaseFailedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseFailed)
local BulkPurchaseDisablePurchaseModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseDisablePurchase)
local BulkPurchaseSucceededModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseSucceeded)
local BulkPurchaseCountersEnumModule = require(BulkPurchaseApp.Enums.BulkPurchaseCountersEnum)
local BulkPurchasePromptStateEnumModule = require(BulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)
local ErrorCodeEnumModule = require(BulkPurchaseApp.Enums.ErrorCodeEnum)
local ItemStatusToErrorCodeMapModule = require(BulkPurchaseApp.Enums.ItemStatusToErrorCodeMap)
local PaymentPlatformEnumModule = require(BulkPurchaseApp.Enums.PaymentPlatformEnum)
local GetPaymentPlatformModule = require(BulkPurchaseApp.Utils.getPaymentPlatform)
local GetRobuxStoreUrlModule = require(BulkPurchaseApp.Utils.getRobuxStoreUrl)
local GetGuiObjectIsObscuredModule = require(BulkPurchaseApp.Utils.getGuiObjectIsObscured)
local ReportBulkPurchaseRequestCountersModule = require(BulkPurchaseApp.Utils.reportBulkPurchaseRequestCounters)
local FFlagFixVP8143Module = require(BulkPurchaseApp.Flags.FFlagFixVP8143)
local FFlagBulkPurchaseReportCountersModule = require(BulkPurchaseApp.Flags.FFlagBulkPurchaseReportCounters)
local GetItemResultsFromResponseModule = require(script.Parent.Utils.getItemResultsFromResponse)
local GetCommonItemStatusModule = require(script.Parent.Utils.getCommonItemStatus)
local HandleEconomicRestrictionErrorModule = require(script.Parent.Utils.handleEconomicRestrictionError)
local SelectBulkPurchaseRequestStateModule = require(script.Parent.Utils.selectBulkPurchaseRequestState)
local SelectOptionsModule = require(script.Parent.Utils.selectOptions)
local FixBuyRobuxForAndroid = game:DefineFastFlag("FixBuyRobuxForAndroid", false)
local FixBulkPurchaseInExperienceBuyRobux = game:DefineFastFlag("FixBulkPurchaseInExperienceBuyRobux", false)
local FixBulkPurchaseStarterGuiRename = game:DefineFastFlag("FixBulkPurchaseStarterGuiRename", false)
local FFlagAXAddPlusUpsellToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddPlusUpsellToBulkPurchase)
local FFlagAXAddOffersToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddOffersToBulkPurchase)
local FFlagAXMoreBulkPurchaseCountersModule = require(BulkPurchaseApp.Flags.FFlagAXMoreBulkPurchaseCounters)
local FFlagBulkPurchaseTestPurchaseHintModule = require(BulkPurchaseApp.Flags.FFlagBulkPurchaseTestPurchaseHint)
local FIntBlackbirdUpsellMinPriceForDiscountInclusive = SharedFlagsModule.FIntBlackbirdUpsellMinPriceForDiscountInclusive
local FIntBlackbirdUpsellMaxPriceForDiscountInclusive = SharedFlagsModule.FIntBlackbirdUpsellMaxPriceForDiscountInclusive
local _ = require(script.Parent.BulkPurchaseRequest)

return function()
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), SelectBulkPurchaseRequestStateModule (copy), SelectPurchaseResultsModule (copy), SelectOrderRequestModule (copy), SelectOptionsModule (copy), SelectItemDataModule (copy), FFlagAXAddPlusUpsellToBulkPurchaseModule (copy), ReactModule (copy), RobloxSubscriptionSignals (copy), SignalsReactModule (copy), MarketplaceService (copy), BulkPurchaseEndedModule (copy), BulkPurchaseDisablePurchaseModule (copy), IsErrorReasonContainsEconomicRestrictionsFunction (copy), HandleEconomicRestrictionErrorModule (copy), GetItemResultsFromResponseModule (copy), GetCommonItemStatusModule (copy), FFlagAXMoreBulkPurchaseCountersModule (copy), ReportBulkPurchaseRequestCountersModule (copy), BulkPurchaseCountersEnumModule (copy), BulkPurchaseSucceededModule (copy), BulkPurchasePromptStateEnumModule (copy), FFlagBulkPurchaseReportCountersModule (copy), ItemStatusToErrorCodeMapModule (copy), BulkPurchaseFailedModule (copy), ErrorCodeEnumModule (copy), GetPaymentPlatformModule (copy), PaymentPlatformEnumModule (copy), SharedFlagsModule (copy), Parent (copy), FixBulkPurchaseInExperienceBuyRobux (copy), WebViewUtilsModule (copy), FixBuyRobuxForAndroid (copy), HttpService (copy), BrowserService (copy), GetRobuxStoreUrlModule (copy), UseAppPolicyFunction (copy), GetRobloxSubscriptionProductsFunction (copy), MutedErrorFunction (copy), FIntBlackbirdUpsellMinPriceForDiscountInclusive (copy), FIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy), RobloxSubscriptionPurchaseAppModule (copy), RobloxSubscriptionFlowCompleteReason (copy), SurfaceName (copy), SurfaceContext (copy), PurchasePromptModule (copy), FFlagAXAddOffersToBulkPurchaseModule (copy), FFlagFixVP8143Module (copy), RunService (copy), GetGuiObjectIsObscuredModule (copy), FixBulkPurchaseStarterGuiRename (copy), StarterGui (copy), FFlagBulkPurchaseTestPurchaseHintModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(SelectBulkPurchaseRequestStateModule)
	local UseSelectorResult1 = UseSelectorFunction(SelectPurchaseResultsModule)
	local UseSelectorResult2 = UseSelectorFunction(SelectOrderRequestModule)
	local UseSelectorResult3 = UseSelectorFunction(SelectOptionsModule)
	local UseSelectorResult4 = UseSelectorFunction(SelectItemDataModule)
	local TotalCost = UseSelectorResult.totalCost
	local Balance = UseSelectorResult.balance
	local BatchPurchaseAuthToken = if FFlagAXAddPlusUpsellToBulkPurchaseModule then UseSelectorResult2 and UseSelectorResult2.batchPurchaseAuthToken else nil
	local v1 = nil
	local Callback = nil
	
	if FFlagAXAddPlusUpsellToBulkPurchaseModule then
		v1, Callback = ReactModule.useState({})
	end
	local UseSignalStateResult = if FFlagAXAddPlusUpsellToBulkPurchaseModule then SignalsReactModule.useSignalState(RobloxSubscriptionSignals.get().getHasRobloxSubscription) else nil
	
	local function OnClose()
		-- upvalues: MarketplaceService (upval), UseSelectorResult1 (copy), UseDispatchResult (copy), BulkPurchaseEndedModule (upval)
		MarketplaceService:signalPromptBulkPurchaseFinished(2, UseSelectorResult1)
		UseDispatchResult(BulkPurchaseEndedModule())
	end
	
	local function v63()
		-- upvalues: FFlagAXAddPlusUpsellToBulkPurchaseModule (upval), UseDispatchResult (copy), BulkPurchaseDisablePurchaseModule (upval), MarketplaceService (upval), UseSelectorResult2 (copy), UseSelectorResult3 (copy), IsErrorReasonContainsEconomicRestrictionsFunction (upval), HandleEconomicRestrictionErrorModule (upval), GetItemResultsFromResponseModule (upval), UseSelectorResult4 (copy), GetCommonItemStatusModule (upval), FFlagAXMoreBulkPurchaseCountersModule (upval), ReportBulkPurchaseRequestCountersModule (upval), BulkPurchaseCountersEnumModule (upval), BulkPurchaseSucceededModule (upval), BulkPurchasePromptStateEnumModule (upval), FFlagBulkPurchaseReportCountersModule (upval), ItemStatusToErrorCodeMapModule (upval), BulkPurchaseFailedModule (upval), ErrorCodeEnumModule (upval)
		if FFlagAXAddPlusUpsellToBulkPurchaseModule then
			UseDispatchResult(BulkPurchaseDisablePurchaseModule())
		end
		local Success, Result = pcall(function()
			-- upvalues: MarketplaceService (upval), UseSelectorResult2 (upval), UseSelectorResult3 (upval)
			return MarketplaceService:PerformBulkPurchase(UseSelectorResult2, UseSelectorResult3)
		end)
		
		if Success and Result then
			if Result.message and IsErrorReasonContainsEconomicRestrictionsFunction(Result.message) then
				HandleEconomicRestrictionErrorModule(Result.message, UseDispatchResult)
				
				return
			end
			local ItemResultsFromResponseModule = GetItemResultsFromResponseModule(Result, UseSelectorResult4)
			local CommonItemStatusModule = GetCommonItemStatusModule(ItemResultsFromResponseModule)
			
			if CommonItemStatusModule then
				if CommonItemStatusModule == Enum.MarketplaceItemPurchaseStatus.Success then
					if FFlagBulkPurchaseReportCountersModule then
						ReportBulkPurchaseRequestCountersModule(BulkPurchaseCountersEnumModule.BulkPurchaseSucceededCounter)
					end
					UseDispatchResult(BulkPurchaseSucceededModule(BulkPurchasePromptStateEnumModule.Success, ItemResultsFromResponseModule))
					
					return
				else
					if FFlagBulkPurchaseReportCountersModule then
						if FFlagAXMoreBulkPurchaseCountersModule then
							ReportBulkPurchaseRequestCountersModule(BulkPurchaseCountersEnumModule.BulkPurchaseFailedCounter, {
								errorCode = tostring(ItemStatusToErrorCodeMapModule[CommonItemStatusModule])
							})
						else
							ReportBulkPurchaseRequestCountersModule(BulkPurchaseCountersEnumModule.BulkPurchaseFailedCounter)
						end
					end
					UseDispatchResult(BulkPurchaseFailedModule(ItemStatusToErrorCodeMapModule[CommonItemStatusModule]))
					
					return
				end
			else
				if FFlagAXMoreBulkPurchaseCountersModule then
					ReportBulkPurchaseRequestCountersModule(BulkPurchaseCountersEnumModule.BulkPurchasePartialSuccessCounter)
				end
				UseDispatchResult(BulkPurchaseSucceededModule(BulkPurchasePromptStateEnumModule.PartialSuccess, ItemResultsFromResponseModule))
				
				return
			end
		elseif string.find(Result, "403") then
			UseDispatchResult(BulkPurchaseFailedModule(ErrorCodeEnumModule.TwoStepVerificationRequired))
			
			return
		else
			UseDispatchResult(BulkPurchaseFailedModule(ErrorCodeEnumModule.Generic))
		end
	end
	
	local function v64()
		-- upvalues: GetPaymentPlatformModule (upval), PaymentPlatformEnumModule (upval), SharedFlagsModule (upval), Parent (upval), FixBulkPurchaseInExperienceBuyRobux (upval), WebViewUtilsModule (upval), FixBuyRobuxForAndroid (upval), HttpService (upval), BrowserService (upval), GetRobuxStoreUrlModule (upval), UseDispatchResult (copy), BulkPurchaseEndedModule (upval), BulkPurchaseFailedModule (upval), ErrorCodeEnumModule (upval)
		local PaymentPlatformModule = GetPaymentPlatformModule()
		
		if PaymentPlatformModule ~= PaymentPlatformEnumModule.Desktop and PaymentPlatformModule ~= PaymentPlatformEnumModule.Mobile then
			UseDispatchResult(BulkPurchaseFailedModule(ErrorCodeEnumModule.InsufficientRobux))
			
			return
		end
		if SharedFlagsModule.FFlagEnableBuyRobuxNewRouting and SharedFlagsModule.FFlagEnableBuyRobuxNewRoutingInExperience then
			require(Parent.BuyRobuxInExperience).openBuyRobux({}, function(Url)
				-- upvalues: FixBulkPurchaseInExperienceBuyRobux (upval), WebViewUtilsModule (upval), FixBuyRobuxForAndroid (upval), HttpService (upval), BrowserService (upval)
				if FixBulkPurchaseInExperienceBuyRobux then
					WebViewUtilsModule.openWebViewSession(Url, "")
					
					return
				end
				if FixBuyRobuxForAndroid then
					BrowserService:SendCommand((HttpService:JSONEncode({ command = "open", url = Url })))
					
					return
				else
					BrowserService:OpenBrowserWindow(Url)
				end
			end, "BulkPurchase.onRobuxUpsell")
		elseif FixBulkPurchaseInExperienceBuyRobux then
			WebViewUtilsModule.openWebViewSession(GetRobuxStoreUrlModule(), "")
		elseif FixBuyRobuxForAndroid then
			BrowserService:SendCommand((HttpService:JSONEncode({ command = "open", url = GetRobuxStoreUrlModule() })))
		else
			BrowserService:OpenBrowserWindow(GetRobuxStoreUrlModule())
		end
		UseDispatchResult(BulkPurchaseEndedModule())
	end
	
	local UseMemoResult = nil
	local BlackbirdUpsellBannerProductInfo = nil
	local UseResult = nil
	
	if FFlagAXAddPlusUpsellToBulkPurchaseModule then
		local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
			return p1.getDisableBlackbirdEntrypoints()
		end)
		ReactModule.useEffect(function()
			-- upvalues: GetRobloxSubscriptionProductsFunction (upval), Callback (ref), MutedErrorFunction (upval)
			GetRobloxSubscriptionProductsFunction():andThen(function(Result)
				-- upvalues: Callback (upval)
				Callback(Result)
			end):catch(function(Err)
				-- upvalues: MutedErrorFunction (upval)
				MutedErrorFunction("BulkPurchasePrompt", "Failed to fetch Roblox subscription products: " .. tostring(Err))
			end)
		end, {})
		UseMemoResult = ReactModule.useMemo(function(): boolean
			-- upvalues: UseSignalStateResult (ref), UseAppPolicyResult (copy), UseSelectorResult (copy), FIntBlackbirdUpsellMinPriceForDiscountInclusive (upval), FIntBlackbirdUpsellMaxPriceForDiscountInclusive (upval)
			if UseSignalStateResult then
				return false
			end
			if UseAppPolicyResult then
				return false
			end
			for _, item in UseSelectorResult.items do
				if FIntBlackbirdUpsellMinPriceForDiscountInclusive <= item.cost and item.cost <= FIntBlackbirdUpsellMaxPriceForDiscountInclusive then
					return true
				end
			end
			return false
		end, {
			UseAppPolicyResult,
			UseSignalStateResult,
			UseSelectorResult.items
		})
		UseResult = ReactModule.useCallback(function()
			-- upvalues: FFlagBulkPurchaseReportCountersModule (upval), ReportBulkPurchaseRequestCountersModule (upval), BulkPurchaseCountersEnumModule (upval), RobloxSubscriptionPurchaseAppModule (upval), RobloxSubscriptionFlowCompleteReason (upval), BatchPurchaseAuthToken (ref), UseDispatchResult (copy), BulkPurchaseDisablePurchaseModule (upval), MarketplaceService (upval), BulkPurchaseFailedModule (upval), ErrorCodeEnumModule (upval), SurfaceName (upval), SurfaceContext (upval)
			if FFlagBulkPurchaseReportCountersModule then
				ReportBulkPurchaseRequestCountersModule(BulkPurchaseCountersEnumModule.BulkPurchasePlusUpsellInitatedCounter)
			end
			RobloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase({ showBackButton = false }, {
				onFlowComplete = function(UpsellPurchaseFailed)
					-- upvalues: RobloxSubscriptionFlowCompleteReason (upval), BatchPurchaseAuthToken (upval), UseDispatchResult (upval), BulkPurchaseDisablePurchaseModule (upval), FFlagBulkPurchaseReportCountersModule (upval), ReportBulkPurchaseRequestCountersModule (upval), BulkPurchaseCountersEnumModule (upval), MarketplaceService (upval), BulkPurchaseFailedModule (upval), ErrorCodeEnumModule (upval)
					if UpsellPurchaseFailed == RobloxSubscriptionFlowCompleteReason.UpsellPurchaseSucceeded and BatchPurchaseAuthToken then
						UseDispatchResult(BulkPurchaseDisablePurchaseModule())
						
						if FFlagBulkPurchaseReportCountersModule then
							ReportBulkPurchaseRequestCountersModule(BulkPurchaseCountersEnumModule.BulkPurchasePlusUpsellSucceededCounter)
						end
						if not pcall(function()
							-- upvalues: MarketplaceService (upval), BatchPurchaseAuthToken (upval)
							MarketplaceService:RefreshBulkPurchase(BatchPurchaseAuthToken)
						end) then
							UseDispatchResult(BulkPurchaseFailedModule(ErrorCodeEnumModule.Generic))
						end
					end
					if FFlagBulkPurchaseReportCountersModule and UpsellPurchaseFailed == RobloxSubscriptionFlowCompleteReason.UpsellPurchaseFailed then
						ReportBulkPurchaseRequestCountersModule(BulkPurchaseCountersEnumModule.BulkPurchasePlusUpsellFailedCounter)
					end
				end
			}, nil, SurfaceName.BulkPurchasePrompt, SurfaceContext.InGame, nil, nil)
		end, { UseDispatchResult, BatchPurchaseAuthToken })
		BlackbirdUpsellBannerProductInfo = PurchasePromptModule.Utils.getBlackbirdUpsellBannerProductInfo(v1)
	end
	local UseResult1 = if FFlagAXAddOffersToBulkPurchaseModule then ReactModule.useCallback(function(p1)
		-- upvalues: UseSelectorResult (copy), MarketplaceService (upval), BatchPurchaseAuthToken (ref)
		local List = {}
		
		if UseSelectorResult.offerData and UseSelectorResult.offerData.offersAvailable then
			local OffersAvailable = UseSelectorResult.offerData.offersAvailable
			
			for i, _ in OffersAvailable do
				if i ~= p1 and not OffersAvailable[i].selected then
					table.insert(List, i)
				end
				if i == p1 and OffersAvailable[i].selected then
					table.insert(List, i)
				end
			end
		end
		pcall(function()
			-- upvalues: MarketplaceService (upval), BatchPurchaseAuthToken (upval), List (copy)
			MarketplaceService:RefreshBulkPurchase(BatchPurchaseAuthToken, { unselectedOffers = List })
		end)
	end, { UseSelectorResult.offerData, BatchPurchaseAuthToken }) else nil
	local UseRefResult = nil
	local v2 = nil
	local UseStateResult2 = nil
	
	if FFlagFixVP8143Module then
		UseRefResult = ReactModule.useRef(nil)
		v2, UseStateResult2 = ReactModule.useState(true)
		ReactModule.useEffect(function()
			-- upvalues: RunService (upval), UseRefResult (ref), GetGuiObjectIsObscuredModule (upval), FixBulkPurchaseStarterGuiRename (upval), StarterGui (upval), UseStateResult2 (ref)
			local HeartbeatConnection = RunService.Heartbeat:Connect(function()
				-- upvalues: UseRefResult (upval), GetGuiObjectIsObscuredModule (upval), FixBulkPurchaseStarterGuiRename (upval), StarterGui (upval), UseStateResult2 (upval)
				if UseRefResult.current and typeof(UseRefResult.current) == "Instance" and UseRefResult.current:IsA("GuiObject") then
					local DevConsoleVisibleCore = if FixBulkPurchaseStarterGuiRename then StarterGui:GetCore("DevConsoleVisible") else game.StarterGui:GetCore("DevConsoleVisible")
					UseStateResult2(GetGuiObjectIsObscuredModule(UseRefResult.current) or DevConsoleVisibleCore)
				end
			end)
			
			return function()
				-- upvalues: HeartbeatConnection (copy)
				HeartbeatConnection:Disconnect()
			end
		end, {})
	end
	return {
		currentBalance = UseSelectorResult.balance,
		items = UseSelectorResult.items,
		ownedItems = UseSelectorResult.ownedItems,
		unpurchasableItems = UseSelectorResult.unpurchasableItems,
		onClose = OnClose,
		onAccept = if Balance < TotalCost then v64 else v63,
		totalCost = UseSelectorResult.totalCost,
		isDisabled = FFlagFixVP8143Module and v2 or (#UseSelectorResult.items == 0 or FFlagAXAddPlusUpsellToBulkPurchaseModule and UseSelectorResult.disablePurchase == true),
		purchaseButtonRef = if FFlagFixVP8143Module then UseRefResult else nil,
		discountInformation = UseSelectorResult.discountInformation,
		shouldShowBlackbirdUpsellBanner = if FFlagAXAddPlusUpsellToBulkPurchaseModule then UseMemoResult else nil,
		blackbirdUpsellBannerProductInfo = if FFlagAXAddPlusUpsellToBulkPurchaseModule then BlackbirdUpsellBannerProductInfo else nil,
		onBlackbirdUpsellActivated = if FFlagAXAddPlusUpsellToBulkPurchaseModule then UseResult else nil,
		offerData = if FFlagAXAddOffersToBulkPurchaseModule then UseSelectorResult.offerData else nil,
		toggleOfferSelected = if FFlagAXAddOffersToBulkPurchaseModule then UseResult1 else nil,
		isTestPurchase = if FFlagBulkPurchaseTestPurchaseHintModule then RunService:IsStudio() else nil
	}
end