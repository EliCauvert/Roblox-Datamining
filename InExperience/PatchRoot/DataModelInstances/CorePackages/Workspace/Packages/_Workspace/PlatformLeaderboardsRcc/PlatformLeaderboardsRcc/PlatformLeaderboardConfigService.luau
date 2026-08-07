local parent = script.Parent
local parent_1 = parent.Parent
local sharedFlagsModule = require(parent_1.SharedFlags)
local signal = require(parent_1.AppCommonLib).Signal
local _ = require(parent.PlatformLeaderboardTypes)
local _ = require(parent.PlatformLeaderboardFetcher)
local platformLeaderboardConfigPollIntervalSeconds = game:DefineFastInt("PlatformLeaderboardConfigPollIntervalSeconds", 300)
local platformLeaderboardConfigPollMaxJitterSeconds = game:DefineFastInt("PlatformLeaderboardConfigPollMaxJitterSeconds", 60)
local fFlagPlatformLeaderboardDebugLogging = sharedFlagsModule.FFlagPlatformLeaderboardDebugLogging
local t = {}
t.__index = t

function t.new(p0) --[[ line: 50 ]]
	-- upvalues: signal (ref), t (ref), platformLeaderboardConfigPollMaxJitterSeconds (ref), platformLeaderboardConfigPollIntervalSeconds (ref), fFlagPlatformLeaderboardDebugLogging (ref)
	local tbl = setmetatable({
		_config = nil,
		_pollTimer = nil,
		_fetcher = p0,
		_configChanged = signal.new()
	}, t)
	local ok, status, var5 = pcall(p0.fetchConfig)
	
	if ok and status then
		tbl._config = var5
	end
	local var6 = nil
	
	local function pollLoop() --[[ line: 64 ]]
		-- upvalues: tbl (ref), var6 (write), platformLeaderboardConfigPollMaxJitterSeconds (copy), platformLeaderboardConfigPollIntervalSeconds (copy)
		while tbl._pollTimer == var6 do
			task.wait(platformLeaderboardConfigPollIntervalSeconds + math.random() * platformLeaderboardConfigPollMaxJitterSeconds)
			local ok, status, var8 = pcall(tbl._fetcher.fetchConfig)
			
			if ok and status then
				tbl:updateConfig(var8)
			end
		end
	end
	
	tbl._pollTimer = task.defer(function() --[[ line: 75 ]]
		-- upvalues: pollLoop (ref), tbl (ref), var6 (write), fFlagPlatformLeaderboardDebugLogging (copy)
		if not pcall(pollLoop) and tbl._pollTimer == var6 then
			if fFlagPlatformLeaderboardDebugLogging then
				warn("[PlatformLeaderboard] ConfigService poll loop terminated unexpectedly")
			end
			tbl._pollTimer = nil
		end
	end)
	
	return tbl
end

local function _(p1, p2) --[[ line: 89 | named "configsEqual" ]]
	return p1 == p2 or (if p1 == nil or p2 == nil then false else p1.leaderboardId == p2.leaderboardId and p1.unit == p2.unit)
end

function t:updateConfig(p3) --[[ line: 99 ]]
	local config = self._config
	
	if config == p3 or (if config == nil or p3 == nil then false else config.leaderboardId == p3.leaderboardId and config.unit == p3.unit) then
		return
	end
	local config_1 = self._config
	self._config = p3
	self._configChanged:fire(config_1, self._config)
end

function t:getConfig() --[[ line: 108 ]]
	return self._config
end

function t:hasActiveConfig() --[[ line: 112 ]]
	return self._config ~= nil
end

function t:onConfigChanged(p4) --[[ line: 116 ]]
	return self._configChanged:connect(p4)
end

function t:teardown() --[[ line: 122 ]]
	-- upvalues: fFlagPlatformLeaderboardDebugLogging (ref)
	local pollTimer = self._pollTimer
	self._pollTimer = nil
	
	if pollTimer and not pcall(task.cancel, pollTimer) and fFlagPlatformLeaderboardDebugLogging then
		warn("[PlatformLeaderboard] ConfigService teardown: failed to cancel poll timer")
	end
end

return t