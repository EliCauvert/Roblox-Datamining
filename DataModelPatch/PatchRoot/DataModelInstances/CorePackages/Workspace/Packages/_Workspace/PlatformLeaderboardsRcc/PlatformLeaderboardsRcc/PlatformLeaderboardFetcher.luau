local HttpService = game:GetService("HttpService")
local Parent = script.Parent.Parent
local HttpRequestModule = require(Parent.HttpRequest)
local LeaderboardName: string = `{require(Parent.CoreScriptsCommon).Url.APIS_URL .. "platform-leaderboards-api"}/v1/rcc/universes/{game.GameId}/leaderboard`
local LeaderboardType = require(script.Parent.PlatformLeaderboardTypes).LeaderboardType
local PlatformLeaderboardFetcherDefaultCount = game:DefineFastInt("PlatformLeaderboardFetcherDefaultCount", 100)
local PlatformLeaderboardDisplayNameEnabled = game:DefineFastFlag("PlatformLeaderboardDisplayNameEnabled", false)
local ConfigResult = HttpRequestModule.config({
	requestFunction = HttpRequestModule.requestFunctions.HttpRbxApi,
	maxRetryCount = game:DefineFastInt("PlatformLeaderboardFetcherHttpRetryCount", 0)
})

local function get(ConfigName)
	-- upvalues: ConfigResult (copy), HttpService (copy)
	local Success, Result, Result3 = pcall(function()
		-- upvalues: ConfigResult (upval), ConfigName (copy)
		return ConfigResult(ConfigName, "GET"):await()
	end)
	
	if not Success or not Result then
		warn("[PlatformLeaderboard] Fetcher request failed")
		
		return false, nil
	elseif typeof(Result3) ~= "table" then
		warn("[PlatformLeaderboard] Fetcher received malformed response")
		
		return false, nil
	else
		local Body = Result3.Body or Result3.responseBody
		
		if typeof(Body) ~= "string" then
			return true, Body
		end
		local Success1, Result1 = pcall(HttpService.JSONDecode, HttpService, Body)
		
		if Success1 then
			return true, Result1
		else
			warn("[PlatformLeaderboard] Fetcher: JSON decode failed:", (tostring(Result1)))
			
			return false, nil
		end
	end
end

local function formatEntry(UserScore)
	-- upvalues: PlatformLeaderboardDisplayNameEnabled (copy)
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
	else
		local Rank = UserScore.rank
		
		return {
			userId = Number,
			score = Number1,
			rank = if Rank == nil then nil else tonumber(Rank),
			displayName = if PlatformLeaderboardDisplayNameEnabled and typeof(UserScore.displayName) == "string" then UserScore.displayName else nil
		}
	end
end

local function formatEntries(List)
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

local function formatConfig(p1)
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

local function fetchLeaderboard(_, Friends, p1, p2)
	-- upvalues: PlatformLeaderboardFetcherDefaultCount (copy), LeaderboardType (copy), LeaderboardName (copy), get (copy), formatConfig (copy), formatEntries (copy)
	local P7 = p2 or PlatformLeaderboardFetcherDefaultCount
	local FriendsName: string? = nil
	
	if Friends == LeaderboardType.Global then
		FriendsName = `{LeaderboardName}/global?count={P7}`
	else
		if Friends ~= LeaderboardType.Friends or p1 == nil then
			warn("[PlatformLeaderboard] Fetcher missing userId for friends leaderboard")
			
			return false, nil
		end
		FriendsName = `{LeaderboardName}/friends?userid={p1}&count={P7}`
	end
	local GetResult, GetResult2 = get(FriendsName)
	
	if not GetResult then
		return false, nil
	elseif typeof(GetResult2) ~= "table" then
		warn("[PlatformLeaderboard] Fetcher received malformed leaderboard response body")
		
		return false, nil
	else
		local Config = GetResult2.config
		
		if Config ~= nil and typeof(Config) ~= "table" then
			warn("[PlatformLeaderboard] Fetcher received malformed leaderboard config payload")
			
			return false, nil
		end
		local Scores = GetResult2.scores
		
		if Scores == nil or typeof(Scores) == "table" then
			return true, {
				config = formatConfig(Config),
				entries = formatEntries(Scores or {})
			}
		else
			warn("[PlatformLeaderboard] Fetcher received malformed leaderboard scores payload")
			
			return false, nil
		end
	end
end

return {
	fetchConfig = function()
		-- upvalues: LeaderboardName (copy), get (copy), formatConfig (copy)
		local GetResult, GetResult2 = get(`{LeaderboardName}/config`)
		
		if not GetResult then
			return false, nil
		elseif typeof(GetResult2) ~= "table" then
			warn("[PlatformLeaderboard] Fetcher received malformed config response body")
			
			return false, nil
		else
			local Config = GetResult2.config
			
			if Config == nil or typeof(Config) == "table" then
				return true, (formatConfig(Config))
			else
				warn("[PlatformLeaderboard] Fetcher received malformed config payload")
				
				return false, nil
			end
		end
	end,
	fetchGlobalLeaderboard = function(p1, p2)
		-- upvalues: fetchLeaderboard (copy), LeaderboardType (copy)
		return fetchLeaderboard(p1, LeaderboardType.Global, nil, p2)
	end,
	fetchFriendsLeaderboard = function(p1, p2, p3)
		-- upvalues: fetchLeaderboard (copy), LeaderboardType (copy)
		return fetchLeaderboard(p1, LeaderboardType.Friends, p2, p3)
	end,
	fetchUserScore = function(_, p1)
		-- upvalues: LeaderboardName (copy), get (copy), formatEntry (copy)
		local GetResult, GetResult2 = get(`{LeaderboardName}/{p1}/score`)
		
		if not GetResult then
			return false, nil
		elseif typeof(GetResult2) ~= "table" then
			warn("[PlatformLeaderboard] Fetcher received malformed user score response body")
			
			return false, nil
		else
			local UserScore = GetResult2.userScore
			
			if UserScore ~= nil and typeof(UserScore) ~= "table" then
				warn("[PlatformLeaderboard] Fetcher received malformed user score payload")
				
				return false, nil
			elseif UserScore then
				return true, (formatEntry(UserScore))
			else
				return true, nil
			end
		end
	end
}