local CatalogNetworking = script:FindFirstAncestor("CatalogNetworking")
local Parent = CatalogNetworking.Parent
local PromiseModule = require(Parent.Promise)
local FetchCollectibleProductIdsModule = require(CatalogNetworking.networkRequests.fetchCollectibleProductIds)
local Signal, Signal2 = require(Parent.Signals).createSignal({})

return {
	getCache = Signal,
	fetchAndCache = function(p1, List)
		-- upvalues: Signal (copy), PromiseModule (copy), FetchCollectibleProductIdsModule (copy), Signal2 (copy)
		local SignalResult = Signal(false)
		local List1 = {}
		
		for _, value in List do
			if not SignalResult[value] then
				table.insert(List1, value)
			end
		end
		return if #List1 == 0 then PromiseModule.resolve() else FetchCollectibleProductIdsModule(p1, List1):andThen(function(Result)
			-- upvalues: Signal (upval), Signal2 (upval)
			local Copy = table.clone(Signal(false))
			
			for _, value in Result do
				Copy[value.collectibleItemId] = {
					productId = value.collectibleProductId,
					resaleProductId = value.resaleProductId
				}
			end
			Signal2(Copy)
		end)
	end,
	getProductId = function(p2)
		-- upvalues: Signal (copy)
		local SignalResultEntry = Signal(false)[p2]
		
		return if SignalResultEntry then SignalResultEntry.productId else nil
	end,
	getResaleProductId = function(p2)
		-- upvalues: Signal (copy)
		local SignalResultEntry = Signal(false)[p2]
		
		return if SignalResultEntry then SignalResultEntry.resaleProductId else nil
	end,
	clear = function()
		-- upvalues: Signal2 (copy)
		Signal2({})
	end
}