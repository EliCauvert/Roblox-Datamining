local catalogNetworking = script:FindFirstAncestor("CatalogNetworking")
local parent = catalogNetworking.Parent
local signalsModule = require(parent.Signals)
local promiseModule = require(parent.Promise)
local dashModule = require(parent.Dash)
local _ = require(catalogNetworking.Types)
local fetchPurchaseDetailsModule = require(catalogNetworking.networkRequests.fetchPurchaseDetails)
local var1, var2 = signalsModule.createSignal({})

local function mergeResponse(p1)
	-- upvalues: var1 (ref), var2 (ref)
	if p1 and p1.look and p1.look.items then
		local cloned = table.clone(var1(false))
		
		for i, v in p1.look.items do
			cloned[tostring(v.id)] = v
		end
		var2(cloned)
	end
	return p1
end

return {
	getCache = var1,
	fetchAndCache = function(p2, p3)
		-- upvalues: var1 (ref), dashModule (ref), promiseModule (ref), fetchPurchaseDetailsModule (ref), mergeResponse (ref)
		local var3 = var1(false)
		local var4 = dashModule.filter(p3, function(p4)
			-- upvalues: var3 (ref)
			return not var3[tostring(p4.id)]
		end)
		
		return if #var4 == 0 then promiseModule.resolve() else fetchPurchaseDetailsModule(p2, var4):andThen(mergeResponse)
	end,
	fetchAll = function(p2, p3)
		-- upvalues: fetchPurchaseDetailsModule (ref), mergeResponse (ref)
		return fetchPurchaseDetailsModule(p2, p3):andThen(mergeResponse)
	end,
	getItem = function(p2)
		-- upvalues: var1 (ref)
		return var1(false)[p2]
	end,
	clear = function()
		-- upvalues: var2 (ref)
		var2({})
	end,
	markItemsOwned = function(p2)
		-- upvalues: var1 (ref), var2 (ref)
		local cloned = table.clone(var1(false))
		
		for i, v in p2 do
			if cloned[v] then
				local cloned_1 = table.clone(cloned[v])
				cloned_1.quantityOwned = (cloned_1.quantityOwned or 0) + 1
				cloned_1.isPurchasable = false
				cloned[v] = cloned_1
			end
		end
		var2(cloned)
	end
}