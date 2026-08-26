local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local discoveryAppLaunchTracker = require(sduiCoreSystem.Parent.AppLaunchTracker).DiscoveryAppLaunchTracker
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local var1 = math.random(10000) <= game:DefineFastInt("DiscoverySduiInstrumentationHundredthsPercent", 0)
local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: var1 (ref), t (ref)
	local t_1 = {
		startTime = 0,
		openTimerCount = 0,
		isFlushScheduled = false,
		openTimers = {},
		closedTimers = {},
		flushDelay = p1 or 0.1,
		enabled = p2 or var1
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:startTimerFlow(p1)
	if not self.enabled then return end
	local var2 = 1000 * os.clock()
	
	if self.openTimerCount == 0 then
		self.startTime = var2
	end
	self.openTimerCount += 1
	local var3 = self.openTimers[p1]
	
	if not var3 then
		self.openTimers[p1] = { failed = 0, count = 1, openCount = 1, startTime = var2 }
		
		return
	elseif var3.openCount == 0 then
		var3.startTime = var2
	end
	var3.count += 1
	var3.openCount += 1
end

function t:stopTimerFlow(p1, p2, p3)
	-- upvalues: sduiErrorsModule (ref), discoveryAppLaunchTracker (ref)
	if not self.enabled then return end
	self.openTimerCount -= 1
	local var2 = self.openTimers[p1]
	
	if not var2 then
		p2.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.NilInstrumentationTimer, {
			message = "Failed to find timer when calling stopTimer",
			name = p1
		}, p2.appPage)
		
		return
	elseif p3 then
		var2.failed += 1
	end
	var2.openCount -= 1
	
	if var2.openCount == 0 then
		local var3 = 1000 * os.clock()
		self:aggregateClosedTimer(p1, var2.count, var2.failed, var3 - var2.startTime)
		self.openTimers[p1] = nil
		
		if self.openTimerCount == 0 then
			self:scheduleFlush(p2)
			local var4 = var3 - self.startTime
			
			if discoveryAppLaunchTracker.isEnabled() and discoveryAppLaunchTracker.default then
				discoveryAppLaunchTracker.default:trackSduiDuration(var4)
				
				return
			end
		elseif self.openTimerCount < 1 then
			p2.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.ImbalancedStartStopTimer, {
				name = p1,
				message = `Negative timer count when stopping timer {self.openTimerCount}`
			}, p2.appPage)
		end
	end
end

function t:aggregateClosedTimer(p1, p2, p3, p4)
	local var2 = self.closedTimers[p1]
	
	if var2 then
		var2.failed += p3
		var2.count += p2
		var2.durationMs += p4
		
		return
	end
	self.closedTimers[p1] = { failed = p3, count = p2, durationMs = p4 }
end

function t:scheduleFlush(p1)
	if self.enabled and not self.isFlushScheduled then
		task.delay(self.flushDelay, function()
			-- upvalues: self (ref), p1 (ref)
			self.isFlushScheduled = false
			self:reportTimers(p1)
		end)
		self.isFlushScheduled = true
	end
end

function t:reportTimers(p1)
	if self.enabled then
		p1.dependencies.logger.reportTimers(self.closedTimers, p1.appPage)
		self.closedTimers = {}
	end
end

return t