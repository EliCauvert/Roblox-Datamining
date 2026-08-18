local playersService = game:GetService("Players")
local _ = require(script.Parent.Parent.Types)

local function finishModelSetup(value) --[[ line: 9 ]]
	value:PivotTo(CFrame.new())
	local humanoidRootPart = value:FindFirstChild("HumanoidRootPart")
	
	if humanoidRootPart and humanoidRootPart:IsA("BasePart") then
		value.PrimaryPart = humanoidRootPart
		humanoidRootPart.Anchored = true
	end
	local humanoid = value:FindFirstChildOfClass("Humanoid")
	local var4 = if humanoid then humanoid:FindFirstChildOfClass("Animator") else nil
	
	if humanoid and not var4 then
		local animator = Instance.new("Animator")
		animator.Parent = humanoid
		var4 = animator
	end
	return { model = value, humanoid = humanoid, animator = var4 }
end

return function(p0) --[[ line: 36 | named "createUserIdModelSource" ]]
	-- upvalues: playersService (ref), finishModelSetup (ref)
	return function(p1) --[[ line: 37 ]]
		-- upvalues: p0 (ref), playersService (copy), finishModelSetup (copy)
		local var6 = tonumber(p0)
		
		if not var6 then
			return nil
		end
		local ok, status = pcall(function() --[[ line: 43 ]]
			-- upvalues: playersService (copy), var6 (ref)
			return playersService:CreateHumanoidModelFromUserIdAsync(var6)
		end)
		
		if p1.isCancelled() then
			if ok and status then
				status:Destroy()
			end
			return nil
		else
			return if ok and status then finishModelSetup(status) else nil
		end
	end
end