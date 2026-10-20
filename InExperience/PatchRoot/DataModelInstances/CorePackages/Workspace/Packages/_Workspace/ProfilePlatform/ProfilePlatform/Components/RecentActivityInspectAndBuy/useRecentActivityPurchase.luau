local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetIsInsufficientRobuxErrorFunction = require(Parent.AvatarExperienceCommon).Utils.getIsInsufficientRobuxError
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local MarketplaceUnifiedAction = require(Parent.AvatarExperienceAnalytics).UnifiedEventLogEnums.MarketplaceUnifiedAction
local _ = require(ProfilePlatform.Common.Types)
local PurchaseBulkItemsModule = require(ProfilePlatform.Networking.PurchaseBulkItems)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local HandlePurchaseItemsSuccessModule = require(ProfilePlatform.Components.InspectAvatar.HandlePurchaseItemsSuccess)
local SendProfilePurchaseEventsModule = require(ProfilePlatform.Analytics.sendProfilePurchaseEvents)
local FFlagProfileUnifiedPurchaseLoggingModule = require(ProfilePlatform.Flags.FFlagProfileUnifiedPurchaseLogging)
local UseRecentActivityPurchaseSelectionModule = require(script.Parent.useRecentActivityPurchaseSelection)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), RobloxAppHooksModule (copy), UseProfileWrapperContextModule (copy), UseRecentActivityPurchaseSelectionModule (copy), ReactModule (copy), UseLocalizationFunction (copy), FFlagProfileUnifiedPurchaseLoggingModule (copy), SendProfilePurchaseEventsModule (copy), MarketplaceUnifiedAction (copy), PurchaseBulkItemsModule (copy), HandlePurchaseItemsSuccessModule (copy), GetIsInsufficientRobuxErrorFunction (copy), SetCurrentToastMessageFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalRobuxBalanceResult = RobloxAppHooksModule.useLocalRobuxBalance()
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local LocalUserId = p1.localUserId
	local UseRecentActivityPurchaseSelectionModuleResult = UseRecentActivityPurchaseSelectionModule(p1.displayItems)
	local PurchaseData = UseRecentActivityPurchaseSelectionModuleResult.purchaseData
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseLocalizationResult = UseLocalizationFunction({
		purchasePartialFailure = "Feature.Avatar.Heading.LooksPurchasePartialSuccess",
		purchaseFailed = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
		purchaseSuccessSingular = {
			"Feature.Avatar.Message.LooksPurchaseSuccessSingular",
			numItems = 1
		},
		purchaseSuccessPlural = {
			"Feature.Avatar.Message.LooksPurchaseSuccessPlural",
			numItems = PurchaseData.count
		}
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseLocalizationResult (copy)
		return {
			purchaseSuccessSingular = UseLocalizationResult.purchaseSuccessSingular,
			purchaseSuccessPlural = UseLocalizationResult.purchaseSuccessPlural,
			purchasePartialFailure = UseLocalizationResult.purchasePartialFailure
		}
	end, {
		UseLocalizationResult.purchaseSuccessSingular,
		UseLocalizationResult.purchaseSuccessPlural,
		UseLocalizationResult.purchasePartialFailure
	})
	
	return {
		selectedItems = UseRecentActivityPurchaseSelectionModuleResult.selectedItems,
		purchaseSummary = {
			totalPrice = PurchaseData.totalPrice,
			count = PurchaseData.count
		},
		isPurchasing = UseStateResult,
		isConfirmingPurchase = UseStateResult1,
		isShowingInsufficientRobux = UseStateResult3,
		robuxBalance = if UseLocalRobuxBalanceResult == nil then 0 else UseLocalRobuxBalanceResult,
		onToggleItem = UseRecentActivityPurchaseSelectionModuleResult.onToggleItem,
		onBuyAll = ReactModule.useCallback(function()
			-- upvalues: PurchaseData (copy), LocalUserId (copy), UseLocalRobuxBalanceResult (copy), UseStateResult2_2 (copy), UseStateResult2_1 (copy)
			if #PurchaseData.lineItems == 0 or not LocalUserId then return end
			if UseLocalRobuxBalanceResult == nil or UseLocalRobuxBalanceResult >= PurchaseData.totalPrice then
				UseStateResult2_1(true)
				
				return
			else
				UseStateResult2_2(true)
			end
		end, { PurchaseData, LocalUserId, UseLocalRobuxBalanceResult }),
		onConfirmPurchase = ReactModule.useCallback(function()
			-- upvalues: UseStateResult (copy), PurchaseData (copy), LocalUserId (copy), UseStateResult2 (copy), FFlagProfileUnifiedPurchaseLoggingModule (upval), SendProfilePurchaseEventsModule (upval), MarketplaceUnifiedAction (upval), UseProfileWrapperContextModuleResult (copy), PurchaseBulkItemsModule (upval), HandlePurchaseItemsSuccessModule (upval), UseDispatchResult (copy), UseMemoResult (copy), UseStateResult2_1 (copy), p1 (copy), GetIsInsufficientRobuxErrorFunction (upval), UseStateResult2_2 (copy), SetCurrentToastMessageFunction (upval), UseLocalizationResult (copy)
			if UseStateResult or #PurchaseData.lineItems == 0 or not LocalUserId then return end
			UseStateResult2(true)
			
			if FFlagProfileUnifiedPurchaseLoggingModule then
				SendProfilePurchaseEventsModule(MarketplaceUnifiedAction.PURCHASE_ATTEMPT, PurchaseData.purchasedItems or {}, UseProfileWrapperContextModuleResult.profileType)
			end
			PurchaseBulkItemsModule({ userId = LocalUserId, lineItems = PurchaseData.lineItems }):andThen(function(Result)
				-- upvalues: HandlePurchaseItemsSuccessModule (upval), FFlagProfileUnifiedPurchaseLoggingModule (upval), PurchaseData (upval), UseProfileWrapperContextModuleResult (upval), UseDispatchResult (upval), UseMemoResult (upval), UseStateResult2_1 (upval), p1 (upval)
				HandlePurchaseItemsSuccessModule({
					result = Result,
					purchasedItems = if FFlagProfileUnifiedPurchaseLoggingModule then PurchaseData.purchasedItems else nil,
					profileWrapperContext = UseProfileWrapperContextModuleResult,
					dispatch = UseDispatchResult,
					localized = UseMemoResult
				})
				UseStateResult2_1(false)
				p1.onClose()
			end):catch(function(Err)
				-- upvalues: UseStateResult2_1 (upval), GetIsInsufficientRobuxErrorFunction (upval), UseStateResult2_2 (upval), UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), UseLocalizationResult (upval), p1 (upval)
				UseStateResult2_1(false)
				
				if GetIsInsufficientRobuxErrorFunction(Err) then
					UseStateResult2_2(true)
					
					return
				else
					UseDispatchResult(SetCurrentToastMessageFunction({
						isLocalized = true,
						toastType = "PurchaseMessage",
						toastMessage = UseLocalizationResult.purchaseFailed
					}))
					p1.onClose()
				end
			end):finally(function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end)
		end, {
			UseStateResult, PurchaseData, LocalUserId,
			UseProfileWrapperContextModuleResult, UseDispatchResult, UseMemoResult,
			UseLocalizationResult.purchaseFailed, p1.onClose
		}),
		onCancelPurchase = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(false)
		end, {}),
		onDismissInsufficientRobux = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2_2 (copy)
			UseStateResult2_2(false)
		end, {})
	}
end