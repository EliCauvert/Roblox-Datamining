local intervalPerformanceTracker = script:FindFirstAncestor("IntervalPerformanceTracker")
local parent = intervalPerformanceTracker.Parent
local default = require(parent.LoggingProtocol).default
local runService = require(parent.MockableProxyServices).RunService
local name = require(intervalPerformanceTracker.Logger):new(script.Name)
local intervalPerformanceTrackerTelemetryConfigModule = require(script.Parent.IntervalPerformanceTrackerTelemetryConfig)
game:DefineFastFlag("DebugPrintIntervalPerformanceTrackerResults", false)
local getFFlagAXFPSEventStreamAndCounters = require(parent.SharedFlags).GetFFlagAXFPSEventStreamAndCounters
local sendFPSStatModule = require(script.Parent.sendFPSStat)
local AXFixAverageFPSCasing = game:DefineFastFlag("AXFixAverageFPSCasing", false)
local AXIntervalPerformanceTrackerFPSStandardDeviation = game:DefineFastFlag("AXIntervalPerformanceTrackerFPSStandardDeviation", false)
local AXIntervalPerformanceTrackerScrollFrameTime = game:DefineFastFlag("AXIntervalPerformanceTrackerScrollFrameTime", false)
local var1 = math.random(0, 1000) < require(parent.SharedFlags).GetFIntIntervalPerformanceTrackerEventStream()
local t = {
	averageFPS = {
		reducer = function(p1)
			return {
				framesCount = if p1.framesCount == nil then 0 else p1.framesCount + 1,
				startTime = p1.startTime or tick()
			}
		end,
		getResult = function(p1)
			local currentTime = tick()
			
			return if p1.framesCount == nil or p1.framesCount == 0 or (p1.startTime == nil or currentTime == p1.startTime) then nil else p1.framesCount / (currentTime - p1.startTime)
		end
	},
	framesCount = {
		reducer = function(p1)
			return {
				framesCount = if p1.framesCount == nil then 0 else p1.framesCount + 1
			}
		end,
		getResult = function(p1)
			return p1.framesCount
		end
	},
	longestFrameTime = {
		reducer = function(p1)
			return {
				framesCount = if p1.framesCount == nil then 0 else p1.framesCount + 1,
				longestFrameTime = if p1.longestFrameTime == nil or p1.previousTime == nil then 0 else math.max(p1.longestFrameTime, tick() - p1.previousTime),
				previousTime = tick()
			}
		end,
		getResult = function(p1)
			return if p1.framesCount < 1 then nil else p1.longestFrameTime
		end
	},
	duration = {
		reducer = function(p1)
			return { startTime = p1.startTime or tick() }
		end,
		getResult = function(p1)
			return tick() - p1.startTime
		end
	}
}

if AXIntervalPerformanceTrackerFPSStandardDeviation then
	t.standardDeviationFPS = {
		reducer = function(p1)
			local currentTime = tick()
			local framesCount = p1.framesCount or 0
			local sumFPS = p1.sumFPS or 0
			local sumSquaredFPS = p1.sumSquaredFPS or 0
			
			if p1.previousTime ~= nil and p1.previousTime < currentTime then
				local var2 = 1 / (currentTime - p1.previousTime)
				framesCount += 1
				sumFPS += var2
				sumSquaredFPS += var2 * var2
			end
			return {
				framesCount = framesCount,
				previousTime = currentTime,
				sumFPS = sumFPS,
				sumSquaredFPS = sumSquaredFPS
			}
		end,
		getResult = function(p1)
			if p1.framesCount == nil or p1.framesCount < 1 then
				return nil
			end
			local var2 = (p1.sumFPS or 0) / p1.framesCount
			
			return math.sqrt(math.max((p1.sumSquaredFPS or 0) / p1.framesCount - var2 * var2, 0))
		end
	}
end
local t_1 = {}
local t_2 = {}

for i, v in t do
	t_1[i] = i
	table.insert(t_2, i)
end
local list = {
	"under_16", "16_to_16_7", "16_7_to_17_5", "17_5_to_18", "18_to_21", "21_to_25",
	"over_25"
}

