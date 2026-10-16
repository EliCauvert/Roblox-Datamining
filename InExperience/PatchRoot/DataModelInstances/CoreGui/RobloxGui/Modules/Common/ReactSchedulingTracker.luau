local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local ReactSchedulingTracker: number = game:DefineFastInt("ReactSchedulingTracker", 0)
local ReactSchedulingTrackerPeriodMs = game:DefineFastInt("ReactSchedulingTrackerPeriodMs", 30000)
local TelemetryServiceMemoryCPUInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServiceMemoryCPUInfoEnabled")
local DisableReactSchedulingTimePctStats = game:DefineFastFlag("DisableReactSchedulingTimePctStats", false)
local DisableReactSchedulingAvgMaxMsStats = game:DefineFastFlag("DisableReactSchedulingAvgMaxMsStats", false)
local FStringReactSchedulingContext = require(CorePackages.Workspace.Packages.SharedFlags).FStringReactSchedulingContext
local ReactSchedulingPercentiles: string = game:DefineFastString("ReactSchedulingPercentiles", "10,50,95,99")
local ReactSchedulingKllSketchMaxSize = game:DefineFastInt("ReactSchedulingKllSketchMaxSize", 200)
local DebugReactSchedulingEnableErrorEvents = game:DefineFastFlag("DebugReactSchedulingEnableErrorEvents", false)
local ReactSchedulingTrackerLayoutEffects = game:DefineFastFlag("ReactSchedulingTrackerLayoutEffects", false)
local ReactSchedulingTrackerDataModelUpdate = game:DefineFastFlag("ReactSchedulingTrackerDataModelUpdate", false)
local TelemetryServicePlaySessionInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local EnableCorescriptExecutionTime = game:DefineFastFlag("EnableCorescriptExecutionTime", false)
local ScriptPlusExecutionTimeEnabledEngineFeature = game:GetEngineFeature("ScriptPlusExecutionTimeEnabled")

function applicationId() --[[ Line: 22 ]]
	local AppStorageService = game:GetService("AppStorageService")
	
	if AppStorageService then
		local AppInstallationIdItem: string = AppStorageService:GetItem("AppInstallationId")
		local ValueType = typeof(AppInstallationIdItem)
		
		return if ValueType == "number" then tonumber(AppInstallationIdItem) or nil elseif ValueType == "string" then if string.len(AppInstallationIdItem) <= 0 then nil else tonumber((string.sub(AppInstallationIdItem, -string.len((tostring(10000)))))) else nil
	else
		return nil
	end
end

local Flag = true
local Flag1 = true

if ReactSchedulingTracker <= 0 then
	Flag1 = false
	Flag = false
end
local RandomValue = math.random(0, 10000)
local ApplicationIdResult: number = applicationId()

if ApplicationIdResult ~= nil then
	RandomValue = (ApplicationIdResult + 1409) % 10000
end
if ReactSchedulingTracker <= RandomValue then
	Flag1 = false
	Flag = false
end
local TelemetryService = game:GetService("TelemetryService")
local MutedErrorFunction = require(CorePackages.Workspace.Packages.Loggers).mutedError
local _ = require(CorePackages.Packages.ReactReconciler)
local KllSketch = require(CorePackages.Workspace.Packages.InExperiencePerformance).KllSketch
local Parts = string.split(ReactSchedulingPercentiles)
local SchedulingProfiler = require(CorePackages.Packages.ReactRoblox).schedulingProfiler
local ProfilerEventTypes = SchedulingProfiler.profilerEventTypes

local function _(): number --[[ Line: 98 | Named "getCurrentTimeMs" ]]
	return os.clock() * 1000
end

local DeviceMemoryTier = require(game:GetService("CorePackages").Workspace.Packages.Devices).DeviceTier.GetDeviceMemoryTier()
local Module = {}
Module.__index = Module

