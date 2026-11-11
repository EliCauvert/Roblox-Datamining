local RunService = game:GetService("RunService")
local ReactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

return {
	useTickClock = function(p1)
		-- upvalues: ReactModule (copy), RunService (copy)
		local UseRefResult = ReactModule.useRef(p1.onTick)
		UseRefResult.current = p1.onTick
		local UseRefResult1 = ReactModule.useRef(p1.onFrame)
		UseRefResult1.current = p1.onFrame
		local IntervalSec = p1.intervalSec
		local Enabled = p1.enabled
		local TestHeartbeat = p1.testHeartbeat or RunService.Heartbeat
		ReactModule.useEffect(function()
			-- upvalues: Enabled (copy), TestHeartbeat (copy), IntervalSec (copy), UseRefResult (copy), UseRefResult1 (copy)
			if not Enabled then return end
			local v1 = 0
			local Connection = TestHeartbeat:Connect(function(p2)
				-- upvalues: v1 (ref), IntervalSec (upval), UseRefResult (upval), UseRefResult1 (upval)
				local v2 = v1 + p2
				local v3 = nil
				local v4 = nil
				
				if IntervalSec <= 0 then
					v3 = 0
					v4 = v2
				else
					local Floored = math.floor(v2 / IntervalSec)
					v3 = Floored
					v4 = v2 - Floored * IntervalSec
				end
				v1 = v4
				
				for _ = 1, v3 do
					UseRefResult.current()
				end
				UseRefResult1.current(if IntervalSec > 0 then v1 / IntervalSec else 0)
			end)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end, { Enabled, IntervalSec, TestHeartbeat })
	end,
	advanceClock = function(p2, p3, p4: number)
		local v1 = p2 + p3
		
		if p4 <= 0 then
			return 0, v1
		else
			local Floored = math.floor(v1 / p4)
			
			return Floored, v1 - Floored * p4
		end
	end
}