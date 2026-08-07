local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local discoveryAppLaunchTracker = require(sduiCoreSystem.Parent.AppLaunchTracker).DiscoveryAppLaunchTracker
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local var2 = math.random(10000) <= game:DefineFastInt("DiscoverySduiInstrumentationHundredthsPercent", 0)
local t = {}
t.__index = t

function t.new(p0, p1) --[[ line: 43 ]]
	-- upvalues: var2 (ref), t (ref)
	local t_1 = {
		startTime = 0,
		openTimerCount = 0,
		isFlushScheduled = false,
		openTimers = {},
		closedTimers = {},
		flushDelay = p0 or 0.1,
		enabled = p1 or var2
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:startTimerFlow(p2) --[[ line: 57 ]]
	if not self.enabled then return end
	local var5 = 1000 * os.clock()
	
	if self.openTimerCount == 0 then
		self.startTime = var5
	end
	self.openTimerCount += 1
	local var6 = self.openTimers[p2]
	
	if not var6 then
		self.openTimers[p2] = { failed = 0, count = 1, openCount = 1, startTime = var5 }
		
		return
	elseif var6.openCount == 0 then
		var6.startTime = var5
	end
	var6.count += 1
	var6.openCount += 1
end

function t:stopTimerFlow(p3, p4, p5) --[[ line: 90 ]]
	-- upvalues: sduiErrorsModule (ref), discoveryAppLaunchTracker (ref)
	if not self.enabled then return end
	self.openTimerCount -= 1
	local var7 = self.openTimers[p3]
	
	if not var7 then
		p4.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.NilInstrumentationTimer, {
			message = "Failed to find timer when calling stopTimer",
			name = p3
		}, p4.appPage)
		
		return
	elseif p5 then
		var7.failed += 1
	end
	var7.openCount -= 1
	
	if var7.openCount == 0 then
		local var8 = 1000 * os.clock()
		self:aggregateClosedTimer(p3, var7.count, var7.failed, var8 - var7.startTime)
		self.openTimers[p3] = nil
		
		if self.openTimerCount == 0 then
			self:scheduleFlush(p4)
			local var9 = var8 - self.startTime
			
			if discoveryAppLaunchTracker.isEnabled() and discoveryAppLaunchTracker.default then
				discoveryAppLaunchTracker.default:trackSduiDuration(var9)
				
				return
			end
		elseif self.openTimerCount < 1 then
			p4.dependencies.logger.reportError(sduiErrorsModule.SduiErrorType.ImbalancedStartStopTimer, {
				name = p3,
				message = `Negative timer count when stopping timer {self.openTimerCount}`
			}, p4.appPage)
		end
	end
end

function t:aggregateClosedTimer(p6, p7, p8, p9) --[[ line: 137 ]]
	local var10 = self.closedTimers[p6]
	
	if var10 then
		var10.failed += p8
		var10.count += p7
		var10.durationMs += p9
		
		return
	end
	self.closedTimers[p6] = { failed = p8, count = p7, durationMs = p9 }
end

function t:scheduleFlush(p10) --[[ line: 158 ]]
	if self.enabled and not self.isFlushScheduled then
		task.delay(self.flushDelay, function() --[[ line: 160 ]]
			-- upvalues: self (ref), p10 (ref)
			self.isFlushScheduled = false
			self:reportTimers(p10)
		end)
		self.isFlushScheduled = true
	end
end

function t:reportTimers(p11) --[[ line: 168 ]]
	if self.enabled then
		p11.dependencies.logger.reportTimers(self.closedTimers, p11.appPage)
		self.closedTimers = {}
	end
end

return t