local function _(p1)
	return if p1 < 16 then "under_16" elseif p1 < 16.666666666667 then "16_to_16_7" elseif p1 < 17.5 then "16_7_to_17_5" elseif p1 < 18 then "17_5_to_18" elseif p1 < 21 then "18_to_21" elseif p1 < 25 then "21_to_25" else "over_25"
end

local _ = function(p1, p2)
	local p11Count = #p1
	local ceiled = math.ceil(p2 / 100 * p11Count)
	
	if ceiled < 1 then
		ceiled = 1
	elseif p11Count < ceiled then
		ceiled = p11Count
	end
	return p1[ceiled]
end

local _ = function(value, p1)
	local var2 = 10 ^ p1
	
	return math.round(value * var2) / var2
end

v = function(p1, p2, p3)
	if p2 ~= nil then
		table.insert(p1, (p3 - p2) * 1000)
	end
end

if AXIntervalPerformanceTrackerScrollFrameTime then
	local httpService = game:GetService("HttpService")
	t.rawFrameTimesMs = {
		reducer = function(p1, p2)
			local frames = p1.frames or {}
			local previousTime = p1.previousTime
			
			if previousTime ~= nil then
				table.insert(frames, (p2 - previousTime) * 1000)
			end
			return { frames = frames, previousTime = p2 }
		end,
		getResult = function(p1)
			-- upvalues: httpService (ref)
			if p1.frames == nil or #p1.frames < 1 then
				return nil
			end
			local t = {}
			
			for i, v in p1.frames do
				table.insert(t, math.round(v * 100) / 100)
			end
			return httpService:JSONEncode(t)
		end
	}
	t.frameTimeAvgMs = {
		reducer = function(p2, p3)
			local framesCount = p2.framesCount or 0
			local sumMs = p2.sumMs or 0
			
			if p2.previousTime ~= nil then
				framesCount += 1
				sumMs += (p3 - p2.previousTime) * 1000
			end
			return {
				framesCount = framesCount,
				sumMs = sumMs,
				previousTime = p3
			}
		end,
		getResult = function(p2)
			return if p2.framesCount == nil or p2.framesCount < 1 then nil else p2.sumMs / p2.framesCount
		end
	}
	t.frameTimeStdDevMs = {
		reducer = function(p2, p3)
			local framesCount = p2.framesCount or 0
			local sumMs = p2.sumMs or 0
			local sumSquaredMs = p2.sumSquaredMs or 0
			
			if p2.previousTime ~= nil then
				local var2 = (p3 - p2.previousTime) * 1000
				framesCount += 1
				sumMs += var2
				sumSquaredMs += var2 * var2
			end
			return {
				framesCount = framesCount,
				sumMs = sumMs,
				sumSquaredMs = sumSquaredMs,
				previousTime = p3
			}
		end,
		getResult = function(p2)
			if p2.framesCount == nil or p2.framesCount < 1 then
				return nil
			end
			local var2 = p2.sumMs / p2.framesCount
			
			return math.sqrt(math.max(p2.sumSquaredMs / p2.framesCount - var2 * var2, 0))
		end
	}
	t.frameTimeDistributionMs = {
		reducer = function(p2, p3)
			local frames = p2.frames or {}
			local previousTime = p2.previousTime
			
			if previousTime ~= nil then
				table.insert(frames, (p3 - previousTime) * 1000)
			end
			return { frames = frames, previousTime = p3 }
		end,
		getResult = function(p2)
			-- upvalues: httpService (ref)
			if p2.frames == nil or #p2.frames < 1 then
				return nil
			end
			local cloned = table.clone(p2.frames)
			table.sort(cloned)
			local t = {}
			local clonedCount = #cloned
			local ceiled = math.ceil(clonedCount * 0.5)
			
			if ceiled < 1 then
				ceiled = 1
			elseif clonedCount < ceiled then
				ceiled = clonedCount
			end
			t.p50 = math.round(cloned[ceiled] * 100) / 100
			local clonedCount_1 = #cloned
			local ceiled_1 = math.ceil(clonedCount_1 * 0.95)
			
			if ceiled_1 < 1 then
				ceiled_1 = 1
			elseif clonedCount_1 < ceiled_1 then
				ceiled_1 = clonedCount_1
			end
			t.p95 = math.round(cloned[ceiled_1] * 100) / 100
			local clonedCount_2 = #cloned
			local ceiled_2 = math.ceil(clonedCount_2 * 0.99)
			
			if ceiled_2 < 1 then
				ceiled_2 = 1
			elseif clonedCount_2 < ceiled_2 then
				ceiled_2 = clonedCount_2
			end
			t.p99 = math.round(cloned[ceiled_2] * 100) / 100
			
			return httpService:JSONEncode(t)
		end
	}
	t.frameBuckets = {
		reducer = function(p2, p3)
			-- upvalues: list (ref)
			local counts
			local _ = nil
			
			if p2.counts == nil then
				counts = {}
				
				for i, v in list do
					counts[v] = 0
				end
			else
				counts = p2.counts
			end
			if p2.previousTime ~= nil then
				local var2 = (p3 - p2.previousTime) * 1000
				counts[if var2 < 16 then "under_16" elseif var2 < 16.666666666667 then "16_to_16_7" elseif var2 < 17.5 then "16_7_to_17_5" elseif var2 < 18 then "17_5_to_18" elseif var2 < 21 then "18_to_21" elseif var2 < 25 then "21_to_25" else "over_25"] += 1
			end
			return { counts = counts, previousTime = p3 }
		end,
		getResult = function(p4)
			-- upvalues: httpService (ref)
			return if p4.counts == nil then nil else httpService:JSONEncode(p4.counts)
		end
	}
	
	for i_1, v_1 in {
		"rawFrameTimesMs",
		"frameTimeAvgMs",
		"frameTimeStdDevMs",
		"frameTimeDistributionMs",
		"frameBuckets"
	} do
		t_1[v_1] = v_1
	end
