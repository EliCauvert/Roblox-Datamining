local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local dashModule = require(parent.Dash)
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local logResponseError = discoveryUtilsModule.logResponseError
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchGameDetailsModule = require(script.Parent.fetchGameDetails)
local gameInfoStoreTypesModule = require(script.Parent.GameInfoStoreTypes)
local trim = require(parent.LuauPolyfill).String.trim
local fFlagLuaAppInExperienceDetailsPrompt = require(parent.SharedFlags).FFlagLuaAppInExperienceDetailsPrompt
local fFlagLuaAppDataHydrationPlayerCountGameInfoStore = require(parent.SharedFlags).FFlagLuaAppDataHydrationPlayerCountGameInfoStore
local getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds = require(parent.SharedFlags).GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds
local fFlagLuaAppDataHydrationUpdateItem = require(parent.SharedFlags).FFlagLuaAppDataHydrationUpdateItem
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagLuaAppDataHydrationSanitizeItem = require(parent.SharedFlags).FFlagLuaAppDataHydrationSanitizeItem
local fFlagMigrateGameInfoToStore = require(parent.SharedFlags).FFlagMigrateGameInfoToStore
local var7 = if fFlagLuaAppInExperienceDetailsPrompt then getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds() else nil

local function sanitizeGameInfo(p0) --[[ line: 38 ]]
	-- upvalues: trim (ref)
	if p0.name then
		p0.name = trim(p0.name)
	end
	return p0
end

