local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local DashModule = require(Parent.Dash)
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local LogResponseErrorFunction = DiscoveryUtilsModule.logResponseError
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchGameDetailsModule = require(script.Parent.fetchGameDetails)
local GameInfoStoreTypesModule = require(script.Parent.GameInfoStoreTypes)
local TrimFunction = require(Parent.LuauPolyfill).String.trim
local FFlagLuaAppInExperienceDetailsPrompt = require(Parent.SharedFlags).FFlagLuaAppInExperienceDetailsPrompt
local FFlagLuaAppDataHydrationPlayerCountGameInfoStore = require(Parent.SharedFlags).FFlagLuaAppDataHydrationPlayerCountGameInfoStore
local GetFIntLuaAppThrottleRefreshPlayabilityIntervalSecondsFunction = require(Parent.SharedFlags).GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds
local FFlagLuaAppDataHydrationUpdateItem = require(Parent.SharedFlags).FFlagLuaAppDataHydrationUpdateItem
local FFlagMigrateGameInfoToStore = require(Parent.SharedFlags).FFlagMigrateGameInfoToStore
local FIntLuaAppThrottleRefreshPlayabilityIntervalSeconds = if FFlagLuaAppInExperienceDetailsPrompt then GetFIntLuaAppThrottleRefreshPlayabilityIntervalSecondsFunction() else nil

local function sanitizeGameInfo(p1)
	-- upvalues: TrimFunction (copy)
	if p1.name then
		p1.name = TrimFunction(p1.name)
	end
	return p1
end

