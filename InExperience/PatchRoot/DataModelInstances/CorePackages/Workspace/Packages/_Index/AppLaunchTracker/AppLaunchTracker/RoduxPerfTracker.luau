local _ = require(script.Parent.AppLaunchTrackerTypes)
local t = { __className = "Devtools" }
t.__index = t

local function _()
	return table.create(100)
end

function t.new(p0, p1, p2)
	-- upvalues: t (ref)
	return setmetatable({
		shouldTrack = false,
		flushCount = 0,
		totalFlushTimeMs = 0,
		reduceCount = 0,
		totalReduceTimeMs = 0,
		maxListenerCount = 0,
		totalThunkTimeMs = 0,
		thunkCount = 0,
		reportTopAction = p0,
		reportTopThunk = p1,
		startImmediately = p2,
		actionCounts = if p0 then table.create(100) else nil,
		actionTotalTimes = if p0 then table.create(100) else nil,
		thunkCounts = if p1 then table.create(100) else nil,
		thunkTotalTimes = if p1 then table.create(100) else nil
	}, t)
end

function t:_hookIntoStore(p3)
	self.store = p3
	self.originalReducer = p3._reducer
	self.originalFlushHandler = p3._flushHandler
	
	if self.startImmediately then
		self:startTracking()
	end
end

function t:trackingReducer(p4, p5)
	assert(self.originalReducer, "self.originalReducer must exist")
	local var2 = self.originalReducer(p4, p5)
	local var3 = (os.clock() - os.clock()) * 1000
	self.totalReduceTimeMs += var3
	self.reduceCount += 1
	
	if self.reportTopAction and self.actionCounts and self.actionTotalTimes then
		local type = p5.type or tostring(p5)
		
		if type then
			self.actionCounts[type] = (self.actionCounts[type] or 0) + 1
			self.actionTotalTimes[type] = (self.actionTotalTimes[type] or 0) + var3
		end
	end
	return var2
end

function t:trackingFlush(...)
	local processTime = os.clock()
	self.originalFlushHandler(...)
	self.totalFlushTimeMs += (os.clock() - processTime) * 1000
	self.flushCount += 1
	local listenersCount = #self.store.changed._listeners
	
	if self.maxListenerCount < listenersCount then
		self.maxListenerCount = listenersCount
	end
end

function t:startTracking()
	function self.store._flushHandler(...)
		-- upvalues: self (ref)
		return self:trackingFlush(...)
	end
	
	function self.store._reducer(...)
		-- upvalues: self (ref)
		return self:trackingReducer(...)
	end
	
	self.shouldTrack = true
end

function t:stopTracking()
	if self.shouldTrack then
		self.shouldTrack = false
		self.store._flushHandler = self.originalFlushHandler
		self.store._reducer = self.originalReducer
	end
end

function t:clear()
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

local function getRelevantLineFromTrace(p6)
	local parts = string.split(p6, "\n")
	
	for i = 3, #parts do
		local var8 = parts[i]
		
		if string.find(var8, "AppLaunchTracker") or string.find(var8, "_Index.Rodux") or (string.find(var8, "_Index.RoactRodux") or string.find(var8, "_Index.Promise")) or string.find(var8, ".RoactRodux") then
			continue
		end
		return var8
	end
	return nil
end

local _ = function(p7)
	-- upvalues: getRelevantLineFromTrace (ref)
	local var9 = getRelevantLineFromTrace(debug.traceback())
	
	return var9 or debug.info(p7, "slf")
end

function t.makeThunkMiddleware(p8, p9)
	-- upvalues: getRelevantLineFromTrace (ref)
	local function tracebackReporter(p10)
		return debug.traceback(p10)
	end
	
	return function(p11, p12)
		-- upvalues: p8 (ref), p9 (ref), getRelevantLineFromTrace (copy), tracebackReporter (ref)
		return function(p13)
			-- upvalues: p8 (copy), p12 (ref), p9 (copy), getRelevantLineFromTrace (copy), tracebackReporter (copy), p11 (ref)
			if typeof(p13) ~= "function" then
				return p11(p13)
			end
			local ok, status = xpcall(function()
				-- upvalues: p8 (copy), p13 (ref), p12 (copy), p9 (copy), getRelevantLineFromTrace (copy)
				if not p8.shouldTrack then
					return p13(p12, p9)
				end
				local var11 = p13(p12, p9)
				local var12 = (os.clock() - os.clock()) * 1000
				p8.totalThunkTimeMs += var12
				p8.thunkCount += 1
				
				if p8.reportTopThunk and p8.thunkCounts and p8.thunkTotalTimes then
					local var13 = getRelevantLineFromTrace(debug.traceback())
					local var14 = var13 or debug.info(p13, "slf")
					p8.thunkCounts[var14] = (p8.thunkCounts[var14] or 0) + 1
					p8.thunkTotalTimes[var14] = (p8.thunkTotalTimes[var14] or 0) + var12
				end
				return var11
			end, tracebackReporter)
			
			if ok then
				return status
			end
			p12._errorReporter.reportReducerError(p12:getState(), p13, { message = "Caught error in thunk", thrownValue = status })
			
			return nil
		end
	end
end

local _ = function(p14)
	local var15 = nil
	local var16 = nil
	
	for i, v in p14 do
		if (var15 or -1) < v then
			var15 = v
			var16 = i
		end
	end
	return var16, var15
end

local _ = function(p15)
	return p15:gsub("CoreGui.RobloxGui.Modules.", ""):gsub("CorePackages.Workspace.Packages._Workspace.", "")
end

function t:getStats()
	local var17 = nil
	local var18 = nil
	local var19 = nil
	local var20 = nil
	local var21 = nil
	local var22 = nil
	
	if self.reportTopAction and self.actionCounts and self.actionTotalTimes then
		local actionTotalTimes = self.actionTotalTimes
		local var23 = nil
		local var24 = nil
		
		for i, v in actionTotalTimes do
			if (var23 or -1) < v then
				var23 = v
				var24 = i
			end
		end
		var17 = var24
		var18 = var23
		
		if var17 then
			var19 = self.actionCounts[var17]
		end
	end
	if self.reportTopThunk and self.thunkCounts and self.thunkTotalTimes then
		local thunkTotalTimes = self.thunkTotalTimes
		local var25 = nil
		local var26 = nil
		
		for i, v in thunkTotalTimes do
			if (var25 or -1) < v then
				var25 = v
				var26 = i
			end
		end
		var20 = var26
		var21 = var25
		
		if var20 then
			var22 = self.thunkCounts[var20]
			var20 = var20:gsub("CoreGui.RobloxGui.Modules.", ""):gsub("CorePackages.Workspace.Packages._Workspace.", "")
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
		topActionName = var17,
		topActionDurationMs = var18,
		topActionCount = var19,
		topThunkName = var20,
		topThunkDurationMs = var21,
		topThunkCount = var22
	}
end

return t