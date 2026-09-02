local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getIsInsufficientRobuxError = require(parent.AvatarExperienceCommon).Utils.getIsInsufficientRobuxError
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local _ = require(profilePlatform.Common.Types)
local purchaseBulkItemsModule = require(profilePlatform.Networking.PurchaseBulkItems)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local handlePurchaseItemsSuccessModule = require(profilePlatform.Components.InspectAvatar.HandlePurchaseItemsSuccess)
local useRecentActivityPurchaseSelectionModule = require(script.Parent.useRecentActivityPurchaseSelection)

return function(p1)
	-- upvalues: useDispatch (ref), robloxAppHooksModule (ref), useProfileWrapperContextModule (ref), useRecentActivityPurchaseSelectionModule (ref), reactModule (ref), useLocalization (ref), purchaseBulkItemsModule (ref), handlePurchaseItemsSuccessModule (ref), getIsInsufficientRobuxError (ref), setCurrentToastMessage (ref)
	local var1 = useDispatch()
	local var2 = robloxAppHooksModule.useLocalRobuxBalance()
	local var3 = useProfileWrapperContextModule()
	local localUserId = p1.localUserId
	local var4 = useRecentActivityPurchaseSelectionModule(p1.displayItems)
	local purchaseData = var4.purchaseData
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useState(false)
	local var11 = useLocalization({
		purchasePartialFailure = "Feature.Avatar.Heading.LooksPurchasePartialSuccess",
		purchaseFailed = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName",
		purchaseSuccessSingular = {
			"Feature.Avatar.Message.LooksPurchaseSuccessSingular",
			numItems = 1
		},
		purchaseSuccessPlural = {
			"Feature.Avatar.Message.LooksPurchaseSuccessPlural",
			numItems = purchaseData.count
		}
	})
	local var12 = reactModule.useMemo(function()
		-- upvalues: var11 (ref)
		return {
			purchaseSuccessSingular = var11.purchaseSuccessSingular,
			purchaseSuccessPlural = var11.purchaseSuccessPlural,
			purchasePartialFailure = var11.purchasePartialFailure
		}
	end, {
		var11.purchaseSuccessSingular,
		var11.purchaseSuccessPlural,
		var11.purchasePartialFailure
	})
	
	return {
		selectedItems = var4.selectedItems,
		purchaseSummary = {
			totalPrice = purchaseData.totalPrice,
			count = purchaseData.count
		},
		isPurchasing = var5,
		isConfirmingPurchase = var7,
		isShowingInsufficientRobux = var9,
		robuxBalance = if var2 ~= nil then 0 else var2,
		onToggleItem = var4.onToggleItem,
		onBuyAll = reactModule.useCallback(function()
			-- upvalues: purchaseData (ref), localUserId (ref), var2 (ref), var10 (ref), var8 (ref)
			if #purchaseData.lineItems == 0 or not localUserId then return end
			if var2 == nil or var2 >= purchaseData.totalPrice then
				var8(true)
				
				return
			end
			var10(true)
		end, { purchaseData, localUserId, var2 }),
		onConfirmPurchase = reactModule.useCallback(function()
			-- upvalues: var5 (ref), purchaseData (ref), localUserId (ref), var6 (ref), purchaseBulkItemsModule (copy), handlePurchaseItemsSuccessModule (copy), var3 (ref), var1 (ref), var12 (ref), var8 (ref), p1 (ref), getIsInsufficientRobuxError (copy), var10 (ref), setCurrentToastMessage (copy), var11 (ref)
			if var5 or #purchaseData.lineItems == 0 or not localUserId then
				return
			end
			var6(true)
			purchaseBulkItemsModule({ userId = localUserId, lineItems = purchaseData.lineItems }):andThen(function(p2)
				-- upvalues: handlePurchaseItemsSuccessModule (copy), var3 (copy), var1 (copy), var12 (copy), var8 (copy), p1 (copy)
				handlePurchaseItemsSuccessModule({
					result = p2,
					profileWrapperContext = var3,
					dispatch = var1,
					localized = var12
				})
				var8(false)
				p1.onClose()
			end):catch(function(p2)
				-- upvalues: var8 (copy), getIsInsufficientRobuxError (copy), var10 (copy), var1 (copy), setCurrentToastMessage (copy), var11 (copy), p1 (copy)
				var8(false)
				
				if getIsInsufficientRobuxError(p2) then
					var10(true)
					
					return
				end
				var1(setCurrentToastMessage({
					isLocalized = true,
					toastType = "PurchaseMessage",
					toastMessage = var11.purchaseFailed
				}))
				p1.onClose()
			end):finally(function()
				-- upvalues: var6 (copy)
				var6(false)
			end)
		end, {
			var5, purchaseData, localUserId, var3, var1, var12, var11.purchaseFailed,
			p1.onClose
		}),
		onCancelPurchase = reactModule.useCallback(function()
			-- upvalues: var8 (ref)
			var8(false)
		end, {}),
		onDismissInsufficientRobux = reactModule.useCallback(function()
			-- upvalues: var10 (ref)
			var10(false)
		end, {})
	}
end