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
local fFlagLuaAppSduiBadgeDetailsComponents = require(parent.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents
local fFlagLuaAppDataHydrationSanitizeItem = require(parent.SharedFlags).FFlagLuaAppDataHydrationSanitizeItem
local var7 = if fFlagLuaAppInExperienceDetailsPrompt then getFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds() else nil

local function sanitizeGameInfo(p0) --[[ line: 38 ]]
	-- upvalues: trim (ref)
	if p0.name then
		p0.name = trim(p0.name)
	end
	return p0
end

return function() --[[ line: 45 | named "createGameInfoStore" ]]
	-- upvalues: fFlagLuaAppInExperienceDetailsPrompt (ref), createDataCacheModule (ref), var7 (ref), fFlagLuaAppDataHydrationSanitizeItem (ref), sanitizeGameInfo (ref), createDataResolverModule (ref), logResponseError (ref), discoveryEventErrorLogger (ref), dashModule (ref), fetchGameDetailsModule (ref), gameInfoStoreTypesModule (ref), fFlagLuaAppDataHydrationPlayerCountGameInfoStore (ref), fFlagLuaAppDataHydrationUpdateItem (ref), fFlagLuaAppSduiBadgeDetailsComponents (ref), fFlagSduiExperienceDetailsSupport (ref)
	local var9 = if fFlagLuaAppInExperienceDetailsPrompt then createDataCacheModule(var7, nil, if fFlagLuaAppDataHydrationSanitizeItem then { sanitizeItem = sanitizeGameInfo } else nil) else createDataCacheModule(nil, nil, if fFlagLuaAppDataHydrationSanitizeItem then { sanitizeItem = sanitizeGameInfo } else nil)
	local var10 = createDataResolverModule({
		cache = var9,
		logError = if fFlagLuaAppInExperienceDetailsPrompt then function(p1) --[[ line: 60 ]]
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
		fetchFn = function(p2) --[[ line: 78 ]]
			-- upvalues: dashModule (copy), fetchGameDetailsModule (copy), fFlagLuaAppInExperienceDetailsPrompt (copy), gameInfoStoreTypesModule (copy), fFlagLuaAppDataHydrationPlayerCountGameInfoStore (copy)
			local var11 = dashModule.keys(p2)
			
			return fetchGameDetailsModule(var11):andThen(function(p4) --[[ line: 83 ]]
				-- upvalues: fFlagLuaAppInExperienceDetailsPrompt (copy), var11 (ref), gameInfoStoreTypesModule (copy), fFlagLuaAppDataHydrationPlayerCountGameInfoStore (copy), dashModule (copy)
				if not fFlagLuaAppInExperienceDetailsPrompt then
					if not p4 then
						error("No response")
					end
					if not p4.responseBody or not p4.responseBody.data then
						error(`Response Code: {p4.reponseCode}`)
					end
				elseif not p4 or not p4.responseBody then
					error({
						errorType = "FetchGameDetailsResponseError",
						responseCode = p4 and p4.responseCode,
						errorMessage = if p4 then "Missing response body" else "No response",
						customFields = { universeIds = var11 }
					})
				end
				if fFlagLuaAppInExperienceDetailsPrompt then
					local var12, var13 = gameInfoStoreTypesModule.gameInfoResponseValidator(p4.responseBody)
					
					if not var12 then
						error({
							errorType = "FetchGameDetailsResponseInvalidInterface",
							responseCode = p4.responseCode,
							errorMessage = var13,
							customFields = { universeIds = var11 }
						})
					end
				end
				local t = {}
				local data = p4.responseBody.data
				
				if not fFlagLuaAppInExperienceDetailsPrompt then
					dashModule.forEach(data, function(p5) --[[ line: 146 ]]
						-- upvalues: t (ref), fFlagLuaAppDataHydrationPlayerCountGameInfoStore (copy)
						t[tostring(p5.id)] = {
							name = p5.name,
							rootPlaceId = tostring(p5.rootPlaceId),
							universeId = tostring(p5.id),
							playerCount = if fFlagLuaAppDataHydrationPlayerCountGameInfoStore then p5.playing else nil
						}
					end)
					
					return t
				end
				for i, v in data do
					if v then
						t[tostring(v.id)] = {
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
				for i, v_1 in var11 do
					if not t[tostring(v_1)] then
						t[tostring(v_1)] = { isUnavailable = true }
					end
				end
				return t
			end):catch(function(p3) --[[ line: 160 ]]
				error(p3)
			end)
		end
	})
	
	return {
		fetchGameInfo = var10.fetchItem,
		fetchGameInfos = var10.fetchItems,
		getGameInfo = var10.getCachedItem,
		getGameInfos = var10.getCachedItems,
		getAndFetchGameInfo = var10.getAndFetchItem,
		getAndFetchGameInfos = var10.getAndFetchItems,
		updateGameInfo = if fFlagLuaAppDataHydrationUpdateItem then var9.updateItem else nil,
		updateGameInfos = if fFlagLuaAppSduiBadgeDetailsComponents then var9.updateItems else nil,
		applyVoteChange = if fFlagSduiExperienceDetailsSupport then function(p6, p7, p8) --[[ line: 166 | named "applyVoteChange" ]]
			-- upvalues: var10 (ref), var9 (ref)
			local cachedItem = var10.getCachedItem(p6)
			local var16 = cachedItem and cachedItem.data(false)
			
			if var16 and var16.totalUpVotes ~= nil then
				local t = {
					totalUpVotes = var16.totalUpVotes,
					totalDownVotes = var16.totalDownVotes
				}
				var9.updateItem(p6, {
					totalUpVotes = tostring(math.max(0, (tonumber(var16.totalUpVotes) or 0) + ((if p8 == true then 1 else 0) - (if p7 == true then 1 else 0)))),
					totalDownVotes = tostring(math.max(0, (tonumber(var16.totalDownVotes) or 0) + ((if p8 == false then 1 else 0) - (if p7 == false then 1 else 0))))
				})
				
				return t
			end
			return nil
		end else nil,
		clear = if fFlagLuaAppInExperienceDetailsPrompt then var10.clear else function() --[[ line: 192 | named "clear" ]]
			-- upvalues: fFlagLuaAppInExperienceDetailsPrompt (copy), var9 (ref), var10 (ref)
			if not fFlagLuaAppInExperienceDetailsPrompt then
				var9.clear()
				var10.clear()
			end
		end,
		dispose = if fFlagLuaAppInExperienceDetailsPrompt then var10.dispose else function() --[[ line: 199 | named "dispose" ]]
			-- upvalues: fFlagLuaAppInExperienceDetailsPrompt (copy), var9 (ref), var10 (ref)
			if not fFlagLuaAppInExperienceDetailsPrompt then
				var9.dispose()
				var10.dispose()
			end
		end
	}
end