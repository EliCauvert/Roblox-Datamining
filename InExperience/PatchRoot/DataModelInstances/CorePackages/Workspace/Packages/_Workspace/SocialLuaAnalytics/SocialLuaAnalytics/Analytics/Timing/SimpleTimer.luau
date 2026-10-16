local LoggerModule = require(script.Parent.Parent.Logger)

local function _(p1, p2) --[[ Line: 3 ]]
	return (p1.UnixTimestampMillis - p2.UnixTimestampMillis) / 1000
end

return function(p1) --[[ Line: 23 | Named "SimpleTimer" ]]
	-- upvalues: LoggerModule (copy)
	local UnixTimestampMillisRatio = nil
	local ClockTime = nil
	local v1 = nil
	local DelayedThread = nil
	local TimeoutThreshold = p1 and p1.timeoutThreshold or nil
	local OnReachingThreshold = p1 and p1.onReachingThreshold or nil
	
	local function _() --[[ Line: 33 ]]
		-- upvalues: UnixTimestampMillisRatio (ref), ClockTime (ref)
		return if UnixTimestampMillisRatio and ClockTime then ClockTime - UnixTimestampMillisRatio else -1
	end
	
	local _ = function() --[[ Line: 54 ]]
		-- upvalues: DelayedThread (ref)
		if DelayedThread then
			task.cancel(DelayedThread)
		end
	end
	
	local _ = function() --[[ Line: 66 ]]
		-- upvalues: TimeoutThreshold (copy), OnReachingThreshold (copy), DelayedThread (ref)
		if TimeoutThreshold and OnReachingThreshold then
			DelayedThread = task.delay(TimeoutThreshold, function() --[[ Line: 73 ]]
				-- upvalues: DelayedThread (upval), OnReachingThreshold (copy)
				DelayedThread = nil
				OnReachingThreshold()
			end)
			
			return
		end
	end
	
	return {
		start = function(p2) --[[ Line: 79 ]]
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
						DelayedThread = task.delay(TimeoutThreshold, function() --[[ Line: 73 ]]
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
		getStartTimestamp = function() --[[ Line: 106 ]]
			-- upvalues: v1 (ref), LoggerModule (upval)
			if v1 then
				return v1
			else
				LoggerModule:warning("Timer has not been started yet")
				
				return nil
			end
		end,
		stop = function(): number --[[ Line: 92 ]]
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
		clear = function() --[[ Line: 60 ]]
			-- upvalues: UnixTimestampMillisRatio (ref), ClockTime (ref), DelayedThread (ref)
			UnixTimestampMillisRatio = nil
			ClockTime = nil
			
			if DelayedThread then
				task.cancel(DelayedThread)
			end
		end,
		getTime = function(): number --[[ Line: 40 ]]
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