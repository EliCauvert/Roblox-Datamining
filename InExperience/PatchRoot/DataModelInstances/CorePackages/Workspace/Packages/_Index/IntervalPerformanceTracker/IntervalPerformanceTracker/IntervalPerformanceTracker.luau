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
local var7 = math.random(0, 1000) < require(parent.SharedFlags).GetFIntIntervalPerformanceTrackerEventStream()
local t = {
	averageFPS = {
		reducer = function(p0) --[[ line: 65 ]]
			return {
				framesCount = if p0.framesCount == nil then 0 else p0.framesCount + 1,
				startTime = p0.startTime or tick()
			}
		end,
		getResult = function(p1) --[[ line: 71 ]]
			local currentTime = tick()
			
			return if p1.framesCount == nil or p1.framesCount == 0 or (p1.startTime == nil or currentTime == p1.startTime) then nil else p1.framesCount / (currentTime - p1.startTime)
		end
	},
	framesCount = {
		reducer = function(p2) --[[ line: 86 ]]
			return {
				framesCount = if p2.framesCount == nil then 0 else p2.framesCount + 1
			}
		end,
		getResult = function(p3) --[[ line: 91 ]]
			return p3.framesCount
		end
	},
	longestFrameTime = {
		reducer = function(p4) --[[ line: 96 ]]
			return {
				framesCount = if p4.framesCount == nil then 0 else p4.framesCount + 1,
				longestFrameTime = if p4.longestFrameTime == nil or p4.previousTime == nil then 0 else math.max(p4.longestFrameTime, tick() - p4.previousTime),
				previousTime = tick()
			}
		end,
		getResult = function(p5) --[[ line: 105 ]]
			return if p5.framesCount < 1 then nil else p5.longestFrameTime
		end
	},
	duration = {
		reducer = function(p6) --[[ line: 113 ]]
			return { startTime = p6.startTime or tick() }
		end,
		getResult = function(p7) --[[ line: 118 ]]
			return tick() - p7.startTime
		end
	}
}

