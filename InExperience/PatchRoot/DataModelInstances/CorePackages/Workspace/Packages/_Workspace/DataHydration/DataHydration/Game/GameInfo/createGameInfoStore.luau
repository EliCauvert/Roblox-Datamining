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
local GetFIntLuaAppThrottleRefreshPlayabilityIntervalSecondsFunction = require(Parent.SharedFlags).GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds
local FFlagLuaAppDataHydrationUpdateItem = require(Parent.SharedFlags).FFlagLuaAppDataHydrationUpdateItem
local FIntLuaAppThrottleRefreshPlayabilityIntervalSeconds = if FFlagLuaAppInExperienceDetailsPrompt then GetFIntLuaAppThrottleRefreshPlayabilityIntervalSecondsFunction() else nil

local function sanitizeGameInfo(p1)
	-- upvalues: TrimFunction (copy)
	if p1.name then
		p1.name = TrimFunction(p1.name)
	end
	return p1
end

return function()
	-- upvalues: FFlagLuaAppInExperienceDetailsPrompt (copy), CreateDataCacheModule (copy), FIntLuaAppThrottleRefreshPlayabilityIntervalSeconds (copy), sanitizeGameInfo (copy), CreateDataResolverModule (copy), LogResponseErrorFunction (copy), DiscoveryEventErrorLogger (copy), DashModule (copy), FetchGameDetailsModule (copy), GameInfoStoreTypesModule (copy), FFlagLuaAppDataHydrationUpdateItem (copy)
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
			-- upvalues: DashModule (upval), FetchGameDetailsModule (upval), FFlagLuaAppInExperienceDetailsPrompt (upval), GameInfoStoreTypesModule (upval), t (copy)
			local KeysResult = DashModule.keys(p1)
			
			return FetchGameDetailsModule(KeysResult):andThen(function(Result)
				-- upvalues: FFlagLuaAppInExperienceDetailsPrompt (upval), KeysResult (copy), GameInfoStoreTypesModule (upval), DashModule (upval), t (upval)
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
								playerCount = entry.playing,
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
						-- upvalues: t1 (copy)
						t1[tostring(p2.id)] = {
							name = p2.name,
							rootPlaceId = tostring(p2.rootPlaceId),
							universeId = tostring(p2.id),
							playerCount = p2.playing,
							totalVisits = p2.visits
						}
					end)
				end
				for i, value1 in t1 do
					if value1 and value1.rootPlaceId then
						t[tostring(value1.rootPlaceId)] = i
					end
				end
				return t1
			end):catch(function(Err)
				error(Err)
			end)
		end
	})
	
	local function updateGameInfo(p2, p3, p4)
		-- upvalues: t (copy), DataCacheModule (copy)
		if p3 and p3.rootPlaceId then
			t[tostring(p3.rootPlaceId)] = p2
		end
		DataCacheModule.updateItem(p2, p3, p4)
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
		updateGameInfo = if FFlagLuaAppDataHydrationUpdateItem then updateGameInfo else nil,
		updateGameInfos = function(List, p2)
			-- upvalues: t (copy), DataCacheModule (copy)
			for i, value in List do
				if value and value.rootPlaceId then
					t[tostring(value.rootPlaceId)] = i
				end
			end
			DataCacheModule.updateItems(List, p2)
		end,
		getUniverseIdForPlaceId = function(p3)
			-- upvalues: t (copy)
			return t[tostring(p3)]
		end,
		applyVoteChange = function(p3, Enabled1, Enabled)
			-- upvalues: DataResolverModule (copy), DataCacheModule (copy)
			local CachedItem = DataResolverModule.getCachedItem(p3)
			local DataResult = CachedItem and CachedItem.data(false)
			
			if DataResult and DataResult.totalUpVotes ~= nil then
				local config = {
					totalUpVotes = DataResult.totalUpVotes,
					totalDownVotes = DataResult.totalDownVotes
				}
				DataCacheModule.updateItem(p3, {
					totalUpVotes = tostring((math.max(0, (tonumber(DataResult.totalUpVotes) or 0) + ((if Enabled == true then 1 else 0) - (if Enabled1 == true then 1 else 0))))),
					totalDownVotes = tostring((math.max(0, (tonumber(DataResult.totalDownVotes) or 0) + ((if Enabled == false then 1 else 0) - (if Enabled1 == false then 1 else 0)))))
				}, false)
				
				return config
			else
				return nil
			end
		end,
		clear = if FFlagLuaAppInExperienceDetailsPrompt then DataResolverModule.clear else clear,
		dispose = if FFlagLuaAppInExperienceDetailsPrompt then DataResolverModule.dispose else dispose
	}
end