local catalogNetworking = script:FindFirstAncestor("CatalogNetworking")
local parent = catalogNetworking.Parent
local signalsModule = require(parent.Signals)
local promiseModule = require(parent.Promise)
local dashModule = require(parent.Dash)
local fetchBundleOwnershipModule = require(catalogNetworking.networkRequests.fetchBundleOwnership)
local var1, var2 = signalsModule.createSignal({})

return {
	getCache = var1,
	fetchAndCache = function(p1, p2)
		-- upvalues: var1 (ref), promiseModule (ref), dashModule (ref), fetchBundleOwnershipModule (ref), var2 (ref)
		local var3 = var1(false)
		local t = {}
		
		for i, v in p2 do
			if var3[tostring(v)] == nil then
				table.insert(t, v)
			end
		end
		return if #t == 0 then promiseModule.resolve() else promiseModule.all(dashModule.map(t, function(p3)
			-- upvalues: fetchBundleOwnershipModule (copy), p1 (ref)
			return fetchBundleOwnershipModule(p1, p3)
		end)):andThen(function(p3)
			-- upvalues: var1 (copy), var2 (copy)
			local cloned = table.clone(var1(false))
			
			for i, v in p3 do
				if v then
					cloned[v.id] = v.owned
				end
			end
			var2(cloned)
		end)
	end,
	isOwned = function(p3)
		-- upvalues: var1 (ref)
		return var1(false)[p3]
	end,
	clear = function()
		-- upvalues: var2 (ref)
		var2({})
	end,
	markOwned = function(p3)
		-- upvalues: var1 (ref), var2 (ref)
		local cloned = table.clone(var1(false))
		
		for i, v in p3 do
			cloned[v] = true
		end
		var2(cloned)
	end
}