local marketplaceService = game:GetService("MarketplaceService")
local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local bulkPurchaseEndedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseEnded)
local selectPurchaseResultsModule = require(bulkPurchaseApp.Store.Selectors.selectPurchaseResults)
local _ = require(script.Parent.BulkPurchaseSuccess)

return function()
	-- upvalues: useDispatch (ref), useSelector (ref), selectPurchaseResultsModule (ref), marketplaceService (ref), bulkPurchaseEndedModule (ref)
	local var1 = useDispatch()
	local var2 = useSelector(selectPurchaseResultsModule)
	local var3 = 0
	
	for i, v in var2.Items do
		if v.status == Enum.MarketplaceItemPurchaseStatus.Success then
			var3 += 1
		end
	end
	return {
		onDismiss = function()
			-- upvalues: marketplaceService (copy), var2 (ref), var1 (ref), bulkPurchaseEndedModule (copy)
			marketplaceService:signalPromptBulkPurchaseFinished(1, var2)
			var1(bulkPurchaseEndedModule())
		end,
		itemCount = var3
	}
end