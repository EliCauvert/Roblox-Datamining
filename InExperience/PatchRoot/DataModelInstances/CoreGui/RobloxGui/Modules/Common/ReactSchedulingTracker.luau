local corePackagesService = game:GetService("CorePackages")
local runService = game:GetService("RunService")
local reactSchedulingTracker = game:DefineFastInt("ReactSchedulingTracker", 0)
local reactSchedulingTrackerPeriodMs = game:DefineFastInt("ReactSchedulingTrackerPeriodMs", 30000)
local telemetryServiceMemoryCPUInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServiceMemoryCPUInfoEnabled")
local disableReactSchedulingTimePctStats = game:DefineFastFlag("DisableReactSchedulingTimePctStats", false)
local disableReactSchedulingAvgMaxMsStats = game:DefineFastFlag("DisableReactSchedulingAvgMaxMsStats", false)
local fStringReactSchedulingContext = require(corePackagesService.Workspace.Packages.SharedFlags).FStringReactSchedulingContext
local reactSchedulingPercentiles = game:DefineFastString("ReactSchedulingPercentiles", "10,50,95,99")
local reactSchedulingKllSketchMaxSize = game:DefineFastInt("ReactSchedulingKllSketchMaxSize", 200)
local debugReactSchedulingEnableErrorEvents = game:DefineFastFlag("DebugReactSchedulingEnableErrorEvents", false)
local reactSchedulingTrackerLayoutEffects = game:DefineFastFlag("ReactSchedulingTrackerLayoutEffects", false)
local reactSchedulingTrackerDataModelUpdate = game:DefineFastFlag("ReactSchedulingTrackerDataModelUpdate", false)
local telemetryServicePlaySessionInfoEnabledEngineFeature = game:GetEngineFeature("TelemetryServicePlaySessionInfoEnabled")
local enableCorescriptExecutionTime = game:DefineFastFlag("EnableCorescriptExecutionTime", false)
local scriptPlusExecutionTimeEnabledEngineFeature = game:GetEngineFeature("ScriptPlusExecutionTimeEnabled")

function applicationId()
	local appStorageService = game:GetService("AppStorageService")
	
	if not appStorageService then
		return nil
	end
	local appInstallationIdItem = appStorageService:GetItem("AppInstallationId")
	local var1 = typeof(appInstallationIdItem)
	
	return if var1 == "number" then tonumber(appInstallationIdItem) or nil elseif var1 == "string" then if string.len(appInstallationIdItem) <= 0 then nil else tonumber(string.sub(appInstallationIdItem, -string.len(tostring(10000)))) else nil
end

local var1 = reactSchedulingTracker > 0
local var2 = true
local var3 = true

if not var1 then
	var3 = false
	var2 = false
end
local randomValue = math.random(0, 10000)
local var4 = applicationId()

if var4 ~= nil then
	randomValue = (var4 + 1409) % 10000
end
if randomValue < reactSchedulingTracker then
	var3 = false
	var2 = false
end
local telemetryService = game:GetService("TelemetryService")
local mutedError = require(corePackagesService.Workspace.Packages.Loggers).mutedError
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local _ = require(corePackagesService.Packages.ReactReconciler)
local kllSketch = require(corePackagesService.Workspace.Packages.InExperiencePerformance).KllSketch
local parts = string.split(reactSchedulingPercentiles)
local deviceTier = require(game:GetService("CorePackages").Workspace.Packages.Devices).DeviceTier
local schedulingProfiler = reactRobloxModule.schedulingProfiler
local profilerEventTypes = schedulingProfiler.profilerEventTypes
local _ = {
	Idle = "Idle",
	Render = "Render",
	Commit = "Commit",
	PassiveEffects = "PassiveEffects"
}

local function _()
	return os.clock() * 1000
end

