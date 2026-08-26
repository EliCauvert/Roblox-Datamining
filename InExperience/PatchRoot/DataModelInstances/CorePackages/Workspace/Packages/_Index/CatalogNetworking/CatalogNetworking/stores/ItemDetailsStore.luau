local catalogNetworking = script:FindFirstAncestor("CatalogNetworking")
local parent = catalogNetworking.Parent
local signalsModule = require(parent.Signals)
local promiseModule = require(parent.Promise)
local _ = require(catalogNetworking.Types)
local fetchItemDetailsModule = require(catalogNetworking.networkRequests.fetchItemDetails)
local var1, var2 = signalsModule.createSignal({})

return {
	getCache = var1,
	fetchAndCache = function(p1, p2)
		-- upvalues: var1 (ref), promiseModule (ref), fetchItemDetailsModule (ref), var2 (ref)
		local var3 = var1(false)
		local t = {}
		
		for i, v in p2 do
			if not var3[tostring(v.id)] then
				table.insert(t, v)
			end
		end
		return if #t == 0 then promiseModule.resolve() else fetchItemDetailsModule(p1, t):andThen(function(p3)
			-- upvalues: var1 (copy), var2 (copy)
			if p3 and p3.data then
				local cloned = table.clone(var1(false))
				
				for i, v in p3.data do
					cloned[tostring(v.id)] = v
				end
				var2(cloned)
			end
		end)
	end,
	getItem = function(p3)
		-- upvalues: var1 (ref)
		return var1(false)[p3]
	end,
	clear = function()
		-- upvalues: var2 (ref)
		var2({})
	end
}