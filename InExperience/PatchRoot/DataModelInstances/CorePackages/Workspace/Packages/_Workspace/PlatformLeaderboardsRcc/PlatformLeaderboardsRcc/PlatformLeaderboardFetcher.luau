local httpService = game:GetService("HttpService")
local parent = script.Parent.Parent
local httpRequestModule = require(parent.HttpRequest)
local sharedFlagsModule = require(parent.SharedFlags)
local var3 = `{require(parent.CoreScriptsCommon).Url.APIS_URL .. "platform-leaderboards-api"}/v1/rcc/universes/{game.GameId}/leaderboard`
local leaderboardType = require(script.Parent.PlatformLeaderboardTypes).LeaderboardType
local platformLeaderboardFetcherHttpRetryCount = game:DefineFastInt("PlatformLeaderboardFetcherHttpRetryCount", 0)
local platformLeaderboardFetcherDefaultCount = game:DefineFastInt("PlatformLeaderboardFetcherDefaultCount", 100)
local platformLeaderboardDisplayNameEnabled = game:DefineFastFlag("PlatformLeaderboardDisplayNameEnabled", false)
local fFlagPlatformLeaderboardDebugLogging = sharedFlagsModule.FFlagPlatformLeaderboardDebugLogging
local var7 = httpRequestModule.config({
	requestFunction = httpRequestModule.requestFunctions.HttpRbxApi,
	maxRetryCount = platformLeaderboardFetcherHttpRetryCount
})

local function get(p0) --[[ line: 30 ]]
	-- upvalues: var7 (ref), fFlagPlatformLeaderboardDebugLogging (ref), httpService (ref)
	local ok, status, var14 = pcall(function() --[[ line: 31 ]]
		-- upvalues: var7 (copy), p0 (ref)
		return var7(p0, "GET"):await()
	end)
	
	if ok and status then
		if typeof(var14) == "table" then
			local body = var14.Body or var14.responseBody
			
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

local function formatEntry(p1) --[[ line: 61 ]]
	-- upvalues: platformLeaderboardDisplayNameEnabled (ref)
	if typeof(p1) ~= "table" then
		return nil
	end
	local userId = p1.userId
	local score = p1.score
	
	if userId == nil or score == nil then
		return nil
	end
	local var16 = tonumber(userId)
	local var17 = tonumber(score)
	
	if var16 == nil or var17 == nil then
		return nil
	end
	local rank = p1.rank
	
	return {
		userId = var16,
		score = var17,
		rank = if rank == nil then nil else tonumber(rank),
		displayName = if platformLeaderboardDisplayNameEnabled then if typeof(p1.displayName) == "string" then p1.displayName else nil else nil
	}
end

local function formatEntries(p2) --[[ line: 92 ]]
	-- upvalues: formatEntry (ref)
	local t = {}
	
	for i, v in p2 do
		local var19 = formatEntry(v)
		
		if var19 ~= nil then
			table.insert(t, var19)
		end
	end
	return t
end

local function formatConfig(p3) --[[ line: 103 ]]
	if p3 == nil or p3.leaderboardId == nil then
		return nil
	end
	local leaderboardId = p3.leaderboardId
	
	if typeof(leaderboardId) == "string" then
		local unit = p3.unit
		
		return {
			leaderboardId = leaderboardId,
			unit = if typeof(unit) == "string" then unit else ""
		}
	end
	return nil
end

local t = {
	fetchConfig = function() --[[ line: 120 ]]
		-- upvalues: var3 (ref), get (ref), fFlagPlatformLeaderboardDebugLogging (ref), formatConfig (ref)
		local var20, var21 = get(`{var3}/config`)
		
		if not var20 then
			return false, nil
		elseif typeof(var21) == "table" then
			local config = var21.config
			
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

local function fetchLeaderboard(_, p4, p5, p6) --[[ line: 143 ]]
	-- upvalues: platformLeaderboardFetcherDefaultCount (ref), leaderboardType (ref), var3 (ref), fFlagPlatformLeaderboardDebugLogging (ref), get (ref), formatConfig (ref), formatEntries (ref)
	p6 = p6 or platformLeaderboardFetcherDefaultCount
	local var23 = nil
	
	if p4 == leaderboardType.Global then
		var23 = `{var3}/global?count={p6}`
	elseif p4 == leaderboardType.Friends and p5 ~= nil then
		var23 = `{var3}/friends?userid={p5}&count={p6}`
	elseif fFlagPlatformLeaderboardDebugLogging then
		warn("[PlatformLeaderboard] Fetcher missing userId for friends leaderboard")
	end
	return false, nil
	local var24, var25 = get(var23)
	
	if not var24 then
		return false, nil
	elseif typeof(var25) == "table" then
		local config = var25.config
		
		if config == nil or typeof(config) == "table" then
			local scores = var25.scores
			
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

function t.fetchGlobalLeaderboard(p7, p8) --[[ line: 192 ]]
	-- upvalues: fetchLeaderboard (ref), leaderboardType (ref)
	return fetchLeaderboard(p7, leaderboardType.Global, nil, p8)
end

function t.fetchFriendsLeaderboard(p9, p10, p11) --[[ line: 199 ]]
	-- upvalues: fetchLeaderboard (ref), leaderboardType (ref)
	return fetchLeaderboard(p9, leaderboardType.Friends, p10, p11)
end

function t.fetchUserScore(_, p12) --[[ line: 207 ]]
	-- upvalues: var3 (ref), get (ref), fFlagPlatformLeaderboardDebugLogging (ref), formatEntry (ref)
	local var26, var27 = get(`{var3}/{p12}/score`)
	
	if not var26 then
		return false, nil
	elseif typeof(var27) == "table" then
		local userScore = var27.userScore
		
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