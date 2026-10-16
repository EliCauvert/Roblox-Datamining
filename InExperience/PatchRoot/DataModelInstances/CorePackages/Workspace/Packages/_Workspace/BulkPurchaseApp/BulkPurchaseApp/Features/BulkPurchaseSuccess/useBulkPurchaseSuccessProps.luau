local MarketplaceService = game:GetService("MarketplaceService")
local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local BulkPurchaseEndedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseEnded)
local SelectPurchaseResultsModule = require(BulkPurchaseApp.Store.Selectors.selectPurchaseResults)
local _ = require(script.Parent.BulkPurchaseSuccess)

return function() --[[ Line: 12 | Named "useBulkPurchaseSuccessProps" ]]
	-- upvalues: UseDispatchFunction (copy), UseSelectorFunction (copy), SelectPurchaseResultsModule (copy), MarketplaceService (copy), BulkPurchaseEndedModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(SelectPurchaseResultsModule)
	local ItemCount = 0
	
	for _, item in UseSelectorResult.Items do
		if item.status == Enum.MarketplaceItemPurchaseStatus.Success then
			ItemCount += 1
		end
	end
	return {
		onDismiss = function() --[[ Line: 23 ]]
			-- upvalues: MarketplaceService (upval), UseSelectorResult (copy), UseDispatchResult (copy), BulkPurchaseEndedModule (upval)
			MarketplaceService:signalPromptBulkPurchaseFinished(1, UseSelectorResult)
			UseDispatchResult(BulkPurchaseEndedModule())
		end,
		itemCount = ItemCount
	}
end