local deviceMemoryTier = deviceTier.GetDeviceMemoryTier()
local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: reactSchedulingTrackerLayoutEffects (ref), profilerEventTypes (ref), mutedError (ref), t (ref)
	return setmetatable({
		currentState = "Idle",
		timerStartMs = 0,
		rootUpdateInProgress = false,
		renderLevel = 0,
		frameReporter = p1,
		rootReporter = p2,
		layoutTimerStartMs = if reactSchedulingTrackerLayoutEffects then 0 else nil,
		rootUpdateTime = {
			tag = "RootUpdateTime",
			RenderMs = 0,
			CommitMs = 0,
			StartTimeMs = 0,
			LayoutEffectsMs = if reactSchedulingTrackerLayoutEffects then 0 else nil
		},
		rootPassiveEffectsTime = { tag = "RootPassiveEffectsTime", PassiveEffectsMs = 0 },
		states = {
			Idle = function(p3, p4)
				-- upvalues: profilerEventTypes (copy), reactSchedulingTrackerLayoutEffects (copy)
				if p4 == profilerEventTypes.RenderStart then
					p3.timerStartMs = os.clock() * 1000
					
					if not p3.rootUpdateInProgress then
						p3.rootUpdateInProgress = true
						p3.rootUpdateTime = {
							tag = "RootUpdateTime",
							RenderMs = 0,
							CommitMs = 0,
							LayoutEffectsMs = if reactSchedulingTrackerLayoutEffects then 0 else nil,
							StartTimeMs = os.clock() * 1000
						}
					end
					return "Render"
				elseif p4 == profilerEventTypes.PassiveEffectsStart then
					p3.timerStartMs = os.clock() * 1000
					p3.rootPassiveEffectsTime = { tag = "RootPassiveEffectsTime", PassiveEffectsMs = 0 }
					
					return "PassiveEffects"
				elseif p4 == profilerEventTypes.CommitStart then
					p3.timerStartMs = os.clock() * 1000
					
					return "Commit"
				end
				return nil
			end,
			Render = function(p3, p4)
				-- upvalues: profilerEventTypes (copy), mutedError (copy)
				if p4 == profilerEventTypes.RenderYield or p4 == profilerEventTypes.RenderStop then
					local var5 = os.clock() * 1000 - p3.timerStartMs
					p3.rootUpdateTime.RenderMs += var5
					p3.frameReporter(var5)
					
					return "Idle"
				end
				mutedError("Invalid event in Render: " .. p5)
				
				return "Idle"
			end,
			Commit = function(p3, p4, p5)
				-- upvalues: profilerEventTypes (copy), reactSchedulingTrackerLayoutEffects (copy), mutedError (copy)
				if p4 == profilerEventTypes.CommitStop then
					if p3.renderLevel > 0 then
						if reactSchedulingTrackerLayoutEffects and p3.renderLevel == 1 then
							p3.rootUpdateTime.LayoutEffectsMs += os.clock() * 1000 - p3.layoutTimerStartMs
						end
						p3.renderLevel -= 1
						
						return nil
					else
						local var5 = os.clock() * 1000 - p3.timerStartMs
						p3.rootUpdateTime.CommitMs += var5
						p3.frameReporter(var5)
						p3.rootReporter(p3.rootUpdateTime, p5)
						p3.rootUpdateInProgress = false
						
						return "Idle"
					end
				elseif p4 == profilerEventTypes.RenderStart then
					p3.renderLevel += 1
					
					if reactSchedulingTrackerLayoutEffects and p3.renderLevel == 1 then
						p3.layoutTimerStartMs = os.clock() * 1000
					end
					return nil
				elseif reactSchedulingTrackerLayoutEffects and (p4 == profilerEventTypes.LayoutEffectsStart or p4 == profilerEventTypes.PassiveEffectsStart) then
					if p3.renderLevel == 0 then
						p3.layoutTimerStartMs = os.clock() * 1000
					end
					return nil
				elseif reactSchedulingTrackerLayoutEffects and (p4 == profilerEventTypes.LayoutEffectsStop or p4 == profilerEventTypes.PassiveEffectsStop) then
					if p3.renderLevel == 0 then
						p3.rootUpdateTime.LayoutEffectsMs += os.clock() * 1000 - p3.layoutTimerStartMs
					end
					return nil
				elseif p4 == profilerEventTypes.RenderYield then
					mutedError("Invalid event in Commit: " .. p7)
					
					return "Idle"
				end
				return nil
			end,
			PassiveEffects = function(p3, p4, p5)
				-- upvalues: profilerEventTypes (copy), mutedError (copy)
				if p4 == profilerEventTypes.PassiveEffectsStop then
					local var5 = os.clock() * 1000 - p3.timerStartMs
					p3.rootPassiveEffectsTime.PassiveEffectsMs += var5
					p3.frameReporter(var5)
					p3.rootReporter(p3.rootPassiveEffectsTime, p5)
					
					return "Idle"
				end
				mutedError("Invalid event in PassiveEffects: " .. p10)
				
				return "Idle"
			end
		}
	}, t)
end

function t:transition(p1, p2)
	local var5 = self.states[self.currentState](self, p1, p2)
	
	if var5 then
		self.currentState = var5
	end
end

local var5 = if telemetryServiceMemoryCPUInfoEnabledEngineFeature then {
	"addPlaceId", "addUniverseId", "addSessionId", "addOSInfo", "addSessionInfo",
	"addMemoryInfo", "addCPUInfo"
} else {
	"addPlaceId",
	"addUniverseId",
	"addSessionId",
	"addOSInfo",
	"addSessionInfo"
}

