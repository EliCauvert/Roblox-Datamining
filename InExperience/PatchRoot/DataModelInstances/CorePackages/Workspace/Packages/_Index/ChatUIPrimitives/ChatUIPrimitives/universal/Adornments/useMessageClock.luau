local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)

local function readWallClockMs()
	return DateTime.now().UnixTimestampMillis
end

return function(p1)
	-- upvalues: ReactModule (copy), readWallClockMs (copy), SignalsModule (copy)
	local UseRefResult = ReactModule.useRef(p1.getNowMs or readWallClockMs)
	UseRefResult.current = p1.getNowMs or readWallClockMs
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseRefResult (copy)
		local Signal, Signal2 = SignalsModule.createSignal(UseRefResult.current())
		
		return { now = Signal, setNow = Signal2 }
	end, {})
	local IsEnabled = p1.enabled ~= false
	local IntervalSeconds = p1.intervalSeconds or 30
	ReactModule.useEffect(function()
		-- upvalues: IsEnabled (copy), UseMemoResult (copy), UseRefResult (copy), IntervalSeconds (copy)
		if IsEnabled then
			UseMemoResult.setNow(UseRefResult.current())
			local DelayedThread = nil
			
			local function scheduleNext()
				-- upvalues: DelayedThread (ref), IntervalSeconds (upval), UseMemoResult (upval), UseRefResult (upval), scheduleNext (copy)
				DelayedThread = task.delay(IntervalSeconds, function()
					-- upvalues: DelayedThread (upval), UseMemoResult (upval), UseRefResult (upval), scheduleNext (upval)
					DelayedThread = nil
					UseMemoResult.setNow(UseRefResult.current())
					scheduleNext()
				end)
			end
			
			DelayedThread = task.delay(IntervalSeconds, function()
				-- upvalues: DelayedThread (ref), UseMemoResult (upval), UseRefResult (upval), scheduleNext (copy)
				DelayedThread = nil
				UseMemoResult.setNow(UseRefResult.current())
				scheduleNext()
			end)
			
			return function()
				-- upvalues: DelayedThread (ref)
				if DelayedThread ~= nil then
					task.cancel(DelayedThread)
					DelayedThread = nil
				end
			end
		else
			return function() end
		end
	end, { IsEnabled, IntervalSeconds })
	
	return UseMemoResult.now
end