local MarketplaceService = game:GetService("MarketplaceService")
local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local BulkPurchaseEndedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseEnded)
local SelectPurchaseResultsModule = require(BulkPurchaseApp.Store.Selectors.selectPurchaseResults)
local GetThumbnailUrlModule = require(BulkPurchaseApp.Utils.getThumbnailUrl)
local _ = require(BulkPurchaseApp.Store.Types)
local _ = require(script.Parent.BulkPurchasePartialSuccess)

local function _(BulkPurchasePartialSuccessItem, Status)
	-- upvalues: GetThumbnailUrlModule (copy)
	return {
		id = BulkPurchasePartialSuccessItem.id,
		image = GetThumbnailUrlModule(BulkPurchasePartialSuccessItem.id, BulkPurchasePartialSuccessItem.type),
		name = BulkPurchasePartialSuccessItem.name,
		status = Status
	}
end

local function selectBulkPurchasePartialSuccessState(p1)
	-- upvalues: GetThumbnailUrlModule (copy)
	local SuccessfulItems = {}
	local UnsuccessfulItems = {}
	local NewPriceRobux = 0
	
	if p1.itemData and p1.itemStatuses then
		for _, BulkPurchasePartialSuccessItem in p1.itemData do
			local ItemStatus = p1.itemStatuses[BulkPurchasePartialSuccessItem.id]
			local config = {
				id = BulkPurchasePartialSuccessItem.id,
				image = GetThumbnailUrlModule(BulkPurchasePartialSuccessItem.id, BulkPurchasePartialSuccessItem.type),
				name = BulkPurchasePartialSuccessItem.name,
				status = ItemStatus
			}
			
			if ItemStatus == Enum.MarketplaceItemPurchaseStatus.Success then
				NewPriceRobux += BulkPurchasePartialSuccessItem.priceRobux
				table.insert(SuccessfulItems, config)
			elseif ItemStatus then
				table.insert(UnsuccessfulItems, config)
			end
		end
	end
	return {
		robuxSpent = NewPriceRobux,
		currentBalance = p1.balance or 0,
		unsuccessfulItems = UnsuccessfulItems,
		successfulItems = SuccessfulItems
	}
end

return function()
	-- upvalues: UseSelectorFunction (copy), SelectPurchaseResultsModule (copy), selectBulkPurchasePartialSuccessState (copy), UseDispatchFunction (copy), ReactModule (copy), MarketplaceService (copy), BulkPurchaseEndedModule (copy)
	local UseSelectorResult = UseSelectorFunction(SelectPurchaseResultsModule)
	local UseSelectorResult1 = UseSelectorFunction(selectBulkPurchasePartialSuccessState)
	local UseDispatchResult = UseDispatchFunction()
	
	return {
		onDismiss = ReactModule.useCallback(function()
			-- upvalues: MarketplaceService (upval), UseSelectorResult (copy), UseDispatchResult (copy), BulkPurchaseEndedModule (upval)
			MarketplaceService:signalPromptBulkPurchaseFinished(1, UseSelectorResult)
			UseDispatchResult(BulkPurchaseEndedModule())
		end, { UseSelectorResult, UseDispatchResult }),
		successfulItems = UseSelectorResult1.successfulItems,
		unsuccessfulItems = UseSelectorResult1.unsuccessfulItems,
		robuxSpent = UseSelectorResult1.robuxSpent,
		currentBalance = UseSelectorResult1.currentBalance
	}
end