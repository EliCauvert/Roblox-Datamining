local HttpService = game:GetService("HttpService")
local Parent = script.Parent.Parent
local HttpRequestModule = require(Parent.HttpRequest)
local LeaderboardName: string = `{require(Parent.CoreScriptsCommon).Url.APIS_URL .. "platform-leaderboards-api"}/v1/rcc/universes/{game.GameId}/leaderboard`
local LeaderboardType = require(script.Parent.PlatformLeaderboardTypes).LeaderboardType
local PlatformLeaderboardFetcherDefaultCount = game:DefineFastInt("PlatformLeaderboardFetcherDefaultCount", 100)
local PlatformLeaderboardDisplayNameEnabled = game:DefineFastFlag("PlatformLeaderboardDisplayNameEnabled", false)
local PlatformLeaderboardBadgeMetadataEnabled = game:DefineFastFlag("PlatformLeaderboardBadgeMetadataEnabled", false)
local FFlagPlatformLeaderboardDebugLogging = require(Parent.SharedFlags).FFlagPlatformLeaderboardDebugLogging
local ConfigResult = HttpRequestModule.config({
	requestFunction = HttpRequestModule.requestFunctions.HttpRbxApi,
	maxRetryCount = game:DefineFastInt("PlatformLeaderboardFetcherHttpRetryCount", 0)
})

local function get(ConfigName) --[[ Line: 32 ]]
	-- upvalues: ConfigResult (copy), FFlagPlatformLeaderboardDebugLogging (copy), HttpService (copy)
	local Success, Result, Result3 = pcall(function() --[[ Line: 33 ]]
		-- upvalues: ConfigResult (upval), ConfigName (copy)
		return ConfigResult(ConfigName, "GET"):await()
	end)
	
	if Success and Result then
		if typeof(Result3) == "table" then
			local Body = Result3.Body or Result3.responseBody
			
			if typeof(Body) ~= "string" then
				return true, Body
			end
			local Success1, Result1 = pcall(HttpService.JSONDecode, HttpService, Body)
			
			if Success1 then
				return true, Result1
			end
			if FFlagPlatformLeaderboardDebugLogging then
				warn("[PlatformLeaderboard] Fetcher: JSON decode failed:", (tostring(Result1)))
			end
			return false, nil
		else
			if FFlagPlatformLeaderboardDebugLogging then
				warn("[PlatformLeaderboard] Fetcher received malformed response")
			end
			return false, nil
		end
	else
		if FFlagPlatformLeaderboardDebugLogging then
			warn("[PlatformLeaderboard] Fetcher request failed")
		end
		return false, nil
	end
end

local function formatEntry(UserScore) --[[ Line: 63 ]]
	-- upvalues: PlatformLeaderboardDisplayNameEnabled (copy), PlatformLeaderboardBadgeMetadataEnabled (copy)
	if typeof(UserScore) ~= "table" then
		return nil
	end
	local UserId = UserScore.userId
	local Score = UserScore.score
	
	if UserId == nil or Score == nil then
		return nil
	end
	local Number: number? = tonumber(UserId)
	local Number1: number? = tonumber(Score)
	
	if Number == nil or Number1 == nil then
		return nil
	end
	local Rank = UserScore.rank
	local Number2 = if Rank == nil then nil else tonumber(Rank)
	local DisplayName = if PlatformLeaderboardDisplayNameEnabled and typeof(UserScore.displayName) == "string" then UserScore.displayName else nil
	local IsVerified = nil
	local HasRobloxSubscription = nil
	
	if PlatformLeaderboardBadgeMetadataEnabled then
		IsVerified = if typeof(UserScore.isVerified) == "boolean" then UserScore.isVerified else nil
		HasRobloxSubscription = if typeof(UserScore.hasRobloxSubscription) == "boolean" then UserScore.hasRobloxSubscription else nil
	end
	return {
		userId = Number,
		score = Number1,
		rank = Number2,
		displayName = DisplayName,
		isVerified = IsVerified,
		hasRobloxSubscription = HasRobloxSubscription
	}
end

local function formatEntries(List) --[[ Line: 104 ]]
	-- upvalues: formatEntry (copy)
	local List1 = {}
	
	for _, value in List do
		local FormatEntryResult = formatEntry(value)
		
		if FormatEntryResult ~= nil then
			table.insert(List1, FormatEntryResult)
		end
	end
	return List1
end

