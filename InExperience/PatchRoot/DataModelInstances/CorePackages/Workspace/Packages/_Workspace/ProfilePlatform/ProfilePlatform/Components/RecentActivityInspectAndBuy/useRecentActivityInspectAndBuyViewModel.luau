local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getIsInsufficientRobuxError = require(parent.AvatarExperienceCommon).Utils.getIsInsufficientRobuxError
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Common.Types)
local purchaseBulkItemsModule = require(profilePlatform.Networking.PurchaseBulkItems)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useInspectAvatarDataModule = require(profilePlatform.Components.InspectAvatar.useInspectAvatarData)
local handlePurchaseItemsSuccessModule = require(profilePlatform.Components.InspectAvatar.HandlePurchaseItemsSuccess)
local useRecentActivityPurchaseSelectionModule = require(script.Parent.useRecentActivityPurchaseSelection)

return function(p0) --[[ line: 49 | named "useRecentActivityInspectAndBuyViewModel" ]]
	-- upvalues: useDispatch (ref), robloxAppHooksModule (ref), useProfileWrapperContextModule (ref), reactModule (ref), enumsModule (ref), useInspectAvatarDataModule (ref), useRecentActivityPurchaseSelectionModule (ref), useLocalization (ref), purchaseBulkItemsModule (ref), handlePurchaseItemsSuccessModule (ref), getIsInsufficientRobuxError (ref), setCurrentToastMessage (ref)
	local var9 = useDispatch()
	local var10 = robloxAppHooksModule.useLocalRobuxBalance()
	local var11 = useProfileWrapperContextModule()
	local assetIds = p0.assetIds
	local var12 = useInspectAvatarDataModule(reactModule.useMemo(function() --[[ line: 58 ]]
		-- upvalues: assetIds (ref), enumsModule (copy)
		local t = {}
		
		for i, v in assetIds do
			table.insert(t, { assetId = v, itemType = enumsModule.ItemTypes.Asset })
		end
		return t
	end, { assetIds }))
	local displayItems = var12.displayItems
	local var13 = useRecentActivityPurchaseSelectionModule(displayItems)
	local purchaseData = var13.purchaseData
	local var14, var15 = reactModule.useState(false)
	local var16, var17 = reactModule.useState(false)
	local var18, var19 = reactModule.useState(false)
	local var20 = useLocalization({
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
	local var21 = reactModule.useMemo(function() --[[ line: 85 ]]
		-- upvalues: var20 (ref)
		return {
			purchaseSuccessSingular = var20.purchaseSuccessSingular,
			purchaseSuccessPlural = var20.purchaseSuccessPlural,
			purchasePartialFailure = var20.purchasePartialFailure
		}
	end, {
		var20.purchaseSuccessSingular,
		var20.purchaseSuccessPlural,
		var20.purchasePartialFailure
	})
	
	return {
		displayItems = displayItems,
		selectedItems = var13.selectedItems,
		isLoading = var12.isLoading,
		purchaseSummary = {
			totalPrice = purchaseData.totalPrice,
			count = purchaseData.count
		},
		isPurchasing = var14,
		isConfirmingPurchase = var16,
		isShowingInsufficientRobux = var18,
		robuxBalance = if var10 ~= nil then 0 else var10,
		onToggleItem = var13.onToggleItem,
		onBuyAll = reactModule.useCallback(function() --[[ line: 99 ]]
			-- upvalues: purchaseData (ref), var12 (ref), var10 (ref), var19 (ref), var17 (ref)
			if #purchaseData.lineItems == 0 or not var12.localUserId then return end
			if var10 == nil or var10 >= purchaseData.totalPrice then
				var17(true)
				
				return
			end
			var19(true)
		end, { purchaseData, var12.localUserId, var10 }),
		onConfirmPurchase = reactModule.useCallback(function() --[[ line: 119 ]]
			-- upvalues: var14 (ref), purchaseData (ref), var12 (ref), var15 (ref), purchaseBulkItemsModule (copy), handlePurchaseItemsSuccessModule (copy), var11 (ref), var9 (ref), var21 (ref), var17 (ref), p0 (ref), getIsInsufficientRobuxError (copy), var19 (ref), setCurrentToastMessage (copy), var20 (ref)
			if var14 or #purchaseData.lineItems == 0 or not var12.localUserId then
				return
			end
			var15(true)
			purchaseBulkItemsModule({
				userId = var12.localUserId,
				lineItems = purchaseData.lineItems
			}):andThen(function(p2) --[[ line: 130 ]]
				-- upvalues: handlePurchaseItemsSuccessModule (copy), var11 (copy), var9 (copy), var21 (copy), var17 (copy), p0 (copy)
				handlePurchaseItemsSuccessModule({
					result = p2,
					profileWrapperContext = var11,
					dispatch = var9,
					localized = var21
				})
				var17(false)
				p0.onClose()
			end):catch(function(p1) --[[ line: 142 ]]
				-- upvalues: var17 (copy), getIsInsufficientRobuxError (copy), var19 (copy), var9 (copy), setCurrentToastMessage (copy), var20 (copy), p0 (copy)
				var17(false)
				
				if getIsInsufficientRobuxError(p1) then
					var19(true)
					
					return
				end
				var9(setCurrentToastMessage({
					isLocalized = true,
					toastType = "PurchaseMessage",
					toastMessage = var20.purchaseFailed
				}))
				p0.onClose()
			end):finally(function() --[[ line: 155 ]]
				-- upvalues: var15 (copy)
				var15(false)
			end)
		end, {
			var14, purchaseData, var12.localUserId, var11, var9, var21,
			var20.purchaseFailed, p0.onClose
		}),
		onCancelPurchase = reactModule.useCallback(function() --[[ line: 110 ]]
			-- upvalues: var17 (ref)
			var17(false)
		end, {}),
		onDismissInsufficientRobux = reactModule.useCallback(function() --[[ line: 114 ]]
			-- upvalues: var19 (ref)
			var19(false)
		end, {}),
		onClose = p0.onClose,
		openItemDetails = reactModule.useCallback(function(_, _, _) --[[ line: 171 ]] end, {})
	}
end