if AXIntervalPerformanceTrackerFPSStandardDeviation then
	t.standardDeviationFPS = {
		reducer = function(p8) --[[ line: 126 ]]
			local currentTime = tick()
			local framesCount = p8.framesCount or 0
			local sumFPS = p8.sumFPS or 0
			local sumSquaredFPS = p8.sumSquaredFPS or 0
			
			if p8.previousTime ~= nil and p8.previousTime < currentTime then
				local var20 = 1 / (currentTime - p8.previousTime)
				framesCount += 1
				sumFPS += var20
				sumSquaredFPS += var20 * var20
			end
			return {
				framesCount = framesCount,
				previousTime = currentTime,
				sumFPS = sumFPS,
				sumSquaredFPS = sumSquaredFPS
			}
		end,
		getResult = function(p9) --[[ line: 146 ]]
			if p9.framesCount == nil or p9.framesCount < 1 then
				return nil
			end
			local var21 = (p9.sumFPS or 0) / p9.framesCount
			
			return math.sqrt(math.max((p9.sumSquaredFPS or 0) / p9.framesCount - var21 * var21, 0))
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

local function _(p10) --[[ line: 197 | named "bucketKeyForFrameTimeMs" ]]
	return if p10 < 16 then "under_16" elseif p10 < 16.666666666667 then "16_to_16_7" elseif p10 < 17.5 then "16_7_to_17_5" elseif p10 < 18 then "17_5_to_18" elseif p10 < 21 then "18_to_21" elseif p10 < 25 then "21_to_25" else "over_25"
end

local _ = function(p11, p12) --[[ line: 216 | named "percentile" ]]
	local p11Count = #p11
	local ceiled = math.ceil(p12 / 100 * p11Count)
	
	if ceiled < 1 then
		ceiled = 1
	elseif p11Count < ceiled then
		ceiled = p11Count
	end
	return p11[ceiled]
end

local _ = function(value, p13) --[[ line: 227 | named "roundTo" ]]
	local var24 = 10 ^ p13
	
	return math.round(value * var24) / var24
end

v = function(p14, p15, p16) --[[ line: 252 | named "appendFrameSample" ]]
	if p15 ~= nil then
		table.insert(p14, (p16 - p15) * 1000)
	end
end

if AXIntervalPerformanceTrackerScrollFrameTime then
	local httpService = game:GetService("HttpService")
	t.rawFrameTimesMs = {
		reducer = function(p17, p18) --[[ line: 265 ]]
			local frames = p17.frames or {}
			local previousTime = p17.previousTime
			
			if previousTime ~= nil then
				table.insert(frames, (p18 - previousTime) * 1000)
			end
			return { frames = frames, previousTime = p18 }
		end,
		getResult = function(p19) --[[ line: 273 ]]
			-- upvalues: httpService (ref)
			if p19.frames == nil or #p19.frames < 1 then
				return nil
			end
			local t = {}
			
			for i, v in p19.frames do
				table.insert(t, math.round(v * 100) / 100)
			end
			return httpService:JSONEncode(t)
		end
	}
	t.frameTimeAvgMs = {
		reducer = function(p20, p21) --[[ line: 287 ]]
			local framesCount = p20.framesCount or 0
			local sumMs = p20.sumMs or 0
			
			if p20.previousTime ~= nil then
				framesCount += 1
				sumMs += (p21 - p20.previousTime) * 1000
			end
			return {
				framesCount = framesCount,
				sumMs = sumMs,
				previousTime = p21
			}
		end,
		getResult = function(p22) --[[ line: 300 ]]
			return if p22.framesCount == nil or p22.framesCount < 1 then nil else p22.sumMs / p22.framesCount
		end
	}
	t.frameTimeStdDevMs = {
		reducer = function(p23, p24) --[[ line: 310 ]]
			local framesCount = p23.framesCount or 0
			local sumMs = p23.sumMs or 0
			local sumSquaredMs = p23.sumSquaredMs or 0
			
			if p23.previousTime ~= nil then
				local var32 = (p24 - p23.previousTime) * 1000
				framesCount += 1
				sumMs += var32
				sumSquaredMs += var32 * var32
			end
			return {
				framesCount = framesCount,
				sumMs = sumMs,
				sumSquaredMs = sumSquaredMs,
				previousTime = p24
			}
		end,
		getResult = function(p25) --[[ line: 327 ]]
			if p25.framesCount == nil or p25.framesCount < 1 then
				return nil
			end
			local var33 = p25.sumMs / p25.framesCount
			
			return math.sqrt(math.max(p25.sumSquaredMs / p25.framesCount - var33 * var33, 0))
		end
	}
	t.frameTimeDistributionMs = {
		reducer = function(p26, p27) --[[ line: 340 ]]
			local frames = p26.frames or {}
			local previousTime = p26.previousTime
			
			if previousTime ~= nil then
				table.insert(frames, (p27 - previousTime) * 1000)
			end
			return { frames = frames, previousTime = p27 }
		end,
		getResult = function(p28) --[[ line: 348 ]]
			-- upvalues: httpService (ref)
			if p28.frames == nil or #p28.frames < 1 then
				return nil
			end
			local cloned = table.clone(p28.frames)
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
		reducer = function(p29, p30) --[[ line: 364 ]]
			-- upvalues: list (ref)
			local counts
			local _ = nil
			
			if p29.counts == nil then
				counts = {}
				
				for i, v in list do
					counts[v] = 0
				end
			else
				counts = p29.counts
			end
			if p29.previousTime ~= nil then
				local var43 = (p30 - p29.previousTime) * 1000
				counts[if var43 < 16 then "under_16" elseif var43 < 16.666666666667 then "16_to_16_7" elseif var43 < 17.5 then "16_7_to_17_5" elseif var43 < 18 then "17_5_to_18" elseif var43 < 21 then "18_to_21" elseif var43 < 25 then "21_to_25" else "over_25"] += 1
			end
			return { counts = counts, previousTime = p30 }
		end,
		getResult = function(p31) --[[ line: 384 ]]
			-- upvalues: httpService (ref)
			return if p31.counts == nil then nil else httpService:JSONEncode(p31.counts)
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

function t_3.new(p32, p33, p34, p35, p36) --[[ line: 416 ]]
	-- upvalues: getFFlagAXFPSEventStreamAndCounters (ref), t_3 (ref)
	local t = {
		_startTime = nil,
		_metricsData = {},
		_timeout = p32,
		_metricsToTrack = p33,
		_countersEnabled = if getFFlagAXFPSEventStreamAndCounters() then p34 else nil,
		_eventStreamEnabled = if getFFlagAXFPSEventStreamAndCounters() then p35 else nil,
		_extraFields = p36
	}
	setmetatable(t, t_3)
	
	return t
end

function t_3:getMetricsToTrack() --[[ line: 436 ]]
	-- upvalues: t_2 (ref)
	return if self._metricsToTrack and #self._metricsToTrack > 0 then self._metricsToTrack else t_2
end

function t_3:hasReachedTimeout() --[[ line: 444 ]]
	return if self._timeout == nil or self._startTime == nil then false else self._timeout < tick() - self._startTime
end

function t_3:updateMetrics() --[[ line: 451 ]]
	-- upvalues: AXIntervalPerformanceTrackerScrollFrameTime (ref), t (ref)
	if self._startTime == nil then
		self._startTime = tick()
	end
	local var45 = if AXIntervalPerformanceTrackerScrollFrameTime then tick() else nil
	
	for i, v in self:getMetricsToTrack() do
		local var46 = t[v]
		
		if var46 then
			if not self._metricsData[v] then
				self._metricsData[v] = {}
			end
			self._metricsData[v] = var46.reducer(self._metricsData[v], var45)
		end
	end
end

function t_3:getResult() --[[ line: 478 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in self:getMetricsToTrack() do
		local var48 = t[v]
		
		if var48 then
			t_1[v] = var48.getResult(self._metricsData[v])
		end
	end
	return t_1
end

local t_4 = {}
t_4.__index = t_4

function t_4.new() --[[ line: 506 ]]
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

function t_4:_updateIntervals() --[[ line: 519 ]]
	for i, v in self._intervals do
		v:updateMetrics()
		
		if v:hasReachedTimeout() then
			self:stopAndLogTracking(i)
		end
	end
end

function t_4:startTracking(p37, p38, p39, p40, p41, p42) --[[ line: 529 ]]
	-- upvalues: var7 (ref), t_3 (ref), getFFlagAXFPSEventStreamAndCounters (ref), runService (ref)
	if not var7 then return end
	if not self._intervals[p37] then
		local var50 = t_3.new(p38, p39, if getFFlagAXFPSEventStreamAndCounters() then p40 else nil, if getFFlagAXFPSEventStreamAndCounters() then p41 else nil, p42)
		self._intervals[p37] = var50
		var50:updateMetrics()
	end
	if not self._renderSteppedConnection then
		self._renderSteppedConnection = runService.RenderStepped:Connect(function() --[[ line: 557 ]]
			-- upvalues: self (ref)
			self:_updateIntervals()
		end)
	end
end

function t_4:_fireStatsTracking(p43) --[[ line: 571 ]]
	-- upvalues: name (ref), AXFixAverageFPSCasing (ref), sendFPSStatModule (ref)
	local averageFPS = p43.averageFPS
	local framesCount = p43.framesCount
	local longestFrameTime = p43.longestFrameTime
	local intervalName = p43.intervalName
	local var51 = self._intervals[intervalName]
	
	if not var51 then
		name:warning(`Missing interval {intervalName}`)
		
		return
	end
	local countersEnabled = var51._countersEnabled
	local eventStreamEnabled = var51._eventStreamEnabled
	
	local function _(p44, p45) --[[ line: 590 | named "makeStatName" ]]
		return "IntervalPerformanceTracker_" .. p44 .. "_" .. p45
	end
	
	if not countersEnabled and not eventStreamEnabled or not intervalName then return end
	if averageFPS then
		local text = "IntervalPerformanceTracker_" .. "AverageFPS" .. "_" .. intervalName
		local cloned = table.clone(p43)
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
		local cloned = table.clone(p43)
		cloned.duration = framesCount
		sendFPSStatModule({
			statName = text,
			metaData = cloned,
			interval = framesCount
		})
	end
	if longestFrameTime and var51._countersEnabled then
		local text = "IntervalPerformanceTracker_" .. "LongestFrameTime" .. "_" .. intervalName
		local cloned = table.clone(p43)
		cloned.duration = longestFrameTime
		sendFPSStatModule({
			statName = text,
			metaData = cloned,
			interval = longestFrameTime
		})
	end
end

function t_4:stopAndLogTracking(p46) --[[ line: 645 ]]
	-- upvalues: var7 (ref), AXIntervalPerformanceTrackerScrollFrameTime (ref), default (ref), intervalPerformanceTrackerTelemetryConfigModule (ref), getFFlagAXFPSEventStreamAndCounters (ref)
	if not var7 then return end
	local var58 = self._intervals[p46]
	
	if var58 then
		local result = var58:getResult()
		local t = { intervalName = p46 }
		
		if AXIntervalPerformanceTrackerScrollFrameTime and var58._extraFields then
			for i, v in var58._extraFields do
				t[i] = v
			end
		end
		local var61 = 0
		
		for i, v in result do
			if v ~= nil then
				var61 += 1
			end
			t[i] = v
		end
		if var61 > 0 then
			default:logRobloxTelemetryEvent(intervalPerformanceTrackerTelemetryConfigModule, nil, t)
			
			if game:GetFastFlag("DebugPrintIntervalPerformanceTrackerResults") then
				print("IntervalPerformanceTracker:" .. tostring(p46) .. " logged with results:")
				
				for i_1, v_1 in t do
					print("\t" .. tostring(i_1) .. " = " .. tostring(v_1))
				end
			end
		end
		if getFFlagAXFPSEventStreamAndCounters() then
			self:_fireStatsTracking(t)
		end
		self._intervals[p46] = nil
	end
	self:disconnectUnusedRenderStepped()
end

function t_4:cancelTracking(p47) --[[ line: 701 ]]
	-- upvalues: var7 (ref)
	if var7 then
		self._intervals[p47] = nil
		self:disconnectUnusedRenderStepped()
		
		return
	end
end

function t_4:disconnectUnusedRenderStepped() --[[ line: 711 ]]
	if not next(self._intervals) and self._renderSteppedConnection then
		self._renderSteppedConnection:Disconnect()
		self._renderSteppedConnection = nil
	end
end

t_4.class = t_4

return t_4.new()