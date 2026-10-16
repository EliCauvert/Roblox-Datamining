local _ = require(script.Parent.AppLaunchTrackerTypes)
local RoduxPerfTrackerModule = { __className = "Devtools" }
RoduxPerfTrackerModule.__index = RoduxPerfTrackerModule

local function _() --[[ Line: 43 | Named "createTable" ]]
	return (table.create(100))
end

function RoduxPerfTrackerModule.new(ReportTopAction, ReportTopThunk, StartImmediately) --[[ Line: 48 ]]
	-- upvalues: RoduxPerfTrackerModule (copy)
	return (setmetatable({
		shouldTrack = false,
		flushCount = 0,
		totalFlushTimeMs = 0,
		reduceCount = 0,
		totalReduceTimeMs = 0,
		maxListenerCount = 0,
		totalThunkTimeMs = 0,
		thunkCount = 0,
		reportTopAction = ReportTopAction,
		reportTopThunk = ReportTopThunk,
		startImmediately = StartImmediately,
		actionCounts = if ReportTopAction then table.create(100) else nil,
		actionTotalTimes = if ReportTopAction then table.create(100) else nil,
		thunkCounts = if ReportTopThunk then table.create(100) else nil,
		thunkTotalTimes = if ReportTopThunk then table.create(100) else nil
	}, RoduxPerfTrackerModule))
end

function RoduxPerfTrackerModule:_hookIntoStore(Store) --[[ Line: 80 ]]
	self.store = Store
	self.originalReducer = Store._reducer
	self.originalFlushHandler = Store._flushHandler
	
	if self.startImmediately then
		self:startTracking()
	end
end

function RoduxPerfTrackerModule:trackingReducer(p1, p2) --[[ Line: 90 ]]
	assert(self.originalReducer, "self.originalReducer must exist")
	local OriginalReducerResult = self.originalReducer(p1, p2)
	local ScaledClockTime = (os.clock() - os.clock()) * 1000
	self.totalReduceTimeMs += ScaledClockTime
	self.reduceCount += 1
	
	if self.reportTopAction and self.actionCounts and self.actionTotalTimes then
		local Type = p2.type or tostring(p2)
		
		if Type then
			self.actionCounts[Type] = (self.actionCounts[Type] or 0) + 1
			self.actionTotalTimes[Type] = (self.actionTotalTimes[Type] or 0) + ScaledClockTime
		end
	end
	return OriginalReducerResult
end

function RoduxPerfTrackerModule:trackingFlush(...) --[[ Line: 115 ]]
	local ClockTime = os.clock()
	self.originalFlushHandler(...)
	self.totalFlushTimeMs += (os.clock() - ClockTime) * 1000
	self.flushCount += 1
	local CountListeners = #self.store.changed._listeners
	
	if self.maxListenerCount < CountListeners then
		self.maxListenerCount = CountListeners
	end
end

function RoduxPerfTrackerModule:startTracking() --[[ Line: 130 ]]
	function self.store._flushHandler(...) --[[ Line: 131 ]]
		-- upvalues: self (copy)
		return self:trackingFlush(...)
	end
	
	function self.store._reducer(...) --[[ Line: 134 ]]
		-- upvalues: self (copy)
		return self:trackingReducer(...)
	end
	
	self.shouldTrack = true
end

function RoduxPerfTrackerModule:stopTracking() --[[ Line: 140 ]]
	if self.shouldTrack then
		self.shouldTrack = false
		self.store._flushHandler = self.originalFlushHandler
		self.store._reducer = self.originalReducer
	end
end

function RoduxPerfTrackerModule:clear() --[[ Line: 148 ]]
	self.flushCount = 0
	self.totalFlushTimeMs = 0
	self.reduceCount = 0
	self.totalReduceTimeMs = 0
	self.maxListenerCount = 0
	self.totalThunkTimeMs = 0
	self.thunkCount = 0
	
	if self.reportTopAction then
		self.actionCounts = table.create(100)
		self.actionTotalTimes = table.create(100)
	end
	if self.reportTopThunk then
		self.thunkCounts = table.create(100)
		self.thunkTotalTimes = table.create(100)
	end
end

local function getRelevantLineFromTrace(Text: string): string? --[[ Line: 167 ]]
	local Parts = string.split(Text, "\n")
	local Text1 = nil
	
	for i = 3, #Parts do
		Text1 = Parts[i]
		
		if not string.find(Text1, "AppLaunchTracker") and not string.find(Text1, "_Index.Rodux") and not string.find(Text1, "_Index.RoactRodux") and not string.find(Text1, "_Index.Promise") and not string.find(Text1, ".RoactRodux") then
			return Text1
		end
	end
	return nil
end

local _ = function(p1) --[[ Line: 184 | Named "getThunkName" ]]
	-- upvalues: getRelevantLineFromTrace (copy)
	local RelevantLineFromTrace = getRelevantLineFromTrace(debug.traceback())
	
	return if RelevantLineFromTrace then RelevantLineFromTrace else debug.info(p1, "slf")
