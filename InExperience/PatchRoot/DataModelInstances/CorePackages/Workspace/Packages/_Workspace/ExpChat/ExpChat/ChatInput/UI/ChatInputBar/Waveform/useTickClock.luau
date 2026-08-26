local runService = game:GetService("RunService")
local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

return {
	useTickClock = function(value)
		-- upvalues: reactModule (ref), runService (ref)
		local var1 = reactModule.useRef(value.onTick)
		var1.current = value.onTick
		local var2 = reactModule.useRef(value.onFrame)
		var2.current = value.onFrame
		local intervalSec = value.intervalSec
		local enabled = value.enabled
		local testHeartbeat = value.testHeartbeat or runService.Heartbeat
		reactModule.useEffect(function()
			-- upvalues: enabled (ref), testHeartbeat (ref), intervalSec (ref), var1 (ref), var2 (ref)
			if enabled then
				local var3 = 0
				local var4 = testHeartbeat:Connect(function(p1)
					-- upvalues: var3 (write), intervalSec (copy), var1 (copy), var2 (copy)
					local var5, var6
					local var7 = var3 + p1
					
					if intervalSec <= 0 then
						var5 = 0
						var6 = var7
					else
						local floored = math.floor(var7 / intervalSec)
						var5 = floored
						var6 = var7 - floored * intervalSec
					end
					var3 = var6
					
					for _ = 1, var5 do
						var1.current()
					end
					var2.current(if intervalSec > 0 then var3 / intervalSec else 0)
				end)
				
				return function()
					-- upvalues: var4 (ref)
					var4:Disconnect()
				end
			end
		end, { enabled, intervalSec, testHeartbeat })
	end,
	advanceClock = function(p1, p2, p3)
		p1 += p2
		
		if p3 <= 0 then
			return 0, p1
		end
		local floored = math.floor(p1 / p3)
		
		return floored, p1 - floored * p3
	end
}