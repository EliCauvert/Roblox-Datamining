local parent = script.Parent
local signal = require(parent.Parent.AppCommonLib).Signal
local _ = require(parent.PlatformLeaderboardTypes)
local _ = require(parent.PlatformLeaderboardFetcher)
local platformLeaderboardConfigPollIntervalSeconds = game:DefineFastInt("PlatformLeaderboardConfigPollIntervalSeconds", 300)
local platformLeaderboardConfigPollMaxJitterSeconds = game:DefineFastInt("PlatformLeaderboardConfigPollMaxJitterSeconds", 60)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 48 ]]
	-- upvalues: signal (ref), t (ref), platformLeaderboardConfigPollMaxJitterSeconds (ref), platformLeaderboardConfigPollIntervalSeconds (ref)
	local tbl = setmetatable({
		_config = nil,
		_pollTimer = nil,
		_fetcher = p0,
		_configChanged = signal.new()
	}, t)
	local ok, status, var4 = pcall(p0.fetchConfig)
	
	if ok and status then
		tbl._config = var4
	end
	local var5 = nil
	
	local function pollLoop() --[[ line: 62 ]]
		-- upvalues: tbl (ref), var5 (write), platformLeaderboardConfigPollMaxJitterSeconds (copy), platformLeaderboardConfigPollIntervalSeconds (copy)
		while tbl._pollTimer == var5 do
			task.wait(platformLeaderboardConfigPollIntervalSeconds + math.random() * platformLeaderboardConfigPollMaxJitterSeconds)
			local ok, status, var7 = pcall(tbl._fetcher.fetchConfig)
			
			if ok and status then
				tbl:updateConfig(var7)
			end
		end
	end
	
	tbl._pollTimer = task.defer(function() --[[ line: 73 ]]
		-- upvalues: pollLoop (ref), tbl (ref), var5 (write)
		if not pcall(pollLoop) and tbl._pollTimer == var5 then
			warn("[PlatformLeaderboard] ConfigService poll loop terminated unexpectedly")
			tbl._pollTimer = nil
		end
	end)
	
	return tbl
end

local function _(p1, p2) --[[ line: 85 | named "configsEqual" ]]
	return p1 == p2 or (if p1 == nil or p2 == nil then false else p1.leaderboardId == p2.leaderboardId and p1.unit == p2.unit)
end

function t:updateConfig(p3) --[[ line: 95 ]]
	local config = self._config
	
	if config == p3 or (if config == nil or p3 == nil then false else config.leaderboardId == p3.leaderboardId and config.unit == p3.unit) then
		return
	end
	local config_1 = self._config
	self._config = p3
	self._configChanged:fire(config_1, self._config)
end

function t:getConfig() --[[ line: 104 ]]
	return self._config
end

function t:hasActiveConfig() --[[ line: 108 ]]
	return self._config ~= nil
end

function t:onConfigChanged(p4) --[[ line: 112 ]]
	return self._configChanged:connect(p4)
end

function t:teardown() --[[ line: 118 ]]
	local pollTimer = self._pollTimer
	self._pollTimer = nil
	
	if pollTimer and not pcall(task.cancel, pollTimer) then
		warn("[PlatformLeaderboard] ConfigService teardown: failed to cancel poll timer")
	end
end

return t