local InExperienceCloudPlay = script:FindFirstAncestor("InExperienceCloudPlay")
local ReactModule = require(InExperienceCloudPlay.Parent.React)
local _ = require(InExperienceCloudPlay.getCloudClientService)

return function(p1, p2)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), p2 (copy), UseStateResult2 (copy)
		if p1 and p2 and p2 > 0 then
			local ClockTimeDelta = os.clock() + p2 - p1:GetSessionElapsedTime()
			local DelayedThread = nil
			
			local function tick()
				-- upvalues: ClockTimeDelta (copy), UseStateResult2 (upval), DelayedThread (ref), tick (copy)
				local ClockTimeDeltaDelta = ClockTimeDelta - os.clock()
				local Largest = math.max(0, (math.ceil(ClockTimeDeltaDelta)))
				UseStateResult2(Largest)
				DelayedThread = if Largest > 0 then task.delay(ClockTimeDeltaDelta - (Largest - 1), tick) else nil
			end
			
			local Value = ClockTimeDelta - os.clock()
			local Largest = math.max(0, (math.ceil(Value)))
			UseStateResult2(Largest)
			DelayedThread = if Largest > 0 then task.delay(Value - (Largest - 1), tick) else nil
			
			return function()
				-- upvalues: DelayedThread (ref)
				if DelayedThread then
					task.cancel(DelayedThread)
				end
			end
		else
			UseStateResult2(nil)
			
			return nil
		end
	end, { p1, p2 })
	
	return UseStateResult
end