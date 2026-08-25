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
	local var39 = typeof(appInstallationIdItem)
	
	return if var39 == "number" then tonumber(appInstallationIdItem) or nil elseif var39 == "string" then if string.len(appInstallationIdItem) <= 0 then nil else tonumber(string.sub(appInstallationIdItem, -string.len(tostring(10000)))) else nil
end

local var15 = reactSchedulingTracker > 0
local var16 = true
local var17 = true

if not var15 then
	var17 = false
	var16 = false
end
local randomValue = math.random(0, 10000)
local var19 = applicationId()

if var19 ~= nil then
	randomValue = (var19 + 1409) % 10000
end
if randomValue < reactSchedulingTracker then
	var17 = false
	var16 = false
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

function t.new(p0, p1)
	-- upvalues: reactSchedulingTrackerLayoutEffects (ref), profilerEventTypes (ref), mutedError (ref), t (ref)
	return setmetatable({
		currentState = "Idle",
		timerStartMs = 0,
		rootUpdateInProgress = false,
		renderLevel = 0,
		frameReporter = p0,
		rootReporter = p1,
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
			Idle = function(p2, p3)
				-- upvalues: profilerEventTypes (copy), reactSchedulingTrackerLayoutEffects (copy)
				if p3 == profilerEventTypes.RenderStart then
					p2.timerStartMs = os.clock() * 1000
					
					if not p2.rootUpdateInProgress then
						p2.rootUpdateInProgress = true
						p2.rootUpdateTime = {
							tag = "RootUpdateTime",
							RenderMs = 0,
							CommitMs = 0,
							LayoutEffectsMs = if reactSchedulingTrackerLayoutEffects then 0 else nil,
							StartTimeMs = os.clock() * 1000
						}
					end
					return "Render"
				elseif p3 == profilerEventTypes.PassiveEffectsStart then
					p2.timerStartMs = os.clock() * 1000
					p2.rootPassiveEffectsTime = { tag = "RootPassiveEffectsTime", PassiveEffectsMs = 0 }
					
					return "PassiveEffects"
				elseif p3 == profilerEventTypes.CommitStart then
					p2.timerStartMs = os.clock() * 1000
					
					return "Commit"
				end
				return nil
			end,
			Render = function(p4, p5)
				-- upvalues: profilerEventTypes (copy), mutedError (copy)
				if p5 == profilerEventTypes.RenderYield or p5 == profilerEventTypes.RenderStop then
					local var40 = os.clock() * 1000 - p4.timerStartMs
					p4.rootUpdateTime.RenderMs += var40
					p4.frameReporter(var40)
					
					return "Idle"
				end
				mutedError("Invalid event in Render: " .. p5)
				
				return "Idle"
			end,
			Commit = function(p6, p7, p8)
				-- upvalues: profilerEventTypes (copy), reactSchedulingTrackerLayoutEffects (copy), mutedError (copy)
				if p7 == profilerEventTypes.CommitStop then
					if p6.renderLevel > 0 then
						if reactSchedulingTrackerLayoutEffects and p6.renderLevel == 1 then
							p6.rootUpdateTime.LayoutEffectsMs += os.clock() * 1000 - p6.layoutTimerStartMs
						end
						p6.renderLevel -= 1
						
						return nil
					else
						local var41 = os.clock() * 1000 - p6.timerStartMs
						p6.rootUpdateTime.CommitMs += var41
						p6.frameReporter(var41)
						p6.rootReporter(p6.rootUpdateTime, p8)
						p6.rootUpdateInProgress = false
						
						return "Idle"
					end
				elseif p7 == profilerEventTypes.RenderStart then
					p6.renderLevel += 1
					
					if reactSchedulingTrackerLayoutEffects and p6.renderLevel == 1 then
						p6.layoutTimerStartMs = os.clock() * 1000
					end
					return nil
				elseif reactSchedulingTrackerLayoutEffects and (p7 == profilerEventTypes.LayoutEffectsStart or p7 == profilerEventTypes.PassiveEffectsStart) then
					if p6.renderLevel == 0 then
						p6.layoutTimerStartMs = os.clock() * 1000
					end
					return nil
				elseif reactSchedulingTrackerLayoutEffects and (p7 == profilerEventTypes.LayoutEffectsStop or p7 == profilerEventTypes.PassiveEffectsStop) then
					if p6.renderLevel == 0 then
						p6.rootUpdateTime.LayoutEffectsMs += os.clock() * 1000 - p6.layoutTimerStartMs
					end
					return nil
				elseif p7 == profilerEventTypes.RenderYield then
					mutedError("Invalid event in Commit: " .. p7)
					
					return "Idle"
				end
				return nil
			end,
			PassiveEffects = function(p9, p10, p11)
				-- upvalues: profilerEventTypes (copy), mutedError (copy)
				if p10 == profilerEventTypes.PassiveEffectsStop then
					local var42 = os.clock() * 1000 - p9.timerStartMs
					p9.rootPassiveEffectsTime.PassiveEffectsMs += var42
					p9.frameReporter(var42)
					p9.rootReporter(p9.rootPassiveEffectsTime, p11)
					
					return "Idle"
				end
				mutedError("Invalid event in PassiveEffects: " .. p10)
				
				return "Idle"
			end
		}
	}, t)