function Module.new(FrameReporter, RootReporter) --[[ Line: 141 ]]
	-- upvalues: ReactSchedulingTrackerLayoutEffects (copy), ProfilerEventTypes (copy), MutedErrorFunction (copy), Module (copy)
	return (setmetatable({
		currentState = "Idle",
		timerStartMs = 0,
		rootUpdateInProgress = false,
		renderLevel = 0,
		frameReporter = FrameReporter,
		rootReporter = RootReporter,
		layoutTimerStartMs = if ReactSchedulingTrackerLayoutEffects then 0 else nil,
		rootUpdateTime = {
			tag = "RootUpdateTime",
			RenderMs = 0,
			CommitMs = 0,
			StartTimeMs = 0,
			LayoutEffectsMs = if ReactSchedulingTrackerLayoutEffects then 0 else nil
		},
		rootPassiveEffectsTime = { tag = "RootPassiveEffectsTime", PassiveEffectsMs = 0 },
		states = {
			Idle = function(p1, CommitStart): string? --[[ Line: 165 ]]
				-- upvalues: ProfilerEventTypes (upval), ReactSchedulingTrackerLayoutEffects (upval)
				if CommitStart == ProfilerEventTypes.RenderStart then
					p1.timerStartMs = os.clock() * 1000
					
					if not p1.rootUpdateInProgress then
						p1.rootUpdateInProgress = true
						p1.rootUpdateTime = {
							tag = "RootUpdateTime",
							RenderMs = 0,
							CommitMs = 0,
							LayoutEffectsMs = if ReactSchedulingTrackerLayoutEffects then 0 else nil,
							StartTimeMs = os.clock() * 1000
						}
					end
					return "Render"
				elseif CommitStart == ProfilerEventTypes.PassiveEffectsStart then
					p1.timerStartMs = os.clock() * 1000
					p1.rootPassiveEffectsTime = { tag = "RootPassiveEffectsTime", PassiveEffectsMs = 0 }
					
					return "PassiveEffects"
				elseif CommitStart == ProfilerEventTypes.CommitStart then
					p1.timerStartMs = os.clock() * 1000
					
					return "Commit"
				else
					return nil
				end
			end,
			Render = function(p1, RenderStop): string --[[ Line: 194 ]]
				-- upvalues: ProfilerEventTypes (upval), MutedErrorFunction (upval)
				if RenderStop == ProfilerEventTypes.RenderYield or RenderStop == ProfilerEventTypes.RenderStop then
					local ClockTimeDelta = os.clock() * 1000 - p1.timerStartMs
					local RootUpdateTime = p1.rootUpdateTime
					RootUpdateTime.RenderMs += ClockTimeDelta
					p1.frameReporter(ClockTimeDelta)
					
					return "Idle"
				else
					MutedErrorFunction("Invalid event in Render: " .. RenderStop)
					
					return "Idle"
				end
			end,
			Commit = function(p1, CommitStop, p2): string? --[[ Line: 206 ]]
				-- upvalues: ProfilerEventTypes (upval), ReactSchedulingTrackerLayoutEffects (upval), MutedErrorFunction (upval)
				if CommitStop == ProfilerEventTypes.CommitStop then
					if p1.renderLevel > 0 then
						if ReactSchedulingTrackerLayoutEffects and p1.renderLevel == 1 then
							local RootUpdateTime = p1.rootUpdateTime
							RootUpdateTime.LayoutEffectsMs += os.clock() * 1000 - p1.layoutTimerStartMs
						end
						p1.renderLevel -= 1
						
						return nil
					else
						local ClockTimeDelta = os.clock() * 1000 - p1.timerStartMs
						local RootUpdateTime = p1.rootUpdateTime
						RootUpdateTime.CommitMs += ClockTimeDelta
						p1.frameReporter(ClockTimeDelta)
						p1.rootReporter(p1.rootUpdateTime, p2)
						p1.rootUpdateInProgress = false
						
						return "Idle"
					end
				elseif CommitStop == ProfilerEventTypes.RenderStart then
					p1.renderLevel += 1
					
					if ReactSchedulingTrackerLayoutEffects and p1.renderLevel == 1 then
						p1.layoutTimerStartMs = os.clock() * 1000
					end
					return nil
				elseif ReactSchedulingTrackerLayoutEffects and (CommitStop == ProfilerEventTypes.LayoutEffectsStart or CommitStop == ProfilerEventTypes.PassiveEffectsStart) then
					if p1.renderLevel == 0 then
						p1.layoutTimerStartMs = os.clock() * 1000
					end
					return nil
				elseif ReactSchedulingTrackerLayoutEffects and (CommitStop == ProfilerEventTypes.LayoutEffectsStop or CommitStop == ProfilerEventTypes.PassiveEffectsStop) then
					if p1.renderLevel == 0 then
						local RootUpdateTime = p1.rootUpdateTime
						RootUpdateTime.LayoutEffectsMs += os.clock() * 1000 - p1.layoutTimerStartMs
					end
					return nil
				elseif CommitStop == ProfilerEventTypes.RenderYield then
					MutedErrorFunction("Invalid event in Commit: " .. CommitStop)
					
					return "Idle"
				else
					return nil
				end
			end,
			PassiveEffects = function(p1, PassiveEffectsStop, p2): string --[[ Line: 253 ]]
				-- upvalues: ProfilerEventTypes (upval), MutedErrorFunction (upval)
				if PassiveEffectsStop == ProfilerEventTypes.PassiveEffectsStop then
					local ClockTimeDelta = os.clock() * 1000 - p1.timerStartMs
					local RootPassiveEffectsTime = p1.rootPassiveEffectsTime
					RootPassiveEffectsTime.PassiveEffectsMs += ClockTimeDelta
					p1.frameReporter(ClockTimeDelta)
					p1.rootReporter(p1.rootPassiveEffectsTime, p2)
					
					return "Idle"
				else
					MutedErrorFunction("Invalid event in PassiveEffects: " .. PassiveEffectsStop)
					
					return "Idle"
				end
			end
		}
	}, Module))
end

function Module:transition(p1, p2) --[[ Line: 276 ]]
	local CurrentState = self.states[self.currentState](self, p1, p2)
	
	if CurrentState then
		self.currentState = CurrentState
	end
end

local List = if TelemetryServiceMemoryCPUInfoEnabledEngineFeature then {
	"addPlaceId", "addUniverseId", "addSessionId", "addOSInfo", "addSessionInfo",
	"addMemoryInfo", "addCPUInfo"
} else {
	"addPlaceId",
	"addUniverseId",
	"addSessionId",
	"addOSInfo",
	"addSessionInfo"
}

if TelemetryServicePlaySessionInfoEnabledEngineFeature then
	table.insert(List, "addPlaySessionId")
