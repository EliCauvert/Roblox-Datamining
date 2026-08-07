local catalogNetworking = script:FindFirstAncestor("CatalogNetworking")
local parent = catalogNetworking.Parent
local signalsModule = require(parent.Signals)
local promiseModule = require(parent.Promise)
local dashModule = require(parent.Dash)
local _ = require(catalogNetworking.Types)
local fetchPurchaseDetailsModule = require(catalogNetworking.networkRequests.fetchPurchaseDetails)
local var5, var6 = signalsModule.createSignal({})

local function mergeResponse(p0) --[[ line: 15 ]]
	-- upvalues: var5 (ref), var6 (ref)
	if p0 and p0.look and p0.look.items then
		local cloned = table.clone(var5(false))
		
		for i, v in p0.look.items do
			cloned[tostring(v.id)] = v
		end
		var6(cloned)
	end
	return p0
end

return {
	getCache = var5,
	fetchAndCache = function(p1, p2) --[[ line: 26 ]]
		-- upvalues: var5 (ref), dashModule (ref), promiseModule (ref), fetchPurchaseDetailsModule (ref), mergeResponse (ref)
		local var9 = var5(false)
		local var10 = dashModule.filter(p2, function(p3) --[[ line: 28 ]]
			-- upvalues: var9 (ref)
			return not var9[tostring(p3.id)]
		end)
		
		return if #var10 == 0 then promiseModule.resolve() else fetchPurchaseDetailsModule(p1, var10):andThen(mergeResponse)
	end,
	fetchAll = function(p4, p5) --[[ line: 37 ]]
		-- upvalues: fetchPurchaseDetailsModule (ref), mergeResponse (ref)
		return fetchPurchaseDetailsModule(p4, p5):andThen(mergeResponse)
	end,
	getItem = function(p6) --[[ line: 41 ]]
		-- upvalues: var5 (ref)
		return var5(false)[p6]
	end,
	clear = function() --[[ line: 45 ]]
		-- upvalues: var6 (ref)
		var6({})
	end,
	markItemsOwned = function(p7) --[[ line: 49 ]]
		-- upvalues: var5 (ref), var6 (ref)
		local cloned = table.clone(var5(false))
		
		for i, v in p7 do
			if cloned[v] then
				local cloned_1 = table.clone(cloned[v])
				cloned_1.quantityOwned = (cloned_1.quantityOwned or 0) + 1
				cloned_1.isPurchasable = false
				cloned[v] = cloned_1
			end
		end
		var6(cloned)
	end
}