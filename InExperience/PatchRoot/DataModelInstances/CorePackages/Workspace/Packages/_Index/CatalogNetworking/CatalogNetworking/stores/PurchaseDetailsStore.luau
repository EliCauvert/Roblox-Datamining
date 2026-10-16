local CatalogNetworking = script:FindFirstAncestor("CatalogNetworking")
local Parent = CatalogNetworking.Parent
local PromiseModule = require(Parent.Promise)
local DashModule = require(Parent.Dash)
local _ = require(CatalogNetworking.Types)
local FetchPurchaseDetailsModule = require(CatalogNetworking.networkRequests.fetchPurchaseDetails)
local Signal, Signal2 = require(Parent.Signals).createSignal({})

local function mergeResponse(Result) --[[ Line: 15 ]]
	-- upvalues: Signal (copy), Signal2 (copy)
	if Result and Result.look and Result.look.items then
		local Copy = table.clone(Signal(false))
		
		for _, item in Result.look.items do
			Copy[tostring(item.id)] = item
		end
		Signal2(Copy)
	end
	return Result
end

return {
	getCache = Signal,
	fetchAndCache = function(p1, p2) --[[ Line: 26 ]]
		-- upvalues: Signal (copy), DashModule (copy), PromiseModule (copy), FetchPurchaseDetailsModule (copy), mergeResponse (copy)
		local SignalResult = Signal(false)
		local FilterResult = DashModule.filter(p2, function(p3): boolean --[[ Line: 28 ]]
			-- upvalues: SignalResult (copy)
			return not SignalResult[tostring(p3.id)]
		end)
		
		return if #FilterResult == 0 then PromiseModule.resolve() else FetchPurchaseDetailsModule(p1, FilterResult):andThen(mergeResponse)
	end,
	fetchAll = function(p1, p2) --[[ Line: 37 ]]
		-- upvalues: FetchPurchaseDetailsModule (copy), mergeResponse (copy)
		return FetchPurchaseDetailsModule(p1, p2):andThen(mergeResponse)
	end,
	getItem = function(p1) --[[ Line: 41 ]]
		-- upvalues: Signal (copy)
		return Signal(false)[p1]
	end,
	clear = function() --[[ Line: 45 ]]
		-- upvalues: Signal2 (copy)
		Signal2({})
	end,
	markItemsOwned = function(List) --[[ Line: 49 ]]
		-- upvalues: Signal (copy), Signal2 (copy)
		local Copy = table.clone(Signal(false))
		
		for _, value in List do
			if Copy[value] then
				local Copy1 = table.clone(Copy[value])
				Copy1.quantityOwned = (Copy1.quantityOwned or 0) + 1
				Copy1.isPurchasable = false
				Copy[value] = Copy1
			end
		end
		Signal2(Copy)
	end
}