end
local config = {
	eventName = "ReactSessionSummary",
	description = "Summary of React performance over a game session",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ReactSessionSummaryEventThrottleHunderedthsPercent", 0),
	lastUpdated = { 2025, 7, 10 }
}
local Config = if DebugReactSchedulingEnableErrorEvents then {
	eventName = "ReactSessionErrorEvent",
	description = "Summary of React performance over a game session",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("DebugReactSessionErrorEventThrottleHunderedthsPercent", 0),
	lastUpdated = { 2025, 8, 7 }
} else nil
local config1 = {
	eventName = "ReactPeriodSummary",
	description = "Summary of React performance over a period",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ReactPeriodSummaryEventThrottleHunderedthsPercent", 0),
	lastUpdated = { 2025, 2, 18 }
}
local config2 = {
	eventName = "ReactPeriod",
	description = "Stats for React performance over a period",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 18 }
}
local config3 = {
	eventName = "ReactFrameCounter",
	description = "Frame counts for React performance over a period",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2025, 2, 18 }
}
local config4 = {
	eventName = "ReactRootSummary",
	description = "Summary of React performance for a root",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "EventIngest" },
	lastUpdated = { 2025, 2, 18 },
	throttlingPercentage = game:DefineFastInt("ReactRootSummaryEventThrottleHunderedthsPercent2", 0)
}
local Config1 = if DisableReactSchedulingTimePctStats then nil else {
	eventName = "ReactRootPeriod",
	description = "Stats for React performance for a root over a period",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 18 }
}
local config5 = {
	eventName = "ReactRootTaskCount",
	description = "Task counts for React performance for a root over a period",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2025, 2, 18 }
}
local Config2 = if DisableReactSchedulingAvgMaxMsStats then nil else {
	eventName = "ReactRootPeriodTask",
	description = "Task stats for React performance for a root over a period",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 18 }
}
local config6 = {
	eventName = "ReactRootUpdate",
	description = "Task stats for individual React root updates, all in milliseconds",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 18 }
}
local Module1 = {}
Module1.__index = Module1

function Module1.new(Context) --[[ Line: 464 ]]
	-- upvalues: KllSketch (copy), ReactSchedulingKllSketchMaxSize (copy), DebugReactSchedulingEnableErrorEvents (copy), Module1 (copy), Module (copy), Flag1 (ref)
	local t = {}
	local t1 = {}
	local t2 = {}
	local Sketches = { all = KllSketch.new(ReactSchedulingKllSketchMaxSize) }
	local Sketches1 = { all = KllSketch.new(ReactSchedulingKllSketchMaxSize) }
	local Sketches2 = { all = KllSketch.new(ReactSchedulingKllSketchMaxSize) }
	
	if DebugReactSchedulingEnableErrorEvents then
		t.all = {}
		t1.all = {}
		t2.all = {}
	end
	local self = setmetatable({
		started = false,
		periodStartMs = 0,
		reactFrameTimeMs = 0,
		frameMetrics = {
			totalFrameCount = 0,
			reactFrameCount = 0,
			totalReactTimeMs = 0,
			totalCorescriptTimeMs = 0,
			maxReactFrameTimeMs = 0,
			allFrameHistogram = { 0, 0, 0, 0 },
			reactFrameHistogram = { 0, 0, 0, 0 },
			reactDropChangeHistogram = { 0, 0, 0, 0 }
		},
		rootsMetrics = {},
		sessionMetrics = {
			updateTime = {
				numRoots = 1,
				sketches = Sketches,
				allData = if DebugReactSchedulingEnableErrorEvents then t else {}
			},
			commitTime = {
				numRoots = 1,
				sketches = Sketches1,
				allData = if DebugReactSchedulingEnableErrorEvents then t1 else {}
			},
			timeToUpdate = {
				numRoots = 1,
				sketches = Sketches2,
				allData = if DebugReactSchedulingEnableErrorEvents then t2 else {}
			},
			timePerFrame = {
				sketch = KllSketch.new(ReactSchedulingKllSketchMaxSize),
				allData = {}
			},
			timePerReactFrame = {
				sketch = KllSketch.new(ReactSchedulingKllSketchMaxSize),
				allData = {}
			}
		},
		context = Context
	}, Module1)
	self.schedulerStateMachine = Module.new(function(p1) --[[ Line: 519 ]]
		-- upvalues: self (copy)
		self:addToFrame(p1)
	end, function(p1, p2) --[[ Line: 521 ]]
		-- upvalues: self (copy), Flag1 (upval)
		self:trackSessionSketches(p1, p2)
		
		if Flag1 then
			self:reportRoot(p1, p2)
		end
	end)
	
	return self
end

function Module1:start() --[[ Line: 531 ]]
	-- upvalues: SchedulingProfiler (copy), RunService (copy), ReactSchedulingTrackerPeriodMs (copy), Flag (ref)
	self.started = true
	self:resetState()
	SchedulingProfiler.registerProfilerEventCallback(function(p1, p2) --[[ Line: 535 ]]
		-- upvalues: self (copy)
		self.schedulerStateMachine:transition(p1, p2)
	end)
	RunService.Heartbeat:Connect(function(DeltaTime: number) --[[ Line: 539 ]]
		-- upvalues: self (copy), ReactSchedulingTrackerPeriodMs (upval), Flag (upval)
		self:processFrame(DeltaTime * 1000)
		self.reactFrameTimeMs = 0
		
		if ReactSchedulingTrackerPeriodMs < os.clock() * 1000 - self.periodStartMs then
			if Flag then
				self:reportPeriod()
			end
			self:resetState()
		end
	end)
end

function Module1:resetState() --[[ Line: 554 ]]
	self.periodStartMs = os.clock() * 1000
	self.frameMetrics = {
		totalFrameCount = 0,
		reactFrameCount = 0,
		totalReactTimeMs = 0,
		totalCorescriptTimeMs = 0,
		maxReactFrameTimeMs = 0,
		allFrameHistogram = { 0, 0, 0, 0 },
		reactFrameHistogram = { 0, 0, 0, 0 },
		reactDropChangeHistogram = { 0, 0, 0, 0 }
	}
	self.rootsMetrics = {}
end