if telemetryServicePlaySessionInfoEnabledEngineFeature then
	table.insert(var5, "addPlaySessionId")
end
local t_1 = {
	eventName = "ReactSessionSummary",
	description = "Summary of React performance over a game session",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ReactSessionSummaryEventThrottleHunderedthsPercent", 0),
	lastUpdated = { 2025, 7, 10 }
}
local var6 = if debugReactSchedulingEnableErrorEvents then {
	eventName = "ReactSessionErrorEvent",
	description = "Summary of React performance over a game session",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("DebugReactSessionErrorEventThrottleHunderedthsPercent", 0),
	lastUpdated = { 2025, 8, 7 }
} else nil
local t_2 = {
	eventName = "ReactPeriodSummary",
	description = "Summary of React performance over a period",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ReactPeriodSummaryEventThrottleHunderedthsPercent", 0),
	lastUpdated = { 2025, 2, 18 }
}
local t_3 = {
	eventName = "ReactPeriod",
	description = "Stats for React performance over a period",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 18 }
}
local t_4 = {
	eventName = "ReactFrameCounter",
	description = "Frame counts for React performance over a period",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2025, 2, 18 }
}
local t_5 = {
	eventName = "ReactRootSummary",
	description = "Summary of React performance for a root",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "EventIngest" },
	lastUpdated = { 2025, 2, 18 },
	throttlingPercentage = game:DefineFastInt("ReactRootSummaryEventThrottleHunderedthsPercent2", 0)
}
local var7 = if not disableReactSchedulingTimePctStats then {
	eventName = "ReactRootPeriod",
	description = "Stats for React performance for a root over a period",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 18 }
} else nil
local t_6 = {
	eventName = "ReactRootTaskCount",
	description = "Task counts for React performance for a root over a period",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2025, 2, 18 }
}
local var8 = if not disableReactSchedulingAvgMaxMsStats then {
	eventName = "ReactRootPeriodTask",
	description = "Task stats for React performance for a root over a period",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 18 }
} else nil
local t_7 = {
	eventName = "ReactRootUpdate",
	description = "Task stats for individual React root updates, all in milliseconds",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 2, 18 }
}
local t_8 = {}
t_8.__index = t_8

function t_8.new(p1)
	-- upvalues: kllSketch (ref), reactSchedulingKllSketchMaxSize (ref), debugReactSchedulingEnableErrorEvents (ref), t_8 (ref), t (ref), var3 (write)
	local t_1 = { all = kllSketch.new(reactSchedulingKllSketchMaxSize) }
	local t_2 = { all = kllSketch.new(reactSchedulingKllSketchMaxSize) }
	local t_3 = { all = kllSketch.new(reactSchedulingKllSketchMaxSize) }
	local t_4 = {}
	local t_5 = {}
	local t_6 = {}
	
	if debugReactSchedulingEnableErrorEvents then
		t_4.all = {}
		t_5.all = {}
		t_6.all = {}
	end
	local tbl = setmetatable({
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
				sketches = t_1,
				allData = if debugReactSchedulingEnableErrorEvents then t_4 else {}
			},
			commitTime = {
				numRoots = 1,
				sketches = t_2,
				allData = if debugReactSchedulingEnableErrorEvents then t_5 else {}
			},
			timeToUpdate = {
				numRoots = 1,
				sketches = t_3,
				allData = if debugReactSchedulingEnableErrorEvents then t_6 else {}
			},
			timePerFrame = {
				sketch = kllSketch.new(reactSchedulingKllSketchMaxSize),
				allData = {}
			},
			timePerReactFrame = {
				sketch = kllSketch.new(reactSchedulingKllSketchMaxSize),
				allData = {}
			}
		},
		context = p1
	}, t_8)
	tbl.schedulerStateMachine = t.new(function(p2)
		-- upvalues: tbl (ref)
		tbl:addToFrame(p2)
	end, function(p2, p3)
		-- upvalues: tbl (ref), var3 (copy)
		tbl:trackSessionSketches(p2, p3)
		
		if var3 then
			tbl:reportRoot(p2, p3)
		end
	end)
	
	return tbl
end

function t_8:start()
	-- upvalues: schedulingProfiler (ref), runService (ref), reactSchedulingTrackerPeriodMs (ref), var2 (write)
	self.started = true
	self:resetState()
	schedulingProfiler.registerProfilerEventCallback(function(p1, p2)
		-- upvalues: self (ref)
		self.schedulerStateMachine:transition(p1, p2)
	end)
	runService.Heartbeat:Connect(function(p1)
		-- upvalues: self (ref), reactSchedulingTrackerPeriodMs (copy), var2 (copy)
		self:processFrame(p1 * 1000)
		self.reactFrameTimeMs = 0
		
		if reactSchedulingTrackerPeriodMs < os.clock() * 1000 - self.periodStartMs then
			if var2 then
				self:reportPeriod()
			end
			self:resetState()
		end
	end)
