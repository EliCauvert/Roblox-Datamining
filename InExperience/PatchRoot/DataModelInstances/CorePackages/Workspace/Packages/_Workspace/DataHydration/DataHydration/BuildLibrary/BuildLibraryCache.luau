local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.BuildLibraryDataStoreTypes)
local buildLibraryQueryModule = require(script.Parent.BuildLibraryQuery)

local function _(p1)
	return { kind = p1.kind, placeId = p1.placeId }
end

return {
	createBuildLibraryCache = function()
		-- upvalues: createDataCacheModule (ref), buildLibraryQueryModule (ref), httpService (ref)
		local var1 = true
		local var2 = 0
		local t = {}
		local var3 = createDataCacheModule()
		local var4 = buildLibraryQueryModule.createQuery(function()
			-- upvalues: var1 (write)
			return var1
		end)
		
		return {
			itemCache = var3,
			cacheItems = function(p1, p2, p3)
				-- upvalues: var1 (write), httpService (copy), t (ref), var3 (ref)
				assert(var1, "Library request belongs to a disposed state")
				local t_1 = {}
				local t_2 = {}
				local t_3 = {}
				
				for i, v in p2 do
					local t_4 = { source = p1, itemId = v.id }
					local t_5 = {}
					local source = t_4.source
					t_5.source = { kind = source.kind, placeId = source.placeId }
					t_5.itemId = t_4.itemId
					local var5 = httpService:JSONEncode(t_5)
					
					if not t_2[var5] then
						t_2[var5] = true
						table.insert(t_1, v.id)
					end
					if p3 >= (t[var5] or 0) then
						local cloned = table.clone(v)
						local var6 = var3.getItem(var5).data(false)
						
						if var6 ~= nil and var6.model ~= nil and cloned.model == nil then
							cloned.model = var6.model
						end
						t[var5] = p3
						t_3[var5] = cloned
					end
				end
				var3.replaceItems(t_3)
				
				return t_1
			end,
			executeQuery = var4.executeQuery,
			decodeItems = var4.decodeItems,
			assertActive = function()
				-- upvalues: var1 (write)
				assert(var1, "Library request belongs to a disposed state")
			end,
			nextSequence = function()
				-- upvalues: var1 (write), var2 (write)
				assert(var1, "Library request belongs to a disposed state")
				var2 += 1
				
				return var2
			end,
			retire = function()
				-- upvalues: var1 (write)
				var1 = false
			end
		}
	end,
	listKey = function(p1)
		-- upvalues: httpService (ref)
		local t = {}
		
		for i, v in p1.ids or {} do
			if not table.find(t, v) then
				table.insert(t, v)
			end
		end
		table.sort(t)
		local t_1 = {}
		local source = p1.source
		t_1.source = { kind = source.kind, placeId = source.placeId }
		t_1.itemKind = p1.itemKind
		t_1.offset = math.max(0, math.floor(p1.offset))
		t_1.limit = math.clamp(math.floor(p1.limit), 1, 24)
		t_1.query = string.lower(p1.query or "")
		t_1.ids = if #t > 0 then t else nil
		t_1.generation = p1.generation
		
		return httpService:JSONEncode(t_1)
	end,
	itemKey = function(p2)
		-- upvalues: httpService (ref)
		local t = {}
		local source = p2.source
		t.source = { kind = source.kind, placeId = source.placeId }
		t.itemId = p2.itemId
		
		return httpService:JSONEncode(t)
	end
}