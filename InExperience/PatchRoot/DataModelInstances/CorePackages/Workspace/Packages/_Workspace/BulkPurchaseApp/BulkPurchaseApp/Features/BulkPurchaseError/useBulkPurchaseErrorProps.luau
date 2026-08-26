local marketplaceService = game:GetService("MarketplaceService")
local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local bulkPurchaseEndedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseEnded)
local selectPurchaseResultsModule = require(bulkPurchaseApp.Store.Selectors.selectPurchaseResults)
local selectErrorCodeModule = require(bulkPurchaseApp.Store.Selectors.selectErrorCode)
local selectErrorMetadataModule = require(bulkPurchaseApp.Store.Selectors.selectErrorMetadata)
local _ = require(bulkPurchaseApp.Enums.ErrorCodeEnum)
local _ = require(script.Parent.BulkPurchaseError)

return function()
	-- upvalues: useSelector (ref), selectPurchaseResultsModule (ref), selectErrorCodeModule (ref), selectErrorMetadataModule (ref), useDispatch (ref), reactModule (ref), marketplaceService (ref), bulkPurchaseEndedModule (ref)
	local var1 = useSelector(selectPurchaseResultsModule)
	local var2 = useDispatch()
	
	return {
		onDismiss = reactModule.useCallback(function()
			-- upvalues: marketplaceService (copy), var1 (ref), var2 (ref), bulkPurchaseEndedModule (copy)
			marketplaceService:signalPromptBulkPurchaseFinished(3, var1)
			var2(bulkPurchaseEndedModule())
		end, { var1, var2 }),
		errorCode = useSelector(selectErrorCodeModule),
		errorMetadata = useSelector(selectErrorMetadataModule)
	}
end