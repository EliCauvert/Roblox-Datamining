local reactModule = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.React)
local getRemainingTimeModule = require(script.Parent.getRemainingTime)
local t = { days = 86400, hours = 3600, minutes = 60, seconds = 1 }

local function _(p1)
	-- upvalues: t (ref)
	return math.max(p1.secondsRemaining - p1.value * t[p1.unit] + 1, 0.05)
end

return function(p1)
	-- upvalues: reactModule (ref), getRemainingTimeModule (ref), t (ref)
	local var1, var2 = reactModule.useState(function()
		-- upvalues: getRemainingTimeModule (copy), p1 (ref)
		return getRemainingTimeModule(p1)
	end)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), getRemainingTimeModule (copy), t (copy)
		if not p1 then
			var2(nil)
			
			return
		end
		local var3 = false
		local delayedThread = nil
		
		local function tick()
			-- upvalues: var3 (write), getRemainingTimeModule (copy), p1 (copy), var2 (copy), delayedThread (write), t (copy), tick (ref)
			if var3 then return end
			local var4 = getRemainingTimeModule(p1)
			var2(var4)
			
			if var4 and var4.value >= 0 then
				delayedThread = task.delay(math.max(var4.secondsRemaining - var4.value * t[var4.unit] + 1, 0.05), tick)
				
				return
			end
		end
		
		local var4 = getRemainingTimeModule(p1)
		var2(var4)
		
		if var4 and var4.value >= 0 then
			delayedThread = task.delay(math.max(var4.secondsRemaining - var4.value * t[var4.unit] + 1, 0.05), tick)
		end
		return function()
			-- upvalues: var3 (write), delayedThread (write)
			var3 = true
			
			if delayedThread then
				task.cancel(delayedThread)
				delayedThread = nil
			end
		end
	end, { p1 })
	
	return var1
end