function Module1:getRootName(p1) --[[ Line: 571 ]]
	local Name = "Unknown"
	
	if p1 then
		if p1.containerInfo.Name ~= "Folder" then
			Name = p1.containerInfo.Name
			
			return Name
		end
		if p1.current and p1.current.child and p1.current.child.memoizedProps then
			for i, _ in p1.current.child.memoizedProps do
				if typeof(i) == "string" then
					Name = i
					
					return Name
				end
			end
		end
	end
	return Name
end

function Module1:addToFrame(p2) --[[ Line: 588 ]]
	self.reactFrameTimeMs += p2
end

function Module1:trackSessionSketches(RootUpdateTime, p2) --[[ Line: 592 ]]
	-- upvalues: DebugReactSchedulingEnableErrorEvents (copy), KllSketch (copy), ReactSchedulingKllSketchMaxSize (copy)
	if not self.sessionMetrics then return end
	local RootName = self:getRootName(p2)
	
	if RootUpdateTime.tag == "RootUpdateTime" then
		local ClockTimeDelta = os.clock() * 1000 - RootUpdateTime.StartTimeMs
		
		if DebugReactSchedulingEnableErrorEvents then
			table.insert(self.sessionMetrics.updateTime.allData.all, RootUpdateTime.RenderMs + RootUpdateTime.CommitMs)
			table.insert(self.sessionMetrics.commitTime.allData.all, RootUpdateTime.CommitMs)
			table.insert(self.sessionMetrics.timeToUpdate.allData.all, ClockTimeDelta)
		end
		self.sessionMetrics.updateTime.sketches.all:insert(RootUpdateTime.RenderMs + RootUpdateTime.CommitMs)
		self.sessionMetrics.commitTime.sketches.all:insert(RootUpdateTime.CommitMs)
		self.sessionMetrics.timeToUpdate.sketches.all:insert(ClockTimeDelta)
		
		if not self.sessionMetrics.updateTime.sketches[RootName] then
			self.sessionMetrics.updateTime.sketches[RootName] = KllSketch.new(ReactSchedulingKllSketchMaxSize)
			
			if DebugReactSchedulingEnableErrorEvents then
				self.sessionMetrics.updateTime.allData[RootName] = {}
			end
			local UpdateTime = self.sessionMetrics.updateTime
			UpdateTime.numRoots += 1
		end
		self.sessionMetrics.updateTime.sketches[RootName]:insert(RootUpdateTime.RenderMs + RootUpdateTime.CommitMs)
		
		if DebugReactSchedulingEnableErrorEvents then
			table.insert(self.sessionMetrics.updateTime.allData[RootName], RootUpdateTime.RenderMs + RootUpdateTime.CommitMs)
		end
		if not self.sessionMetrics.commitTime.sketches[RootName] then
			self.sessionMetrics.commitTime.sketches[RootName] = KllSketch.new(ReactSchedulingKllSketchMaxSize)
			
			if DebugReactSchedulingEnableErrorEvents then
				self.sessionMetrics.commitTime.allData[RootName] = {}
			end
			local CommitTime = self.sessionMetrics.commitTime
			CommitTime.numRoots += 1
		end
		self.sessionMetrics.commitTime.sketches[RootName]:insert(RootUpdateTime.CommitMs)
		
		if DebugReactSchedulingEnableErrorEvents then
			table.insert(self.sessionMetrics.commitTime.allData[RootName], RootUpdateTime.CommitMs)
		end
		if not self.sessionMetrics.timeToUpdate.sketches[RootName] then
			self.sessionMetrics.timeToUpdate.sketches[RootName] = KllSketch.new(ReactSchedulingKllSketchMaxSize)
			
			if DebugReactSchedulingEnableErrorEvents then
				self.sessionMetrics.timeToUpdate.allData[RootName] = {}
			end
			local TimeToUpdate = self.sessionMetrics.timeToUpdate
			TimeToUpdate.numRoots += 1
		end
		self.sessionMetrics.timeToUpdate.sketches[RootName]:insert(ClockTimeDelta)
		
		if DebugReactSchedulingEnableErrorEvents then
			table.insert(self.sessionMetrics.timeToUpdate.allData[RootName], ClockTimeDelta)
		end
	end
end

