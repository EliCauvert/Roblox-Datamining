local LoggerModule = require(script.Parent.Parent.Logger)

local function _(p1, p2)
	return (p1.UnixTimestampMillis - p2.UnixTimestampMillis) / 1000
end

return function(p1)
	-- upvalues: LoggerModule (copy)
	local UnixTimestampMillisRatio = nil
	local ClockTime = nil
	local v1 = nil
	local DelayedThread = nil
	local TimeoutThreshold = p1 and p1.timeoutThreshold or nil
	local OnReachingThreshold = p1 and p1.onReachingThreshold or nil
	
	local function _()
		-- upvalues: UnixTimestampMillisRatio (ref), ClockTime (ref)
		return if UnixTimestampMillisRatio and ClockTime then ClockTime - UnixTimestampMillisRatio else -1
	end
	
	local _ = function()
		-- upvalues: DelayedThread (ref)
		if DelayedThread then
			task.cancel(DelayedThread)
		end
	end
	
	local _ = function()
		-- upvalues: TimeoutThreshold (copy), OnReachingThreshold (copy), DelayedThread (ref)
		if TimeoutThreshold and OnReachingThreshold then
			DelayedThread = task.delay(TimeoutThreshold, function()
				-- upvalues: DelayedThread (upval), OnReachingThreshold (copy)
				DelayedThread = nil
				OnReachingThreshold()
			end)
			
			return
		end
	end
	
	return {
		start = function(p2)
			-- upvalues: UnixTimestampMillisRatio (ref), v1 (ref), TimeoutThreshold (copy), OnReachingThreshold (copy), DelayedThread (ref), LoggerModule (upval)
			if UnixTimestampMillisRatio then
				LoggerModule:warning("Timer has been already started")
			else
				UnixTimestampMillisRatio = os.clock()
				v1 = p2 or DateTime.now()
				
				if p2 then
					UnixTimestampMillisRatio = (v1.UnixTimestampMillis - DateTime.now().UnixTimestampMillis) / 1000
				end
				if TimeoutThreshold then
					if OnReachingThreshold then
						DelayedThread = task.delay(TimeoutThreshold, function()
							-- upvalues: DelayedThread (upval), OnReachingThreshold (copy)
							DelayedThread = nil
							OnReachingThreshold()
						end)
						
						return
					end
					return
				end
			end
		end,
		getStartTimestamp = function()
			-- upvalues: v1 (ref), LoggerModule (upval)
			if v1 then
				return v1
			else
				LoggerModule:warning("Timer has not been started yet")
				
				return nil
			end
		end,
		stop = function(): number
			-- upvalues: DelayedThread (ref), UnixTimestampMillisRatio (ref), ClockTime (ref), LoggerModule (upval)
			if DelayedThread then
				task.cancel(DelayedThread)
			end
			if UnixTimestampMillisRatio and not ClockTime then
				ClockTime = os.clock()
			elseif UnixTimestampMillisRatio then
				LoggerModule:warning("Timer has been already stopped")
			else
				LoggerModule:warning("Timer has not been started yet")
			end
			return if UnixTimestampMillisRatio and ClockTime then ClockTime - UnixTimestampMillisRatio else -1
		end,
		clear = function()
			-- upvalues: UnixTimestampMillisRatio (ref), ClockTime (ref), DelayedThread (ref)
			UnixTimestampMillisRatio = nil
			ClockTime = nil
			
			if DelayedThread then
				task.cancel(DelayedThread)
			end
		end,
		getTime = function(): number
			-- upvalues: UnixTimestampMillisRatio (ref), ClockTime (ref), LoggerModule (upval)
			local ClockTime1: number? = nil
			
			if UnixTimestampMillisRatio and not ClockTime then
				ClockTime1 = os.clock()
			elseif UnixTimestampMillisRatio then
				LoggerModule:warning("Timer has been already stopped")
			else
				LoggerModule:warning("Timer has not been started yet")
			end
			return if UnixTimestampMillisRatio and ClockTime1 then ClockTime1 - UnixTimestampMillisRatio else -1
		end
	}
end