end

function RoduxPerfTrackerModule.makeThunkMiddleware(p1, p2) --[[ Line: 192 ]]
	-- upvalues: getRelevantLineFromTrace (copy)
	local function tracebackReporter(Err) --[[ Line: 193 ]]
		return debug.traceback(Err)
	end
	
	return function(Callback, p3) --[[ Line: 196 | Named "thunkMiddleware" ]]
		-- upvalues: p1 (copy), p2 (copy), getRelevantLineFromTrace (upval), tracebackReporter (copy)
		return function(Callback1) --[[ Line: 197 ]]
			-- upvalues: p1 (upval), p3 (copy), p2 (upval), getRelevantLineFromTrace (upval), tracebackReporter (upval), Callback (copy)
			if typeof(Callback1) ~= "function" then
				return Callback(Callback1)
			end
			local Success, Result = xpcall(function() --[[ Line: 199 ]]
				-- upvalues: p1 (upval), Callback1 (copy), p3 (upval), p2 (upval), getRelevantLineFromTrace (upval)
				if not p1.shouldTrack then
					return Callback1(p3, p2)
				end
				local CallbackResult = Callback1(p3, p2)
				local ScaledClockTime = (os.clock() - os.clock()) * 1000
				p1.totalThunkTimeMs += ScaledClockTime
				p1.thunkCount += 1
				
				if p1.reportTopThunk and p1.thunkCounts and p1.thunkTotalTimes then
					local RelevantLineFromTrace = getRelevantLineFromTrace(debug.traceback())
					local RelevantLineFromTrace1 = if RelevantLineFromTrace then RelevantLineFromTrace else debug.info(Callback1, "slf")
					p1.thunkCounts[RelevantLineFromTrace1] = (p1.thunkCounts[RelevantLineFromTrace1] or 0) + 1
					p1.thunkTotalTimes[RelevantLineFromTrace1] = (p1.thunkTotalTimes[RelevantLineFromTrace1] or 0) + ScaledClockTime
				end
				return CallbackResult
			end, tracebackReporter)
			
			if Success then
				return Result
			else
				p3._errorReporter.reportReducerError(p3:getState(), Callback1, { message = "Caught error in thunk", thrownValue = Result })
				
				return nil
			end
		end
	end
end

local _ = function(List) --[[ Line: 243 | Named "getTopValue" ]]
	local v1 = nil
	local v2 = nil
	
	for i, value in List do
		if (v1 or -1) < value then
			v1 = value
			v2 = i
		end
	end
	return v2, v1
end

local _ = function(Text: string) --[[ Line: 255 | Named "fixThunkName" ]]
	return Text:gsub("CoreGui.RobloxGui.Modules.", ""):gsub("CorePackages.Workspace.Packages._Workspace.", "")
end

function RoduxPerfTrackerModule:getStats() --[[ Line: 259 ]]
	local TopActionName = nil
	local TopActionDurationMs = nil
	local ActionCount = nil
	local Text = nil
	local TopThunkDurationMs = nil
	local ThunkCount = nil
	
	if self.reportTopAction and self.actionCounts and self.actionTotalTimes then
		local v3 = nil
		local v4 = nil
		
		for i, actionTotalTime in self.actionTotalTimes do
			if (v3 or -1) < actionTotalTime then
				v3 = actionTotalTime
				v4 = i
			end
		end
		TopActionName = v4
		TopActionDurationMs = v3
		
		if TopActionName then
			ActionCount = self.actionCounts[TopActionName]
		end
	end
	if self.reportTopThunk and self.thunkCounts and self.thunkTotalTimes then
		local v5 = nil
		local v6 = nil
		
		for i1, thunkTotalTime in self.thunkTotalTimes do
			if (v5 or -1) < thunkTotalTime then
				v5 = thunkTotalTime
				v6 = i1
			end
		end
		Text = v6
		TopThunkDurationMs = v5
		
		if Text then
			ThunkCount = self.thunkCounts[Text]
			Text = Text:gsub("CoreGui.RobloxGui.Modules.", ""):gsub("CorePackages.Workspace.Packages._Workspace.", "")
		end
	end
	return {
		flushCount = self.flushCount,
		totalFlushTimeMs = self.totalFlushTimeMs,
		reduceCount = self.reduceCount,
		totalReduceTimeMs = self.totalReduceTimeMs,
		maxListenerCount = self.maxListenerCount,
		totalThunkTimeMs = self.totalThunkTimeMs,
		thunkCount = self.thunkCount,
		topActionName = TopActionName,
		topActionDurationMs = TopActionDurationMs,
		topActionCount = ActionCount,
		topThunkName = Text,
		topThunkDurationMs = TopThunkDurationMs,
		topThunkCount = ThunkCount
	}
end

return RoduxPerfTrackerModule