function Module1:reportRoot(RootUpdateTime, p2) --[[ Line: 652 ]]
	-- upvalues: ReactSchedulingTrackerLayoutEffects (copy), ReactSchedulingTrackerDataModelUpdate (copy), TelemetryService (copy), config6 (copy), DeviceMemoryTier (copy)
	local RootName = self:getRootName(p2)
	
	if not self.rootsMetrics[RootName] then
		self.rootsMetrics[RootName] = {
			update_count = 0,
			render_total_time_ms = 0,
			commit_total_time_ms = 0,
			max_render_time_ms = 0,
			max_commit_time_ms = 0,
			max_update_time_ms = 0,
			passive_effects_count = 0,
			passive_effects_total_time_ms = 0,
			max_passive_effects_time_ms = 0,
			total_time_to_update_ms = 0,
			max_time_to_update_ms = 0,
			layout_effects_count = if ReactSchedulingTrackerLayoutEffects then 0 else nil,
			layout_effects_total_time_ms = if ReactSchedulingTrackerLayoutEffects then 0 else nil,
			data_model_update_total_time_ms = if ReactSchedulingTrackerLayoutEffects and ReactSchedulingTrackerDataModelUpdate then 0 else nil,
			max_layout_effects_time_ms = if ReactSchedulingTrackerLayoutEffects then 0 else nil,
			max_data_model_update_time_ms = if ReactSchedulingTrackerLayoutEffects and ReactSchedulingTrackerDataModelUpdate then 0 else nil
		}
	end
	local RootsMetric = self.rootsMetrics[RootName]
	
	if RootUpdateTime.tag == "RootPassiveEffectsTime" then
		TelemetryService:LogStat(config6, {
			customFields = {
				updateType = "PassiveEffects",
				rootName = RootName,
				deviceTier = DeviceMemoryTier,
				context = self.context
			}
		}, RootUpdateTime.PassiveEffectsMs)
		RootsMetric.passive_effects_count += 1
		RootsMetric.passive_effects_total_time_ms += RootUpdateTime.PassiveEffectsMs
		
		if RootsMetric.max_passive_effects_time_ms < RootUpdateTime.PassiveEffectsMs then
			RootsMetric.max_passive_effects_time_ms = RootUpdateTime.PassiveEffectsMs
			
			return
		end
	elseif RootUpdateTime.tag == "RootUpdateTime" then
		local ClockTimeDelta = os.clock() * 1000 - RootUpdateTime.StartTimeMs
		TelemetryService:LogStat(config6, {
			customFields = {
				updateType = "TimeToComplete",
				rootName = RootName,
				deviceTier = DeviceMemoryTier,
				context = self.context
			}
		}, ClockTimeDelta)
		RootsMetric.total_time_to_update_ms += ClockTimeDelta
		
		if RootsMetric.max_time_to_update_ms < ClockTimeDelta then
			RootsMetric.max_time_to_update_ms = ClockTimeDelta
		end
		TelemetryService:LogStat(config6, {
			customFields = {
				updateType = "RenderAndCommit",
				rootName = RootName,
				deviceTier = DeviceMemoryTier,
				context = self.context
			}
		}, RootUpdateTime.RenderMs + RootUpdateTime.CommitMs)
		TelemetryService:LogStat(config6, {
			customFields = {
				updateType = "Commit",
				rootName = RootName,
				deviceTier = DeviceMemoryTier,
				context = self.context
			}
		}, RootUpdateTime.CommitMs)
		
		if ReactSchedulingTrackerLayoutEffects then
			if RootUpdateTime.LayoutEffectsMs > 0 then
				TelemetryService:LogStat(config6, {
					customFields = {
						updateType = "LayoutEffects",
						rootName = RootName,
						deviceTier = DeviceMemoryTier,
						context = self.context
					}
				}, RootUpdateTime.LayoutEffectsMs)
			end
			if ReactSchedulingTrackerDataModelUpdate then
				TelemetryService:LogStat(config6, {
					customFields = {
						updateType = "DataModelUpdate",
						rootName = RootName,
						deviceTier = DeviceMemoryTier,
						context = self.context
					}
				}, RootUpdateTime.CommitMs - RootUpdateTime.LayoutEffectsMs)
			end
		end
		RootsMetric.update_count += 1
		
		if RootsMetric.max_update_time_ms < RootUpdateTime.RenderMs + RootUpdateTime.CommitMs then
			RootsMetric.max_update_time_ms = RootUpdateTime.RenderMs + RootUpdateTime.CommitMs
		end
		RootsMetric.render_total_time_ms += RootUpdateTime.RenderMs
		RootsMetric.commit_total_time_ms += RootUpdateTime.CommitMs
		
		if RootsMetric.max_render_time_ms < RootUpdateTime.RenderMs then
			RootsMetric.max_render_time_ms = RootUpdateTime.RenderMs
		end
		if RootsMetric.max_commit_time_ms < RootUpdateTime.CommitMs then
			RootsMetric.max_commit_time_ms = RootUpdateTime.CommitMs
		end
		if ReactSchedulingTrackerLayoutEffects then
			if RootUpdateTime.LayoutEffectsMs > 0 then
				RootsMetric.layout_effects_count += 1
				RootsMetric.layout_effects_total_time_ms += RootUpdateTime.LayoutEffectsMs
				
				if RootsMetric.max_layout_effects_time_ms < RootUpdateTime.LayoutEffectsMs then
					RootsMetric.max_layout_effects_time_ms = RootUpdateTime.LayoutEffectsMs
				end
			end
			if ReactSchedulingTrackerDataModelUpdate then
				RootsMetric.data_model_update_total_time_ms += RootUpdateTime.CommitMs - RootUpdateTime.LayoutEffectsMs
				
				if RootsMetric.max_data_model_update_time_ms < RootUpdateTime.CommitMs - RootUpdateTime.LayoutEffectsMs then
					RootsMetric.max_data_model_update_time_ms = RootUpdateTime.CommitMs - RootUpdateTime.LayoutEffectsMs
				end
			end
		end
	end
end

function Module1:getFrameBucket(p2: number): number --[[ Line: 791 ]]
	return (math.min(4, math.floor(math.max(0, p2 - 2) / 16.666666666666668) + 1))
end