end
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4, p5, p6, p7, p8)
	-- upvalues: getFFlagAXFPSEventStreamAndCounters (ref), t_3 (ref)
	local t = {
		_startTime = nil,
		_metricsData = {},
		_timeout = p4,
		_metricsToTrack = p5,
		_countersEnabled = if getFFlagAXFPSEventStreamAndCounters() then p6 else nil,
		_eventStreamEnabled = if getFFlagAXFPSEventStreamAndCounters() then p7 else nil,
		_extraFields = p8
	}
	setmetatable(t, t_3)
	
	return t
end

function t_3:getMetricsToTrack()
	-- upvalues: t_2 (ref)
	return if self._metricsToTrack and #self._metricsToTrack > 0 then self._metricsToTrack else t_2
end

function t_3:hasReachedTimeout()
	return if self._timeout == nil or self._startTime == nil then false else self._timeout < tick() - self._startTime
end

function t_3:updateMetrics()
	-- upvalues: AXIntervalPerformanceTrackerScrollFrameTime (ref), t (ref)
	if self._startTime == nil then
		self._startTime = tick()
	end
	local var3 = if AXIntervalPerformanceTrackerScrollFrameTime then tick() else nil
	
	for i, v in self:getMetricsToTrack() do
		local var4 = t[v]
		
		if var4 then
			if not self._metricsData[v] then
				self._metricsData[v] = {}
			end
			self._metricsData[v] = var4.reducer(self._metricsData[v], var3)
		end
	end
end

function t_3:getResult()
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in self:getMetricsToTrack() do
		local var5 = t[v]
		
		if var5 then
			t_1[v] = var5.getResult(self._metricsData[v])
		end
	end
	return t_1
end

local t_4 = {}
t_4.__index = t_4

function t_4.DebugPrintIntervalPerformanceTrackerResults()
	-- upvalues: t (ref), t_1 (ref), t_4 (ref)
	local t_2 = {
		_renderSteppedConnection = nil,
		_metricsTrackers = t,
		_intervals = {},
		availableMetricsEnum = t_1
	}
	setmetatable(t_2, t_4)
	
	return t_2
end

function t_4:_updateIntervals()
	for i, v in self._intervals do
		v:updateMetrics()
		
		if v:hasReachedTimeout() then
			self:stopAndLogTracking(i)
		end
	end
end

function t_4:startTracking(p4, p5, p6, p7, p8, p9)
	-- upvalues: var1 (ref), t_3 (ref), getFFlagAXFPSEventStreamAndCounters (ref), runService (ref)
	if not var1 then return end
	if not self._intervals[p4] then
		local var6 = t_3.new(p5, p6, if getFFlagAXFPSEventStreamAndCounters() then p7 else nil, if getFFlagAXFPSEventStreamAndCounters() then p8 else nil, p9)
		self._intervals[p4] = var6
		var6:updateMetrics()
	end
	if not self._renderSteppedConnection then
		self._renderSteppedConnection = runService.RenderStepped:Connect(function()
			-- upvalues: self (ref)
			self:_updateIntervals()
		end)
	end