local function formatConfig(p1) --[[ Line: 115 ]]
	if p1 == nil or p1.leaderboardId == nil then
		return nil
	end
	local LeaderboardId = p1.leaderboardId
	
	if typeof(LeaderboardId) == "string" then
		local Unit = p1.unit
		
		return {
			leaderboardId = LeaderboardId,
			unit = if typeof(Unit) == "string" then Unit else ""
		}
	else
		return nil
	end
end

local function fetchLeaderboard(_, Friends, p1, p2) --[[ Line: 155 ]]
	-- upvalues: PlatformLeaderboardFetcherDefaultCount (copy), LeaderboardType (copy), LeaderboardName (copy), FFlagPlatformLeaderboardDebugLogging (copy), get (copy), formatConfig (copy), formatEntries (copy)
	local P7 = p2 or PlatformLeaderboardFetcherDefaultCount
	local FriendsName: string? = nil
	
	if Friends == LeaderboardType.Global then
		FriendsName = `{LeaderboardName}/global?count={P7}`
	elseif Friends == LeaderboardType.Friends and p1 ~= nil then
		FriendsName = `{LeaderboardName}/friends?userid={p1}&count={P7}`
	else
		if FFlagPlatformLeaderboardDebugLogging then
			warn("[PlatformLeaderboard] Fetcher missing userId for friends leaderboard")
		end
		return false, nil
	end
	local GetResult, GetResult2 = get(FriendsName)
	
	if not GetResult then
		return false, nil
	end
	if typeof(GetResult2) == "table" then
		local Config = GetResult2.config
		
		if Config == nil or typeof(Config) == "table" then
			local Scores = GetResult2.scores
			
			if Scores == nil or typeof(Scores) == "table" then
				return true, {
					config = formatConfig(Config),
					entries = formatEntries(Scores or {})
				}
			end
			if FFlagPlatformLeaderboardDebugLogging then
				warn("[PlatformLeaderboard] Fetcher received malformed leaderboard scores payload")
			end
			return false, nil
		else
			if FFlagPlatformLeaderboardDebugLogging then
				warn("[PlatformLeaderboard] Fetcher received malformed leaderboard config payload")
			end
			return false, nil
		end
	else
		if FFlagPlatformLeaderboardDebugLogging then
			warn("[PlatformLeaderboard] Fetcher received malformed leaderboard response body")
		end
		return false, nil
	end
end

return {
	fetchConfig = function() --[[ Line: 132 ]]
		-- upvalues: LeaderboardName (copy), get (copy), FFlagPlatformLeaderboardDebugLogging (copy), formatConfig (copy)
		local GetResult, GetResult2 = get(`{LeaderboardName}/config`)
		
		if not GetResult then
			return false, nil
		end
		if typeof(GetResult2) == "table" then
			local Config = GetResult2.config
			
			if Config == nil or typeof(Config) == "table" then
				return true, (formatConfig(Config))
			end
			if FFlagPlatformLeaderboardDebugLogging then
				warn("[PlatformLeaderboard] Fetcher received malformed config payload")
			end
			return false, nil
		else
			if FFlagPlatformLeaderboardDebugLogging then
				warn("[PlatformLeaderboard] Fetcher received malformed config response body")
			end
			return false, nil
		end
	end,
	fetchGlobalLeaderboard = function(p1, p2) --[[ Line: 204 ]]
		-- upvalues: fetchLeaderboard (copy), LeaderboardType (copy)
		return fetchLeaderboard(p1, LeaderboardType.Global, nil, p2)
	end,
	fetchFriendsLeaderboard = function(p1, p2, p3) --[[ Line: 211 ]]
		-- upvalues: fetchLeaderboard (copy), LeaderboardType (copy)
		return fetchLeaderboard(p1, LeaderboardType.Friends, p2, p3)
	end,
	fetchUserScore = function(_, p1) --[[ Line: 219 ]]
		-- upvalues: LeaderboardName (copy), get (copy), FFlagPlatformLeaderboardDebugLogging (copy), formatEntry (copy)
		local GetResult, GetResult2 = get(`{LeaderboardName}/{p1}/score`)
		
		if not GetResult then
			return false, nil
		end
		if typeof(GetResult2) == "table" then
			local UserScore = GetResult2.userScore
			
			if UserScore ~= nil and typeof(UserScore) ~= "table" then
				if FFlagPlatformLeaderboardDebugLogging then
					warn("[PlatformLeaderboard] Fetcher received malformed user score payload")
				end
				return false, nil
			elseif UserScore then
				return true, (formatEntry(UserScore))
			else
				return true, nil
			end
		else
			if FFlagPlatformLeaderboardDebugLogging then
				warn("[PlatformLeaderboard] Fetcher received malformed user score response body")
			end
			return false, nil
		end
	end
}