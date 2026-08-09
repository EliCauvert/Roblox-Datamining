local httpService = game:GetService("HttpService")
local parent = script.Parent.Parent
local httpRequestModule = require(parent.HttpRequest)
local var2 = `{require(parent.CoreScriptsCommon).Url.APIS_URL .. "platform-leaderboards-api"}/v1/rcc/universes/{game.GameId}/leaderboard`
local leaderboardType = require(script.Parent.PlatformLeaderboardTypes).LeaderboardType
local platformLeaderboardFetcherHttpRetryCount = game:DefineFastInt("PlatformLeaderboardFetcherHttpRetryCount", 0)
local platformLeaderboardFetcherDefaultCount = game:DefineFastInt("PlatformLeaderboardFetcherDefaultCount", 100)
local platformLeaderboardDisplayNameEnabled = game:DefineFastFlag("PlatformLeaderboardDisplayNameEnabled", false)
local var6 = httpRequestModule.config({
	requestFunction = httpRequestModule.requestFunctions.HttpRbxApi,
	maxRetryCount = platformLeaderboardFetcherHttpRetryCount
})

local function get(p0) --[[ line: 28 ]]
	-- upvalues: var6 (ref), httpService (ref)
	local ok, status, var13 = pcall(function() --[[ line: 29 ]]
		-- upvalues: var6 (copy), p0 (ref)
		return var6(p0, "GET"):await()
	end)
	
	if not ok or not status then
		warn("[PlatformLeaderboard] Fetcher request failed")
		
		return false, nil
	elseif typeof(var13) ~= "table" then
		warn("[PlatformLeaderboard] Fetcher received malformed response")
		
		return false, nil
	end
	local body = var13.Body or var13.responseBody
	
	if typeof(body) ~= "string" then
		return true, body
	end
	local ok_1, status_1 = pcall(httpService.JSONDecode, httpService, body)
	
	if ok_1 then
		return true, status_1
	end
	warn("[PlatformLeaderboard] Fetcher: JSON decode failed:", tostring(status_1))
	
	return false, nil
end

local function formatEntry(p1) --[[ line: 53 ]]
	-- upvalues: platformLeaderboardDisplayNameEnabled (ref)
	if typeof(p1) ~= "table" then
		return nil
	end
	local userId = p1.userId
	local score = p1.score
	
	if userId == nil or score == nil then
		return nil
	end
	local var15 = tonumber(userId)
	local var16 = tonumber(score)
	
	if var15 == nil or var16 == nil then
		return nil
	end
	local rank = p1.rank
	
	return {
		userId = var15,
		score = var16,
		rank = if rank == nil then nil else tonumber(rank),
		displayName = if platformLeaderboardDisplayNameEnabled then if typeof(p1.displayName) == "string" then p1.displayName else nil else nil
	}
end

local function formatEntries(p2) --[[ line: 84 ]]
	-- upvalues: formatEntry (ref)
	local t = {}
	
	for i, v in p2 do
		local var18 = formatEntry(v)
		
		if var18 ~= nil then
			table.insert(t, var18)
		end
	end
	return t
end

local function formatConfig(p3) --[[ line: 95 ]]
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
	fetchConfig = function() --[[ line: 112 ]]
		-- upvalues: var2 (ref), get (ref), formatConfig (ref)
		local var19, var20 = get(`{var2}/config`)
		
		if not var19 then
			return false, nil
		elseif typeof(var20) ~= "table" then
			warn("[PlatformLeaderboard] Fetcher received malformed config response body")
			
			return false, nil
		end
		local config = var20.config
		
		if config == nil or typeof(config) == "table" then
			return true, formatConfig(config)
		end
		warn("[PlatformLeaderboard] Fetcher received malformed config payload")
		
		return false, nil
	end
}

local function fetchLeaderboard(_, p4, p5, p6) --[[ line: 131 ]]
	-- upvalues: platformLeaderboardFetcherDefaultCount (ref), leaderboardType (ref), var2 (ref), get (ref), formatConfig (ref), formatEntries (ref)
	p6 = p6 or platformLeaderboardFetcherDefaultCount
	local var22 = nil
	
	if p4 == leaderboardType.Global then
		var22 = `{var2}/global?count={p6}`
	elseif p4 == leaderboardType.Friends and p5 ~= nil then
		var22 = `{var2}/friends?userid={p5}&count={p6}`
	else
		warn("[PlatformLeaderboard] Fetcher missing userId for friends leaderboard")
		
		return false, nil
	end
	local var23, var24 = get(var22)
	
	if not var23 then
		return false, nil
	elseif typeof(var24) ~= "table" then
		warn("[PlatformLeaderboard] Fetcher received malformed leaderboard response body")
		
		return false, nil
	end
	local config = var24.config
	
	if config ~= nil and typeof(config) ~= "table" then
		warn("[PlatformLeaderboard] Fetcher received malformed leaderboard config payload")
		
		return false, nil
	end
	local scores = var24.scores
	
	if scores == nil or typeof(scores) == "table" then
		return true, {
			config = formatConfig(config),
			entries = formatEntries(scores or {})
		}
	end
	warn("[PlatformLeaderboard] Fetcher received malformed leaderboard scores payload")
	
	return false, nil
end

function t.fetchGlobalLeaderboard(p7, p8) --[[ line: 172 ]]
	-- upvalues: fetchLeaderboard (ref), leaderboardType (ref)
	return fetchLeaderboard(p7, leaderboardType.Global, nil, p8)
end

function t.fetchFriendsLeaderboard(p9, p10, p11) --[[ line: 179 ]]
	-- upvalues: fetchLeaderboard (ref), leaderboardType (ref)
	return fetchLeaderboard(p9, leaderboardType.Friends, p10, p11)
end

function t.fetchUserScore(_, p12) --[[ line: 187 ]]
	-- upvalues: var2 (ref), get (ref), formatEntry (ref)
	local var25, var26 = get(`{var2}/{p12}/score`)
	
	if not var25 then
		return false, nil
	elseif typeof(var26) ~= "table" then
		warn("[PlatformLeaderboard] Fetcher received malformed user score response body")
		
		return false, nil
	end
	local userScore = var26.userScore
	
	if userScore ~= nil and typeof(userScore) ~= "table" then
		warn("[PlatformLeaderboard] Fetcher received malformed user score payload")
		
		return false, nil
	elseif userScore then
		return true, formatEntry(userScore)
	end
	return true, nil
end

return t