end

function t_8:resetState()
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

function t_8.getRootName(_, p1)
	local var9 = "Unknown"
	
	if p1 then
		if p1.containerInfo.Name ~= "Folder" then
			var9 = p1.containerInfo.Name
			
			return var9
		elseif p1.current and p1.current.child and p1.current.child.memoizedProps then
			for i, v in p1.current.child.memoizedProps do
				if typeof(i) == "string" then
					var9 = i
					
					return var9
				end
			end
		end
	end
	return var9
end

function t_8:addToFrame(p2)
	self.reactFrameTimeMs += p2
end

function t_8:trackSessionSketches(p2, p3)
	-- upvalues: debugReactSchedulingEnableErrorEvents (ref), kllSketch (ref), reactSchedulingKllSketchMaxSize (ref)
	if not self.sessionMetrics then return end
	local var10 = self:getRootName(p3)
	
	if p2.tag == "RootUpdateTime" then
		local var11 = os.clock() * 1000 - p2.StartTimeMs
		
		if debugReactSchedulingEnableErrorEvents then
			table.insert(self.sessionMetrics.updateTime.allData.all, p2.RenderMs + p2.CommitMs)
			table.insert(self.sessionMetrics.commitTime.allData.all, p2.CommitMs)
			table.insert(self.sessionMetrics.timeToUpdate.allData.all, var11)
		end
		self.sessionMetrics.updateTime.sketches.all:insert(p2.RenderMs + p2.CommitMs)
		self.sessionMetrics.commitTime.sketches.all:insert(p2.CommitMs)
		self.sessionMetrics.timeToUpdate.sketches.all:insert(var11)
		
		if not self.sessionMetrics.updateTime.sketches[var10] then
			self.sessionMetrics.updateTime.sketches[var10] = kllSketch.new(reactSchedulingKllSketchMaxSize)
			
			if debugReactSchedulingEnableErrorEvents then
				self.sessionMetrics.updateTime.allData[var10] = {}
			end
			self.sessionMetrics.updateTime.numRoots += 1
		end
		self.sessionMetrics.updateTime.sketches[var10]:insert(p2.RenderMs + p2.CommitMs)
		
		if debugReactSchedulingEnableErrorEvents then
			table.insert(self.sessionMetrics.updateTime.allData[var10], p2.RenderMs + p2.CommitMs)
		end
		if not self.sessionMetrics.commitTime.sketches[var10] then
			self.sessionMetrics.commitTime.sketches[var10] = kllSketch.new(reactSchedulingKllSketchMaxSize)
			
			if debugReactSchedulingEnableErrorEvents then
				self.sessionMetrics.commitTime.allData[var10] = {}
			end
			self.sessionMetrics.commitTime.numRoots += 1
		end
		self.sessionMetrics.commitTime.sketches[var10]:insert(p2.CommitMs)
		
		if debugReactSchedulingEnableErrorEvents then
			table.insert(self.sessionMetrics.commitTime.allData[var10], p2.CommitMs)
		end
		if not self.sessionMetrics.timeToUpdate.sketches[var10] then
			self.sessionMetrics.timeToUpdate.sketches[var10] = kllSketch.new(reactSchedulingKllSketchMaxSize)
			
			if debugReactSchedulingEnableErrorEvents then
				self.sessionMetrics.timeToUpdate.allData[var10] = {}
			end
			self.sessionMetrics.timeToUpdate.numRoots += 1
		end
		self.sessionMetrics.timeToUpdate.sketches[var10]:insert(var11)
		
		if debugReactSchedulingEnableErrorEvents then
			table.insert(self.sessionMetrics.timeToUpdate.allData[var10], var11)
		end
	end
end