end

function t_4:_fireStatsTracking(p4)
	-- upvalues: name (ref), AXFixAverageFPSCasing (ref), sendFPSStatModule (ref)
	local averageFPS = p4.averageFPS
	local framesCount = p4.framesCount
	local longestFrameTime = p4.longestFrameTime
	local intervalName = p4.intervalName
	local var6 = self._intervals[intervalName]
	
	if not var6 then
		name:warning(`Missing interval {intervalName}`)
		
		return
	end
	local countersEnabled = var6._countersEnabled
	local eventStreamEnabled = var6._eventStreamEnabled
	
	local function _(p5, p6)
		return "IntervalPerformanceTracker_" .. p44 .. "_" .. p45
	end
	
	if not countersEnabled and not eventStreamEnabled or not intervalName then return end
	if averageFPS then
		local text = "IntervalPerformanceTracker_" .. "AverageFPS" .. "_" .. intervalName
		local cloned = table.clone(p4)
		cloned.duration = averageFPS
		cloned.averageFps = if AXFixAverageFPSCasing then averageFPS else nil
		sendFPSStatModule({
			statName = text,
			eventStreamName = intervalName,
			metaData = cloned,
			interval = averageFPS,
			excludeCounters = not countersEnabled,
			excludeEventStream = not eventStreamEnabled
		})
	end
	if framesCount and countersEnabled then
		local text = "IntervalPerformanceTracker_" .. "FramesCount" .. "_" .. intervalName
		local cloned = table.clone(p4)
		cloned.duration = framesCount
		sendFPSStatModule({
			statName = text,
			metaData = cloned,
			interval = framesCount
		})
	end
	if longestFrameTime and var6._countersEnabled then
		local text = "IntervalPerformanceTracker_" .. "LongestFrameTime" .. "_" .. intervalName
		local cloned = table.clone(p4)
		cloned.duration = longestFrameTime
		sendFPSStatModule({
			statName = text,
			metaData = cloned,
			interval = longestFrameTime
		})
	end
end

function t_4:stopAndLogTracking(p4)
	-- upvalues: var1 (ref), AXIntervalPerformanceTrackerScrollFrameTime (ref), default (ref), intervalPerformanceTrackerTelemetryConfigModule (ref), getFFlagAXFPSEventStreamAndCounters (ref)
	if not var1 then return end
	local var6 = self._intervals[p4]
	
	if var6 then
		local result = var6:getResult()
		local t = { intervalName = p4 }
		
		if AXIntervalPerformanceTrackerScrollFrameTime and var6._extraFields then
			for i, v in var6._extraFields do
				t[i] = v
			end
		end
		local var7 = 0
		
		for i, v in result do
			if v ~= nil then
				var7 += 1
			end
			t[i] = v
		end
		if var7 > 0 then
			default:logRobloxTelemetryEvent(intervalPerformanceTrackerTelemetryConfigModule, nil, t)
			
			if game:GetFastFlag("DebugPrintIntervalPerformanceTrackerResults") then
				print("IntervalPerformanceTracker:" .. tostring(p4) .. " logged with results:")
				
				for i_1, v_1 in t do
					print("\t" .. tostring(i_1) .. " = " .. tostring(v_1))
				end
			end
		end
		if getFFlagAXFPSEventStreamAndCounters() then
			self:_fireStatsTracking(t)
		end
		self._intervals[p4] = nil
	end
	self:disconnectUnusedRenderStepped()
end

function t_4:cancelTracking(p5)
	-- upvalues: var1 (ref)
	if var1 then
		self._intervals[p5] = nil
		self:disconnectUnusedRenderStepped()
		
		return
	end
end

function t_4:disconnectUnusedRenderStepped()
	if not next(self._intervals) and self._renderSteppedConnection then
		self._renderSteppedConnection:Disconnect()
		self._renderSteppedConnection = nil
	end
end

t_4.class = t_4

return t_4.new()