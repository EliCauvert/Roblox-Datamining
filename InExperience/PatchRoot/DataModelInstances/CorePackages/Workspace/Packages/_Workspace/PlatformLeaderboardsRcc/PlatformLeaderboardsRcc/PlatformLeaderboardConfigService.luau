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

function t.new(p1)
	-- upvalues: signal (ref), t (ref), platformLeaderboardConfigPollMaxJitterSeconds (ref), platformLeaderboardConfigPollIntervalSeconds (ref), fFlagPlatformLeaderboardDebugLogging (ref)
	local tbl = setmetatable({
		_config = nil,
		_pollTimer = nil,
		_fetcher = p1,
		_configChanged = signal.new()
	}, t)
	local ok, status, var1 = pcall(p1.fetchConfig)
	
	if ok and status then
		tbl._config = var1
	end
	local var2 = nil
	
	local function pollLoop()
		-- upvalues: tbl (ref), var2 (write), platformLeaderboardConfigPollMaxJitterSeconds (copy), platformLeaderboardConfigPollIntervalSeconds (copy)
		while tbl._pollTimer == var2 do
			task.wait(platformLeaderboardConfigPollIntervalSeconds + math.random() * platformLeaderboardConfigPollMaxJitterSeconds)
			local ok, status, var3 = pcall(tbl._fetcher.fetchConfig)
			
			if ok and status then
				tbl:updateConfig(var3)
			end
		end
	end
	
	tbl._pollTimer = task.defer(function()
		-- upvalues: pollLoop (ref), tbl (ref), var2 (write), fFlagPlatformLeaderboardDebugLogging (copy)
		if not pcall(pollLoop) and tbl._pollTimer == var2 then
			if fFlagPlatformLeaderboardDebugLogging then
				warn("[PlatformLeaderboard] ConfigService poll loop terminated unexpectedly")
			end
			tbl._pollTimer = nil
		end
	end)
	
	return tbl
end

local function _(p2, p3)
	return p2 == p3 or (if p2 == nil or p3 == nil then false else p2.leaderboardId == p3.leaderboardId and p2.unit == p3.unit)
end

function t:updateConfig(p2)
	local config = self._config
	
	if config == p2 or (if config == nil or p2 == nil then false else config.leaderboardId == p2.leaderboardId and config.unit == p2.unit) then
		return
	end
	local config_1 = self._config
	self._config = p2
	self._configChanged:fire(config_1, self._config)
end

function t:getConfig()
	return self._config
end

function t:hasActiveConfig()
	return self._config ~= nil
end

function t:onConfigChanged(p2)
	return self._configChanged:connect(p2)
end

function t:teardown()
	-- upvalues: fFlagPlatformLeaderboardDebugLogging (ref)
	local pollTimer = self._pollTimer
	self._pollTimer = nil
	
	if pollTimer and not pcall(task.cancel, pollTimer) and fFlagPlatformLeaderboardDebugLogging then
		warn("[PlatformLeaderboard] ConfigService teardown: failed to cancel poll timer")
	end
end

return t