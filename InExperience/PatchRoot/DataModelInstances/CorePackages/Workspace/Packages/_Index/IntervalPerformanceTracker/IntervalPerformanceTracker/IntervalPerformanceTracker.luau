local IntervalPerformanceTracker = script:FindFirstAncestor("IntervalPerformanceTracker")
local Parent = IntervalPerformanceTracker.Parent
local Default = require(Parent.LoggingProtocol).default
local MockableProxyServicesModule = require(Parent.MockableProxyServices)
local RunService = MockableProxyServicesModule.RunService
local NewResult = require(IntervalPerformanceTracker.Logger):new(script.Name)
local IntervalPerformanceTrackerTelemetryConfigModule = require(script.Parent.IntervalPerformanceTrackerTelemetryConfig)
game:DefineFastFlag("DebugPrintIntervalPerformanceTrackerResults", false)
local SendFPSStatModule = require(script.Parent.sendFPSStat)
local SendScrollFrameCountersModule = require(script.Parent.sendScrollFrameCounters)
local AXFixAverageFPSCasing = game:DefineFastFlag("AXFixAverageFPSCasing", false)
local AXIntervalPerformanceTrackerScrollFrameCounters = game:DefineFastFlag("AXIntervalPerformanceTrackerScrollFrameCounters", false)
local IntervalPerformanceTrackerScrollPositionSamples = game:DefineFastFlag("IntervalPerformanceTrackerScrollPositionSamples", false)
local IntervalPerformanceTrackerCancelOnAppHide = game:DefineFastFlag("IntervalPerformanceTrackerCancelOnAppHide", false)
local RandomValue = math.random(0, 1000)
local FIntIntervalPerformanceTrackerEventStream = require(Parent.SharedFlags).GetFIntIntervalPerformanceTrackerEventStream()
local IsRandomValueBelow = RandomValue < FIntIntervalPerformanceTrackerEventStream

local function _(p1: number): boolean
	-- upvalues: RandomValue (copy), FIntIntervalPerformanceTrackerEventStream (copy)
	return p1 >= 1000 or RandomValue < math.max(p1, FIntIntervalPerformanceTrackerEventStream)
end

local config = {
	averageFPS = {
		reducer = function(p1)
			return {
				framesCount = if p1.framesCount == nil then 0 else p1.framesCount + 1,
				startTime = p1.startTime or tick()
			}
		end,
		getResult = function(p1)
			local CurrentTime = tick()
			
			return if p1.framesCount == nil or p1.framesCount == 0 or p1.startTime == nil or CurrentTime == p1.startTime then nil else p1.framesCount / (CurrentTime - p1.startTime)
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
		reducer = function(_metricsTrackers)
			return {
				framesCount = if _metricsTrackers.framesCount == nil then 0 else _metricsTrackers.framesCount + 1,
				longestFrameTime = if _metricsTrackers.longestFrameTime == nil or _metricsTrackers.previousTime == nil then 0 else math.max(_metricsTrackers.longestFrameTime, tick() - _metricsTrackers.previousTime),
				previousTime = tick()
			}
		end,
		getResult = function(_metricsTrackers)
			return if _metricsTrackers.framesCount < 1 then nil else _metricsTrackers.longestFrameTime
		end
	},
	duration = {
		reducer = function(p1)
			return { startTime = p1.startTime or tick() }
		end,
		getResult = function(p1): number
			return tick() - p1.startTime
		end
	}
}

if game:DefineFastFlag("AXIntervalPerformanceTrackerFPSStandardDeviation", false) then
	config.standardDeviationFPS = {
		reducer = function(p1)
			local CurrentTime = tick()
			local FramesCount = p1.framesCount or 0
			local SumFPS = p1.sumFPS or 0
			local SumSquaredFPS = p1.sumSquaredFPS or 0
			
			if p1.previousTime ~= nil and p1.previousTime < CurrentTime then
				local Amount = 1 / (CurrentTime - p1.previousTime)
				FramesCount += 1
				SumFPS += Amount
				SumSquaredFPS += Amount * Amount
			end
			return {
				framesCount = FramesCount,
				previousTime = CurrentTime,
				sumFPS = SumFPS,
				sumSquaredFPS = SumSquaredFPS
			}
		end,
		getResult = function(p1): number?
			if p1.framesCount == nil or p1.framesCount < 1 then
				return nil
			else
				local v1 = (p1.sumFPS or 0) / p1.framesCount
				
				return (math.sqrt((math.max((p1.sumSquaredFPS or 0) / p1.framesCount - v1 * v1, 0))))
			end
		end
	}
