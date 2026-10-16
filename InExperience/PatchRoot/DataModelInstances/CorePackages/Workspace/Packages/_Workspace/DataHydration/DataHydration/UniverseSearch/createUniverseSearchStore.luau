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

local function _(Input) --[[ Line: 29 | Named "paramsKey" ]]
	-- upvalues: HttpService (copy)
	return HttpService:JSONEncode(Input)
end

return function(p1) --[[ Line: 33 | Named "createUniverseSearchStore" ]]
	-- upvalues: CryoModule (copy), CreateDataCacheModule (copy), CreateDataResolverModule (copy), FetchUniverseSearchModule (copy), HttpService (copy)
	local P1 = p1 or {}
	local Inputs = {}
	local T = {}
	local JoinResults = {}
	
	local function applyItemPatches(Result) --[[ Line: 40 ]]
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
		fetchFn = function(p2, _) --[[ Line: 71 ]]
			-- upvalues: Inputs (ref), FetchUniverseSearchModule (upval), P1 (copy), applyItemPatches (copy)
			return FetchUniverseSearchModule(Inputs[p2], { network = P1.network, baseUrl = P1.baseUrl }):andThen(applyItemPatches)
		end
	})
	
	return {
		getSearch = function(Input) --[[ Line: 80 ]]
			-- upvalues: HttpService (upval), Inputs (ref), DataResolverModule (copy)
			local Json = HttpService:JSONEncode(Input)
			Inputs[Json] = Input
			
			return DataResolverModule.getCachedItem(Json)
		end,
		fetchSearch = function(Input) --[[ Line: 86 ]]
			-- upvalues: HttpService (upval), Inputs (ref), DataResolverModule (copy)
			local Json = HttpService:JSONEncode(Input)
			Inputs[Json] = Input
			
			return DataResolverModule.fetchItem(Json)
		end,
		refreshSearch = function(Input) --[[ Line: 92 ]]
			-- upvalues: HttpService (upval), Inputs (ref), T (ref), DataCacheModule (copy), FetchUniverseSearchModule (upval), P1 (copy), applyItemPatches (copy)
			local Json = HttpService:JSONEncode(Input)
			Inputs[Json] = Input
			local v1 = (T[Json] or 0) + 1
			T[Json] = v1
			DataCacheModule.resetFailedItem(Json)
			
			return FetchUniverseSearchModule(Input, { network = P1.network, baseUrl = P1.baseUrl }):andThen(applyItemPatches):andThen(function(Result) --[[ Line: 101 ]]
				-- upvalues: T (upval), Json (copy), v1 (copy), DataCacheModule (upval)
				if T[Json] == v1 then
					DataCacheModule.replaceItem(Json, Result)
				end
				return Result
			end):catch(function(Err) --[[ Line: 107 ]]
				-- upvalues: T (upval), Json (copy), v1 (copy), DataCacheModule (upval)
				if T[Json] == v1 then
					DataCacheModule.markItemsAsFailed({ Json })
				end
				error(Err)
			end)
		end,
		getAndFetchSearch = function(Input) --[[ Line: 115 ]]
			-- upvalues: HttpService (upval), Inputs (ref), DataResolverModule (copy)
			local Json = HttpService:JSONEncode(Input)
			Inputs[Json] = Input
			
			return DataResolverModule.getAndFetchItem(Json)
		end,
		updateSearchItem = function(Key, p2) --[[ Line: 123 ]]
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
		invalidateAll = function() --[[ Line: 140 ]]
			-- upvalues: Inputs (ref), T (ref), DataResolverModule (copy)
			Inputs = {}
			T = {}
			DataResolverModule.clear()
		end,
		dispose = function() --[[ Line: 146 ]]
			-- upvalues: Inputs (ref), T (ref), JoinResults (ref), DataResolverModule (copy)
			Inputs = {}
			T = {}
			JoinResults = {}
			DataResolverModule.dispose()
		end
	}
end