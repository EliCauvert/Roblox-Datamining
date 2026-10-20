local HttpService = game:GetService("HttpService")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchUniverseSearchModule = require(script.Parent.fetchUniverseSearch)
local _ = require(script.Parent.UniverseSearchStoreTypes)

local function _(Input)
	-- upvalues: HttpService (copy)
	return HttpService:JSONEncode(Input)
end

return function(p1)
	-- upvalues: CryoModule (copy), CreateDataCacheModule (copy), CreateDataResolverModule (copy), FetchUniverseSearchModule (copy), HttpService (copy)
	local P1 = p1 or {}
	local Inputs = {}
	local T = {}
	local JoinResults = {}
	
	local function applyItemPatches(Result)
		-- upvalues: JoinResults (ref), CryoModule (upval)
		local Data = Result.data
		
		if Data == nil or next(JoinResults) == nil then
			return Result
		end
		local Flag = false
		local Buffer = table.create(#Data)
		
		for i, entry in Data do
			local JoinResult = JoinResults[entry.id]
			
			if JoinResult == nil then
				Buffer[i] = entry
			else
				Flag = true
				Buffer[i] = CryoModule.Dictionary.join(entry, JoinResult)
			end
		end
		return if Flag then CryoModule.Dictionary.join(Result, { data = Buffer }) else Result
	end
	
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = DataCacheModule,
		fetchFn = function(p2, _)
			-- upvalues: Inputs (ref), FetchUniverseSearchModule (upval), P1 (copy), applyItemPatches (copy)
			return FetchUniverseSearchModule(Inputs[p2], { network = P1.network, baseUrl = P1.baseUrl }):andThen(applyItemPatches)
		end
	})
	
	return {
		getSearch = function(Input)
			-- upvalues: HttpService (upval), Inputs (ref), DataResolverModule (copy)
			local Json = HttpService:JSONEncode(Input)
			Inputs[Json] = Input
			
			return DataResolverModule.getCachedItem(Json)
		end,
		fetchSearch = function(Input)
			-- upvalues: HttpService (upval), Inputs (ref), DataResolverModule (copy)
			local Json = HttpService:JSONEncode(Input)
			Inputs[Json] = Input
			
			return DataResolverModule.fetchItem(Json)
		end,
		refreshSearch = function(Input)
			-- upvalues: HttpService (upval), Inputs (ref), T (ref), DataCacheModule (copy), FetchUniverseSearchModule (upval), P1 (copy), applyItemPatches (copy)
			local Json = HttpService:JSONEncode(Input)
			Inputs[Json] = Input
			local v1 = (T[Json] or 0) + 1
			T[Json] = v1
			DataCacheModule.resetFailedItem(Json)
			
			return FetchUniverseSearchModule(Input, { network = P1.network, baseUrl = P1.baseUrl }):andThen(applyItemPatches):andThen(function(Result)
				-- upvalues: T (upval), Json (copy), v1 (copy), DataCacheModule (upval)
				if T[Json] == v1 then
					DataCacheModule.replaceItem(Json, Result)
				end
				return Result
			end):catch(function(Err)
				-- upvalues: T (upval), Json (copy), v1 (copy), DataCacheModule (upval)
				if T[Json] == v1 then
					DataCacheModule.markItemsAsFailed({ Json })
				end
				error(Err)
			end)
		end,
		getAndFetchSearch = function(Input)
			-- upvalues: HttpService (upval), Inputs (ref), DataResolverModule (copy)
			local Json = HttpService:JSONEncode(Input)
			Inputs[Json] = Input
			
			return DataResolverModule.getAndFetchItem(Json)
		end,
		updateSearchItem = function(Key, p2)
			-- upvalues: JoinResults (ref), CryoModule (upval), Inputs (ref), DataResolverModule (copy), applyItemPatches (copy), DataCacheModule (copy)
			JoinResults[Key] = CryoModule.Dictionary.join(JoinResults[Key] or {}, p2)
			
			for input in Inputs do
				local DataResult = DataResolverModule.getCachedItem(input).data(false)
				local NoDataResult = DataResult == nil
				local ApplyItemPatchesResult = nil
				
				if not NoDataResult then
					ApplyItemPatchesResult = applyItemPatches(DataResult)
					NoDataResult = ApplyItemPatchesResult == DataResult
				end
				if not NoDataResult then
					DataCacheModule.updateItem(input, ApplyItemPatchesResult)
				end
			end
		end,
		invalidateAll = function()
			-- upvalues: Inputs (ref), T (ref), DataResolverModule (copy)
			Inputs = {}
			T = {}
			DataResolverModule.clear()
		end,
		dispose = function()
			-- upvalues: Inputs (ref), T (ref), JoinResults (ref), DataResolverModule (copy)
			Inputs = {}
			T = {}
			JoinResults = {}
			DataResolverModule.dispose()
		end
	}
end