end
local AvailableMetricsEnum = {}
local List = {}

for i, _ in config do
	AvailableMetricsEnum[i] = i
	table.insert(List, i)
end
local FRAMEBUCKETKEYS = if AXIntervalPerformanceTrackerScrollFrameCounters then require(script.Parent.ScrollFrameBands).FRAME_BUCKET_KEYS else {
	"under_16", "16_to_16_7", "16_7_to_17_5", "17_5_to_18", "18_to_21", "21_to_25",
	"over_25"
}
local list = { "rawFrameTimesMs", "rawScrollPositionSamplesCsv" }

local _ = function(p1: number): string
	return if p1 < 16 then "under_16" elseif p1 < 16.666666666666668 then "16_to_16_7" elseif p1 < 17.5 then "16_7_to_17_5" elseif p1 < 18 then "17_5_to_18" elseif p1 < 21 then "18_to_21" elseif p1 < 25 then "21_to_25" else "over_25"
end

local _ = function(p1, p2: number)
	local CountP12 = #p1
	local Ceiled = math.ceil(p2 / 100 * CountP12)
	
	if Ceiled < 1 then
		Ceiled = 1
	elseif CountP12 < Ceiled then
		Ceiled = CountP12
	end
	return p1[Ceiled]
end

local _ = function(p1, p2: number): number
	local v1 = 10 ^ p2
	
	return math.round(p1 * v1) / v1
end

local _ = function(List, p1, p2)
	if p1 ~= nil then
		table.insert(List, (p2 - p1) * 1000)
	end
end

local HttpService = game:GetService("HttpService")
config.rawFrameTimesMs = {
	reducer = function(p1, PreviousTime)
		local Frames = p1.frames or {}
		local PreviousTime1 = p1.previousTime
		
		if PreviousTime1 ~= nil then
			table.insert(Frames, (PreviousTime - PreviousTime1) * 1000)
		end
		return { frames = Frames, previousTime = PreviousTime }
	end,
	getResult = function(p1)
		-- upvalues: HttpService (copy)
		if p1.frames == nil or #p1.frames < 1 then
			return nil
		end
		local List = {}
		
		for _, frame in p1.frames do
			table.insert(List, math.round(frame * 100) / 100)
		end
		return HttpService:JSONEncode(List)
	end
}

