local _ = require(script.Parent.AppLaunchTrackerTypes)
local t = { __className = "Devtools" }
t.__index = t

local function _()
	return table.create(100)
end

function t.new(p1, p2, p3)
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
		reportTopAction = p1,
		reportTopThunk = p2,
		startImmediately = p3,
		actionCounts = if p1 then table.create(100) else nil,
		actionTotalTimes = if p1 then table.create(100) else nil,
		thunkCounts = if p2 then table.create(100) else nil,
		thunkTotalTimes = if p2 then table.create(100) else nil
	}, t)
end

function t:_hookIntoStore(p1)
	self.store = p1
	self.originalReducer = p1._reducer
	self.originalFlushHandler = p1._flushHandler
	
	if self.startImmediately then
		self:startTracking()
	end
end

function t:trackingReducer(p1, p2)
	assert(self.originalReducer, "self.originalReducer must exist")
	local var1 = self.originalReducer(p1, p2)
	local var2 = (os.clock() - os.clock()) * 1000
	self.totalReduceTimeMs += var2
	self.reduceCount += 1
	
	if self.reportTopAction and self.actionCounts and self.actionTotalTimes then
		local type = p2.type or tostring(p2)
		
		if type then
			self.actionCounts[type] = (self.actionCounts[type] or 0) + 1
			self.actionTotalTimes[type] = (self.actionTotalTimes[type] or 0) + var2
		end
	end
	return var1
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

local function getRelevantLineFromTrace(p1)
	local parts = string.split(p1, "\n")
	
	for i = 3, #parts do
		local var1 = parts[i]
		
		if string.find(var1, "AppLaunchTracker") or string.find(var1, "_Index.Rodux") or (string.find(var1, "_Index.RoactRodux") or string.find(var1, "_Index.Promise")) or string.find(var1, ".RoactRodux") then
			continue
		end
		return var1
	end
	return nil
end

local _ = function(p2)
	-- upvalues: getRelevantLineFromTrace (ref)
	local var2 = getRelevantLineFromTrace(debug.traceback())
	
	return var2 or debug.info(p2, "slf")
end

function t.makeThunkMiddleware(p2, p3)
	-- upvalues: getRelevantLineFromTrace (ref)
	local function tracebackReporter(p4)
		return debug.traceback(p4)
	end
	
	return function(p4, p5)
		-- upvalues: p2 (ref), p3 (ref), getRelevantLineFromTrace (copy), tracebackReporter (ref)
		return function(p6)
			-- upvalues: p2 (copy), p5 (ref), p3 (copy), getRelevantLineFromTrace (copy), tracebackReporter (copy), p4 (ref)
			if typeof(p6) ~= "function" then
				return p4(p6)
			end
			local ok, status = xpcall(function()
				-- upvalues: p2 (copy), p6 (ref), p5 (copy), p3 (copy), getRelevantLineFromTrace (copy)
				if not p2.shouldTrack then
					return p6(p5, p3)
				end
				local var2 = p6(p5, p3)
				local var3 = (os.clock() - os.clock()) * 1000
				p2.totalThunkTimeMs += var3
				p2.thunkCount += 1
				
				if p2.reportTopThunk and p2.thunkCounts and p2.thunkTotalTimes then
					local var4 = getRelevantLineFromTrace(debug.traceback())
					local var5 = var4 or debug.info(p6, "slf")
					p2.thunkCounts[var5] = (p2.thunkCounts[var5] or 0) + 1
					p2.thunkTotalTimes[var5] = (p2.thunkTotalTimes[var5] or 0) + var3
				end
				return var2
			end, tracebackReporter)
			
			if ok then
				return status
			end
			p5._errorReporter.reportReducerError(p5:getState(), p6, { message = "Caught error in thunk", thrownValue = status })
			
			return nil
		end
	end
end

local _ = function(p2)
	local var2 = nil
	local var3 = nil
	
	for i, v in p2 do
		if (var2 or -1) < v then
			var2 = v
			var3 = i
		end
	end
	return var3, var2
end

local _ = function(p3)
	return p3:gsub("CoreGui.RobloxGui.Modules.", ""):gsub("CorePackages.Workspace.Packages._Workspace.", "")
end

function t:getStats()
	local var4 = nil
	local var5 = nil
	local var6 = nil
	local var7 = nil
	local var8 = nil
	local var9 = nil
	
	if self.reportTopAction and self.actionCounts and self.actionTotalTimes then
		local actionTotalTimes = self.actionTotalTimes
		local var10 = nil
		local var11 = nil
		
		for i, v in actionTotalTimes do
			if (var10 or -1) < v then
				var10 = v
				var11 = i
			end
		end
		var4 = var11
		var5 = var10
		
		if var4 then
			var6 = self.actionCounts[var4]
		end
	end
	if self.reportTopThunk and self.thunkCounts and self.thunkTotalTimes then
		local thunkTotalTimes = self.thunkTotalTimes
		local var12 = nil
		local var13 = nil
		
		for i, v in thunkTotalTimes do
			if (var12 or -1) < v then
				var12 = v
				var13 = i
			end
		end
		var7 = var13
		var8 = var12
		
		if var7 then
			var9 = self.thunkCounts[var7]
			var7 = var7:gsub("CoreGui.RobloxGui.Modules.", ""):gsub("CorePackages.Workspace.Packages._Workspace.", "")
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
		topActionName = var4,
		topActionDurationMs = var5,
		topActionCount = var6,
		topThunkName = var7,
		topThunkDurationMs = var8,
		topThunkCount = var9
	}
end

return t