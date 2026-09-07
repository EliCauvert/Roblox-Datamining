local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchPlaceVersionHistoryModule = require(script.Parent.fetchPlaceVersionHistory)
local _ = require(script.Parent.PlaceVersionHistoryStoreTypes)

return function(p1)
	-- upvalues: createSingleEntityResolverModule (ref), fetchPlaceVersionHistoryModule (ref)
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
	
	return {
		getHistory = var1.get,
		fetchHistory = var1.fetch,
		getAndFetchHistory = var1.getAndFetch,
		updateHistory = var1.update,
		fetchPageHistory = function(p2, p3)
			-- upvalues: fetchPlaceVersionHistoryModule (copy), t (ref), var1 (ref)
			return fetchPlaceVersionHistoryModule.fetchHistory(p2, t, p3):andThen(function(p4)
				-- upvalues: var1 (copy), p2 (ref)
				var1.update(p2, p4)
				
				return p4
			end)
		end,
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
				local var2 = var1.get(p2).data(false)
				
				if var2 == nil or typeof(var2.placeVersions) ~= "table" then
					return p5
				end
				local t = {}
				
				for i, v in var2.placeVersions do
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
					hasMore = var2.hasMore,
					nextCursor = var2.nextCursor,
					placeVersions = t
				})
				
				return p5
			end)
		end,
		clear = var1.clear,
		dispose = var1.dispose
	}
end