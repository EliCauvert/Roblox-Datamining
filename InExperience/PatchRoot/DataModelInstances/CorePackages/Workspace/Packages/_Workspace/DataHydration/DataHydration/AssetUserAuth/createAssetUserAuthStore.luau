local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local PromiseModule = require(Parent.Promise)
local FetchAssetUserAuthModule = require(script.Parent.fetchAssetUserAuth)
local _ = require(script.Parent.AssetUserAuthStoreTypes)

local function ALWAYS_REFRESH(): boolean
	return true
end

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), FetchAssetUserAuthModule (copy), PromiseModule (copy), ALWAYS_REFRESH (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = DataCacheModule,
		fetchFn = function(p2, _)
			-- upvalues: FetchAssetUserAuthModule (upval), config (copy)
			return FetchAssetUserAuthModule.fetchOperation(p2, config)
		end
	})
	
	local function seedAndReturn(Result)
		-- upvalues: DataCacheModule (copy)
		local Path: string = Result.path
		
		if typeof(Path) == "string" and #Path > 0 then
			DataCacheModule.updateItem(string.match(Path, "operations/(.+)$") or Path, Result)
		end
		return Result
	end
	
	return {
		patchAssetIcon = function(p2, p3)
			-- upvalues: FetchAssetUserAuthModule (upval), config (copy), DataCacheModule (copy)
			return FetchAssetUserAuthModule.patchAssetIcon(p2, p3, config):andThen(function(Result)
				-- upvalues: DataCacheModule (upval)
				local Path: string = Result.path
				
				if typeof(Path) == "string" and #Path > 0 then
					DataCacheModule.updateItem(string.match(Path, "operations/(.+)$") or Path, Result)
				end
				return Result
			end)
		end,
		updateIcon = function(p2, p3)
			-- upvalues: FetchAssetUserAuthModule (upval), config (copy), seedAndReturn (copy)
			return FetchAssetUserAuthModule.updateIcon(p2, p3, config):andThen(seedAndReturn)
		end,
		getPreviews = function(p2)
			-- upvalues: FetchAssetUserAuthModule (upval), config (copy)
			return FetchAssetUserAuthModule.getPreviews(p2, config)
		end,
		updatePreviews = function(p2, p3)
			-- upvalues: FetchAssetUserAuthModule (upval), config (copy), seedAndReturn (copy)
			return FetchAssetUserAuthModule.updatePreviews(p2, p3, config):andThen(seedAndReturn)
		end,
		createImageAsset = function(p2, p3, p4)
			-- upvalues: FetchAssetUserAuthModule (upval), config (copy), seedAndReturn (copy)
			return FetchAssetUserAuthModule.createImageAsset(p2, p3, p4, config):andThen(seedAndReturn)
		end,
		pollUntilDone = function(p2)
			-- upvalues: PromiseModule (upval), FetchAssetUserAuthModule (upval), config (copy), DataCacheModule (copy)
			local Match = nil
			
			if typeof(p2) == "string" then
				Match = p2
			else
				local Path = p2.path or ""
				Match = string.match(Path, "operations/(.+)$") or (p2.operationId or Path)
			end
			return PromiseModule.new(function(Callback1, Callback)
				-- upvalues: Match (ref), FetchAssetUserAuthModule (upval), config (upval), DataCacheModule (upval)
				local Count = 0
				local Count1 = 0
				
				local function poll()
					-- upvalues: Count (ref), Match (upval), FetchAssetUserAuthModule (upval), config (upval), DataCacheModule (upval), Count1 (ref), Callback (copy), Callback1 (copy), poll (copy)
					Count += 1
					local Match1 = Match
					FetchAssetUserAuthModule.fetchOperation(Match1, config):andThen(function(Result)
						-- upvalues: DataCacheModule (upval), Match1 (copy)
						DataCacheModule.updateItem(Match1, Result)
						
						return Result
					end):andThen(function(Result)
						-- upvalues: Count1 (upval), Callback (upval), Callback1 (upval), Count (upval), Match (upval), poll (upval)
						Count1 = 0
						
						if Result.done then
							if Result.error then
								Callback(Result.error.message or "Operation failed")
								
								return
							else
								Callback1({ status = "done", operation = Result })
								
								return
							end
						elseif Count >= 30 then
							Callback1({ status = "timed_out", operationId = Match })
							
							return
						else
							task.delay(2, poll)
						end
					end):catch(function(Err)
						-- upvalues: Count1 (upval), poll (upval), Callback (upval)
						Count1 += 1
						
						if Count1 <= 3 then
							task.delay(math.pow(2, Count1 - 1) * 2, poll)
							
							return
						else
							Callback(Err)
						end
					end)
				end
				
				poll()
			end)
		end,
		getOperation = DataResolverModule.getCachedItem,
		fetchOperation = DataResolverModule.fetchItem,
		getAndFetchOperation = function(p2)
			-- upvalues: DataResolverModule (copy), ALWAYS_REFRESH (upval)
			return DataResolverModule.getAndFetchItem(p2, ALWAYS_REFRESH)
		end,
		refreshOperation = function(p2)
			-- upvalues: FetchAssetUserAuthModule (upval), config (copy), DataCacheModule (copy)
			return FetchAssetUserAuthModule.fetchOperation(p2, config):andThen(function(Result)
				-- upvalues: DataCacheModule (upval), p2 (copy)
				DataCacheModule.updateItem(p2, Result)
				
				return Result
			end)
		end,
		updateOperation = DataCacheModule.updateItem,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end