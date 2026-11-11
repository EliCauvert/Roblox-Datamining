local CatalogNetworking = script:FindFirstAncestor("CatalogNetworking")
local Parent = CatalogNetworking.Parent
local PromiseModule = require(Parent.Promise)
local _ = require(CatalogNetworking.Types)
local FetchItemDetailsModule = require(CatalogNetworking.networkRequests.fetchItemDetails)
local Signal, Signal2 = require(Parent.Signals).createSignal({})

return {
	getCache = Signal,
	fetchAndCache = function(p1, List)
		-- upvalues: Signal (copy), PromiseModule (copy), FetchItemDetailsModule (copy), Signal2 (copy)
		local SignalResult = Signal(false)
		local List1 = {}
		
		for _, value in List do
			if not SignalResult[tostring(value.id)] then
				table.insert(List1, value)
			end
		end
		return if #List1 == 0 then PromiseModule.resolve() else FetchItemDetailsModule(p1, List1):andThen(function(Result)
			-- upvalues: Signal (upval), Signal2 (upval)
			if Result and Result.data then
				local Copy = table.clone(Signal(false))
				
				for _, entry in Result.data do
					Copy[tostring(entry.id)] = entry
				end
				Signal2(Copy)
			end
		end)
	end,
	getItem = function(p2)
		-- upvalues: Signal (copy)
		return Signal(false)[p2]
	end,
	clear = function()
		-- upvalues: Signal2 (copy)
		Signal2({})
	end
}