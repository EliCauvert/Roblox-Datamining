local catalogNetworking = script:FindFirstAncestor("CatalogNetworking")
local parent = catalogNetworking.Parent
local signalsModule = require(parent.Signals)
local promiseModule = require(parent.Promise)
local fetchCollectibleProductIdsModule = require(catalogNetworking.networkRequests.fetchCollectibleProductIds)
local var1, var2 = signalsModule.createSignal({})

return {
	getCache = var1,
	fetchAndCache = function(p1, p2)
		-- upvalues: var1 (ref), promiseModule (ref), fetchCollectibleProductIdsModule (ref), var2 (ref)
		local var3 = var1(false)
		local t = {}
		
		for i, v in p2 do
			if not var3[v] then
				table.insert(t, v)
			end
		end
		return if #t == 0 then promiseModule.resolve() else fetchCollectibleProductIdsModule(p1, t):andThen(function(p3)
			-- upvalues: var1 (copy), var2 (copy)
			local cloned = table.clone(var1(false))
			
			for i, v in p3 do
				cloned[v.collectibleItemId] = {
					productId = v.collectibleProductId,
					resaleProductId = v.resaleProductId
				}
			end
			var2(cloned)
		end)
	end,
	getProductId = function(p3)
		-- upvalues: var1 (ref)
		local var4 = var1(false)[p3]
		
		return if var4 then var4.productId else nil
	end,
	getResaleProductId = function(p3)
		-- upvalues: var1 (ref)
		local var4 = var1(false)[p3]
		
		return if var4 then var4.resaleProductId else nil
	end,
	clear = function()
		-- upvalues: var2 (ref)
		var2({})
	end
}