function Module1:processFrame(p2: number) --[[ Line: 798 ]]
	-- upvalues: ScriptPlusExecutionTimeEnabledEngineFeature (copy), EnableCorescriptExecutionTime (copy), RunService (copy), DebugReactSchedulingEnableErrorEvents (copy)
	local FrameMetrics = self.frameMetrics
	local ReactFrameTimeMs: number = self.reactFrameTimeMs
	
	if ScriptPlusExecutionTimeEnabledEngineFeature and EnableCorescriptExecutionTime then
		local TotalScriptPlusExecutionTime: number = RunService:GetTotalScriptPlusExecutionTime()
		
		if TotalScriptPlusExecutionTime > 0 then
			FrameMetrics.totalCorescriptTimeMs += TotalScriptPlusExecutionTime
		end
	end
	FrameMetrics.totalFrameCount += 1
	local FrameBucket = self:getFrameBucket(p2)
	local AllFrameHistogram = FrameMetrics.allFrameHistogram
	AllFrameHistogram[FrameBucket] += 1
	self.sessionMetrics.timePerFrame.sketch:insert(ReactFrameTimeMs)
	
	if DebugReactSchedulingEnableErrorEvents then
		table.insert(self.sessionMetrics.timePerFrame.allData, ReactFrameTimeMs)
	end
	if ReactFrameTimeMs > 0 then
		FrameMetrics.totalReactTimeMs += ReactFrameTimeMs
		local ReactFrameHistogram = FrameMetrics.reactFrameHistogram
		ReactFrameHistogram[FrameBucket] += 1
		self.sessionMetrics.timePerReactFrame.sketch:insert(ReactFrameTimeMs)
		
		if DebugReactSchedulingEnableErrorEvents then
			table.insert(self.sessionMetrics.timePerReactFrame.allData, ReactFrameTimeMs)
		end
		FrameMetrics.reactFrameCount += 1
		
		if FrameMetrics.maxReactFrameTimeMs < ReactFrameTimeMs then
			FrameMetrics.maxReactFrameTimeMs = ReactFrameTimeMs
		end
		local ReactDropChangeHistogram = FrameMetrics.reactDropChangeHistogram
		local NewFrameBucket = FrameBucket - self:getFrameBucket(p2 - ReactFrameTimeMs) + 1
		ReactDropChangeHistogram[NewFrameBucket] += 1
	end
end

