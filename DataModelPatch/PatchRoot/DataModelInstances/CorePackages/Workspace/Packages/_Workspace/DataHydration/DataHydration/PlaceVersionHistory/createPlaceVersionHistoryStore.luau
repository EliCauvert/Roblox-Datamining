local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local FetchPlaceVersionHistoryModule = require(script.Parent.fetchPlaceVersionHistory)
local _ = require(script.Parent.PlaceVersionHistoryStoreTypes)

return function(p1)
	-- upvalues: CreateSingleEntityResolverModule (copy), FetchPlaceVersionHistoryModule (copy)
	local P0 = p1 or {}
	local config = {
		network = P0.network,
		baseUrl = P0.baseUrl,
		developBaseUrl = P0.developBaseUrl
	}
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2)
		-- upvalues: FetchPlaceVersionHistoryModule (upval), config (copy)
		return FetchPlaceVersionHistoryModule.fetchHistory(p2, config)
	end)
	
	return {
		getHistory = SingleEntityResolverModule.get,
		fetchHistory = SingleEntityResolverModule.fetch,
		getAndFetchHistory = SingleEntityResolverModule.getAndFetch,
		updateHistory = SingleEntityResolverModule.update,
		fetchPageHistory = function(p2, p3)
			-- upvalues: FetchPlaceVersionHistoryModule (upval), config (copy), SingleEntityResolverModule (copy)
			return FetchPlaceVersionHistoryModule.fetchHistory(p2, config, p3):andThen(function(Result)
				-- upvalues: SingleEntityResolverModule (upval), p2 (copy)
				SingleEntityResolverModule.update(p2, Result)
				
				return Result
			end)
		end,
		revertVersion = function(AssetId, AssetId1, AssetVersionNumber)
			-- upvalues: FetchPlaceVersionHistoryModule (upval), config (copy), SingleEntityResolverModule (copy)
			return FetchPlaceVersionHistoryModule.revertVersion(AssetId1, AssetVersionNumber, config):andThen(function(_)
				-- upvalues: AssetId1 (copy), AssetVersionNumber (copy), SingleEntityResolverModule (upval), AssetId (copy)
				local config = {
					assetId = AssetId1,
					assetVersionNumber = AssetVersionNumber
				}
				SingleEntityResolverModule.fetch(AssetId)
				
				return config
			end):catch(function(Err)
				error(Err)
			end)
		end,
		rollbackPlace = function(p2, p3, p4, p5)
			-- upvalues: FetchPlaceVersionHistoryModule (upval), config (copy), SingleEntityResolverModule (copy)
			return FetchPlaceVersionHistoryModule.rollbackPlace(p2, p3, p4, p5, config):andThen(function(Result)
				-- upvalues: SingleEntityResolverModule (upval), p2 (copy)
				SingleEntityResolverModule.fetch(p2)
				
				return Result
			end):catch(function(Err)
				error(Err)
			end)
		end,
		addVersionNote = function(p2, Version, p3)
			-- upvalues: FetchPlaceVersionHistoryModule (upval), config (copy), SingleEntityResolverModule (copy)
			return FetchPlaceVersionHistoryModule.addVersionNote(p2, Version, p3, config):andThen(function(Result)
				-- upvalues: SingleEntityResolverModule (upval), p2 (copy), Version (copy), p3 (copy)
				local DataResult = SingleEntityResolverModule.get(p2).data(false)
				
				if DataResult == nil or typeof(DataResult.placeVersions) ~= "table" then
					return Result
				end
				local PlaceVersions = {}
				
				for i, placeVersion in DataResult.placeVersions do
					if placeVersion.version ~= Version then
						PlaceVersions[i] = placeVersion
						continue
					end
					local t = {}
					
					for i1, value in placeVersion do
						t[i1] = value
					end
					t.title = p3.title
					t.description = p3.description
					PlaceVersions[i] = t
				end
				SingleEntityResolverModule.cache.replaceItem(tostring(p2), {
					hasMore = DataResult.hasMore,
					nextCursor = DataResult.nextCursor,
					placeVersions = PlaceVersions
				})
				
				return Result
			end)
		end,
		clear = SingleEntityResolverModule.clear,
		dispose = SingleEntityResolverModule.dispose
	}
end