function t_8:reportRoot(p2, p3)
	-- upvalues: reactSchedulingTrackerLayoutEffects (ref), reactSchedulingTrackerDataModelUpdate (ref), telemetryService (ref), t_7 (ref), deviceMemoryTier (ref)
	local var10 = self:getRootName(p3)
	
	if not self.rootsMetrics[var10] then
		self.rootsMetrics[var10] = {
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
			layout_effects_count = if reactSchedulingTrackerLayoutEffects then 0 else nil,
			layout_effects_total_time_ms = if reactSchedulingTrackerLayoutEffects then 0 else nil,
			data_model_update_total_time_ms = if reactSchedulingTrackerLayoutEffects and reactSchedulingTrackerDataModelUpdate then 0 else nil,
			max_layout_effects_time_ms = if reactSchedulingTrackerLayoutEffects then 0 else nil,
			max_data_model_update_time_ms = if reactSchedulingTrackerLayoutEffects and reactSchedulingTrackerDataModelUpdate then 0 else nil
		}
	end
	local var11 = self.rootsMetrics[var10]
	
	if p2.tag == "RootPassiveEffectsTime" then
		telemetryService:LogStat(t_7, {
			customFields = {
				updateType = "PassiveEffects",
				rootName = var10,
				deviceTier = deviceMemoryTier,
				context = self.context
			}
		}, p2.PassiveEffectsMs)
		var11.passive_effects_count += 1
		var11.passive_effects_total_time_ms += p2.PassiveEffectsMs
		
		if var11.max_passive_effects_time_ms < p2.PassiveEffectsMs then
			var11.max_passive_effects_time_ms = p2.PassiveEffectsMs
			
			return
		end
	elseif p2.tag == "RootUpdateTime" then
		local var12 = os.clock() * 1000 - p2.StartTimeMs
		telemetryService:LogStat(t_7, {
			customFields = {
				updateType = "TimeToComplete",
				rootName = var10,
				deviceTier = deviceMemoryTier,
				context = self.context
			}
		}, var12)
		var11.total_time_to_update_ms += var12
		
		if var11.max_time_to_update_ms < var12 then
			var11.max_time_to_update_ms = var12
		end
		telemetryService:LogStat(t_7, {
			customFields = {
				updateType = "RenderAndCommit",
				rootName = var10,
				deviceTier = deviceMemoryTier,
				context = self.context
			}
		}, p2.RenderMs + p2.CommitMs)
		telemetryService:LogStat(t_7, {
			customFields = {
				updateType = "Commit",
				rootName = var10,
				deviceTier = deviceMemoryTier,
				context = self.context
			}
		}, p2.CommitMs)
		
		if reactSchedulingTrackerLayoutEffects then
			if p2.LayoutEffectsMs > 0 then
				telemetryService:LogStat(t_7, {
					customFields = {
						updateType = "LayoutEffects",
						rootName = var10,
						deviceTier = deviceMemoryTier,
						context = self.context
					}
				}, p2.LayoutEffectsMs)
			end
			if reactSchedulingTrackerDataModelUpdate then
				telemetryService:LogStat(t_7, {
					customFields = {
						updateType = "DataModelUpdate",
						rootName = var10,
						deviceTier = deviceMemoryTier,
						context = self.context
					}
				}, p2.CommitMs - p2.LayoutEffectsMs)
			end
		end
		var11.update_count += 1
		
		if var11.max_update_time_ms < p2.RenderMs + p2.CommitMs then
			var11.max_update_time_ms = p2.RenderMs + p2.CommitMs
		end
		var11.render_total_time_ms += p2.RenderMs
		var11.commit_total_time_ms += p2.CommitMs
		
		if var11.max_render_time_ms < p2.RenderMs then
			var11.max_render_time_ms = p2.RenderMs
		end
		if var11.max_commit_time_ms < p2.CommitMs then
			var11.max_commit_time_ms = p2.CommitMs
		end
		if reactSchedulingTrackerLayoutEffects then
			if p2.LayoutEffectsMs > 0 then
				var11.layout_effects_count += 1
				var11.layout_effects_total_time_ms += p2.LayoutEffectsMs
				
				if var11.max_layout_effects_time_ms < p2.LayoutEffectsMs then
					var11.max_layout_effects_time_ms = p2.LayoutEffectsMs
				end
			end
			if reactSchedulingTrackerDataModelUpdate then
				var11.data_model_update_total_time_ms += p2.CommitMs - p2.LayoutEffectsMs
				
				if var11.max_data_model_update_time_ms < p2.CommitMs - p2.LayoutEffectsMs then
					var11.max_data_model_update_time_ms = p2.CommitMs - p2.LayoutEffectsMs
				end
			end
		end
	end
end

function t_8.getFrameBucket(_, p2)
	return math.min(4, math.floor(math.max(0, p2 - 2) / 16.666666666667) + 1)
end

