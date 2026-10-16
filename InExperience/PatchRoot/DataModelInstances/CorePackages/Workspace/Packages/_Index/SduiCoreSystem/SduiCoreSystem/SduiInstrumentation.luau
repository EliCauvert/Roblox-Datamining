local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local DiscoveryAppLaunchTracker = require(SduiCoreSystem.Parent.AppLaunchTracker).DiscoveryAppLaunchTracker
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local IsRandomValueBelow = math.random(10000) <= game:DefineFastInt("DiscoverySduiInstrumentationHundredthsPercent", 0)
local SduiInstrumentationModule = {}
SduiInstrumentationModule.__index = SduiInstrumentationModule

function SduiInstrumentationModule.new(p1, p2) --[[ Line: 43 ]]
	-- upvalues: IsRandomValueBelow (copy), SduiInstrumentationModule (copy)
	local config = {
		startTime = 0,
		openTimerCount = 0,
		isFlushScheduled = false,
		openTimers = {},
		closedTimers = {},
		flushDelay = p1 or 0.1,
		enabled = p2 or IsRandomValueBelow
	}
	setmetatable(config, SduiInstrumentationModule)
	
	return config
end

function SduiInstrumentationModule:startTimerFlow(p1) --[[ Line: 57 ]]
	if not self.enabled then return end
	local ScaledClockTime = 1000 * os.clock()
	
	if self.openTimerCount == 0 then
		self.startTime = ScaledClockTime
	end
	self.openTimerCount += 1
	local OpenTimer = self.openTimers[p1]
	
	if not OpenTimer then
		self.openTimers[p1] = {
			failed = 0,
			count = 1,
			openCount = 1,
			startTime = ScaledClockTime
		}
		
		return
	end
	if OpenTimer.openCount == 0 then
		OpenTimer.startTime = ScaledClockTime
	end
	OpenTimer.count += 1
	OpenTimer.openCount += 1
end

function SduiInstrumentationModule:stopTimerFlow(Name, p1, p2) --[[ Line: 90 ]]
	-- upvalues: SduiErrorsModule (copy), DiscoveryAppLaunchTracker (copy)
	if not self.enabled then return end
	self.openTimerCount -= 1
	local OpenTimer = self.openTimers[Name]
	
	if not OpenTimer then
		p1.dependencies.logger.reportError(SduiErrorsModule.SduiErrorType.NilInstrumentationTimer, {
			message = "Failed to find timer when calling stopTimer",
			name = Name
		}, p1.appPage)
		
		return
	end
	if p2 then
		OpenTimer.failed += 1
	end
	OpenTimer.openCount -= 1
	
	if OpenTimer.openCount == 0 then
		local ScaledClockTime = 1000 * os.clock()
		self:aggregateClosedTimer(Name, OpenTimer.count, OpenTimer.failed, ScaledClockTime - OpenTimer.startTime)
		self.openTimers[Name] = nil
		
		if self.openTimerCount == 0 then
			self:scheduleFlush(p1)
			local ScaledClockTimeDelta = ScaledClockTime - self.startTime
			
			if DiscoveryAppLaunchTracker.isEnabled() and DiscoveryAppLaunchTracker.default then
				DiscoveryAppLaunchTracker.default:trackSduiDuration(ScaledClockTimeDelta)
				
				return
			end
		elseif self.openTimerCount < 1 then
			p1.dependencies.logger.reportError(SduiErrorsModule.SduiErrorType.ImbalancedStartStopTimer, {
				name = Name,
				message = `Negative timer count when stopping timer {self.openTimerCount}`
			}, p1.appPage)
		end
	end
end

function SduiInstrumentationModule:aggregateClosedTimer(Name, Count, Failed, DurationMs) --[[ Line: 137 ]]
	local ClosedTimer = self.closedTimers[Name]
	
	if ClosedTimer then
		ClosedTimer.failed += Failed
		ClosedTimer.count += Count
		ClosedTimer.durationMs += DurationMs
		
		return
	else
		self.closedTimers[Name] = { failed = Failed, count = Count, durationMs = DurationMs }
	end
end

function SduiInstrumentationModule:scheduleFlush(p1) --[[ Line: 158 ]]
	if self.enabled and not self.isFlushScheduled then
		task.delay(self.flushDelay, function() --[[ Line: 160 ]]
			-- upvalues: self (copy), p1 (copy)
			self.isFlushScheduled = false
			self:reportTimers(p1)
		end)
		self.isFlushScheduled = true
	end
end

function SduiInstrumentationModule:reportTimers(p1) --[[ Line: 168 ]]
	if self.enabled then
		p1.dependencies.logger.reportTimers(self.closedTimers, p1.appPage)
		self.closedTimers = {}
	end
end

return SduiInstrumentationModule