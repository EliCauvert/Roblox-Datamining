local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchUniverseSearchModule = require(script.Parent.fetchUniverseSearch)
local _ = require(script.Parent.UniverseSearchStoreTypes)

local function _(p1)
	-- upvalues: httpService (ref)
	return httpService:JSONEncode(p1)
end

return function(p1)
	-- upvalues: cryoModule (ref), createDataCacheModule (ref), createDataResolverModule (ref), fetchUniverseSearchModule (ref), httpService (ref)
	p1 = p1 or {}
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	local function applyItemPatches(p2)
		-- upvalues: t_2 (write), cryoModule (copy)
		local data = p2.data
		
		if data == nil or next(t_2) == nil then
			return p2
		end
		local var1 = false
		local list = table.create(#data)
		
		for i, v in data do
			local id = t_2[v.id]
			
			if id == nil then
				list[i] = v
			else
				var1 = true
				list[i] = cryoModule.Dictionary.join(v, id)
			end
		end
		return if var1 then cryoModule.Dictionary.join(p2, { data = list }) else p2
	end
	
	local var2 = createDataCacheModule()
	local var3 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var2,
		fetchFn = function(p3, _)
			-- upvalues: t (write), fetchUniverseSearchModule (copy), p1 (ref), applyItemPatches (ref)
			return fetchUniverseSearchModule(t[p3], { network = p1.network, baseUrl = p1.baseUrl }):andThen(applyItemPatches)
		end
	})
	
	return {
		getSearch = function(p3)
			-- upvalues: httpService (copy), t (write), var3 (ref)
			local var4 = httpService:JSONEncode(p3)
			t[var4] = p3
			
			return var3.getCachedItem(var4)
		end,
		fetchSearch = function(p3)
			-- upvalues: httpService (copy), t (write), var3 (ref)
			local var4 = httpService:JSONEncode(p3)
			t[var4] = p3
			
			return var3.fetchItem(var4)
		end,
		refreshSearch = function(p3)
			-- upvalues: httpService (copy), t (write), t_1 (write), var2 (ref), fetchUniverseSearchModule (copy), p1 (ref), applyItemPatches (ref)
			local var4 = httpService:JSONEncode(p3)
			t[var4] = p3
			local var5 = (t_1[var4] or 0) + 1
			t_1[var4] = var5
			var2.resetFailedItem(var4)
			
			return fetchUniverseSearchModule(p3, { network = p1.network, baseUrl = p1.baseUrl }):andThen(applyItemPatches):andThen(function(p4)
				-- upvalues: t_1 (copy), var4 (ref), var5 (ref), var2 (copy)
				if t_1[var4] == var5 then
					var2.replaceItem(var4, p4)
				end
				return p4
			end):catch(function(p4)
				-- upvalues: t_1 (copy), var4 (ref), var5 (ref), var2 (copy)
				if t_1[var4] == var5 then
					var2.markItemsAsFailed({ var4 })
				end
				error(p4)
			end)
		end,
		getAndFetchSearch = function(p3)
			-- upvalues: httpService (copy), t (write), var3 (ref)
			local var4 = httpService:JSONEncode(p3)
			t[var4] = p3
			
			return var3.getAndFetchItem(var4)
		end,
		updateSearchItem = function(p3, p4)
			-- upvalues: t_2 (write), cryoModule (copy), t (write), var3 (ref), applyItemPatches (ref), var2 (ref)
			t_2[p3] = cryoModule.Dictionary.join(t_2[p3] or {}, p4)
			
			for i in t do
				local var4 = var3.getCachedItem(i).data(false)
				
				if var4 ~= nil then
					local var5 = applyItemPatches(var4)
					
					if var5 ~= var4 then
						var2.updateItem(i, var5)
					end
				end
			end
		end,
		invalidateAll = function()
			-- upvalues: t (write), t_1 (write), var3 (ref)
			t = {}
			t_1 = {}
			var3.clear()
		end,
		dispose = function()
			-- upvalues: t (write), t_1 (write), t_2 (write), var3 (ref)
			t = {}
			t_1 = {}
			t_2 = {}
			var3.dispose()
		end
	}
end