function t_8:processFrame(p2)
	-- upvalues: scriptPlusExecutionTimeEnabledEngineFeature (ref), enableCorescriptExecutionTime (ref), runService (ref), debugReactSchedulingEnableErrorEvents (ref)
	local frameMetrics = self.frameMetrics
	local reactFrameTimeMs = self.reactFrameTimeMs
	
	if scriptPlusExecutionTimeEnabledEngineFeature and enableCorescriptExecutionTime then
		local totalScriptPlusExecutionTime = runService:GetTotalScriptPlusExecutionTime()
		
		if totalScriptPlusExecutionTime > 0 then
			frameMetrics.totalCorescriptTimeMs += totalScriptPlusExecutionTime
		end
	end
	frameMetrics.totalFrameCount += 1
	local var10 = self:getFrameBucket(p2)
	frameMetrics.allFrameHistogram[var10] += 1
	self.sessionMetrics.timePerFrame.sketch:insert(reactFrameTimeMs)
	
	if debugReactSchedulingEnableErrorEvents then
		table.insert(self.sessionMetrics.timePerFrame.allData, reactFrameTimeMs)
	end
	if reactFrameTimeMs > 0 then
		frameMetrics.totalReactTimeMs += reactFrameTimeMs
		frameMetrics.reactFrameHistogram[var10] += 1
		self.sessionMetrics.timePerReactFrame.sketch:insert(reactFrameTimeMs)
		
		if debugReactSchedulingEnableErrorEvents then
			table.insert(self.sessionMetrics.timePerReactFrame.allData, reactFrameTimeMs)
		end
		frameMetrics.reactFrameCount += 1
		
		if frameMetrics.maxReactFrameTimeMs < reactFrameTimeMs then
			frameMetrics.maxReactFrameTimeMs = reactFrameTimeMs
		end
		frameMetrics.reactDropChangeHistogram[var10 - self:getFrameBucket(p2 - reactFrameTimeMs) + 1] += 1
	end
end

