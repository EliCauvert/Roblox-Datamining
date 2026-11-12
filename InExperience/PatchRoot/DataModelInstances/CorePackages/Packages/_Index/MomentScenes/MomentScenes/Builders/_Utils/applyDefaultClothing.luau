local RunService = game:GetService("RunService")
local CheckApplyDefaultClothingModule = require(script.Parent.checkApplyDefaultClothing)

local function _()
	-- upvalues: RunService (copy)
	if RunService:IsRunning() then
		task.wait()
		
		return
	else
		wait(0)
	end
end

return function(p1, p2)
	-- upvalues: CheckApplyDefaultClothingModule (copy), RunService (copy)
	local v1 = if p2 == nil then 8 else p2
	local Flag = false
	local v2 = false
	local HumanoidDescription = nil
	task.spawn(function()
		-- upvalues: v2 (ref), HumanoidDescription (ref), CheckApplyDefaultClothingModule (upval), p1 (copy), Flag (ref)
		v2, HumanoidDescription = pcall(CheckApplyDefaultClothingModule, p1)
		Flag = true
	end)
	local ClockTime = os.clock()
	while not Flag and os.clock() - ClockTime < v1 do
		if RunService:IsRunning() then
			task.wait()
		else
			wait(0)
		end
	end
	if not Flag then
		warn("applyDefaultClothing: timed out")
		
		return p1
	elseif v2 then
		return if typeof(HumanoidDescription) == "Instance" and HumanoidDescription:IsA("HumanoidDescription") then HumanoidDescription else p1
	else
		warn(`applyDefaultClothing: {HumanoidDescription}`)
		
		return p1
	end
end