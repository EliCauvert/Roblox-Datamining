local httpService = game:GetService("HttpService")
local parent = script.Parent.Parent
local httpRequestModule = require(parent.HttpRequest)
local sharedFlagsModule = require(parent.SharedFlags)
local var1 = `{require(parent.CoreScriptsCommon).Url.APIS_URL .. "platform-leaderboards-api"}/v1/rcc/universes/{game.GameId}/leaderboard`
local leaderboardType = require(script.Parent.PlatformLeaderboardTypes).LeaderboardType
local platformLeaderboardFetcherHttpRetryCount = game:DefineFastInt("PlatformLeaderboardFetcherHttpRetryCount", 0)
local platformLeaderboardFetcherDefaultCount = game:DefineFastInt("PlatformLeaderboardFetcherDefaultCount", 100)
local platformLeaderboardDisplayNameEnabled = game:DefineFastFlag("PlatformLeaderboardDisplayNameEnabled", false)
local platformLeaderboardBadgeMetadataEnabled = game:DefineFastFlag("PlatformLeaderboardBadgeMetadataEnabled", false)
local fFlagPlatformLeaderboardDebugLogging = sharedFlagsModule.FFlagPlatformLeaderboardDebugLogging
local var2 = httpRequestModule.config({
	requestFunction = httpRequestModule.requestFunctions.HttpRbxApi,
	maxRetryCount = platformLeaderboardFetcherHttpRetryCount
})

local function get(p1)
	-- upvalues: var2 (ref), fFlagPlatformLeaderboardDebugLogging (ref), httpService (ref)
	local ok, status, var3 = pcall(function()
		-- upvalues: var2 (copy), p1 (ref)
		return var2(p1, "GET"):await()
	end)
	
	if ok and status then
		if typeof(var3) == "table" then
			local body = var3.Body or var3.responseBody
			
			if typeof(body) ~= "string" then
				return true, body
			end
			local ok_1, status_1 = pcall(httpService.JSONDecode, httpService, body)
			
			if ok_1 then
				return true, status_1
			elseif fFlagPlatformLeaderboardDebugLogging then
				warn("[PlatformLeaderboard] Fetcher: JSON decode failed:", tostring(status_1))
			end
			return false, nil
		elseif fFlagPlatformLeaderboardDebugLogging then
			warn("[PlatformLeaderboard] Fetcher received malformed response")
		end
		return false, nil
	elseif fFlagPlatformLeaderboardDebugLogging then
		warn("[PlatformLeaderboard] Fetcher request failed")
	end
	return false, nil
end

local function formatEntry(p1)
	-- upvalues: platformLeaderboardDisplayNameEnabled (ref), platformLeaderboardBadgeMetadataEnabled (ref)
	if typeof(p1) ~= "table" then
		return nil
	end
	local userId = p1.userId
	local score = p1.score
	
	if userId == nil or score == nil then
		return nil
	end
	local var3 = tonumber(userId)
	local var4 = tonumber(score)
	
	if var3 == nil or var4 == nil then
		return nil
	end
	local rank = p1.rank
	local var5 = if rank == nil then nil else tonumber(rank)
	local var6 = if platformLeaderboardDisplayNameEnabled then if typeof(p1.displayName) == "string" then p1.displayName else nil else nil
	local var7 = nil
	local var8 = nil
	
	if platformLeaderboardBadgeMetadataEnabled then
		var7 = if typeof(p1.isVerified) == "boolean" then p1.isVerified else nil
		var8 = if typeof(p1.hasRobloxSubscription) == "boolean" then p1.hasRobloxSubscription else nil
	end
	return {
		userId = var3,
		score = var4,
		rank = var5,
		displayName = var6,
		isVerified = var7,
		hasRobloxSubscription = var8
	}
end

local function formatEntries(p1)
	-- upvalues: formatEntry (ref)
	local t = {}
	
	for i, v in p1 do
		local var3 = formatEntry(v)
		
		if var3 ~= nil then
			table.insert(t, var3)
		end
	end
	return t
end

