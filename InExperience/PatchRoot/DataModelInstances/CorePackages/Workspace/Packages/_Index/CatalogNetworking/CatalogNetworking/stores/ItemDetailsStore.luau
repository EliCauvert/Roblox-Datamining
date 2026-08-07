local catalogNetworking = script:FindFirstAncestor("CatalogNetworking")
local parent = catalogNetworking.Parent
local signalsModule = require(parent.Signals)
local promiseModule = require(parent.Promise)
local _ = require(catalogNetworking.Types)
local fetchItemDetailsModule = require(catalogNetworking.networkRequests.fetchItemDetails)
local var4, var5 = signalsModule.createSignal({})

return {
	getCache = var4,
	fetchAndCache = function(p0, p1) --[[ line: 14 ]]
		-- upvalues: var4 (ref), promiseModule (ref), fetchItemDetailsModule (ref), var5 (ref)
		local var6 = var4(false)
		local t = {}
		
		for i, v in p1 do
			if not var6[tostring(v.id)] then
				table.insert(t, v)
			end
		end
		return if #t == 0 then promiseModule.resolve() else fetchItemDetailsModule(p0, t):andThen(function(p2) --[[ line: 26 ]]
			-- upvalues: var4 (copy), var5 (copy)
			if p2 and p2.data then
				local cloned = table.clone(var4(false))
				
				for i, v in p2.data do
					cloned[tostring(v.id)] = v
				end
				var5(cloned)
			end
		end)
	end,
	getItem = function(p3) --[[ line: 37 ]]
		-- upvalues: var4 (ref)
		return var4(false)[p3]
	end,
	clear = function() --[[ line: 41 ]]
		-- upvalues: var5 (ref)
		var5({})
	end
}