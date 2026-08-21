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

local function _(p0) --[[ line: 29 | named "paramsKey" ]]
	-- upvalues: httpService (ref)
	return httpService:JSONEncode(p0)
end

return function(p1) --[[ line: 33 | named "createUniverseSearchStore" ]]
	-- upvalues: cryoModule (ref), createDataCacheModule (ref), createDataResolverModule (ref), fetchUniverseSearchModule (ref), httpService (ref)
	p1 = p1 or {}
	local t = {}
	local t_1 = {}
	
	local function applyItemPatches(p2) --[[ line: 39 ]]
		-- upvalues: t_1 (write), cryoModule (copy)
		local data = p2.data
		
		if data == nil or next(t_1) == nil then
			return p2
		end
		local var12 = false
		local list = table.create(#data)
		
		for i, v in data do
			local id = t_1[v.id]
			
			if id == nil then
				list[i] = v
			else
				var12 = true
				list[i] = cryoModule.Dictionary.join(v, id)
			end
		end
		return if var12 then cryoModule.Dictionary.join(p2, { data = list }) else p2
	end
	
	local var10 = createDataCacheModule()
	local var11 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var10,
		fetchFn = function(p3, _) --[[ line: 70 ]]
			-- upvalues: t (write), fetchUniverseSearchModule (copy), p1 (ref), applyItemPatches (ref)
			return fetchUniverseSearchModule(t[p3], { network = p1.network, baseUrl = p1.baseUrl }):andThen(applyItemPatches)
		end
	})
	
	return {
		getSearch = function(p4) --[[ line: 79 ]]
			-- upvalues: httpService (copy), t (write), var11 (ref)
			local var14 = httpService:JSONEncode(p4)
			t[var14] = p4
			
			return var11.getCachedItem(var14)
		end,
		fetchSearch = function(p5) --[[ line: 85 ]]
			-- upvalues: httpService (copy), t (write), var11 (ref)
			local var15 = httpService:JSONEncode(p5)
			t[var15] = p5
			
			return var11.fetchItem(var15)
		end,
		getAndFetchSearch = function(p6) --[[ line: 91 ]]
			-- upvalues: httpService (copy), t (write), var11 (ref)
			local var16 = httpService:JSONEncode(p6)
			t[var16] = p6
			
			return var11.getAndFetchItem(var16)
		end,
		updateSearchItem = function(p7, p8) --[[ line: 99 ]]
			-- upvalues: t_1 (write), cryoModule (copy), t (write), var11 (ref), applyItemPatches (ref), var10 (ref)
			t_1[p7] = cryoModule.Dictionary.join(t_1[p7] or {}, p8)
			
			for i in t do
				local var17 = var11.getCachedItem(i).data(false)
				
				if var17 ~= nil then
					local var18 = applyItemPatches(var17)
					
					if var18 ~= var17 then
						var10.updateItem(i, var18)
					end
				end
			end
		end,
		invalidateAll = function() --[[ line: 116 ]]
			-- upvalues: t (write), var11 (ref)
			t = {}
			var11.clear()
		end,
		dispose = function() --[[ line: 121 ]]
			-- upvalues: t (write), t_1 (write), var11 (ref)
			t = {}
			t_1 = {}
			var11.dispose()
		end
	}
end