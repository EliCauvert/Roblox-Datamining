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

return function(p0)
	-- upvalues: useDispatch (ref), robloxAppHooksModule (ref), useProfileWrapperContextModule (ref), useRecentActivityPurchaseSelectionModule (ref), reactModule (ref), useLocalization (ref), purchaseBulkItemsModule (ref), handlePurchaseItemsSuccessModule (ref), getIsInsufficientRobuxError (ref), setCurrentToastMessage (ref)
	local var7 = useDispatch()
	local var8 = robloxAppHooksModule.useLocalRobuxBalance()
	local var9 = useProfileWrapperContextModule()
	local localUserId = p0.localUserId
	local var10 = useRecentActivityPurchaseSelectionModule(p0.displayItems)
	local purchaseData = var10.purchaseData
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useState(false)
	local var17 = useLocalization({
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
	local var18 = reactModule.useMemo(function()
		-- upvalues: var17 (ref)
		return {
			purchaseSuccessSingular = var17.purchaseSuccessSingular,
			purchaseSuccessPlural = var17.purchaseSuccessPlural,
			purchasePartialFailure = var17.purchasePartialFailure
		}
	end, {
		var17.purchaseSuccessSingular,
		var17.purchaseSuccessPlural,
		var17.purchasePartialFailure
	})
	
	return {
		selectedItems = var10.selectedItems,
		purchaseSummary = {
			totalPrice = purchaseData.totalPrice,
			count = purchaseData.count
		},
		isPurchasing = var11,
		isConfirmingPurchase = var13,
		isShowingInsufficientRobux = var15,
		robuxBalance = if var8 ~= nil then 0 else var8,
		onToggleItem = var10.onToggleItem,
		onBuyAll = reactModule.useCallback(function()
			-- upvalues: purchaseData (ref), localUserId (ref), var8 (ref), var16 (ref), var14 (ref)
			if #purchaseData.lineItems == 0 or not localUserId then return end
			if var8 == nil or var8 >= purchaseData.totalPrice then
				var14(true)
				
				return
			end
			var16(true)
		end, { purchaseData, localUserId, var8 }),
		onConfirmPurchase = reactModule.useCallback(function()
			-- upvalues: var11 (ref), purchaseData (ref), localUserId (ref), var12 (ref), purchaseBulkItemsModule (copy), handlePurchaseItemsSuccessModule (copy), var9 (ref), var7 (ref), var18 (ref), var14 (ref), p0 (ref), getIsInsufficientRobuxError (copy), var16 (ref), setCurrentToastMessage (copy), var17 (ref)
			if var11 or #purchaseData.lineItems == 0 or not localUserId then
				return
			end
			var12(true)
			purchaseBulkItemsModule({ userId = localUserId, lineItems = purchaseData.lineItems }):andThen(function(p2)
				-- upvalues: handlePurchaseItemsSuccessModule (copy), var9 (copy), var7 (copy), var18 (copy), var14 (copy), p0 (copy)
				handlePurchaseItemsSuccessModule({
					result = p2,
					profileWrapperContext = var9,
					dispatch = var7,
					localized = var18
				})
				var14(false)
				p0.onClose()
			end):catch(function(p1)
				-- upvalues: var14 (copy), getIsInsufficientRobuxError (copy), var16 (copy), var7 (copy), setCurrentToastMessage (copy), var17 (copy), p0 (copy)
				var14(false)
				
				if getIsInsufficientRobuxError(p1) then
					var16(true)
					
					return
				end
				var7(setCurrentToastMessage({
					isLocalized = true,
					toastType = "PurchaseMessage",
					toastMessage = var17.purchaseFailed
				}))
				p0.onClose()
			end):finally(function()
				-- upvalues: var12 (copy)
				var12(false)
			end)
		end, {
			var11, purchaseData, localUserId, var9, var7, var18, var17.purchaseFailed,
			p0.onClose
		}),
		onCancelPurchase = reactModule.useCallback(function()
			-- upvalues: var14 (ref)
			var14(false)
		end, {}),
		onDismissInsufficientRobux = reactModule.useCallback(function()
			-- upvalues: var16 (ref)
			var16(false)
		end, {})
	}
end