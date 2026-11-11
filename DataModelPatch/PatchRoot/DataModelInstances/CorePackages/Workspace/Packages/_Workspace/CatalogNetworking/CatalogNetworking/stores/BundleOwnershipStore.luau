local CatalogNetworking = script:FindFirstAncestor("CatalogNetworking")
local Parent = CatalogNetworking.Parent
local PromiseModule = require(Parent.Promise)
local DashModule = require(Parent.Dash)
local FetchBundleOwnershipModule = require(CatalogNetworking.networkRequests.fetchBundleOwnership)
local Signal, Signal2 = require(Parent.Signals).createSignal({})

return {
	getCache = Signal,
	fetchAndCache = function(p1, List)
		-- upvalues: Signal (copy), PromiseModule (copy), DashModule (copy), FetchBundleOwnershipModule (copy), Signal2 (copy)
		local SignalResult = Signal(false)
		local List1 = {}
		
		for _, value in List do
			if SignalResult[tostring(value)] == nil then
				table.insert(List1, value)
			end
		end
		return if #List1 == 0 then PromiseModule.resolve() else PromiseModule.all((DashModule.map(List1, function(p2)
			-- upvalues: FetchBundleOwnershipModule (upval), p1 (copy)
			return FetchBundleOwnershipModule(p1, p2)
		end))):andThen(function(Result)
			-- upvalues: Signal (upval), Signal2 (upval)
			local Copy = table.clone(Signal(false))
			
			for _, value in Result do
				if value then
					Copy[value.id] = value.owned
				end
			end
			Signal2(Copy)
		end)
	end,
	isOwned = function(p2)
		-- upvalues: Signal (copy)
		return Signal(false)[p2]
	end,
	clear = function()
		-- upvalues: Signal2 (copy)
		Signal2({})
	end,
	markOwned = function(List)
		-- upvalues: Signal (copy), Signal2 (copy)
		local Copy = table.clone(Signal(false))
		
		for _, value in List do
			Copy[value] = true
		end
		Signal2(Copy)
	end
}