return function()
	-- upvalues: FFlagLuaAppInExperienceDetailsPrompt (copy), CreateDataCacheModule (copy), FIntLuaAppThrottleRefreshPlayabilityIntervalSeconds (copy), sanitizeGameInfo (copy), CreateDataResolverModule (copy), LogResponseErrorFunction (copy), DiscoveryEventErrorLogger (copy), DashModule (copy), FetchGameDetailsModule (copy), GameInfoStoreTypesModule (copy), FFlagLuaAppDataHydrationPlayerCountGameInfoStore (copy), FFlagMigrateGameInfoToStore (copy), FFlagLuaAppDataHydrationUpdateItem (copy)
	local t = {}
	
	local function _(p1, p2)
		-- upvalues: t (copy)
		if p2 and p2.rootPlaceId then
			t[tostring(p2.rootPlaceId)] = p1
		end
	end
	
	local DataCacheModule = if FFlagLuaAppInExperienceDetailsPrompt then CreateDataCacheModule(FIntLuaAppThrottleRefreshPlayabilityIntervalSeconds, nil, { sanitizeItem = sanitizeGameInfo }) else CreateDataCacheModule(nil, nil, { sanitizeItem = sanitizeGameInfo })
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		logError = if FFlagLuaAppInExperienceDetailsPrompt then function(p1)
			-- upvalues: LogResponseErrorFunction (upval), DiscoveryEventErrorLogger (upval)
			if type(p1) == "table" then
				if p1.responseCode then
					LogResponseErrorFunction("v1/games/universeIds", { StatusCode = tonumber(p1.responseCode) })
				end
				if p1.errorType and p1.errorMessage then
					DiscoveryEventErrorLogger.reportError(p1.errorType, p1.errorMessage, p1.customFields)
					
					return
				end
			else
				DiscoveryEventErrorLogger.reportError("FetchGameDetailsError", (tostring(p1)))
			end
		end else nil,
		fetchFn = function(p1)
			-- upvalues: DashModule (upval), FetchGameDetailsModule (upval), FFlagLuaAppInExperienceDetailsPrompt (upval), GameInfoStoreTypesModule (upval), FFlagLuaAppDataHydrationPlayerCountGameInfoStore (upval), FFlagMigrateGameInfoToStore (upval), t (copy)
			local KeysResult = DashModule.keys(p1)
			
			return FetchGameDetailsModule(KeysResult):andThen(function(Result)
				-- upvalues: FFlagLuaAppInExperienceDetailsPrompt (upval), KeysResult (copy), GameInfoStoreTypesModule (upval), FFlagLuaAppDataHydrationPlayerCountGameInfoStore (upval), DashModule (upval), FFlagMigrateGameInfoToStore (upval), t (upval)
				if FFlagLuaAppInExperienceDetailsPrompt then
					if not Result or not Result.responseBody then
						error({
							errorType = "FetchGameDetailsResponseError",
							responseCode = Result and Result.responseCode,
							errorMessage = if Result then "Missing response body" else "No response",
							customFields = { universeIds = KeysResult }
						})
					end
				else
					if not Result then
						error("No response")
					end
					if not Result.responseBody or not Result.responseBody.data then
						error(`Response Code: {Result.reponseCode}`)
					end
				end
				if FFlagLuaAppInExperienceDetailsPrompt then
					local GameInfoResponseValidatorResult, GameInfoResponseValidatorResult2 = GameInfoStoreTypesModule.gameInfoResponseValidator(Result.responseBody)
					
					if not GameInfoResponseValidatorResult then
						error({
							errorType = "FetchGameDetailsResponseInvalidInterface",
							responseCode = Result.responseCode,
							errorMessage = GameInfoResponseValidatorResult2,
							customFields = { universeIds = KeysResult }
						})
					end
				end
				local t1 = {}
				local Data = Result.responseBody.data
				
				if FFlagLuaAppInExperienceDetailsPrompt then
					for _, entry in Data do
						if entry then
							t1[tostring(entry.id)] = {
								name = entry.name,
								rootPlaceId = tostring(entry.rootPlaceId),
								universeId = tostring(entry.id),
								description = entry.description,
								creator = if entry.creator then {
									id = tostring(entry.creator.id),
									name = entry.creator.name,
									hasVerifiedBadge = entry.creator.hasVerifiedBadge
								} else nil,
								playerCount = if FFlagLuaAppDataHydrationPlayerCountGameInfoStore then entry.playing else nil,
								totalVisits = entry.visits
							}
						end
					end
					for _, value in KeysResult do
						if not t1[tostring(value)] then
							t1[tostring(value)] = { isUnavailable = true }
						end
					end
				else
					DashModule.forEach(Data, function(p2)
						-- upvalues: t1 (copy), FFlagLuaAppDataHydrationPlayerCountGameInfoStore (upval)
						t1[tostring(p2.id)] = {
							name = p2.name,
							rootPlaceId = tostring(p2.rootPlaceId),
							universeId = tostring(p2.id),
							playerCount = if FFlagLuaAppDataHydrationPlayerCountGameInfoStore then p2.playing else nil,
							totalVisits = p2.visits
						}
					end)
				end
				if FFlagMigrateGameInfoToStore then
					for i, value1 in t1 do
						if value1 and value1.rootPlaceId then
							t[tostring(value1.rootPlaceId)] = i
						end
					end
				end
				return t1
			end):catch(function(Err)
				error(Err)
			end)
		end
	})
	
	local function updateGameInfo(p2, p3, p4)
		-- upvalues: t (copy), FFlagMigrateGameInfoToStore (upval), DataCacheModule (copy)
		if p3 and p3.rootPlaceId then
			t[tostring(p3.rootPlaceId)] = p2
		end
		if FFlagMigrateGameInfoToStore then
			DataCacheModule.updateItem(p2, p3, p4)
			
			return
		else
			DataCacheModule.updateItem(p2, p3)
		end
	end
	
	local function updateGameInfos(List, p2)
		-- upvalues: t (copy), FFlagMigrateGameInfoToStore (upval), DataCacheModule (copy)
		for i, value in List do
			if value and value.rootPlaceId then
				t[tostring(value.rootPlaceId)] = i
			end
		end
		if FFlagMigrateGameInfoToStore then
			DataCacheModule.updateItems(List, p2)
			
			return
		else
			DataCacheModule.updateItems(List)
		end
	end
	
	local function getUniverseIdForPlaceId(p3)
		-- upvalues: t (copy)
		return t[tostring(p3)]
	end
	
	local function clear()
		-- upvalues: FFlagLuaAppInExperienceDetailsPrompt (upval), DataCacheModule (copy), DataResolverModule (copy)
		if not FFlagLuaAppInExperienceDetailsPrompt then
			DataCacheModule.clear()
			DataResolverModule.clear()
		end
	end
	
	local function dispose()
		-- upvalues: FFlagLuaAppInExperienceDetailsPrompt (upval), DataCacheModule (copy), DataResolverModule (copy)
		if not FFlagLuaAppInExperienceDetailsPrompt then
			DataCacheModule.dispose()
			DataResolverModule.dispose()
		end
	end
	
	return {
		fetchGameInfo = DataResolverModule.fetchItem,
		fetchGameInfos = DataResolverModule.fetchItems,
		getGameInfo = DataResolverModule.getCachedItem,
		getGameInfos = DataResolverModule.getCachedItems,
		getAndFetchGameInfo = DataResolverModule.getAndFetchItem,
		getAndFetchGameInfos = DataResolverModule.getAndFetchItems,
		updateGameInfo = if FFlagLuaAppDataHydrationUpdateItem then if FFlagMigrateGameInfoToStore then updateGameInfo else DataCacheModule.updateItem else nil,
		updateGameInfos = if FFlagMigrateGameInfoToStore then updateGameInfos else DataCacheModule.updateItems,
		getUniverseIdForPlaceId = if FFlagMigrateGameInfoToStore then getUniverseIdForPlaceId else nil,
		applyVoteChange = function(p3, Enabled1, Enabled)
			-- upvalues: DataResolverModule (copy), FFlagMigrateGameInfoToStore (upval), DataCacheModule (copy)
			local CachedItem = DataResolverModule.getCachedItem(p3)
			local DataResult = CachedItem and CachedItem.data(false)
			
			if not DataResult or DataResult.totalUpVotes == nil then
				return nil
			end
			local Number: number = tonumber(DataResult.totalUpVotes) or 0
			local Number1: number = tonumber(DataResult.totalDownVotes) or 0
			local config = {
				totalUpVotes = DataResult.totalUpVotes,
				totalDownVotes = DataResult.totalDownVotes
			}
			local v1 = (if Enabled == true then 1 else 0) - (if Enabled1 == true then 1 else 0)
			local v2 = (if Enabled == false then 1 else 0) - (if Enabled1 == false then 1 else 0)
			
			if FFlagMigrateGameInfoToStore then
				DataCacheModule.updateItem(p3, {
					totalUpVotes = tostring((math.max(0, Number + v1))),
					totalDownVotes = tostring((math.max(0, Number1 + v2)))
				}, false)
				
				return config
			else
				DataCacheModule.updateItem(p3, {
					totalUpVotes = tostring((math.max(0, Number + v1))),
					totalDownVotes = tostring((math.max(0, Number1 + v2)))
				})
				
				return config
			end
		end,
		clear = if FFlagLuaAppInExperienceDetailsPrompt then DataResolverModule.clear else clear,
		dispose = if FFlagLuaAppInExperienceDetailsPrompt then DataResolverModule.dispose else dispose
	}
end