function t_8:reportPeriod()
	-- upvalues: telemetryService (ref), t_2 (ref), var5 (write), t_3 (ref), deviceMemoryTier (ref), scriptPlusExecutionTimeEnabledEngineFeature (ref), enableCorescriptExecutionTime (ref), t_4 (ref), reactSchedulingTrackerLayoutEffects (ref), reactSchedulingTrackerDataModelUpdate (ref), t_5 (ref), disableReactSchedulingTimePctStats (ref), var7 (write), t_6 (ref), disableReactSchedulingAvgMaxMsStats (ref), var8 (write)
	local frameMetrics = self.frameMetrics
	local var10 = os.clock() * 1000 - self.periodStartMs
	local t = {
		period_length_ms = var10,
		react_total_time_ms = frameMetrics.totalReactTimeMs,
		react_total_time_pct = frameMetrics.totalReactTimeMs / var10,
		react_frame_count = frameMetrics.reactFrameCount,
		total_frame_count = frameMetrics.totalFrameCount,
		corescript_total_time_ms = frameMetrics.totalCorescriptTimeMs,
		corescript_total_time_pct = frameMetrics.totalCorescriptTimeMs / var10,
		average_react_all_frame_ms = frameMetrics.totalReactTimeMs / frameMetrics.totalFrameCount,
		average_react_only_frame_ms = if frameMetrics.reactFrameCount > 0 then frameMetrics.totalReactTimeMs / frameMetrics.reactFrameCount else 0,
		max_react_frame_ms = frameMetrics.maxReactFrameTimeMs,
		all_frame_drop0 = frameMetrics.allFrameHistogram[1],
		all_frame_drop1 = frameMetrics.allFrameHistogram[2],
		all_frame_drop2 = frameMetrics.allFrameHistogram[3],
		all_frame_drop3 = frameMetrics.allFrameHistogram[4],
		react_frame_drop0 = frameMetrics.reactFrameHistogram[1],
		react_frame_drop1 = frameMetrics.reactFrameHistogram[2],
		react_frame_drop2 = frameMetrics.reactFrameHistogram[3],
		react_frame_drop3 = frameMetrics.reactFrameHistogram[4],
		react_drop_change0 = frameMetrics.reactDropChangeHistogram[1],
		react_drop_change1 = frameMetrics.reactDropChangeHistogram[2],
		react_drop_change2 = frameMetrics.reactDropChangeHistogram[3],
		react_drop_change3 = frameMetrics.reactDropChangeHistogram[4]
	}
	telemetryService:LogEvent(t_2, { standardizedFields = var5, customFields = t })
	telemetryService:LogStat(t_3, {
		customFields = {
			stat = "ReactTotalTimePct",
			context = self.context,
			deviceTier = deviceMemoryTier
		}
	}, t.react_total_time_pct)
	
	if scriptPlusExecutionTimeEnabledEngineFeature and enableCorescriptExecutionTime then
		telemetryService:LogStat(t_3, {
			customFields = {
				stat = "TotalCorescriptTimePct",
				context = self.context,
				deviceTier = deviceMemoryTier
			}
		}, t.corescript_total_time_pct)
	end
	telemetryService:LogStat(t_3, {
		customFields = {
			stat = "AverageReactAllFrameMs",
			context = self.context,
			deviceTier = deviceMemoryTier
		}
	}, t.average_react_all_frame_ms)
	telemetryService:LogStat(t_3, {
		customFields = {
			stat = "AverageReactOnlyFrameMs",
			context = self.context,
			deviceTier = deviceMemoryTier
		}
	}, t.average_react_only_frame_ms)
	telemetryService:LogStat(t_3, {
		customFields = {
			stat = "MaxReactFrameMs",
			context = self.context,
			deviceTier = deviceMemoryTier
		}
	}, t.max_react_frame_ms)
	
	for i = 1, 4 do
		local var11 = i - 1
		telemetryService:LogCounter(t_4, {
			customFields = {
				category = "AllFrame",
				bucket = var11,
				context = self.context,
				deviceTier = deviceMemoryTier
			}
		}, frameMetrics.allFrameHistogram[i])
		telemetryService:LogCounter(t_4, {
			customFields = {
				category = "ReactFrame",
				bucket = var11,
				context = self.context,
				deviceTier = deviceMemoryTier
			}
		}, frameMetrics.reactFrameHistogram[i])
		telemetryService:LogCounter(t_4, {
			customFields = {
				category = "ReactDropChange",
				bucket = var11,
				context = self.context,
				deviceTier = deviceMemoryTier
			}
		}, frameMetrics.reactDropChangeHistogram[i])
	end
	for i_1, v in self.rootsMetrics do
		v.root_name = i_1
		v.update_total_time_ms = v.render_total_time_ms + v.commit_total_time_ms
		v.total_time_ms = v.update_total_time_ms + v.passive_effects_total_time_ms
		v.avg_render_time_ms = v.render_total_time_ms / v.update_count
		v.context = self.context
		v.total_time_pct = (v.update_total_time_ms + v.passive_effects_total_time_ms) / t.react_total_time_ms
		v.avg_update_time_ms = v.update_total_time_ms / v.update_count
		v.avg_commit_time_ms = v.commit_total_time_ms / v.update_count
		
		if reactSchedulingTrackerLayoutEffects then
			v.avg_layout_effects_time_ms = v.layout_effects_total_time_ms / v.layout_effects_count
			
			if reactSchedulingTrackerDataModelUpdate then
				v.avg_data_model_update_time_ms = v.data_model_update_total_time_ms / v.update_count
			end
		end
		v.avg_passive_effects_time_ms = v.passive_effects_total_time_ms / v.passive_effects_count
		v.avg_time_to_update_ms = v.total_time_to_update_ms / v.update_count
		telemetryService:LogEvent(t_5, { standardizedFields = var5, customFields = v })
		
		if not disableReactSchedulingTimePctStats then
			telemetryService:LogStat(var7, {
				customFields = {
					stat = "TotalTimePct",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.total_time_pct)
		end
		telemetryService:LogCounter(t_6, {
			customFields = {
				task = "RenderAndCommit",
				rootName = v.root_name,
				deviceTier = deviceMemoryTier,
				context = self.context
			}
		}, v.update_count)
		
		if reactSchedulingTrackerLayoutEffects then
			telemetryService:LogCounter(t_6, {
				customFields = {
					task = "LayoutEffects",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.layout_effects_count)
		end
		telemetryService:LogCounter(t_6, {
			customFields = {
				task = "PassiveEffects",
				rootName = v.root_name,
				deviceTier = deviceMemoryTier,
				context = self.context
			}
		}, v.passive_effects_count)
		
		if not disableReactSchedulingAvgMaxMsStats then
			telemetryService:LogStat(var8, {
				customFields = {
					task = "RenderAndCommit",
					stat = "AvgMs",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.avg_update_time_ms)
			telemetryService:LogStat(var8, {
				customFields = {
					task = "Commit",
					stat = "AvgMs",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.avg_commit_time_ms)
			
			if reactSchedulingTrackerLayoutEffects then
				telemetryService:LogStat(var8, {
					customFields = {
						task = "LayoutEffects",
						stat = "AvgMs",
						rootName = v.root_name,
						deviceTier = deviceMemoryTier,
						context = self.context
					}
				}, v.avg_layout_effects_time_ms)
				
				if reactSchedulingTrackerDataModelUpdate then
					telemetryService:LogStat(var8, {
						customFields = {
							task = "DataModelUpdate",
							stat = "AvgMs",
							rootName = v.root_name,
							deviceTier = deviceMemoryTier,
							context = self.context
						}
					}, v.avg_data_model_update_time_ms)
				end
			end
			telemetryService:LogStat(var8, {
				customFields = {
					task = "TimeToUpdateMs",
					stat = "AvgMs",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.avg_time_to_update_ms)
			telemetryService:LogStat(var8, {
				customFields = {
					task = "PassiveEffects",
					stat = "AvgMs",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.avg_passive_effects_time_ms)
			telemetryService:LogStat(var8, {
				customFields = {
					task = "RenderAndCommit",
					stat = "MaxMs",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.max_update_time_ms)
			telemetryService:LogStat(var8, {
				customFields = {
					task = "Commit",
					stat = "MaxMs",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.max_commit_time_ms)
			
			if reactSchedulingTrackerLayoutEffects then
				telemetryService:LogStat(var8, {
					customFields = {
						task = "LayoutEffects",
						stat = "MaxMs",
						rootName = v.root_name,
						deviceTier = deviceMemoryTier,
						context = self.context
					}
				}, v.max_layout_effects_time_ms)
				
				if reactSchedulingTrackerDataModelUpdate then
					telemetryService:LogStat(var8, {
						customFields = {
							task = "DataModelUpdate",
							stat = "MaxMs",
							rootName = v.root_name,
							deviceTier = deviceMemoryTier,
							context = self.context
						}
					}, v.max_data_model_update_time_ms)
				end
			end
			telemetryService:LogStat(var8, {
				customFields = {
					task = "TimeToUpdateMs",
					stat = "MaxMs",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.max_time_to_update_ms)
			telemetryService:LogStat(var8, {
				customFields = {
					task = "PassiveEffects",
					stat = "MaxMs",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.max_passive_effects_time_ms)
		end
	end
end

function generatePercentilesFromSingleSketch(p2)
	-- upvalues: parts (ref)
	local var12 = "{"
	
	for i, v in parts do
		var12 = (var12 .. "\"p" .. v .. "\":") .. p29:getPercentile(tonumber(v) or 0)
		
		if i < #parts then
			var12 ..= ","
		end
	end
	return var12 .. "}"
end

function generatePercentilesFromSketches(p3, p4)
	-- upvalues: parts (ref)
	local var13 = "{"
	
	for i, v in parts do
		var13 ..= "\"p" .. v .. "\":{"
		local var14 = tonumber(v) or 0
		local var15 = 0
		
		for i_1, v_1 in p3 do
			var15 += 1
			var13 ..= "\"" .. i_1 .. "\":" .. v_1:getPercentile(var14)
			
			if var15 < p4 then
				var13 ..= ","
			end
		end
		var13 ..= if i < #parts then "}," else "}"
	end
	return var13 .. "}"
end

function t_8:reportPercentError(p5, p6, p7, p8)
	-- upvalues: parts (ref), telemetryService (ref), var6 (write), var5 (write)
	table.sort(p5)
	local p32Count = #p5
	
	if p32Count < 1 then return end
	for i, v in parts do
		local var16 = p5[math.ceil((tonumber(v) or 0) / 100 * p32Count)]
		local var17 = if p6.sketches then p6.sketches[p8]:getPercentile(v) else p6.sketch:getPercentile(v)
		local var18 = 0
		
		if var16 ~= 0 or var17 == 0 then
			if var16 ~= 0 then
				var18 = (var17 - var16) * 100 / var16
			end
			telemetryService:LogEvent(var6, {
				standardizedFields = var5,
				customFields = {
					rootName = p8,
					percentile = v,
					metric = p7,
					numDatapoints = p32Count,
					context = self.context,
					approxError = var18
				}
			})
		end
	end
end

function t_8:reportSession()
	-- upvalues: debugReactSchedulingEnableErrorEvents (ref), telemetryService (ref), t_1 (ref), var5 (write)
	if not self.started then return end
	local t = {
		reactUpdateTime = generatePercentilesFromSketches(self.sessionMetrics.updateTime.sketches, self.sessionMetrics.updateTime.numRoots),
		reactCommitTime = generatePercentilesFromSketches(self.sessionMetrics.commitTime.sketches, self.sessionMetrics.commitTime.numRoots),
		reactTimeToUpdate = generatePercentilesFromSketches(self.sessionMetrics.timeToUpdate.sketches, self.sessionMetrics.timeToUpdate.numRoots),
		timePerFrame = generatePercentilesFromSingleSketch(self.sessionMetrics.timePerFrame.sketch),
		timePerReactFrame = generatePercentilesFromSingleSketch(self.sessionMetrics.timePerReactFrame.sketch)
	}
	
	if debugReactSchedulingEnableErrorEvents then
		for i, v in self.sessionMetrics do
			if not v.sketches then
				self:reportPercentError(v.allData, v, i, "all")
				continue
			end
			for i_1, v_1 in v.allData do
				self:reportPercentError(v_1, v, i, i_1)
			end
		end
	end
	telemetryService:LogEvent(t_1, { standardizedFields = var5, customFields = t })
end

return t_8.new(fStringReactSchedulingContext)