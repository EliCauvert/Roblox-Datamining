local ActFunction = require(script:FindFirstAncestor("FriendsLanding").dependencies).Roact.act
local RunService = game:GetService("RunService")

return function(p1, p2)
	-- upvalues: ActFunction (copy), RunService (copy)
	local P1 = p2 or 1
	local NewDeltaTime = 0
	while NewDeltaTime < P1 and not p1() do
		ActFunction(function()
			-- upvalues: NewDeltaTime (ref), RunService (upval)
			NewDeltaTime += RunService.Heartbeat:Wait()
		end)
	end
end