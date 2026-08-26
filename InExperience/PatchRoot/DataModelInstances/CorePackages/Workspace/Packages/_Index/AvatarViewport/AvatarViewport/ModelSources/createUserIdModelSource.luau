local playersService = game:GetService("Players")
local _ = require(script.Parent.Parent.Types)

local function finishModelSetup(value)
	value:PivotTo(CFrame.new())
	local humanoidRootPart = value:FindFirstChild("HumanoidRootPart")
	
	if humanoidRootPart and humanoidRootPart:IsA("BasePart") then
		value.PrimaryPart = humanoidRootPart
		humanoidRootPart.Anchored = true
	end
	local humanoid = value:FindFirstChildOfClass("Humanoid")
	local var1 = if humanoid then humanoid:FindFirstChildOfClass("Animator") else nil
	
	if humanoid and not var1 then
		local animator = Instance.new("Animator")
		animator.Parent = humanoid
		var1 = animator
	end
	return { model = value, humanoid = humanoid, animator = var1 }
end

return function(p1)
	-- upvalues: playersService (ref), finishModelSetup (ref)
	return function(p2)
		-- upvalues: p1 (ref), playersService (copy), finishModelSetup (copy)
		local var1 = tonumber(p1)
		
		if not var1 then
			return nil
		end
		local ok, status = pcall(function()
			-- upvalues: playersService (copy), var1 (ref)
			return playersService:CreateHumanoidModelFromUserIdAsync(var1)
		end)
		
		if p2.isCancelled() then
			if ok and status then
				status:Destroy()
			end
			return nil
		else
			return if ok and status then finishModelSetup(status) else nil
		end
	end
end