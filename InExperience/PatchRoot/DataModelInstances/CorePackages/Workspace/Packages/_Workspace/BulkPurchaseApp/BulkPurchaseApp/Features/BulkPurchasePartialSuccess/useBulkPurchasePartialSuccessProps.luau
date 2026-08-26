local marketplaceService = game:GetService("MarketplaceService")
local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local bulkPurchaseEndedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseEnded)
local selectPurchaseResultsModule = require(bulkPurchaseApp.Store.Selectors.selectPurchaseResults)
local getThumbnailUrlModule = require(bulkPurchaseApp.Utils.getThumbnailUrl)
local _ = require(bulkPurchaseApp.Store.Types)
local _ = require(script.Parent.BulkPurchasePartialSuccess)

local function _(p1, p2)
	-- upvalues: getThumbnailUrlModule (ref)
	return {
		id = p1.id,
		image = getThumbnailUrlModule(p1.id, p1.type),
		name = p1.name,
		status = p2
	}
end

local function selectBulkPurchasePartialSuccessState(p1)
	-- upvalues: getThumbnailUrlModule (ref)
	local t = {}
	local t_1 = {}
	local var1 = 0
	
	if p1.itemData and p1.itemStatuses then
		for i, v in p1.itemData do
			local id = p1.itemStatuses[v.id]
			local t_2 = {
				id = v.id,
				image = getThumbnailUrlModule(v.id, v.type),
				name = v.name,
				status = id
			}
			
			if id == Enum.MarketplaceItemPurchaseStatus.Success then
				var1 += v.priceRobux
				table.insert(t, t_2)
			elseif id then
				table.insert(t_1, t_2)
			end
		end
	end
	return {
		robuxSpent = var1,
		currentBalance = p1.balance or 0,
		unsuccessfulItems = t_1,
		successfulItems = t
	}
end

return function()
	-- upvalues: useSelector (ref), selectPurchaseResultsModule (ref), selectBulkPurchasePartialSuccessState (ref), useDispatch (ref), reactModule (ref), marketplaceService (ref), bulkPurchaseEndedModule (ref)
	local var2 = useSelector(selectPurchaseResultsModule)
	local var3 = useSelector(selectBulkPurchasePartialSuccessState)
	local var4 = useDispatch()
	
	return {
		onDismiss = reactModule.useCallback(function()
			-- upvalues: marketplaceService (copy), var2 (ref), var4 (ref), bulkPurchaseEndedModule (copy)
			marketplaceService:signalPromptBulkPurchaseFinished(1, var2)
			var4(bulkPurchaseEndedModule())
		end, { var2, var4 }),
		successfulItems = var3.successfulItems,
		unsuccessfulItems = var3.unsuccessfulItems,
		robuxSpent = var3.robuxSpent,
		currentBalance = var3.currentBalance
	}
end