if IntervalPerformanceTrackerScrollPositionSamples then
	config.rawScrollPositionSamplesCsv = {
		reducer = function(p2, p3, p4)
			local TimestampsMs = p2.timestampsMs or {}
			local PositionsY = p2.positionsY or {}
			
			if p2.startTime ~= nil and p4 ~= nil then
				table.insert(TimestampsMs, (p3 - p2.startTime) * 1000)
				table.insert(PositionsY, p4)
			end
			return {
				timestampsMs = TimestampsMs,
				positionsY = PositionsY,
				startTime = p2.startTime or p3
			}
		end,
		getResult = function(p2)
			-- upvalues: HttpService (copy)
			local TimestampsMs = p2.timestampsMs
			local PositionsY = p2.positionsY
			
			if TimestampsMs == nil or PositionsY == nil or #TimestampsMs < 1 then
				return nil
			end
			local Buffer = table.create(#TimestampsMs)
			
			for i, timestampsM in TimestampsMs do
				Buffer[i] = `{math.round(timestampsM * 100) / 100},{math.round(PositionsY[i] * 100) / 100}`
			end
			return HttpService:JSONEncode(table.concat(Buffer, "\n"))
		end
	}
end
config.frameTimeAvgMs = {
	reducer = function(p2, PreviousTime)
		local FramesCount = p2.framesCount or 0
		local SumMs = p2.sumMs or 0
		
		if p2.previousTime ~= nil then
			FramesCount += 1
			SumMs += (PreviousTime - p2.previousTime) * 1000
		end
		return {
			framesCount = FramesCount,
			sumMs = SumMs,
			previousTime = PreviousTime
		}
	end,
	getResult = function(p2)
		return if p2.framesCount == nil or p2.framesCount < 1 then nil else p2.sumMs / p2.framesCount
	end
}
config.frameTimeStdDevMs = {
	reducer = function(p2, PreviousTime)
		local FramesCount = p2.framesCount or 0
		local SumMs = p2.sumMs or 0
		local SumSquaredMs = p2.sumSquaredMs or 0
		
		if p2.previousTime ~= nil then
			local ScaledPreviousTime = (PreviousTime - p2.previousTime) * 1000
			FramesCount += 1
			SumMs += ScaledPreviousTime
			SumSquaredMs += ScaledPreviousTime * ScaledPreviousTime
		end
		return {
			framesCount = FramesCount,
			sumMs = SumMs,
			sumSquaredMs = SumSquaredMs,
			previousTime = PreviousTime
		}
	end,
	getResult = function(p2): number?
		if p2.framesCount == nil or p2.framesCount < 1 then
			return nil
		else
			local SumMsRatio = p2.sumMs / p2.framesCount
			
			return (math.sqrt((math.max(p2.sumSquaredMs / p2.framesCount - SumMsRatio * SumMsRatio, 0))))
		end
	end
}
config.frameTimeDistributionMs = {
	reducer = function(p2, PreviousTime)
		local Frames = p2.frames or {}
		local PreviousTime1 = p2.previousTime
		
		if PreviousTime1 ~= nil then
			table.insert(Frames, (PreviousTime - PreviousTime1) * 1000)
		end
		return { frames = Frames, previousTime = PreviousTime }
	end,
	getResult = function(p2)
		-- upvalues: HttpService (copy)
		if p2.frames == nil or #p2.frames < 1 then
			return nil
		end
		local Copy = table.clone(p2.frames)
		table.sort(Copy)
		local Input = {}
		local CountCopy = #Copy
		local Ceiled = math.ceil(CountCopy * 0.5)
		
		if Ceiled < 1 then
			Ceiled = 1
		elseif CountCopy < Ceiled then
			Ceiled = CountCopy
		end
		Input.p50 = math.round(Copy[Ceiled] * 100) / 100
		local CountCopy1 = #Copy
		local Ceiled1 = math.ceil(CountCopy1 * 0.95)
		
		if Ceiled1 < 1 then
			Ceiled1 = 1
		elseif CountCopy1 < Ceiled1 then
			Ceiled1 = CountCopy1
		end
		Input.p95 = math.round(Copy[Ceiled1] * 100) / 100
		local CountCopy2 = #Copy
		local Ceiled2 = math.ceil(CountCopy2 * 0.99)
		
		if Ceiled2 < 1 then
			Ceiled2 = 1
		elseif CountCopy2 < Ceiled2 then
			Ceiled2 = CountCopy2
		end
		Input.p99 = math.round(Copy[Ceiled2] * 100) / 100
		
		return HttpService:JSONEncode(Input)
	end
}
config.frameBuckets = {
	reducer = function(p2, PreviousTime)
		-- upvalues: FRAMEBUCKETKEYS (copy)
		local Counts = nil
		if p2.counts == nil then
			Counts = {}
			
			for _, fRAMEBUCKETKEY in FRAMEBUCKETKEYS do
				Counts[fRAMEBUCKETKEY] = 0
			end
		else
			Counts = p2.counts
		end
		if p2.previousTime ~= nil then
			local ScaledPreviousTime = (PreviousTime - p2.previousTime) * 1000
			local Under: string = if ScaledPreviousTime < 16 then "under_16" elseif ScaledPreviousTime < 16.666666666666668 then "16_to_16_7" elseif ScaledPreviousTime < 17.5 then "16_7_to_17_5" elseif ScaledPreviousTime < 18 then "17_5_to_18" elseif ScaledPreviousTime < 21 then "18_to_21" elseif ScaledPreviousTime < 25 then "21_to_25" else "over_25"
			Counts[Under] += 1
		end
		return { counts = Counts, previousTime = PreviousTime }
	end,
	getResult = function(p3)
		-- upvalues: HttpService (copy)
		return if p3.counts == nil then nil else HttpService:JSONEncode(p3.counts)
	end
}

for _, value in {
	"rawFrameTimesMs",
	"frameTimeAvgMs",
	"frameTimeStdDevMs",
	"frameTimeDistributionMs",
	"frameBuckets"
} do
	AvailableMetricsEnum[value] = value
end
if IntervalPerformanceTrackerScrollPositionSamples then
	AvailableMetricsEnum.rawScrollPositionSamplesCsv = "rawScrollPositionSamplesCsv"
end
local Module = {}
Module.__index = Module

function Module.new(_timeout, _metricsToTrack, _countersEnabled, _eventStreamEnabled, _extraFields, _scrollFrame)
	-- upvalues: Module (copy)
	local config = {
		_startTime = nil,
		_metricsData = {},
		_timeout = _timeout,
		_metricsToTrack = _metricsToTrack,
		_countersEnabled = _countersEnabled,
		_eventStreamEnabled = _eventStreamEnabled,
		_extraFields = _extraFields,
		_scrollFrame = _scrollFrame
	}
	setmetatable(config, Module)
	
	return config
end

function Module.getMetricsToTrack(p3)
	-- upvalues: List (copy)
	return if p3._metricsToTrack and #p3._metricsToTrack > 0 then p3._metricsToTrack else List
end

function Module:hasReachedTimeout(): boolean
	return self._timeout ~= nil and self._startTime ~= nil and self._timeout < tick() - self._startTime
end

function Module:updateMetrics()
	-- upvalues: IntervalPerformanceTrackerScrollPositionSamples (copy), config (copy)
	if self._startTime == nil then
		self._startTime = tick()
	end
	local CurrentTime = tick()
	local Y = if IntervalPerformanceTrackerScrollPositionSamples and self._scrollFrame then self._scrollFrame.CanvasPosition.Y else nil
	for _, value in self:getMetricsToTrack() do
		local Entry = config[value]
		
		if Entry then
			if not self._metricsData[value] then
				self._metricsData[value] = {}
			end
			self._metricsData[value] = Entry.reducer(self._metricsData[value], CurrentTime, Y)
		end
	end
end

function Module:getResult()
	-- upvalues: config (copy)
	local t = {}
	
	for _, value in self:getMetricsToTrack() do
		local Entry = config[value]
		
		if Entry then
			t[value] = Entry.getResult(self._metricsData[value])
		end
	end
	return t
end

local Module1 = {}
Module1.__index = Module1

function Module1.new()
	-- upvalues: config (copy), AvailableMetricsEnum (copy), Module1 (copy), IntervalPerformanceTrackerCancelOnAppHide (copy), MockableProxyServicesModule (copy)
	local config1 = {
		_renderSteppedConnection = nil,
		_metricsTrackers = config,
		_intervals = {},
		availableMetricsEnum = AvailableMetricsEnum
	}
	setmetatable(config1, Module1)
	
	if IntervalPerformanceTrackerCancelOnAppHide then
		local Success, Result = pcall(function()
			-- upvalues: MockableProxyServicesModule (upval)
			return MockableProxyServicesModule.AppLifecycleObserverService
		end)
		
		if Success and Result then
			Result.OnHide:Connect(function()
				-- upvalues: config1 (copy)
				table.clear(config1._intervals)
				config1:disconnectUnusedRenderStepped()
			end)
		end
	end
	return config1
end

function Module1:_updateIntervals()
	for i, interval in self._intervals do
		interval:updateMetrics()
		
		if interval:hasReachedTimeout() then
			self:stopAndLogTracking(i)
		end
	end
end

function Module1:startTracking(p3, Timeout, MetricsToTrack, CountersEnabled, EventStreamEnabled, ExtraFields, ScrollFrame, p4: number)
	-- upvalues: RandomValue (copy), FIntIntervalPerformanceTrackerEventStream (copy), IsRandomValueBelow (copy), Module (copy), RunService (copy)
	if p4 == nil then
		if not IsRandomValueBelow then return end
	elseif p4 < 1000 and RandomValue >= math.max(p4, FIntIntervalPerformanceTrackerEventStream) then return end
	if not self._intervals[p3] then
		local NewModule = Module.new(Timeout, MetricsToTrack, CountersEnabled, EventStreamEnabled, ExtraFields, ScrollFrame)
		self._intervals[p3] = NewModule
		NewModule:updateMetrics()
	end
	if not self._renderSteppedConnection then
		self._renderSteppedConnection = RunService.RenderStepped:Connect(function()
			-- upvalues: self (copy)
			self:_updateIntervals()
		end)
	end
end

function Module1:_fireStatsTracking(Tbl)
	-- upvalues: NewResult (copy), list (copy), IntervalPerformanceTrackerScrollPositionSamples (copy), AXFixAverageFPSCasing (copy), SendFPSStatModule (copy), AXIntervalPerformanceTrackerScrollFrameCounters (copy), SendScrollFrameCountersModule (copy)
	local AverageFPS = Tbl.averageFPS
	local FramesCount = Tbl.framesCount
	local LongestFrameTime = Tbl.longestFrameTime
	local IntervalName = Tbl.intervalName
	local Interval = self._intervals[IntervalName]
	
	if not Interval then
		NewResult:warning(`Missing interval {IntervalName}`)
		
		return
	end
	local CountersEnabled = Interval._countersEnabled
	local EventStreamEnabled = Interval._eventStreamEnabled
	
	local function _(Text, Text1): string
		return "IntervalPerformanceTracker_" .. Text .. "_" .. Text1
	end
	
	local _ = function()
		-- upvalues: Tbl (copy), list (upval)
		local Copy = table.clone(Tbl)
		
		for _, value in list do
			Copy[value] = nil
		end
		return Copy
	end
	
	if not CountersEnabled and not EventStreamEnabled or not IntervalName then return end
	if AverageFPS then
		local Text = "IntervalPerformanceTracker_" .. "AverageFPS" .. "_" .. IntervalName
		local Copy1 = nil
		
		if IntervalPerformanceTrackerScrollPositionSamples then
			local Copy = table.clone(Tbl)
			
			for _, value in list do
				Copy[value] = nil
			end
			Copy1 = Copy
		else
			Copy1 = table.clone(Tbl)
		end
		Copy1.duration = AverageFPS
		Copy1.averageFps = if AXFixAverageFPSCasing then AverageFPS else nil
		SendFPSStatModule({
			statName = Text,
			eventStreamName = IntervalName,
			metaData = Copy1,
			interval = AverageFPS,
			excludeCounters = not CountersEnabled,
			excludeEventStream = not EventStreamEnabled
		})
	end
	if FramesCount and CountersEnabled then
		local Text = "IntervalPerformanceTracker_" .. "FramesCount" .. "_" .. IntervalName
		local Copy2 = nil
		
		if IntervalPerformanceTrackerScrollPositionSamples then
			local Copy = table.clone(Tbl)
			
			for _, value1 in list do
				Copy[value1] = nil
			end
			Copy2 = Copy
		else
			Copy2 = table.clone(Tbl)
		end
		Copy2.duration = FramesCount
		SendFPSStatModule({
			statName = Text,
			metaData = Copy2,
			interval = FramesCount
		})
	end
	if LongestFrameTime and Interval._countersEnabled then
		local Text = "IntervalPerformanceTracker_" .. "LongestFrameTime" .. "_" .. IntervalName
		local Copy3 = nil
		
		if IntervalPerformanceTrackerScrollPositionSamples then
			local Copy = table.clone(Tbl)
			
			for _, value2 in list do
				Copy[value2] = nil
			end
			Copy3 = Copy
		else
			Copy3 = table.clone(Tbl)
		end
		Copy3.duration = LongestFrameTime
		SendFPSStatModule({
			statName = Text,
			metaData = Copy3,
			interval = LongestFrameTime
		})
	end
	if AXIntervalPerformanceTrackerScrollFrameCounters and CountersEnabled then
		local FrameBuckets = Tbl.frameBuckets
		
		if FrameBuckets then
			SendScrollFrameCountersModule({
				intervalName = IntervalName,
				scrollType = Tbl.scroll_type,
				frameBucketsJson = FrameBuckets
			})
		end
	end
end

function Module1:stopAndLogTracking(IntervalName)
	-- upvalues: IsRandomValueBelow (copy), Default (copy), IntervalPerformanceTrackerTelemetryConfigModule (copy)
	if not IsRandomValueBelow and not self._intervals[IntervalName] then return end
	local Interval = self._intervals[IntervalName]
	
	if Interval then
		local Result = Interval:getResult()
		local config = { intervalName = IntervalName }
		
		if Interval._extraFields then
			for i, extraField in Interval._extraFields do
				config[i] = extraField
			end
		end
		local Count = 0
		
		for i1, value in Result do
			if value ~= nil then
				Count += 1
			end
			config[i1] = value
		end
		if Count > 0 then
			Default:logRobloxTelemetryEvent(IntervalPerformanceTrackerTelemetryConfigModule, nil, config)
			
			if game:GetFastFlag("DebugPrintIntervalPerformanceTrackerResults") then
				print("IntervalPerformanceTracker:" .. tostring(IntervalName) .. " logged with results:")
				
				for i2, value1 in config do
					print("\t" .. tostring(i2) .. " = " .. tostring(value1))
				end
			end
		end
		self:_fireStatsTracking(config)
		self._intervals[IntervalName] = nil
	end
	self:disconnectUnusedRenderStepped()
end

function Module1:cancelTracking(p3)
	-- upvalues: IsRandomValueBelow (copy)
	if IsRandomValueBelow or self._intervals[p3] then
		self._intervals[p3] = nil
		self:disconnectUnusedRenderStepped()
		
		return
	end
end

function Module1:disconnectUnusedRenderStepped()
	if not next(self._intervals) and self._renderSteppedConnection then
		self._renderSteppedConnection:Disconnect()
		self._renderSteppedConnection = nil
	end
end

Module1.class = Module1

return Module1.new()