function Module1:reportPeriod() --[[ Line: 837 ]]
	-- upvalues: TelemetryService (copy), config1 (copy), List (ref), config2 (copy), DeviceMemoryTier (copy), ScriptPlusExecutionTimeEnabledEngineFeature (copy), EnableCorescriptExecutionTime (copy), config3 (copy), ReactSchedulingTrackerLayoutEffects (copy), ReactSchedulingTrackerDataModelUpdate (copy), config4 (copy), DisableReactSchedulingTimePctStats (copy), Config1 (ref), config5 (copy), DisableReactSchedulingAvgMaxMsStats (copy), Config2 (ref)
	local FrameMetrics = self.frameMetrics
	local ClockTimeDelta = os.clock() * 1000 - self.periodStartMs
	local CustomFields = {
		period_length_ms = ClockTimeDelta,
		react_total_time_ms = FrameMetrics.totalReactTimeMs,
		react_total_time_pct = FrameMetrics.totalReactTimeMs / ClockTimeDelta,
		react_frame_count = FrameMetrics.reactFrameCount,
		total_frame_count = FrameMetrics.totalFrameCount,
		corescript_total_time_ms = FrameMetrics.totalCorescriptTimeMs,
		corescript_total_time_pct = FrameMetrics.totalCorescriptTimeMs / ClockTimeDelta,
		average_react_all_frame_ms = FrameMetrics.totalReactTimeMs / FrameMetrics.totalFrameCount,
		average_react_only_frame_ms = if FrameMetrics.reactFrameCount > 0 then FrameMetrics.totalReactTimeMs / FrameMetrics.reactFrameCount else 0,
		max_react_frame_ms = FrameMetrics.maxReactFrameTimeMs,
		all_frame_drop0 = FrameMetrics.allFrameHistogram[1],
		all_frame_drop1 = FrameMetrics.allFrameHistogram[2],
		all_frame_drop2 = FrameMetrics.allFrameHistogram[3],
		all_frame_drop3 = FrameMetrics.allFrameHistogram[4],
		react_frame_drop0 = FrameMetrics.reactFrameHistogram[1],
		react_frame_drop1 = FrameMetrics.reactFrameHistogram[2],
		react_frame_drop2 = FrameMetrics.reactFrameHistogram[3],
		react_frame_drop3 = FrameMetrics.reactFrameHistogram[4],
		react_drop_change0 = FrameMetrics.reactDropChangeHistogram[1],
		react_drop_change1 = FrameMetrics.reactDropChangeHistogram[2],
		react_drop_change2 = FrameMetrics.reactDropChangeHistogram[3],
		react_drop_change3 = FrameMetrics.reactDropChangeHistogram[4]
	}
	TelemetryService:LogEvent(config1, { standardizedFields = List, customFields = CustomFields })
	TelemetryService:LogStat(config2, {
		customFields = {
			stat = "ReactTotalTimePct",
			context = self.context,
			deviceTier = DeviceMemoryTier
		}
	}, CustomFields.react_total_time_pct)
	
	if ScriptPlusExecutionTimeEnabledEngineFeature and EnableCorescriptExecutionTime then
		TelemetryService:LogStat(config2, {
			customFields = {
				stat = "TotalCorescriptTimePct",
				context = self.context,
				deviceTier = DeviceMemoryTier
			}
		}, CustomFields.corescript_total_time_pct)
	end
	TelemetryService:LogStat(config2, {
		customFields = {
			stat = "AverageReactAllFrameMs",
			context = self.context,
			deviceTier = DeviceMemoryTier
		}
	}, CustomFields.average_react_all_frame_ms)
	TelemetryService:LogStat(config2, {
		customFields = {
			stat = "AverageReactOnlyFrameMs",
			context = self.context,
			deviceTier = DeviceMemoryTier
		}
	}, CustomFields.average_react_only_frame_ms)
	TelemetryService:LogStat(config2, {
		customFields = {
			stat = "MaxReactFrameMs",
			context = self.context,
			deviceTier = DeviceMemoryTier
		}
	}, CustomFields.max_react_frame_ms)
	
	for i = 1, 4 do
		local IDelta = i - 1
		TelemetryService:LogCounter(config3, {
			customFields = {
				category = "AllFrame",
				bucket = IDelta,
				context = self.context,
				deviceTier = DeviceMemoryTier
			}
		}, FrameMetrics.allFrameHistogram[i])
		TelemetryService:LogCounter(config3, {
			customFields = {
				category = "ReactFrame",
				bucket = IDelta,
				context = self.context,
				deviceTier = DeviceMemoryTier
			}
		}, FrameMetrics.reactFrameHistogram[i])
		TelemetryService:LogCounter(config3, {
			customFields = {
				category = "ReactDropChange",
				bucket = IDelta,
				context = self.context,
				deviceTier = DeviceMemoryTier
			}
		}, FrameMetrics.reactDropChangeHistogram[i])
	end
	for Root_name, rootsMetric in self.rootsMetrics do
		rootsMetric.root_name = Root_name
		rootsMetric.update_total_time_ms = rootsMetric.render_total_time_ms + rootsMetric.commit_total_time_ms
		rootsMetric.total_time_ms = rootsMetric.update_total_time_ms + rootsMetric.passive_effects_total_time_ms
		rootsMetric.avg_render_time_ms = rootsMetric.render_total_time_ms / rootsMetric.update_count
		rootsMetric.context = self.context
		rootsMetric.total_time_pct = (rootsMetric.update_total_time_ms + rootsMetric.passive_effects_total_time_ms) / CustomFields.react_total_time_ms
		rootsMetric.avg_update_time_ms = rootsMetric.update_total_time_ms / rootsMetric.update_count
		rootsMetric.avg_commit_time_ms = rootsMetric.commit_total_time_ms / rootsMetric.update_count
		
		if ReactSchedulingTrackerLayoutEffects then
			rootsMetric.avg_layout_effects_time_ms = rootsMetric.layout_effects_total_time_ms / rootsMetric.layout_effects_count
			
			if ReactSchedulingTrackerDataModelUpdate then
				rootsMetric.avg_data_model_update_time_ms = rootsMetric.data_model_update_total_time_ms / rootsMetric.update_count
			end
		end
		rootsMetric.avg_passive_effects_time_ms = rootsMetric.passive_effects_total_time_ms / rootsMetric.passive_effects_count
		rootsMetric.avg_time_to_update_ms = rootsMetric.total_time_to_update_ms / rootsMetric.update_count
		TelemetryService:LogEvent(config4, { standardizedFields = List, customFields = rootsMetric })
		
		if not DisableReactSchedulingTimePctStats then
			TelemetryService:LogStat(Config1, {
				customFields = {
					stat = "TotalTimePct",
					rootName = rootsMetric.root_name,
					deviceTier = DeviceMemoryTier,
					context = self.context
				}
			}, rootsMetric.total_time_pct)
		end
		TelemetryService:LogCounter(config5, {
			customFields = {
				task = "RenderAndCommit",
				rootName = rootsMetric.root_name,
				deviceTier = DeviceMemoryTier,
				context = self.context
			}
		}, rootsMetric.update_count)
		
		if ReactSchedulingTrackerLayoutEffects then
			TelemetryService:LogCounter(config5, {
				customFields = {
					task = "LayoutEffects",
					rootName = rootsMetric.root_name,
					deviceTier = DeviceMemoryTier,
					context = self.context
				}
			}, rootsMetric.layout_effects_count)
		end
		TelemetryService:LogCounter(config5, {
			customFields = {
				task = "PassiveEffects",
				rootName = rootsMetric.root_name,
				deviceTier = DeviceMemoryTier,
				context = self.context
			}
		}, rootsMetric.passive_effects_count)
		
		if not DisableReactSchedulingAvgMaxMsStats then
			TelemetryService:LogStat(Config2, {
				customFields = {
					task = "RenderAndCommit",
					stat = "AvgMs",
					rootName = rootsMetric.root_name,
					deviceTier = DeviceMemoryTier,
					context = self.context
				}
			}, rootsMetric.avg_update_time_ms)
			TelemetryService:LogStat(Config2, {
				customFields = {
					task = "Commit",
					stat = "AvgMs",
					rootName = rootsMetric.root_name,
					deviceTier = DeviceMemoryTier,
					context = self.context
				}
			}, rootsMetric.avg_commit_time_ms)
			
			if ReactSchedulingTrackerLayoutEffects then
				TelemetryService:LogStat(Config2, {
					customFields = {
						task = "LayoutEffects",
						stat = "AvgMs",
						rootName = rootsMetric.root_name,
						deviceTier = DeviceMemoryTier,
						context = self.context
					}
				}, rootsMetric.avg_layout_effects_time_ms)
				
				if ReactSchedulingTrackerDataModelUpdate then
					TelemetryService:LogStat(Config2, {
						customFields = {
							task = "DataModelUpdate",
							stat = "AvgMs",
							rootName = rootsMetric.root_name,
							deviceTier = DeviceMemoryTier,
							context = self.context
						}
					}, rootsMetric.avg_data_model_update_time_ms)
				end
			end
			TelemetryService:LogStat(Config2, {
				customFields = {
					task = "TimeToUpdateMs",
					stat = "AvgMs",
					rootName = rootsMetric.root_name,
					deviceTier = DeviceMemoryTier,
					context = self.context
				}
			}, rootsMetric.avg_time_to_update_ms)
			TelemetryService:LogStat(Config2, {
				customFields = {
					task = "PassiveEffects",
					stat = "AvgMs",
					rootName = rootsMetric.root_name,
					deviceTier = DeviceMemoryTier,
					context = self.context
				}
			}, rootsMetric.avg_passive_effects_time_ms)
			TelemetryService:LogStat(Config2, {
				customFields = {
					task = "RenderAndCommit",
					stat = "MaxMs",
					rootName = rootsMetric.root_name,
					deviceTier = DeviceMemoryTier,
					context = self.context
				}
			}, rootsMetric.max_update_time_ms)
			TelemetryService:LogStat(Config2, {
				customFields = {
					task = "Commit",
					stat = "MaxMs",
					rootName = rootsMetric.root_name,
					deviceTier = DeviceMemoryTier,
					context = self.context
				}
			}, rootsMetric.max_commit_time_ms)
			
			if ReactSchedulingTrackerLayoutEffects then
				TelemetryService:LogStat(Config2, {
					customFields = {
						task = "LayoutEffects",
						stat = "MaxMs",
						rootName = rootsMetric.root_name,
						deviceTier = DeviceMemoryTier,
						context = self.context
					}
				}, rootsMetric.max_layout_effects_time_ms)
				
				if ReactSchedulingTrackerDataModelUpdate then
					TelemetryService:LogStat(Config2, {
						customFields = {
							task = "DataModelUpdate",
							stat = "MaxMs",
							rootName = rootsMetric.root_name,
							deviceTier = DeviceMemoryTier,
							context = self.context
						}
					}, rootsMetric.max_data_model_update_time_ms)
				end
			end
			TelemetryService:LogStat(Config2, {
				customFields = {
					task = "TimeToUpdateMs",
					stat = "MaxMs",
					rootName = rootsMetric.root_name,
					deviceTier = DeviceMemoryTier,
					context = self.context
				}
			}, rootsMetric.max_time_to_update_ms)
			TelemetryService:LogStat(Config2, {
				customFields = {
					task = "PassiveEffects",
					stat = "MaxMs",
					rootName = rootsMetric.root_name,
					deviceTier = DeviceMemoryTier,
					context = self.context
				}
			}, rootsMetric.max_passive_effects_time_ms)
		end
	end
