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
	local var4 = useDispatch()
	local var5 = useSelector(selectPurchaseResultsModule)
	local var6 = 0
	
	for i, v in var5.Items do
		if v.status == Enum.MarketplaceItemPurchaseStatus.Success then
			var6 += 1
		end
	end
	return {
		onDismiss = function()
			-- upvalues: marketplaceService (copy), var5 (ref), var4 (ref), bulkPurchaseEndedModule (copy)
			marketplaceService:signalPromptBulkPurchaseFinished(1, var5)
			var4(bulkPurchaseEndedModule())
		end,
		itemCount = var6
	}
end