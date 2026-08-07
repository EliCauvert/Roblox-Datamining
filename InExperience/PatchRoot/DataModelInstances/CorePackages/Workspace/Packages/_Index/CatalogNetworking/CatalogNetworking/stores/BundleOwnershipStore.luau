local catalogNetworking = script:FindFirstAncestor("CatalogNetworking")
local parent = catalogNetworking.Parent
local signalsModule = require(parent.Signals)
local promiseModule = require(parent.Promise)
local dashModule = require(parent.Dash)
local fetchBundleOwnershipModule = require(catalogNetworking.networkRequests.fetchBundleOwnership)
local var5, var6 = signalsModule.createSignal({})

return {
	getCache = var5,
	fetchAndCache = function(p0, p1) --[[ line: 12 ]]
		-- upvalues: var5 (ref), promiseModule (ref), dashModule (ref), fetchBundleOwnershipModule (ref), var6 (ref)
		local var7 = var5(false)
		local t = {}
		
		for i, v in p1 do
			if var7[tostring(v)] == nil then
				table.insert(t, v)
			end
		end
		return if #t == 0 then promiseModule.resolve() else promiseModule.all(dashModule.map(t, function(p3) --[[ line: 24 ]]
			-- upvalues: fetchBundleOwnershipModule (copy), p0 (ref)
			return fetchBundleOwnershipModule(p0, p3)
		end)):andThen(function(p2) --[[ line: 28 ]]
			-- upvalues: var5 (copy), var6 (copy)
			local cloned = table.clone(var5(false))
			
			for i, v in p2 do
				if v then
					cloned[v.id] = v.owned
				end
			end
			var6(cloned)
		end)
	end,
	isOwned = function(p4) --[[ line: 39 ]]
		-- upvalues: var5 (ref)
		return var5(false)[p4]
	end,
	clear = function() --[[ line: 43 ]]
		-- upvalues: var6 (ref)
		var6({})
	end,
	markOwned = function(p5) --[[ line: 47 ]]
		-- upvalues: var5 (ref), var6 (ref)
		local cloned = table.clone(var5(false))
		
		for i, v in p5 do
			cloned[v] = true
		end
		var6(cloned)
	end
}