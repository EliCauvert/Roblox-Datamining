local MarketplaceService = game:GetService("MarketplaceService")
local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local BulkPurchaseEndedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseEnded)
local SelectPurchaseResultsModule = require(BulkPurchaseApp.Store.Selectors.selectPurchaseResults)
local SelectErrorCodeModule = require(BulkPurchaseApp.Store.Selectors.selectErrorCode)
local SelectErrorMetadataModule = require(BulkPurchaseApp.Store.Selectors.selectErrorMetadata)
local _ = require(BulkPurchaseApp.Enums.ErrorCodeEnum)
local _ = require(script.Parent.BulkPurchaseError)

return function() --[[ Line: 16 | Named "useBulkPurchaseErrorProps" ]]
	-- upvalues: UseSelectorFunction (copy), SelectPurchaseResultsModule (copy), SelectErrorCodeModule (copy), SelectErrorMetadataModule (copy), UseDispatchFunction (copy), ReactModule (copy), MarketplaceService (copy), BulkPurchaseEndedModule (copy)
	local UseSelectorResult = UseSelectorFunction(SelectPurchaseResultsModule)
	local UseSelectorResult1 = UseSelectorFunction(SelectErrorCodeModule)
	local UseSelectorResult2 = UseSelectorFunction(SelectErrorMetadataModule)
	local UseDispatchResult = UseDispatchFunction()
	
	return {
		onDismiss = ReactModule.useCallback(function() --[[ Line: 22 ]]
			-- upvalues: MarketplaceService (upval), UseSelectorResult (copy), UseDispatchResult (copy), BulkPurchaseEndedModule (upval)
			MarketplaceService:signalPromptBulkPurchaseFinished(3, UseSelectorResult)
			UseDispatchResult(BulkPurchaseEndedModule())
		end, { UseSelectorResult, UseDispatchResult }),
		errorCode = UseSelectorResult1,
		errorMetadata = UseSelectorResult2
	}
end