end

function generatePercentilesFromSingleSketch(p2): string --[[ Line: 1141 ]]
	-- upvalues: Parts (copy)
	local Text = "{"
	
	for i, part in Parts do
		Text = (Text .. "\"p" .. part .. "\":") .. p2:getPercentile(tonumber(part) or 0)
		
		if i < #Parts then
			Text ..= ","
		end
	end
	return Text .. "}"
end

function generatePercentilesFromSketches(List, p3): string --[[ Line: 1155 ]]
	-- upvalues: Parts (copy)
	local v1 = "{"
	
	for i, part in Parts do
		local Text = v1 .. "\"p" .. part .. "\":{"
		local Number: number = tonumber(part) or 0
		local Count = 0
		
		for i1, value in List do
			Count += 1
			Text ..= "\"" .. i1 .. "\":" .. value:getPercentile(Number)
			
			if Count < p3 then
				Text ..= ","
			end
		end
		v1 = Text .. (if i < #Parts then "}," else "}")
	end
	return v1 .. "}"
end

function Module1:reportPercentError(List1, p4, Metric, RootName) --[[ Line: 1175 ]]
	-- upvalues: Parts (copy), TelemetryService (copy), Config (ref), List (ref)
	table.sort(List1)
	local CountList1 = #List1
	
	if CountList1 < 1 then return end
	for _, part in Parts do
		local Entry = List1[math.ceil((tonumber(part) or 0) / 100 * CountList1)]
		local Percentile = if p4.sketches then p4.sketches[RootName]:getPercentile(part) else p4.sketch:getPercentile(part)
		local ApproxError = 0
		
		if Entry ~= 0 or Percentile == 0 then
			if Entry ~= 0 then
				ApproxError = (Percentile - Entry) * 100 / Entry
			end
			TelemetryService:LogEvent(Config, {
				standardizedFields = List,
				customFields = {
					rootName = RootName,
					percentile = part,
					metric = Metric,
					numDatapoints = CountList1,
					context = self.context,
					approxError = ApproxError
				}
			})
		end
	end
end

function Module1:reportSession() --[[ Line: 1215 ]]
	-- upvalues: DebugReactSchedulingEnableErrorEvents (copy), TelemetryService (copy), config (copy), List (ref)
	if not self.started then return end
	local CustomFields = {
		reactUpdateTime = generatePercentilesFromSketches(self.sessionMetrics.updateTime.sketches, self.sessionMetrics.updateTime.numRoots),
		reactCommitTime = generatePercentilesFromSketches(self.sessionMetrics.commitTime.sketches, self.sessionMetrics.commitTime.numRoots),
		reactTimeToUpdate = generatePercentilesFromSketches(self.sessionMetrics.timeToUpdate.sketches, self.sessionMetrics.timeToUpdate.numRoots),
		timePerFrame = generatePercentilesFromSingleSketch(self.sessionMetrics.timePerFrame.sketch),
		timePerReactFrame = generatePercentilesFromSingleSketch(self.sessionMetrics.timePerReactFrame.sketch)
	}
	
	if DebugReactSchedulingEnableErrorEvents then
		for Metric, sessionMetric in self.sessionMetrics do
			if not sessionMetric.sketches then
				self:reportPercentError(sessionMetric.allData, sessionMetric, Metric, "all")
				continue
			end
			for i, value in sessionMetric.allData do
				self:reportPercentError(value, sessionMetric, Metric, i)
			end
		end
	end
	TelemetryService:LogEvent(config, { standardizedFields = List, customFields = CustomFields })
end

return (Module1.new(FStringReactSchedulingContext))