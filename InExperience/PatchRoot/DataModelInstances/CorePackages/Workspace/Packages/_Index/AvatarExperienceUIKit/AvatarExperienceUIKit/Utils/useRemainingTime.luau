local reactModule = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.React)
local getRemainingTimeModule = require(script.Parent.getRemainingTime)
local t = { days = 86400, hours = 3600, minutes = 60, seconds = 1 }

local function _(p0)
	-- upvalues: t (ref)
	return math.max(p0.secondsRemaining - p0.value * t[p0.unit] + 1, 0.05)
end

return function(p1)
	-- upvalues: reactModule (ref), getRemainingTimeModule (ref), t (ref)
	local var3, var4 = reactModule.useState(function()
		-- upvalues: getRemainingTimeModule (copy), p1 (ref)
		return getRemainingTimeModule(p1)
	end)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), getRemainingTimeModule (copy), t (copy)
		if not p1 then
			var4(nil)
			
			return
		end
		local var5 = false
		local delayedThread = nil
		
		local function tick()
			-- upvalues: var5 (write), getRemainingTimeModule (copy), p1 (copy), var4 (copy), delayedThread (write), t (copy), tick (ref)
			if var5 then return end
			local var9 = getRemainingTimeModule(p1)
			var4(var9)
			
			if var9 and var9.value >= 0 then
				delayedThread = task.delay(math.max(var9.secondsRemaining - var9.value * t[var9.unit] + 1, 0.05), tick)
				
				return
			end
		end
		
		local var8 = getRemainingTimeModule(p1)
		var4(var8)
		
		if var8 and var8.value >= 0 then
			delayedThread = task.delay(math.max(var8.secondsRemaining - var8.value * t[var8.unit] + 1, 0.05), tick)
		end
		return function()
			-- upvalues: var5 (write), delayedThread (write)
			var5 = true
			
			if delayedThread then
				task.cancel(delayedThread)
				delayedThread = nil
			end
		end
	end, { p1 })
	
	return var3
end