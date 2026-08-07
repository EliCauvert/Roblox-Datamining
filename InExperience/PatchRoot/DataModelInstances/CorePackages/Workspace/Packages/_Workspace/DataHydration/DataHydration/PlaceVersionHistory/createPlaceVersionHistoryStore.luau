local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchPlaceVersionHistoryModule = require(script.Parent.fetchPlaceVersionHistory)
local _ = require(script.Parent.PlaceVersionHistoryStoreTypes)

return function(p0) --[[ line: 20 | named "createPlaceVersionHistoryStore" ]]
	-- upvalues: createSingleEntityResolverModule (ref), fetchPlaceVersionHistoryModule (ref)
	p0 = p0 or {}
	local t = {
		network = p0.network,
		baseUrl = p0.baseUrl,
		developBaseUrl = p0.developBaseUrl
	}
	local var5 = createSingleEntityResolverModule(function(p1) --[[ line: 28 ]]
		-- upvalues: fetchPlaceVersionHistoryModule (copy), t (ref)
		return fetchPlaceVersionHistoryModule.fetchHistory(p1, t)
	end)
	
	return {
		getHistory = var5.get,
		fetchHistory = var5.fetch,
		getAndFetchHistory = var5.getAndFetch,
		updateHistory = var5.update,
		fetchPageHistory = function(p2, p3) --[[ line: 32 ]]
			-- upvalues: fetchPlaceVersionHistoryModule (copy), t (ref), var5 (ref)
			return fetchPlaceVersionHistoryModule.fetchHistory(p2, t, p3):andThen(function(p4) --[[ line: 38 ]]
				-- upvalues: var5 (copy), p2 (ref)
				var5.update(p2, p4)
				
				return p4
			end)
		end,
		revertVersion = function(p5, p6, p7) --[[ line: 44 ]]
			-- upvalues: fetchPlaceVersionHistoryModule (copy), t (ref), var5 (ref)
			return fetchPlaceVersionHistoryModule.revertVersion(p6, p7, t):andThen(function(_) --[[ line: 51 ]]
				-- upvalues: p6 (ref), p7 (ref), var5 (copy), p5 (ref)
				local t = { assetId = p6, assetVersionNumber = p7 }
				var5.fetch(p5)
				
				return t
			end):catch(function(p8) --[[ line: 60 ]]
				error(p8)
			end)
		end,
		rollbackPlace = function(p9, p10, p11, p12) --[[ line: 65 ]]
			-- upvalues: fetchPlaceVersionHistoryModule (copy), t (ref), var5 (ref)
			return fetchPlaceVersionHistoryModule.rollbackPlace(p9, p10, p11, p12, t):andThen(function(p14) --[[ line: 73 ]]
				-- upvalues: var5 (copy), p9 (ref)
				var5.fetch(p9)
				
				return p14
			end):catch(function(p13) --[[ line: 77 ]]
				error(p13)
			end)
		end,
		addVersionNote = function(p15, p16, p17) --[[ line: 82 ]]
			-- upvalues: fetchPlaceVersionHistoryModule (copy), t (ref), var5 (ref)
			return fetchPlaceVersionHistoryModule.addVersionNote(p15, p16, p17, t):andThen(function(p18) --[[ line: 89 ]]
				-- upvalues: var5 (copy), p15 (ref), p16 (ref), p17 (ref)
				local var7 = var5.get(p15).data(false)
				
				if var7 == nil or typeof(var7.placeVersions) ~= "table" then
					return p18
				end
				local t = {}
				
				for i, v in var7.placeVersions do
					if v.version ~= p16 then
						t[i] = v
						continue
					end
					local t_1 = {}
					
					for i_1, v_1 in v do
						t_1[i_1] = v_1
					end
					t_1.title = p17.title
					t_1.description = p17.description
					t[i] = t_1
				end
				var5.cache.replaceItem(tostring(p15), {
					hasMore = var7.hasMore,
					nextCursor = var7.nextCursor,
					placeVersions = t
				})
				
				return p18
			end)
		end,
		clear = var5.clear,
		dispose = var5.dispose
	}
end