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
local fFlagLuaAppDataHydrationTotalVisitsGameInfoStore = require(parent.SharedFlags).FFlagLuaAppDataHydrationTotalVisitsGameInfoStore
local getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds = require(parent.SharedFlags).GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds
local fFlagLuaAppDataHydrationUpdateItem = require(parent.SharedFlags).FFlagLuaAppDataHydrationUpdateItem
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagMigrateGameInfoToStore = require(parent.SharedFlags).FFlagMigrateGameInfoToStore
local var1 = if fFlagLuaAppInExperienceDetailsPrompt then getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds() else nil

local function sanitizeGameInfo(p1)
	-- upvalues: trim (ref)
	if p1.name then
		p1.name = trim(p1.name)
	end
	return p1
end

return function()
	-- upvalues: fFlagLuaAppInExperienceDetailsPrompt (ref), createDataCacheModule (ref), var1 (ref), sanitizeGameInfo (ref), createDataResolverModule (ref), logResponseError (ref), discoveryEventErrorLogger (ref), dashModule (ref), fetchGameDetailsModule (ref), gameInfoStoreTypesModule (ref), fFlagLuaAppDataHydrationPlayerCountGameInfoStore (ref), fFlagLuaAppDataHydrationTotalVisitsGameInfoStore (ref), fFlagMigrateGameInfoToStore (ref), fFlagLuaAppDataHydrationUpdateItem (ref), fFlagSduiExperienceDetailsSupport (ref)
	local t = {}
	
	local function _(p1, p2)
		-- upvalues: t (ref)
		if p2 and p2.rootPlaceId then
			t[tostring(p2.rootPlaceId)] = p1
		end
	end
	
	local var2 = if fFlagLuaAppInExperienceDetailsPrompt then createDataCacheModule(var1, nil, { sanitizeItem = sanitizeGameInfo }) else createDataCacheModule(nil, nil, { sanitizeItem = sanitizeGameInfo })
	local var3 = createDataResolverModule({
		cache = var2,
		logError = if fFlagLuaAppInExperienceDetailsPrompt then function(p1)
			-- upvalues: logResponseError (copy), discoveryEventErrorLogger (copy)
			if type(p1) == "table" then
				if p1.responseCode then
					logResponseError("v1/games/universeIds", { StatusCode = tonumber(p1.responseCode) })
				end
				if p1.errorType and p1.errorMessage then
					discoveryEventErrorLogger.reportError(p1.errorType, p1.errorMessage, p1.customFields)
					
					return
				end
			else
				discoveryEventErrorLogger.reportError("FetchGameDetailsError", tostring(p1))
			end
		end else nil,
		fetchFn = function(p1)
			-- upvalues: dashModule (copy), fetchGameDetailsModule (copy), fFlagLuaAppInExperienceDetailsPrompt (copy), gameInfoStoreTypesModule (copy), fFlagLuaAppDataHydrationPlayerCountGameInfoStore (copy), fFlagLuaAppDataHydrationTotalVisitsGameInfoStore (copy), fFlagMigrateGameInfoToStore (copy), t (ref)
			local var4 = dashModule.keys(p1)
			
			return fetchGameDetailsModule(var4):andThen(function(p2)
				-- upvalues: fFlagLuaAppInExperienceDetailsPrompt (copy), var4 (ref), gameInfoStoreTypesModule (copy), fFlagLuaAppDataHydrationPlayerCountGameInfoStore (copy), fFlagLuaAppDataHydrationTotalVisitsGameInfoStore (copy), dashModule (copy), fFlagMigrateGameInfoToStore (copy), t (copy)
				if not fFlagLuaAppInExperienceDetailsPrompt then
					if not p2 then
						error("No response")
					end
					if not p2.responseBody or not p2.responseBody.data then
						error(`Response Code: {p2.reponseCode}`)
					end
				elseif not p2 or not p2.responseBody then
					error({
						errorType = "FetchGameDetailsResponseError",
						responseCode = p2 and p2.responseCode,
						errorMessage = if p2 then "Missing response body" else "No response",
						customFields = { universeIds = var4 }
					})
				end
				if fFlagLuaAppInExperienceDetailsPrompt then
					local var5, var6 = gameInfoStoreTypesModule.gameInfoResponseValidator(p2.responseBody)
					
					if not var5 then
						error({
							errorType = "FetchGameDetailsResponseInvalidInterface",
							responseCode = p2.responseCode,
							errorMessage = var6,
							customFields = { universeIds = var4 }
						})
					end
				end
				local t_1 = {}
				local data = p2.responseBody.data
				
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
								playerCount = if fFlagLuaAppDataHydrationPlayerCountGameInfoStore then v.playing else nil,
								totalVisits = if fFlagLuaAppDataHydrationTotalVisitsGameInfoStore then v.visits else nil
							}
						end
					end
					for i_1, v_1 in var4 do
						if not t_1[tostring(v_1)] then
							t_1[tostring(v_1)] = { isUnavailable = true }
						end
					end
				else
					dashModule.forEach(data, function(p3)
						-- upvalues: t_1 (ref), fFlagLuaAppDataHydrationPlayerCountGameInfoStore (copy), fFlagLuaAppDataHydrationTotalVisitsGameInfoStore (copy)
						t_1[tostring(p3.id)] = {
							name = p3.name,
							rootPlaceId = tostring(p3.rootPlaceId),
							universeId = tostring(p3.id),
							playerCount = if fFlagLuaAppDataHydrationPlayerCountGameInfoStore then p3.playing else nil,
							totalVisits = if fFlagLuaAppDataHydrationTotalVisitsGameInfoStore then p3.visits else nil
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
			end):catch(function(p3)
				error(p3)
			end)
		end
	})
	
	return {
		fetchGameInfo = var3.fetchItem,
		fetchGameInfos = var3.fetchItems,
		getGameInfo = var3.getCachedItem,
		getGameInfos = var3.getCachedItems,
		getAndFetchGameInfo = var3.getAndFetchItem,
		getAndFetchGameInfos = var3.getAndFetchItems,
		updateGameInfo = if fFlagLuaAppDataHydrationUpdateItem then if fFlagMigrateGameInfoToStore then function(p3, p4, p5)
			-- upvalues: t (ref), fFlagMigrateGameInfoToStore (copy), var2 (ref)
			if p4 and p4.rootPlaceId then
				t[tostring(p4.rootPlaceId)] = p3
			end
			if fFlagMigrateGameInfoToStore then
				var2.updateItem(p3, p4, p5)
				
				return
			end
			var2.updateItem(p3, p4)
		end else var2.updateItem else nil,
		updateGameInfos = if fFlagMigrateGameInfoToStore then function(p3, p4)
			-- upvalues: t (ref), fFlagMigrateGameInfoToStore (copy), var2 (ref)
			for i, v in p3 do
				if v and v.rootPlaceId then
					t[tostring(v.rootPlaceId)] = i
				end
			end
			if fFlagMigrateGameInfoToStore then
				var2.updateItems(p3, p4)
				
				return
			end
			var2.updateItems(p3)
		end else var2.updateItems,
		getUniverseIdForPlaceId = if fFlagMigrateGameInfoToStore then function(p5)
			-- upvalues: t (ref)
			return t[tostring(p5)]
		end else nil,
		applyVoteChange = if fFlagSduiExperienceDetailsSupport then function(p5, p6, p7)
			-- upvalues: var3 (ref), fFlagMigrateGameInfoToStore (copy), var2 (ref)
			local cachedItem = var3.getCachedItem(p5)
			local var7 = cachedItem and cachedItem.data(false)
			
			if not var7 or var7.totalUpVotes == nil then
				return nil
			end
			local totalUpVotes = tonumber(var7.totalUpVotes) or 0
			local totalDownVotes = tonumber(var7.totalDownVotes) or 0
			local t = {
				totalUpVotes = var7.totalUpVotes,
				totalDownVotes = var7.totalDownVotes
			}
			local var8 = (if p7 == true then 1 else 0) - (if p6 == true then 1 else 0)
			local var9 = (if p7 == false then 1 else 0) - (if p6 == false then 1 else 0)
			
			if fFlagMigrateGameInfoToStore then
				var2.updateItem(p5, {
					totalUpVotes = tostring(math.max(0, totalUpVotes + var8)),
					totalDownVotes = tostring(math.max(0, totalDownVotes + var9))
				}, false)
				
				return t
			end
			var2.updateItem(p5, {
				totalUpVotes = tostring(math.max(0, totalUpVotes + var8)),
				totalDownVotes = tostring(math.max(0, totalDownVotes + var9))
			})
			
			return t
		end else nil,
		clear = if fFlagLuaAppInExperienceDetailsPrompt then var3.clear else function()
			-- upvalues: fFlagLuaAppInExperienceDetailsPrompt (copy), var2 (ref), var3 (ref)
			if not fFlagLuaAppInExperienceDetailsPrompt then
				var2.clear()
				var3.clear()
			end
		end,
		dispose = if fFlagLuaAppInExperienceDetailsPrompt then var3.dispose else function()
			-- upvalues: fFlagLuaAppInExperienceDetailsPrompt (copy), var2 (ref), var3 (ref)
			if not fFlagLuaAppInExperienceDetailsPrompt then
				var2.dispose()
				var3.dispose()
			end
		end
	}
end