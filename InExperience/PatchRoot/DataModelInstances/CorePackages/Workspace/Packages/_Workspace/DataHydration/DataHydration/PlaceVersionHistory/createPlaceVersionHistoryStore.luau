local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local SignalsModule = require(Parent.Signals)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local FetchPlaceVersionHistoryModule = require(script.Parent.fetchPlaceVersionHistory)
local _ = require(script.Parent.PlaceVersionHistoryStoreTypes)

return function(p1) --[[ Line: 28 | Named "createPlaceVersionHistoryStore" ]]
	-- upvalues: CreateSingleEntityResolverModule (copy), FetchPlaceVersionHistoryModule (copy), PromiseModule (copy), SignalsModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	local config = {
		network = P0.network,
		baseUrl = P0.baseUrl,
		developBaseUrl = P0.developBaseUrl
	}
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2) --[[ Line: 36 ]]
		-- upvalues: FetchPlaceVersionHistoryModule (upval), config (copy)
		return FetchPlaceVersionHistoryModule.fetchHistory(p2, config)
	end)
	local SingleEntityResolverModule1 = CreateSingleEntityResolverModule(function(p2) --[[ Line: 42 ]]
		-- upvalues: FetchPlaceVersionHistoryModule (upval), config (copy)
		return FetchPlaceVersionHistoryModule.fetchHistory(p2, config, { isPublished = true, pageSize = 1 }):andThen(function(Result) --[[ Line: 48 ]]
			return { placeVersion = Result.placeVersions[1] }
		end)
	end, { resolver = { replaceItems = true } })
	local t = {}
	local ResolveResult = PromiseModule.resolve()
	
	local function _(Key) --[[ Line: 73 | Named "getFetchingMoreHistorySignal" ]]
		-- upvalues: t (copy), SignalsModule (upval)
		local Entry = t[Key]
		
		if Entry == nil then
			local Signal, Signal2 = SignalsModule.createSignal(false)
			Entry = { getIsFetching = Signal, setIsFetching = Signal2 }
			t[Key] = Entry
		end
		return Entry
	end
	
	return {
		getHistory = SingleEntityResolverModule.get,
		fetchHistory = SingleEntityResolverModule.fetch,
		getAndFetchHistory = SingleEntityResolverModule.getAndFetch,
		updateHistory = SingleEntityResolverModule.update,
		fetchPageHistory = function(p2, p3) --[[ Line: 56 ]]
			-- upvalues: FetchPlaceVersionHistoryModule (upval), config (copy), SingleEntityResolverModule (copy)
			return FetchPlaceVersionHistoryModule.fetchHistory(p2, config, p3):andThen(function(Result) --[[ Line: 62 ]]
				-- upvalues: SingleEntityResolverModule (upval), p2 (copy)
				SingleEntityResolverModule.update(p2, Result)
				
				return Result
			end)
		end,
		fetchMoreHistory = function(Key, Cursor) --[[ Line: 90 ]]
			-- upvalues: SingleEntityResolverModule (copy), t (copy), SignalsModule (upval), ResolveResult (copy), FetchPlaceVersionHistoryModule (upval), config (copy), CryoModule (upval)
			local DataResult = SingleEntityResolverModule.get(Key).data(false)
			local Entry = t[Key]
			
			if Entry == nil then
				local Signal, Signal2 = SignalsModule.createSignal(false)
				Entry = { getIsFetching = Signal, setIsFetching = Signal2 }
				t[Key] = Entry
			end
			local Entry1 = Entry
			
			if DataResult == nil or not DataResult.hasMore or DataResult.nextCursor ~= Cursor or Cursor == "" or Entry1.getIsFetching(false) then
				return ResolveResult
			else
				Entry1.setIsFetching(true)
				local Promise = FetchPlaceVersionHistoryModule.fetchHistory(Key, config, {
					cursor = Cursor,
					pageSize = FetchPlaceVersionHistoryModule.DEFAULT_HISTORY_PAGE_SIZE
				}):andThen(function(Result) --[[ Line: 108 ]]
					-- upvalues: SingleEntityResolverModule (upval), Key (copy), DataResult (copy), Cursor (copy), CryoModule (upval)
					if SingleEntityResolverModule.get(Key).data(false) == DataResult then
						SingleEntityResolverModule.cache.replaceItem(tostring(Key), {
							hasMore = Result.hasMore and Result.nextCursor ~= Cursor,
							nextCursor = Result.nextCursor,
							placeVersions = CryoModule.List.join(DataResult.placeVersions or {}, Result.placeVersions or {})
						})
					end
				end)
				Promise:finally(function() --[[ Line: 120 ]]
					-- upvalues: Entry1 (copy)
					Entry1.setIsFetching(false)
				end)
				
				return Promise
			end
		end,
		getIsFetchingMoreHistory = function(Key) --[[ Line: 86 ]]
			-- upvalues: t (copy), SignalsModule (upval)
			local Entry = t[Key]
			
			if Entry == nil then
				local Signal, Signal2 = SignalsModule.createSignal(false)
				Entry = { getIsFetching = Signal, setIsFetching = Signal2 }
				t[Key] = Entry
			end
			return Entry.getIsFetching
		end,
		getLiveVersion = SingleEntityResolverModule1.get,
		fetchLiveVersion = SingleEntityResolverModule1.fetch,
		getAndFetchLiveVersion = SingleEntityResolverModule1.getAndFetch,
		revertVersion = function(AssetId, AssetId1, AssetVersionNumber) --[[ Line: 126 ]]
			-- upvalues: FetchPlaceVersionHistoryModule (upval), config (copy), SingleEntityResolverModule (copy)
			return FetchPlaceVersionHistoryModule.revertVersion(AssetId1, AssetVersionNumber, config):andThen(function(_) --[[ Line: 133 ]]
				-- upvalues: AssetId1 (copy), AssetVersionNumber (copy), SingleEntityResolverModule (upval), AssetId (copy)
				local config = {
					assetId = AssetId1,
					assetVersionNumber = AssetVersionNumber
				}
				SingleEntityResolverModule.fetch(AssetId)
				
				return config
			end):catch(function(Err) --[[ Line: 142 ]]
				error(Err)
			end)
		end,
		rollbackPlace = function(p2, p3, p4, p5) --[[ Line: 147 ]]
			-- upvalues: FetchPlaceVersionHistoryModule (upval), config (copy), SingleEntityResolverModule (copy)
			return FetchPlaceVersionHistoryModule.rollbackPlace(p2, p3, p4, p5, config):andThen(function(Result) --[[ Line: 155 ]]
				-- upvalues: SingleEntityResolverModule (upval), p2 (copy)
				SingleEntityResolverModule.fetch(p2)
				
				return Result
			end):catch(function(Err) --[[ Line: 159 ]]
				error(Err)
			end)
		end,
		addVersionNote = function(p2, Version, p3) --[[ Line: 164 ]]
			-- upvalues: FetchPlaceVersionHistoryModule (upval), config (copy), SingleEntityResolverModule (copy)
			return FetchPlaceVersionHistoryModule.addVersionNote(p2, Version, p3, config):andThen(function(Result) --[[ Line: 171 ]]
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
		clear = function() --[[ Line: 201 ]]
			-- upvalues: SingleEntityResolverModule (copy), SingleEntityResolverModule1 (copy)
			SingleEntityResolverModule.clear()
			SingleEntityResolverModule1.clear()
		end,
		dispose = function() --[[ Line: 206 ]]
			-- upvalues: SingleEntityResolverModule (copy), SingleEntityResolverModule1 (copy)
			SingleEntityResolverModule.dispose()
			SingleEntityResolverModule1.dispose()
		end
	}
end