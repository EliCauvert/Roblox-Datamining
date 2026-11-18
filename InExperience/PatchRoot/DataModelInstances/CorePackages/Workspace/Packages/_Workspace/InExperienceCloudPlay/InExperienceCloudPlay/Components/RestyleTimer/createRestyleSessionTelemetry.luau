local InExperienceCloudPlay = script:FindFirstAncestor("InExperienceCloudPlay")
local CloudPlayTelemetryModule = require(InExperienceCloudPlay.CloudPlayTelemetry)
local GetCloudClientServiceModule = require(InExperienceCloudPlay.getCloudClientService)

local function _()
	-- upvalues: GetCloudClientServiceModule (copy)
	local CloudClientServiceModule = GetCloudClientServiceModule()
	
	return if CloudClientServiceModule and CloudClientServiceModule.SessionTimeLimit > 0 then CloudClientServiceModule.SessionTimeLimit - CloudClientServiceModule:GetSessionElapsedTime() else nil
end

local _ = function(): boolean
	-- upvalues: GetCloudClientServiceModule (copy)
	local CloudClientServiceModule = GetCloudClientServiceModule()
	local SessionTimeLimitDelta = if CloudClientServiceModule and CloudClientServiceModule.SessionTimeLimit > 0 then CloudClientServiceModule.SessionTimeLimit - CloudClientServiceModule:GetSessionElapsedTime() else nil
	
	return SessionTimeLimitDelta ~= nil and SessionTimeLimitDelta <= 0
end

return function()
	-- upvalues: CloudPlayTelemetryModule (copy), GetCloudClientServiceModule (copy)
	local Count = 0
	local Flag = false
	local Flag1 = false
	local ToggleCount = 0
	local PopoverOpenCount = 0
	local ClockTime = nil
	local Enabled = nil
	local ClockTime1 = nil
	local NewClockTime = 0
	local DelayedThread = nil
	
	local function sendSummary(EndReason)
		-- upvalues: Flag1 (ref), Flag (ref), CloudPlayTelemetryModule (upval), Enabled (ref), NewClockTime (ref), ClockTime1 (ref), ToggleCount (ref), PopoverOpenCount (ref)
		if not Flag1 and Flag then
			Flag1 = true
			CloudPlayTelemetryModule.logRestyleSessionSummary({
				endReason = EndReason,
				filterEnabledAtEnd = Enabled == true,
				secondsWithFilterOff = NewClockTime + (if ClockTime1 then os.clock() - ClockTime1 else 0),
				toggleCount = ToggleCount,
				popoverOpenCount = PopoverOpenCount
			})
			
			return
		end
	end
	
	local t = {}
	
	local function scheduleExpiry()
		-- upvalues: DelayedThread (ref), GetCloudClientServiceModule (upval), Flag1 (ref), t (copy), scheduleExpiry (copy)
		if DelayedThread then
			task.cancel(DelayedThread)
			DelayedThread = nil
		end
		local CloudClientServiceModule = GetCloudClientServiceModule()
		local SessionTimeLimitDelta = if CloudClientServiceModule and CloudClientServiceModule.SessionTimeLimit > 0 then CloudClientServiceModule.SessionTimeLimit - CloudClientServiceModule:GetSessionElapsedTime() else nil
		
		if SessionTimeLimitDelta and not Flag1 then
			DelayedThread = task.delay(math.max(0, SessionTimeLimitDelta), function()
				-- upvalues: DelayedThread (upval), GetCloudClientServiceModule (upval), t (upval), scheduleExpiry (upval)
				DelayedThread = nil
				local CloudClientServiceModule = GetCloudClientServiceModule()
				local SessionTimeLimitDelta = if CloudClientServiceModule and CloudClientServiceModule.SessionTimeLimit > 0 then CloudClientServiceModule.SessionTimeLimit - CloudClientServiceModule:GetSessionElapsedTime() else nil
				
				if SessionTimeLimitDelta ~= nil and SessionTimeLimitDelta <= 0 then
					t.timerExpired()
					
					return
				else
					scheduleExpiry()
				end
			end)
			
			return
		end
	end
	
	function t.mount()
		-- upvalues: Count (ref), t (copy), sendSummary (copy), GetCloudClientServiceModule (upval)
		Count += 1
		
		return function()
			-- upvalues: Count (upval), t (upval), sendSummary (upval), GetCloudClientServiceModule (upval)
			Count -= 1
			t.popoverClosed("hidden")
			task.defer(function()
				-- upvalues: Count (upval), sendSummary (upval), GetCloudClientServiceModule (upval)
				if Count == 0 then
					local CloudClientServiceModule = GetCloudClientServiceModule()
					local SessionTimeLimitDelta = if CloudClientServiceModule and CloudClientServiceModule.SessionTimeLimit > 0 then CloudClientServiceModule.SessionTimeLimit - CloudClientServiceModule:GetSessionElapsedTime() else nil
					local IsSessionTimeLimitDeltaBelow: boolean = SessionTimeLimitDelta ~= nil and SessionTimeLimitDelta <= 0
					sendSummary(if IsSessionTimeLimitDeltaBelow then "timer_expired" else "left_early")
				end
			end)
		end
	end
	
	function t.chipShown()
		-- upvalues: Flag (ref), CloudPlayTelemetryModule (upval), GetCloudClientServiceModule (upval), scheduleExpiry (copy)
		if Flag then return end
		Flag = true
		CloudPlayTelemetryModule.logRestyleChipShown()
		local CloudClientServiceModule = GetCloudClientServiceModule()
		
		if CloudClientServiceModule then
			CloudClientServiceModule:GetPropertyChangedSignal("SessionTimeLimit"):Connect(scheduleExpiry)
		end
		scheduleExpiry()
	end
	
	function t.popoverOpened()
		-- upvalues: ClockTime (ref), PopoverOpenCount (ref), CloudPlayTelemetryModule (upval)
		if not ClockTime then
			ClockTime = os.clock()
			PopoverOpenCount += 1
			CloudPlayTelemetryModule.logRestylePopoverOpened()
			
			return
		end
	end
	
	function t.popoverClosed(p1)
		-- upvalues: ClockTime (ref), CloudPlayTelemetryModule (upval)
		local ClockTime1 = ClockTime
		
		if ClockTime1 then
			ClockTime = nil
			CloudPlayTelemetryModule.logRestylePopoverClosed(p1, (os.clock() - ClockTime1) * 1000)
			
			return
		end
	end
	
	function t.toggled(p1)
		-- upvalues: ToggleCount (ref), CloudPlayTelemetryModule (upval)
		ToggleCount += 1
		CloudPlayTelemetryModule.logRestyleToggled(p1, ToggleCount)
	end
	
	function t.filterChanged(p1)
		-- upvalues: Enabled (ref), ClockTime1 (ref), NewClockTime (ref)
		if Enabled == p1 then return end
		Enabled = p1
		
		if not p1 then
			ClockTime1 = os.clock()
		elseif ClockTime1 then
			NewClockTime += os.clock() - ClockTime1
			ClockTime1 = nil
			
			return
		end
	end
	
	function t.timerExpired()
		-- upvalues: sendSummary (copy)
		sendSummary("timer_expired")
	end
	
	return t
end