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

local function _(p0, p1)
	-- upvalues: getThumbnailUrlModule (ref)
	return {
		id = p0.id,
		image = getThumbnailUrlModule(p0.id, p0.type),
		name = p0.name,
		status = p1
	}
end

local function selectBulkPurchasePartialSuccessState(p2)
	-- upvalues: getThumbnailUrlModule (ref)
	local t = {}
	local t_1 = {}
	local var9 = 0
	
	if p2.itemData and p2.itemStatuses then
		for i, v in p2.itemData do
			local id = p2.itemStatuses[v.id]
			local t_2 = {
				id = v.id,
				image = getThumbnailUrlModule(v.id, v.type),
				name = v.name,
				status = id
			}
			
			if id == Enum.MarketplaceItemPurchaseStatus.Success then
				var9 += v.priceRobux
				table.insert(t, t_2)
			elseif id then
				table.insert(t_1, t_2)
			end
		end
	end
	return {
		robuxSpent = var9,
		currentBalance = p2.balance or 0,
		unsuccessfulItems = t_1,
		successfulItems = t
	}
end

return function()
	-- upvalues: useSelector (ref), selectPurchaseResultsModule (ref), selectBulkPurchasePartialSuccessState (ref), useDispatch (ref), reactModule (ref), marketplaceService (ref), bulkPurchaseEndedModule (ref)
	local var11 = useSelector(selectPurchaseResultsModule)
	local var12 = useSelector(selectBulkPurchasePartialSuccessState)
	local var13 = useDispatch()
	
	return {
		onDismiss = reactModule.useCallback(function()
			-- upvalues: marketplaceService (copy), var11 (ref), var13 (ref), bulkPurchaseEndedModule (copy)
			marketplaceService:signalPromptBulkPurchaseFinished(1, var11)
			var13(bulkPurchaseEndedModule())
		end, { var11, var13 }),
		successfulItems = var12.successfulItems,
		unsuccessfulItems = var12.unsuccessfulItems,
		robuxSpent = var12.robuxSpent,
		currentBalance = var12.currentBalance
	}
end