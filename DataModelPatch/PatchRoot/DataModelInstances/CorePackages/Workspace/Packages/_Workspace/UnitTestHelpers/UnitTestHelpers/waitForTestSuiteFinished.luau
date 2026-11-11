local RunService = game:GetService("RunService")
local LogService = game:GetService("LogService")

local function waitUntil(p1, p2)
	-- upvalues: RunService (copy)
	local P1 = p2 or 1
	local NewDeltaTime = 0
	while NewDeltaTime < P1 and not p1() do
		NewDeltaTime += RunService.Heartbeat:Wait()
	end
end

return function()
	-- upvalues: waitUntil (copy), LogService (copy)
	waitUntil(function(): boolean
		-- upvalues: LogService (upval)
		for _, value in ipairs((LogService:GetLogHistory())) do
			if string.match(value.message, "%d+ passed, %d+ failed, %d+ skipped") then
				return true
			end
		end
		return false
	end, 300)
end