end

function t:transition(p12, p13)
	local var43 = self.states[self.currentState](self, p12, p13)
	
	if var43 then
		self.currentState = var43
	end
end

local var25 = if telemetryServiceMemoryCPUInfoEnabledEngineFeature then {
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
	table.insert(var25, "addPlaySessionId")
end
local t_1 = {
	eventName = "ReactSessionSummary",
	description = "Summary of React performance over a game session",
	links = "https://roblox.atlassian.net/wiki/spaces/APEX/pages/3321660204/React+Profiler+Metric+Issues+and+Path+Forward#New-Metrics-%E2%9C%A8",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("ReactSessionSummaryEventThrottleHunderedthsPercent", 0),
	lastUpdated = { 2025, 7, 10 }
}
local var27 = if debugReactSchedulingEnableErrorEvents then {
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
local var32 = if not disableReactSchedulingTimePctStats then {
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
local var34 = if not disableReactSchedulingAvgMaxMsStats then {
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

function t_8.new(p14)
	-- upvalues: kllSketch (ref), reactSchedulingKllSketchMaxSize (ref), debugReactSchedulingEnableErrorEvents (ref), t_8 (ref), t (ref), var17 (write)
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
		context = p14
	}, t_8)
	tbl.schedulerStateMachine = t.new(function(p15)
		-- upvalues: tbl (ref)
		tbl:addToFrame(p15)
	end, function(p16, p17)
		-- upvalues: tbl (ref), var17 (copy)
		tbl:trackSessionSketches(p16, p17)
		
		if var17 then
			tbl:reportRoot(p16, p17)
		end
	end)
	
	return tbl
end

function t_8:start()
	-- upvalues: schedulingProfiler (ref), runService (ref), reactSchedulingTrackerPeriodMs (ref), var16 (write)
	self.started = true
	self:resetState()
	schedulingProfiler.registerProfilerEventCallback(function(p18, p19)
		-- upvalues: self (ref)
		self.schedulerStateMachine:transition(p18, p19)
	end)
	runService.Heartbeat:Connect(function(p20)
		-- upvalues: self (ref), reactSchedulingTrackerPeriodMs (copy), var16 (copy)
		self:processFrame(p20 * 1000)
		self.reactFrameTimeMs = 0
		
		if reactSchedulingTrackerPeriodMs < os.clock() * 1000 - self.periodStartMs then
			if var16 then
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

function t_8.getRootName(_, p21)
	local var51 = "Unknown"
	
	if p21 then
		if p21.containerInfo.Name ~= "Folder" then
			var51 = p21.containerInfo.Name
			
			return var51
		elseif p21.current and p21.current.child and p21.current.child.memoizedProps then
			for i, v in p21.current.child.memoizedProps do
				if typeof(i) == "string" then
					var51 = i
					
					return var51
				end
			end
		end
	end
	return var51
end

function t_8:addToFrame(p22)
	self.reactFrameTimeMs += p22
end

function t_8:trackSessionSketches(p23, p24)
	-- upvalues: debugReactSchedulingEnableErrorEvents (ref), kllSketch (ref), reactSchedulingKllSketchMaxSize (ref)
	if not self.sessionMetrics then return end
	local var52 = self:getRootName(p24)
	
	if p23.tag == "RootUpdateTime" then
		local var53 = os.clock() * 1000 - p23.StartTimeMs
		
		if debugReactSchedulingEnableErrorEvents then
			table.insert(self.sessionMetrics.updateTime.allData.all, p23.RenderMs + p23.CommitMs)
			table.insert(self.sessionMetrics.commitTime.allData.all, p23.CommitMs)
			table.insert(self.sessionMetrics.timeToUpdate.allData.all, var53)
		end
		self.sessionMetrics.updateTime.sketches.all:insert(p23.RenderMs + p23.CommitMs)
		self.sessionMetrics.commitTime.sketches.all:insert(p23.CommitMs)
		self.sessionMetrics.timeToUpdate.sketches.all:insert(var53)
		
		if not self.sessionMetrics.updateTime.sketches[var52] then
			self.sessionMetrics.updateTime.sketches[var52] = kllSketch.new(reactSchedulingKllSketchMaxSize)
			
			if debugReactSchedulingEnableErrorEvents then
				self.sessionMetrics.updateTime.allData[var52] = {}
			end
			self.sessionMetrics.updateTime.numRoots += 1
		end
		self.sessionMetrics.updateTime.sketches[var52]:insert(p23.RenderMs + p23.CommitMs)
		
		if debugReactSchedulingEnableErrorEvents then
			table.insert(self.sessionMetrics.updateTime.allData[var52], p23.RenderMs + p23.CommitMs)
		end
		if not self.sessionMetrics.commitTime.sketches[var52] then
			self.sessionMetrics.commitTime.sketches[var52] = kllSketch.new(reactSchedulingKllSketchMaxSize)
			
			if debugReactSchedulingEnableErrorEvents then
				self.sessionMetrics.commitTime.allData[var52] = {}
			end
			self.sessionMetrics.commitTime.numRoots += 1
		end
		self.sessionMetrics.commitTime.sketches[var52]:insert(p23.CommitMs)
		
		if debugReactSchedulingEnableErrorEvents then
			table.insert(self.sessionMetrics.commitTime.allData[var52], p23.CommitMs)
		end
		if not self.sessionMetrics.timeToUpdate.sketches[var52] then
			self.sessionMetrics.timeToUpdate.sketches[var52] = kllSketch.new(reactSchedulingKllSketchMaxSize)
			
			if debugReactSchedulingEnableErrorEvents then
				self.sessionMetrics.timeToUpdate.allData[var52] = {}
			end
			self.sessionMetrics.timeToUpdate.numRoots += 1
		end
		self.sessionMetrics.timeToUpdate.sketches[var52]:insert(var53)
		
		if debugReactSchedulingEnableErrorEvents then
			table.insert(self.sessionMetrics.timeToUpdate.allData[var52], var53)
		end
	end
end

function t_8:reportRoot(p25, p26)
	-- upvalues: reactSchedulingTrackerLayoutEffects (ref), reactSchedulingTrackerDataModelUpdate (ref), telemetryService (ref), t_7 (ref), deviceMemoryTier (ref)
	local var54 = self:getRootName(p26)
	
	if not self.rootsMetrics[var54] then
		self.rootsMetrics[var54] = {
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
	local var55 = self.rootsMetrics[var54]
	
	if p25.tag == "RootPassiveEffectsTime" then
		telemetryService:LogStat(t_7, {
			customFields = {
				updateType = "PassiveEffects",
				rootName = var54,
				deviceTier = deviceMemoryTier,
				context = self.context
			}
		}, p25.PassiveEffectsMs)
		var55.passive_effects_count += 1
		var55.passive_effects_total_time_ms += p25.PassiveEffectsMs
		
		if var55.max_passive_effects_time_ms < p25.PassiveEffectsMs then
			var55.max_passive_effects_time_ms = p25.PassiveEffectsMs
			
			return
		end
	elseif p25.tag == "RootUpdateTime" then
		local var56 = os.clock() * 1000 - p25.StartTimeMs
		telemetryService:LogStat(t_7, {
			customFields = {
				updateType = "TimeToComplete",
				rootName = var54,
				deviceTier = deviceMemoryTier,
				context = self.context
			}
		}, var56)
		var55.total_time_to_update_ms += var56
		
		if var55.max_time_to_update_ms < var56 then
			var55.max_time_to_update_ms = var56
		end
		telemetryService:LogStat(t_7, {
			customFields = {
				updateType = "RenderAndCommit",
				rootName = var54,
				deviceTier = deviceMemoryTier,
				context = self.context
			}
		}, p25.RenderMs + p25.CommitMs)
		telemetryService:LogStat(t_7, {
			customFields = {
				updateType = "Commit",
				rootName = var54,
				deviceTier = deviceMemoryTier,
				context = self.context
			}
		}, p25.CommitMs)
		
		if reactSchedulingTrackerLayoutEffects then
			if p25.LayoutEffectsMs > 0 then
				telemetryService:LogStat(t_7, {
					customFields = {
						updateType = "LayoutEffects",
						rootName = var54,
						deviceTier = deviceMemoryTier,
						context = self.context
					}
				}, p25.LayoutEffectsMs)
			end
			if reactSchedulingTrackerDataModelUpdate then
				telemetryService:LogStat(t_7, {
					customFields = {
						updateType = "DataModelUpdate",
						rootName = var54,
						deviceTier = deviceMemoryTier,
						context = self.context
					}
				}, p25.CommitMs - p25.LayoutEffectsMs)
			end
		end
		var55.update_count += 1
		
		if var55.max_update_time_ms < p25.RenderMs + p25.CommitMs then
			var55.max_update_time_ms = p25.RenderMs + p25.CommitMs
		end
		var55.render_total_time_ms += p25.RenderMs
		var55.commit_total_time_ms += p25.CommitMs
		
		if var55.max_render_time_ms < p25.RenderMs then
			var55.max_render_time_ms = p25.RenderMs
		end
		if var55.max_commit_time_ms < p25.CommitMs then
			var55.max_commit_time_ms = p25.CommitMs
		end
		if reactSchedulingTrackerLayoutEffects then
			if p25.LayoutEffectsMs > 0 then
				var55.layout_effects_count += 1
				var55.layout_effects_total_time_ms += p25.LayoutEffectsMs
				
				if var55.max_layout_effects_time_ms < p25.LayoutEffectsMs then
					var55.max_layout_effects_time_ms = p25.LayoutEffectsMs
				end
			end
			if reactSchedulingTrackerDataModelUpdate then
				var55.data_model_update_total_time_ms += p25.CommitMs - p25.LayoutEffectsMs
				
				if var55.max_data_model_update_time_ms < p25.CommitMs - p25.LayoutEffectsMs then
					var55.max_data_model_update_time_ms = p25.CommitMs - p25.LayoutEffectsMs
				end
			end
		end
	end
end

function t_8.getFrameBucket(_, p27)
	return math.min(4, math.floor(math.max(0, p27 - 2) / 16.666666666667) + 1)
end

function t_8:processFrame(p28)
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
	local var58 = self:getFrameBucket(p28)
	frameMetrics.allFrameHistogram[var58] += 1
	self.sessionMetrics.timePerFrame.sketch:insert(reactFrameTimeMs)
	
	if debugReactSchedulingEnableErrorEvents then
		table.insert(self.sessionMetrics.timePerFrame.allData, reactFrameTimeMs)
	end
	if reactFrameTimeMs > 0 then
		frameMetrics.totalReactTimeMs += reactFrameTimeMs
		frameMetrics.reactFrameHistogram[var58] += 1
		self.sessionMetrics.timePerReactFrame.sketch:insert(reactFrameTimeMs)
		
		if debugReactSchedulingEnableErrorEvents then
			table.insert(self.sessionMetrics.timePerReactFrame.allData, reactFrameTimeMs)
		end
		frameMetrics.reactFrameCount += 1
		
		if frameMetrics.maxReactFrameTimeMs < reactFrameTimeMs then
			frameMetrics.maxReactFrameTimeMs = reactFrameTimeMs
		end
		frameMetrics.reactDropChangeHistogram[var58 - self:getFrameBucket(p28 - reactFrameTimeMs) + 1] += 1
	end
end

function t_8:reportPeriod()
	-- upvalues: telemetryService (ref), t_2 (ref), var25 (write), t_3 (ref), deviceMemoryTier (ref), scriptPlusExecutionTimeEnabledEngineFeature (ref), enableCorescriptExecutionTime (ref), t_4 (ref), reactSchedulingTrackerLayoutEffects (ref), reactSchedulingTrackerDataModelUpdate (ref), t_5 (ref), disableReactSchedulingTimePctStats (ref), var32 (write), t_6 (ref), disableReactSchedulingAvgMaxMsStats (ref), var34 (write)
	local frameMetrics = self.frameMetrics
	local var59 = os.clock() * 1000 - self.periodStartMs
	local t = {
		period_length_ms = var59,
		react_total_time_ms = frameMetrics.totalReactTimeMs,
		react_total_time_pct = frameMetrics.totalReactTimeMs / var59,
		react_frame_count = frameMetrics.reactFrameCount,
		total_frame_count = frameMetrics.totalFrameCount,
		corescript_total_time_ms = frameMetrics.totalCorescriptTimeMs,
		corescript_total_time_pct = frameMetrics.totalCorescriptTimeMs / var59,
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
	telemetryService:LogEvent(t_2, { standardizedFields = var25, customFields = t })
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
		local var61 = i - 1
		telemetryService:LogCounter(t_4, {
			customFields = {
				category = "AllFrame",
				bucket = var61,
				context = self.context,
				deviceTier = deviceMemoryTier
			}
		}, frameMetrics.allFrameHistogram[i])
		telemetryService:LogCounter(t_4, {
			customFields = {
				category = "ReactFrame",
				bucket = var61,
				context = self.context,
				deviceTier = deviceMemoryTier
			}
		}, frameMetrics.reactFrameHistogram[i])
		telemetryService:LogCounter(t_4, {
			customFields = {
				category = "ReactDropChange",
				bucket = var61,
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
		telemetryService:LogEvent(t_5, { standardizedFields = var25, customFields = v })
		
		if not disableReactSchedulingTimePctStats then
			telemetryService:LogStat(var32, {
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
			telemetryService:LogStat(var34, {
				customFields = {
					task = "RenderAndCommit",
					stat = "AvgMs",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.avg_update_time_ms)
			telemetryService:LogStat(var34, {
				customFields = {
					task = "Commit",
					stat = "AvgMs",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.avg_commit_time_ms)
			
			if reactSchedulingTrackerLayoutEffects then
				telemetryService:LogStat(var34, {
					customFields = {
						task = "LayoutEffects",
						stat = "AvgMs",
						rootName = v.root_name,
						deviceTier = deviceMemoryTier,
						context = self.context
					}
				}, v.avg_layout_effects_time_ms)
				
				if reactSchedulingTrackerDataModelUpdate then
					telemetryService:LogStat(var34, {
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
			telemetryService:LogStat(var34, {
				customFields = {
					task = "TimeToUpdateMs",
					stat = "AvgMs",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.avg_time_to_update_ms)
			telemetryService:LogStat(var34, {
				customFields = {
					task = "PassiveEffects",
					stat = "AvgMs",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.avg_passive_effects_time_ms)
			telemetryService:LogStat(var34, {
				customFields = {
					task = "RenderAndCommit",
					stat = "MaxMs",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.max_update_time_ms)
			telemetryService:LogStat(var34, {
				customFields = {
					task = "Commit",
					stat = "MaxMs",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.max_commit_time_ms)
			
			if reactSchedulingTrackerLayoutEffects then
				telemetryService:LogStat(var34, {
					customFields = {
						task = "LayoutEffects",
						stat = "MaxMs",
						rootName = v.root_name,
						deviceTier = deviceMemoryTier,
						context = self.context
					}
				}, v.max_layout_effects_time_ms)
				
				if reactSchedulingTrackerDataModelUpdate then
					telemetryService:LogStat(var34, {
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
			telemetryService:LogStat(var34, {
				customFields = {
					task = "TimeToUpdateMs",
					stat = "MaxMs",
					rootName = v.root_name,
					deviceTier = deviceMemoryTier,
					context = self.context
				}
			}, v.max_time_to_update_ms)
			telemetryService:LogStat(var34, {
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

function generatePercentilesFromSingleSketch(p29)
	-- upvalues: parts (ref)
	local var62 = "{"
	
	for i, v in parts do
		var62 = (var62 .. "\"p" .. v .. "\":") .. p29:getPercentile(tonumber(v) or 0)
		
		if i < #parts then
			var62 ..= ","
		end
	end
	return var62 .. "}"
end

function generatePercentilesFromSketches(p30, p31)
	-- upvalues: parts (ref)
	local var63 = "{"
	
	for i, v in parts do
		var63 ..= "\"p" .. v .. "\":{"
		local var64 = tonumber(v) or 0
		local var65 = 0
		
		for i_1, v_1 in p30 do
			var65 += 1
			var63 ..= "\"" .. i_1 .. "\":" .. v_1:getPercentile(var64)
			
			if var65 < p31 then
				var63 ..= ","
			end
		end
		var63 ..= if i < #parts then "}," else "}"
	end
	return var63 .. "}"
end

function t_8:reportPercentError(p32, p33, p34, p35)
	-- upvalues: parts (ref), telemetryService (ref), var27 (write), var25 (write)
	table.sort(p32)
	local p32Count = #p32
	
	if p32Count < 1 then return end
	for i, v in parts do
		local var67 = p32[math.ceil((tonumber(v) or 0) / 100 * p32Count)]
		local var68 = if p33.sketches then p33.sketches[p35]:getPercentile(v) else p33.sketch:getPercentile(v)
		local var69 = 0
		
		if var67 ~= 0 or var68 == 0 then
			if var67 ~= 0 then
				var69 = (var68 - var67) * 100 / var67
			end
			telemetryService:LogEvent(var27, {
				standardizedFields = var25,
				customFields = {
					rootName = p35,
					percentile = v,
					metric = p34,
					numDatapoints = p32Count,
					context = self.context,
					approxError = var69
				}
			})
		end
	end
end

function t_8:reportSession()
	-- upvalues: debugReactSchedulingEnableErrorEvents (ref), telemetryService (ref), t_1 (ref), var25 (write)
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
	telemetryService:LogEvent(t_1, { standardizedFields = var25, customFields = t })
end

return t_8.new(fStringReactSchedulingContext)