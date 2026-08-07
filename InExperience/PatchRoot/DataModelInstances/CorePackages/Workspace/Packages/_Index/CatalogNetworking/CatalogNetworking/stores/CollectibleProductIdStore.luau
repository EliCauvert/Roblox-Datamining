local catalogNetworking = script:FindFirstAncestor("CatalogNetworking")
local parent = catalogNetworking.Parent
local signalsModule = require(parent.Signals)
local promiseModule = require(parent.Promise)
local fetchCollectibleProductIdsModule = require(catalogNetworking.networkRequests.fetchCollectibleProductIds)
local var4, var5 = signalsModule.createSignal({})

return {
	getCache = var4,
	fetchAndCache = function(p0, p1) --[[ line: 16 ]]
		-- upvalues: var4 (ref), promiseModule (ref), fetchCollectibleProductIdsModule (ref), var5 (ref)
		local var6 = var4(false)
		local t = {}
		
		for i, v in p1 do
			if not var6[v] then
				table.insert(t, v)
			end
		end
		return if #t == 0 then promiseModule.resolve() else fetchCollectibleProductIdsModule(p0, t):andThen(function(p2) --[[ line: 28 ]]
			-- upvalues: var4 (copy), var5 (copy)
			local cloned = table.clone(var4(false))
			
			for i, v in p2 do
				cloned[v.collectibleItemId] = {
					productId = v.collectibleProductId,
					resaleProductId = v.resaleProductId
				}
			end
			var5(cloned)
		end)
	end,
	getProductId = function(p3) --[[ line: 40 ]]
		-- upvalues: var4 (ref)
		local var9 = var4(false)[p3]
		
		return if var9 then var9.productId else nil
	end,
	getResaleProductId = function(p4) --[[ line: 45 ]]
		-- upvalues: var4 (ref)
		local var10 = var4(false)[p4]
		
		return if var10 then var10.resaleProductId else nil
	end,
	clear = function() --[[ line: 50 ]]
		-- upvalues: var5 (ref)
		var5({})
	end
}