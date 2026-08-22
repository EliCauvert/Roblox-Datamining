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
	local t_2 = {}
	
	local function applyItemPatches(p2) --[[ line: 40 ]]
		-- upvalues: t_2 (write), cryoModule (copy)
		local data = p2.data
		
		if data == nil or next(t_2) == nil then
			return p2
		end
		local var13 = false
		local list = table.create(#data)
		
		for i, v in data do
			local id = t_2[v.id]
			
			if id == nil then
				list[i] = v
			else
				var13 = true
				list[i] = cryoModule.Dictionary.join(v, id)
			end
		end
		return if var13 then cryoModule.Dictionary.join(p2, { data = list }) else p2
	end
	
	local var11 = createDataCacheModule()
	local var12 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var11,
		fetchFn = function(p3, _) --[[ line: 71 ]]
			-- upvalues: t (write), fetchUniverseSearchModule (copy), p1 (ref), applyItemPatches (ref)
			return fetchUniverseSearchModule(t[p3], { network = p1.network, baseUrl = p1.baseUrl }):andThen(applyItemPatches)
		end
	})
	
	return {
		getSearch = function(p4) --[[ line: 80 ]]
			-- upvalues: httpService (copy), t (write), var12 (ref)
			local var15 = httpService:JSONEncode(p4)
			t[var15] = p4
			
			return var12.getCachedItem(var15)
		end,
		fetchSearch = function(p5) --[[ line: 86 ]]
			-- upvalues: httpService (copy), t (write), var12 (ref)
			local var16 = httpService:JSONEncode(p5)
			t[var16] = p5
			
			return var12.fetchItem(var16)
		end,
		refreshSearch = function(p6) --[[ line: 92 ]]
			-- upvalues: httpService (copy), t (write), t_1 (write), var11 (ref), fetchUniverseSearchModule (copy), p1 (ref), applyItemPatches (ref)
			local var17 = httpService:JSONEncode(p6)
			t[var17] = p6
			local var18 = (t_1[var17] or 0) + 1
			t_1[var17] = var18
			var11.resetFailedItem(var17)
			
			return fetchUniverseSearchModule(p6, { network = p1.network, baseUrl = p1.baseUrl }):andThen(applyItemPatches):andThen(function(p8) --[[ line: 101 ]]
				-- upvalues: t_1 (copy), var17 (ref), var18 (ref), var11 (copy)
				if t_1[var17] == var18 then
					var11.replaceItem(var17, p8)
				end
				return p8
			end):catch(function(p7) --[[ line: 107 ]]
				-- upvalues: t_1 (copy), var17 (ref), var18 (ref), var11 (copy)
				if t_1[var17] == var18 then
					var11.markItemsAsFailed({ var17 })
				end
				error(p7)
			end)
		end,
		getAndFetchSearch = function(p9) --[[ line: 115 ]]
			-- upvalues: httpService (copy), t (write), var12 (ref)
			local var19 = httpService:JSONEncode(p9)
			t[var19] = p9
			
			return var12.getAndFetchItem(var19)
		end,
		updateSearchItem = function(p10, p11) --[[ line: 123 ]]
			-- upvalues: t_2 (write), cryoModule (copy), t (write), var12 (ref), applyItemPatches (ref), var11 (ref)
			t_2[p10] = cryoModule.Dictionary.join(t_2[p10] or {}, p11)
			
			for i in t do
				local var20 = var12.getCachedItem(i).data(false)
				
				if var20 ~= nil then
					local var21 = applyItemPatches(var20)
					
					if var21 ~= var20 then
						var11.updateItem(i, var21)
					end
				end
			end
		end,
		invalidateAll = function() --[[ line: 140 ]]
			-- upvalues: t (write), t_1 (write), var12 (ref)
			t = {}
			t_1 = {}
			var12.clear()
		end,
		dispose = function() --[[ line: 146 ]]
			-- upvalues: t (write), t_1 (write), t_2 (write), var12 (ref)
			t = {}
			t_1 = {}
			t_2 = {}
			var12.dispose()
		end
	}
end