return function() --[[ line: 45 | named "createGameInfoStore" ]]
	-- upvalues: fFlagLuaAppInExperienceDetailsPrompt (ref), createDataCacheModule (ref), var7 (ref), fFlagLuaAppDataHydrationSanitizeItem (ref), sanitizeGameInfo (ref), createDataResolverModule (ref), logResponseError (ref), discoveryEventErrorLogger (ref), dashModule (ref), fetchGameDetailsModule (ref), gameInfoStoreTypesModule (ref), fFlagLuaAppDataHydrationPlayerCountGameInfoStore (ref), fFlagMigrateGameInfoToStore (ref), fFlagLuaAppDataHydrationUpdateItem (ref), fFlagSduiExperienceDetailsSupport (ref)
	local t = {}
	
	local function _(p1, p2) --[[ line: 51 | named "indexPlaceId" ]]
		-- upvalues: t (ref)
		if p2 and p2.rootPlaceId then
			t[tostring(p2.rootPlaceId)] = p1
		end
	end
	
	local var10 = if fFlagLuaAppInExperienceDetailsPrompt then createDataCacheModule(var7, nil, if fFlagLuaAppDataHydrationSanitizeItem then { sanitizeItem = sanitizeGameInfo } else nil) else createDataCacheModule(nil, nil, if fFlagLuaAppDataHydrationSanitizeItem then { sanitizeItem = sanitizeGameInfo } else nil)
	local var11 = createDataResolverModule({
		cache = var10,
		logError = if fFlagLuaAppInExperienceDetailsPrompt then function(p3) --[[ line: 71 ]]
			-- upvalues: logResponseError (copy), discoveryEventErrorLogger (copy)
			if type(p3) == "table" then
				if p3.responseCode then
					logResponseError("v1/games/universeIds", { StatusCode = tonumber(p3.responseCode) })
				end
				if p3.errorType and p3.errorMessage then
					discoveryEventErrorLogger.reportError(p3.errorType, p3.errorMessage, p3.customFields)
					
					return
				end
			else
				discoveryEventErrorLogger.reportError("FetchGameDetailsError", tostring(p3))
			end
		end else nil,
		fetchFn = function(p4) --[[ line: 89 ]]
			-- upvalues: dashModule (copy), fetchGameDetailsModule (copy), fFlagLuaAppInExperienceDetailsPrompt (copy), gameInfoStoreTypesModule (copy), fFlagLuaAppDataHydrationPlayerCountGameInfoStore (copy), fFlagMigrateGameInfoToStore (copy), t (ref)
			local var12 = dashModule.keys(p4)
			
			return fetchGameDetailsModule(var12):andThen(function(p6) --[[ line: 94 ]]
				-- upvalues: fFlagLuaAppInExperienceDetailsPrompt (copy), var12 (ref), gameInfoStoreTypesModule (copy), fFlagLuaAppDataHydrationPlayerCountGameInfoStore (copy), dashModule (copy), fFlagMigrateGameInfoToStore (copy), t (copy)
				if not fFlagLuaAppInExperienceDetailsPrompt then
					if not p6 then
						error("No response")
					end
					if not p6.responseBody or not p6.responseBody.data then
						error(`Response Code: {p6.reponseCode}`)
					end
				elseif not p6 or not p6.responseBody then
					error({
						errorType = "FetchGameDetailsResponseError",
						responseCode = p6 and p6.responseCode,
						errorMessage = if p6 then "Missing response body" else "No response",
						customFields = { universeIds = var12 }
					})
				end
				if fFlagLuaAppInExperienceDetailsPrompt then
					local var13, var14 = gameInfoStoreTypesModule.gameInfoResponseValidator(p6.responseBody)
					
					if not var13 then
						error({
							errorType = "FetchGameDetailsResponseInvalidInterface",
							responseCode = p6.responseCode,
							errorMessage = var14,
							customFields = { universeIds = var12 }
						})
					end
				end
				local t_1 = {}
				local data = p6.responseBody.data
				
				if fFlagLuaAppInExperienceDetailsPrompt then
					for i, v in data do
						if v then
							t_1[tostring(v.id)] = {
								name = v.name,
								rootPlaceId = tostring(v.rootPlaceId),
								universeId = tostring(v.id),
								description = v.description,
								creator = if v.creator then {
									id = tostring(v.creator.id),
									name = v.creator.name,
									hasVerifiedBadge = v.creator.hasVerifiedBadge
								} else nil,
								playerCount = if fFlagLuaAppDataHydrationPlayerCountGameInfoStore then v.playing else nil
							}
						end
					end
					for i_1, v_1 in var12 do
						if not t_1[tostring(v_1)] then
							t_1[tostring(v_1)] = { isUnavailable = true }
						end
					end
				else
					dashModule.forEach(data, function(p7) --[[ line: 157 ]]
						-- upvalues: t_1 (ref), fFlagLuaAppDataHydrationPlayerCountGameInfoStore (copy)
						t_1[tostring(p7.id)] = {
							name = p7.name,
							rootPlaceId = tostring(p7.rootPlaceId),
							universeId = tostring(p7.id),
							playerCount = if fFlagLuaAppDataHydrationPlayerCountGameInfoStore then p7.playing else nil
						}
					end)
				end
				if fFlagMigrateGameInfoToStore then
					for i, v in t_1 do
						if v and v.rootPlaceId then
							t[tostring(v.rootPlaceId)] = i
						end
					end
				end
				return t_1
			end):catch(function(p5) --[[ line: 177 ]]
				error(p5)
			end)
		end
	})
	
	return {
		fetchGameInfo = var11.fetchItem,
		fetchGameInfos = var11.fetchItems,
		getGameInfo = var11.getCachedItem,
		getGameInfos = var11.getCachedItems,
		getAndFetchGameInfo = var11.getAndFetchItem,
		getAndFetchGameInfos = var11.getAndFetchItems,
		updateGameInfo = if fFlagLuaAppDataHydrationUpdateItem then if fFlagMigrateGameInfoToStore then function(p8, p9) --[[ line: 209 | named "updateGameInfo" ]]
			-- upvalues: t (ref), var10 (ref)
			if p9 and p9.rootPlaceId then
				t[tostring(p9.rootPlaceId)] = p8
			end
			var10.updateItem(p8, p9)
		end else var10.updateItem else nil,
		updateGameInfos = if fFlagMigrateGameInfoToStore then function(p10) --[[ line: 214 | named "updateGameInfos" ]]
			-- upvalues: t (ref), var10 (ref)
			for i, v in p10 do
				if v and v.rootPlaceId then
					t[tostring(v.rootPlaceId)] = i
				end
			end
			var10.updateItems(p10)
		end else var10.updateItems,
		getUniverseIdForPlaceId = if fFlagMigrateGameInfoToStore then function(p11) --[[ line: 221 | named "getUniverseIdForPlaceId" ]]
			-- upvalues: t (ref)
			return t[tostring(p11)]
		end else nil,
		applyVoteChange = if fFlagSduiExperienceDetailsSupport then function(p12, p13, p14) --[[ line: 183 | named "applyVoteChange" ]]
			-- upvalues: var11 (ref), var10 (ref)
			local cachedItem = var11.getCachedItem(p12)
			local var17 = cachedItem and cachedItem.data(false)
			
			if var17 and var17.totalUpVotes ~= nil then
				local t = {
					totalUpVotes = var17.totalUpVotes,
					totalDownVotes = var17.totalDownVotes
				}
				var10.updateItem(p12, {
					totalUpVotes = tostring(math.max(0, (tonumber(var17.totalUpVotes) or 0) + ((if p14 == true then 1 else 0) - (if p13 == true then 1 else 0)))),
					totalDownVotes = tostring(math.max(0, (tonumber(var17.totalDownVotes) or 0) + ((if p14 == false then 1 else 0) - (if p13 == false then 1 else 0))))
				})
				
				return t
			end
			return nil
		end else nil,
		clear = if fFlagLuaAppInExperienceDetailsPrompt then var11.clear else function() --[[ line: 225 | named "clear" ]]
			-- upvalues: fFlagLuaAppInExperienceDetailsPrompt (copy), var10 (ref), var11 (ref)
			if not fFlagLuaAppInExperienceDetailsPrompt then
				var10.clear()
				var11.clear()
			end
		end,
		dispose = if fFlagLuaAppInExperienceDetailsPrompt then var11.dispose else function() --[[ line: 232 | named "dispose" ]]
			-- upvalues: fFlagLuaAppInExperienceDetailsPrompt (copy), var10 (ref), var11 (ref)
			if not fFlagLuaAppInExperienceDetailsPrompt then
				var10.dispose()
				var11.dispose()
			end
		end
	}
end