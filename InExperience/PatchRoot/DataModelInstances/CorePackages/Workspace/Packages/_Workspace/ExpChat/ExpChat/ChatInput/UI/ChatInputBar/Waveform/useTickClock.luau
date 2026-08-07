local runService = game:GetService("RunService")
local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

return {
	useTickClock = function(value) --[[ line: 38 ]]
		-- upvalues: reactModule (ref), runService (ref)
		local var2 = reactModule.useRef(value.onTick)
		var2.current = value.onTick
		local var3 = reactModule.useRef(value.onFrame)
		var3.current = value.onFrame
		local intervalSec = value.intervalSec
		local enabled = value.enabled
		local testHeartbeat = value.testHeartbeat or runService.Heartbeat
		reactModule.useEffect(function() --[[ line: 49 ]]
			-- upvalues: enabled (ref), testHeartbeat (ref), intervalSec (ref), var2 (ref), var3 (ref)
			if enabled then
				local var5 = 0
				local var6 = testHeartbeat:Connect(function(p0) --[[ line: 55 ]]
					-- upvalues: var5 (write), intervalSec (copy), var2 (copy), var3 (copy)
					local var8, var9
					local var7 = var5 + p0
					
					if intervalSec <= 0 then
						var8 = 0
						var9 = var7
					else
						local floored = math.floor(var7 / intervalSec)
						var8 = floored
						var9 = var7 - floored * intervalSec
					end
					var5 = var9
					
					for _ = 1, var8 do
						var2.current()
					end
					var3.current(if intervalSec > 0 then var5 / intervalSec else 0)
				end)
				
				return function() --[[ line: 67 ]]
					-- upvalues: var6 (ref)
					var6:Disconnect()
				end
			end
		end, { enabled, intervalSec, testHeartbeat })
	end,
	advanceClock = function(p1, p2, p3) --[[ line: 29 ]]
		p1 += p2
		
		if p3 <= 0 then
			return 0, p1
		end
		local floored = math.floor(p1 / p3)
		
		return floored, p1 - floored * p3
	end
}