local function formatConfig(p2)
	if p2 == nil or p2.leaderboardId == nil then
		return nil
	end
	local leaderboardId = p2.leaderboardId
	
	if typeof(leaderboardId) == "string" then
		local unit = p2.unit
		
		return {
			leaderboardId = leaderboardId,
			unit = if typeof(unit) == "string" then unit else ""
		}
	end
	return nil
end

local t = {
	fetchConfig = function()
		-- upvalues: var1 (ref), get (ref), fFlagPlatformLeaderboardDebugLogging (ref), formatConfig (ref)
		local var4, var5 = get(`{var1}/config`)
		
		if not var4 then
			return false, nil
		elseif typeof(var5) == "table" then
			local config = var5.config
			
			if config == nil or typeof(config) == "table" then
				return true, formatConfig(config)
			elseif fFlagPlatformLeaderboardDebugLogging then
				warn("[PlatformLeaderboard] Fetcher received malformed config payload")
			end
			return false, nil
		elseif fFlagPlatformLeaderboardDebugLogging then
			warn("[PlatformLeaderboard] Fetcher received malformed config response body")
		end
		return false, nil
	end
}

local function fetchLeaderboard(_, p2, p3, p4)
	-- upvalues: platformLeaderboardFetcherDefaultCount (ref), leaderboardType (ref), var1 (ref), fFlagPlatformLeaderboardDebugLogging (ref), get (ref), formatConfig (ref), formatEntries (ref)
	p4 = p4 or platformLeaderboardFetcherDefaultCount
	local var4 = nil
	
	if p2 == leaderboardType.Global then
		var4 = `{var1}/global?count={p4}`
	elseif p2 == leaderboardType.Friends and p3 ~= nil then
		var4 = `{var1}/friends?userid={p3}&count={p4}`
	elseif fFlagPlatformLeaderboardDebugLogging then
		warn("[PlatformLeaderboard] Fetcher missing userId for friends leaderboard")
	end
	return false, nil
	local var5, var6 = get(var4)
	
	if not var5 then
		return false, nil
	elseif typeof(var6) == "table" then
		local config = var6.config
		
		if config == nil or typeof(config) == "table" then
			local scores = var6.scores
			
			if scores == nil or typeof(scores) == "table" then
				return true, {
					config = formatConfig(config),
					entries = formatEntries(scores or {})
				}
			elseif fFlagPlatformLeaderboardDebugLogging then
				warn("[PlatformLeaderboard] Fetcher received malformed leaderboard scores payload")
			end
			return false, nil
		elseif fFlagPlatformLeaderboardDebugLogging then
			warn("[PlatformLeaderboard] Fetcher received malformed leaderboard config payload")
		end
		return false, nil
	elseif fFlagPlatformLeaderboardDebugLogging then
		warn("[PlatformLeaderboard] Fetcher received malformed leaderboard response body")
	end
	return false, nil
end

function t.fetchGlobalLeaderboard(p2, p3)
	-- upvalues: fetchLeaderboard (ref), leaderboardType (ref)
	return fetchLeaderboard(p2, leaderboardType.Global, nil, p3)
end

function t.fetchFriendsLeaderboard(p2, p3, p4)
	-- upvalues: fetchLeaderboard (ref), leaderboardType (ref)
	return fetchLeaderboard(p2, leaderboardType.Friends, p3, p4)
end

function t.fetchUserScore(_, p2)
	-- upvalues: var1 (ref), get (ref), fFlagPlatformLeaderboardDebugLogging (ref), formatEntry (ref)
	local var4, var5 = get(`{var1}/{p2}/score`)
	
	if not var4 then
		return false, nil
	elseif typeof(var5) == "table" then
		local userScore = var5.userScore
		
		if userScore == nil or typeof(userScore) == "table" then
			if userScore then
				return true, formatEntry(userScore)
			end
			return true, nil
		elseif fFlagPlatformLeaderboardDebugLogging then
			warn("[PlatformLeaderboard] Fetcher received malformed user score payload")
		end
		return false, nil
	elseif fFlagPlatformLeaderboardDebugLogging then
		warn("[PlatformLeaderboard] Fetcher received malformed user score response body")
	end
	return false, nil
end

return t