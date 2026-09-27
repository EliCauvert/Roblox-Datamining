local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local signalsModule = require(parent.Signals)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchPlaceVersionHistoryModule = require(script.Parent.fetchPlaceVersionHistory)
local _ = require(script.Parent.PlaceVersionHistoryStoreTypes)

return function(p1)
	-- upvalues: createSingleEntityResolverModule (ref), fetchPlaceVersionHistoryModule (ref), promiseModule (ref), signalsModule (ref), cryoModule (ref)
	p1 = p1 or {}
	local t = {
		network = p1.network,
		baseUrl = p1.baseUrl,
		developBaseUrl = p1.developBaseUrl
	}
	local var1 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchPlaceVersionHistoryModule (copy), t (ref)
		return fetchPlaceVersionHistoryModule.fetchHistory(p2, t)
	end)
	local var2 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchPlaceVersionHistoryModule (copy), t (ref)
		return fetchPlaceVersionHistoryModule.fetchHistory(p2, t, { isPublished = true, pageSize = 1 }):andThen(function(p3)
			return { placeVersion = p3.placeVersions[1] }
		end)
	end, { resolver = { replaceItems = true } })
	
	local function fetchPageHistory(p2, p3)
		-- upvalues: fetchPlaceVersionHistoryModule (copy), t (ref), var1 (ref)
		return fetchPlaceVersionHistoryModule.fetchHistory(p2, t, p3):andThen(function(p4)
			-- upvalues: var1 (copy), p2 (ref)
			var1.update(p2, p4)
			
			return p4
		end)
	end
	
	local t_1 = {}
	local var3 = promiseModule.resolve()
	
	local function _(value)
		-- upvalues: t_1 (ref), signalsModule (copy)
		local var4 = t_1[value]
		
		if var4 == nil then
			local var5, var6 = signalsModule.createSignal(false)
			var4 = { getIsFetching = var5, setIsFetching = var6 }
			t_1[value] = var4
		end
		return var4
	end
	
	return {
		getHistory = var1.get,
		fetchHistory = var1.fetch,
		getAndFetchHistory = var1.getAndFetch,
		updateHistory = var1.update,
		fetchPageHistory = fetchPageHistory,
		fetchMoreHistory = function(p2, p3)
			-- upvalues: var1 (ref), t_1 (ref), signalsModule (copy), var3 (ref), fetchPlaceVersionHistoryModule (copy), t (ref), cryoModule (copy)
			local var4 = var1.get(p2).data(false)
			local var5 = t_1[p2]
			
			if var5 == nil then
				local var6, var7 = signalsModule.createSignal(false)
				var5 = { getIsFetching = var6, setIsFetching = var7 }
				t_1[p2] = var5
			end
			if var4 == nil or not var4.hasMore or (var4.nextCursor ~= p3 or p3 == "") or var5.getIsFetching(false) then
				return var3
			end
			var5.setIsFetching(true)
			local var8 = fetchPlaceVersionHistoryModule.fetchHistory(p2, t, {
				cursor = p3,
				pageSize = fetchPlaceVersionHistoryModule.DEFAULT_HISTORY_PAGE_SIZE
			}):andThen(function(p4)
				-- upvalues: var1 (copy), p2 (ref), var4 (ref), p3 (ref), cryoModule (copy)
				if var1.get(p2).data(false) == var4 then
					var1.cache.replaceItem(tostring(p2), {
						hasMore = p4.hasMore and p4.nextCursor ~= p3,
						nextCursor = p4.nextCursor,
						placeVersions = cryoModule.List.join(var4.placeVersions or {}, p4.placeVersions or {})
					})
				end
			end)
			var8:finally(function()
				-- upvalues: var5 (ref)
				var5.setIsFetching(false)
			end)
			
			return var8
		end,
		getIsFetchingMoreHistory = function(p2)
			-- upvalues: t_1 (ref), signalsModule (copy)
			local var4 = t_1[p2]
			
			if var4 == nil then
				local var5, var6 = signalsModule.createSignal(false)
				var4 = { getIsFetching = var5, setIsFetching = var6 }
				t_1[p2] = var4
			end
			return var4.getIsFetching
		end,
		getLiveVersion = var2.get,
		fetchLiveVersion = var2.fetch,
		getAndFetchLiveVersion = var2.getAndFetch,
		revertVersion = function(p2, p3, p4)
			-- upvalues: fetchPlaceVersionHistoryModule (copy), t (ref), var1 (ref)
			return fetchPlaceVersionHistoryModule.revertVersion(p3, p4, t):andThen(function(_)
				-- upvalues: p3 (ref), p4 (ref), var1 (copy), p2 (ref)
				local t = { assetId = p3, assetVersionNumber = p4 }
				var1.fetch(p2)
				
				return t
			end):catch(function(p5)
				error(p5)
			end)
		end,
		rollbackPlace = function(p2, p3, p4, p5)
			-- upvalues: fetchPlaceVersionHistoryModule (copy), t (ref), var1 (ref)
			return fetchPlaceVersionHistoryModule.rollbackPlace(p2, p3, p4, p5, t):andThen(function(p6)
				-- upvalues: var1 (copy), p2 (ref)
				var1.fetch(p2)
				
				return p6
			end):catch(function(p6)
				error(p6)
			end)
		end,
		addVersionNote = function(p2, p3, p4)
			-- upvalues: fetchPlaceVersionHistoryModule (copy), t (ref), var1 (ref)
			return fetchPlaceVersionHistoryModule.addVersionNote(p2, p3, p4, t):andThen(function(p5)
				-- upvalues: var1 (copy), p2 (ref), p3 (ref), p4 (ref)
				local var4 = var1.get(p2).data(false)
				
				if var4 == nil or typeof(var4.placeVersions) ~= "table" then
					return p5
				end
				local t = {}
				
				for i, v in var4.placeVersions do
					if v.version ~= p3 then
						t[i] = v
						continue
					end
					local t_1 = {}
					
					for i_1, v_1 in v do
						t_1[i_1] = v_1
					end
					t_1.title = p4.title
					t_1.description = p4.description
					t[i] = t_1
				end
				var1.cache.replaceItem(tostring(p2), {
					hasMore = var4.hasMore,
					nextCursor = var4.nextCursor,
					placeVersions = t
				})
				
				return p5
			end)
		end,
		clear = function()
			-- upvalues: var1 (ref), var2 (ref)
			var1.clear()
			var2.clear()
		end,
		dispose = function()
			-- upvalues: var1 (ref), var2 (ref)
			var1.dispose()
			var2.dispose()
		end
	}
end