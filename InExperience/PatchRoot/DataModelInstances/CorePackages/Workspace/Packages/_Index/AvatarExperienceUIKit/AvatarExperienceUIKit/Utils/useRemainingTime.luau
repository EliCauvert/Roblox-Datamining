local ReactModule = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.React)
local GetRemainingTimeModule = require(script.Parent.getRemainingTime)
local config = { days = 86400, hours = 3600, minutes = 60, seconds = 1 }

local function _(p1): number --[[ Line: 56 | Named "getNextTickInterval" ]]
	-- upvalues: config (copy)
	return (math.max(p1.secondsRemaining - p1.value * config[p1.unit] + 1, 0.05))
end

return function(p1) --[[ Line: 62 | Named "useRemainingTime" ]]
	-- upvalues: ReactModule (copy), GetRemainingTimeModule (copy), config (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 63 ]]
		-- upvalues: GetRemainingTimeModule (upval), p1 (copy)
		return GetRemainingTimeModule(p1)
	end)
	ReactModule.useEffect(function() --[[ Line: 67 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy), GetRemainingTimeModule (upval), config (upval)
		if not p1 then
			UseStateResult2(nil)
			
			return
		end
		local Flag = false
		local DelayedThread = nil
		
		local function tick() --[[ Line: 76 ]]
			-- upvalues: Flag (ref), GetRemainingTimeModule (upval), p1 (upval), UseStateResult2 (upval), DelayedThread (ref), config (upval), tick (copy)
			if Flag then return end
			local RemainingTimeModule = GetRemainingTimeModule(p1)
			UseStateResult2(RemainingTimeModule)
			
			if RemainingTimeModule and RemainingTimeModule.value >= 0 then
				DelayedThread = task.delay(math.max(RemainingTimeModule.secondsRemaining - RemainingTimeModule.value * config[RemainingTimeModule.unit] + 1, 0.05), tick)
				
				return
			end
		end
		
		if not Flag then
			local RemainingTimeModule = GetRemainingTimeModule(p1)
			UseStateResult2(RemainingTimeModule)
			
			if RemainingTimeModule and RemainingTimeModule.value >= 0 then
				DelayedThread = task.delay(math.max(RemainingTimeModule.secondsRemaining - RemainingTimeModule.value * config[RemainingTimeModule.unit] + 1, 0.05), tick)
			end
		end
		return function() --[[ Line: 91 ]]
			-- upvalues: Flag (ref), DelayedThread (ref)
			Flag = true
			
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
		end
	end, { p1 })
	
	return UseStateResult
end