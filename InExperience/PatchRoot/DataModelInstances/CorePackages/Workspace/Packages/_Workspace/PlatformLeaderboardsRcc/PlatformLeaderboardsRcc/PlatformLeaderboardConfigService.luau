local Parent = script.Parent
local Parent1 = Parent.Parent
local Signal = require(Parent1.AppCommonLib).Signal
local _ = require(Parent.PlatformLeaderboardTypes)
local _ = require(Parent.PlatformLeaderboardFetcher)
local PlatformLeaderboardConfigPollIntervalSeconds = game:DefineFastInt("PlatformLeaderboardConfigPollIntervalSeconds", 300)
local PlatformLeaderboardConfigPollMaxJitterSeconds = game:DefineFastInt("PlatformLeaderboardConfigPollMaxJitterSeconds", 60)
local FFlagPlatformLeaderboardDebugLogging = require(Parent1.SharedFlags).FFlagPlatformLeaderboardDebugLogging
local PlatformLeaderboardConfigService = {}
PlatformLeaderboardConfigService.__index = PlatformLeaderboardConfigService

function PlatformLeaderboardConfigService.new(_fetcher)
	-- upvalues: Signal (copy), PlatformLeaderboardConfigService (copy), PlatformLeaderboardConfigPollMaxJitterSeconds (copy), PlatformLeaderboardConfigPollIntervalSeconds (copy), FFlagPlatformLeaderboardDebugLogging (copy)
	local self = setmetatable({
		_config = nil,
		_pollTimer = nil,
		_fetcher = _fetcher,
		_configChanged = Signal.new()
	}, PlatformLeaderboardConfigService)
	local Success, Result, Result3 = pcall(_fetcher.fetchConfig)
	
	if Success and Result then
		self._config = Result3
	end
	local DeferredThread = nil
	
	local function pollLoop()
		-- upvalues: self (copy), DeferredThread (ref), PlatformLeaderboardConfigPollMaxJitterSeconds (upval), PlatformLeaderboardConfigPollIntervalSeconds (upval)
		while self._pollTimer == DeferredThread do
			task.wait(PlatformLeaderboardConfigPollIntervalSeconds + math.random() * PlatformLeaderboardConfigPollMaxJitterSeconds)
			local Success, Result, Result3 = pcall(self._fetcher.fetchConfig)
			
			if Success and Result then
				self:updateConfig(Result3)
			end
		end
	end
	
	DeferredThread = task.defer(function()
		-- upvalues: pollLoop (copy), self (copy), DeferredThread (ref), FFlagPlatformLeaderboardDebugLogging (upval)
		if not pcall(pollLoop) and self._pollTimer == DeferredThread then
			if FFlagPlatformLeaderboardDebugLogging then
				warn("[PlatformLeaderboard] ConfigService poll loop terminated unexpectedly")
			end
			self._pollTimer = nil
		end
	end)
	self._pollTimer = DeferredThread
	
	return self
end

local function _(p1, p2): boolean
	return p1 == p2 or p1 ~= nil and p2 ~= nil and (p1.leaderboardId == p2.leaderboardId and p1.unit == p2.unit)
end

function PlatformLeaderboardConfigService:updateConfig(_config)
	local Config = self._config
	
	if Config ~= _config and (Config == nil or _config == nil or (Config.leaderboardId ~= _config.leaderboardId or Config.unit ~= _config.unit)) then
		self._config = _config
		self._configChanged:fire(self._config, self._config)
		
		return
	end
end

function PlatformLeaderboardConfigService:getConfig()
	return self._config
end

function PlatformLeaderboardConfigService:hasActiveConfig(): boolean
	return self._config ~= nil
end

function PlatformLeaderboardConfigService:onConfigChanged(p1)
	return self._configChanged:connect(p1)
end

function PlatformLeaderboardConfigService:teardown()
	-- upvalues: FFlagPlatformLeaderboardDebugLogging (copy)
	local PollTimer = self._pollTimer
	self._pollTimer = nil
	
	if PollTimer and not pcall(task.cancel, PollTimer) and FFlagPlatformLeaderboardDebugLogging then
		warn("[PlatformLeaderboard] ConfigService teardown: failed to cancel poll timer")
	end
end

return PlatformLeaderboardConfigService