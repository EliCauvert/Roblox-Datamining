local Players = game:GetService("Players")
local ReactModule = require(script:FindFirstAncestor("AvatarWorkshop").Parent.React)
local _Color3 = Color3.fromRGB(218, 203, 173)
local _Color3_1 = Color3.fromRGB(163, 162, 165)

local function _(p1)
	-- upvalues: _Color3_1 (copy)
	local HumanoidDescription = Instance.new("HumanoidDescription")
	HumanoidDescription.Head = p1.head
	HumanoidDescription.Torso = p1.torso
	HumanoidDescription.RightArm = p1.rightArm
	HumanoidDescription.LeftArm = p1.leftArm
	HumanoidDescription.RightLeg = p1.rightLeg
	HumanoidDescription.LeftLeg = p1.leftLeg
	HumanoidDescription.HeadColor = _Color3_1
	HumanoidDescription.TorsoColor = _Color3_1
	HumanoidDescription.RightArmColor = _Color3_1
	HumanoidDescription.LeftArmColor = _Color3_1
	HumanoidDescription.RightLegColor = _Color3_1
	HumanoidDescription.LeftLegColor = _Color3_1
	
	return HumanoidDescription
end

return function(p1)
	-- upvalues: ReactModule (copy), Players (copy), _Color3_1 (copy), _Color3 (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(CFrame.new())
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult2 (copy)
		if UseRefResult.current then
			UseRefResult.current.CurrentCamera = UseRefResult2.current
		end
	end, {})
	local Head = p1.head
	local Torso = p1.torso
	local RightArm = p1.rightArm
	local LeftArm = p1.leftArm
	local RightLeg = p1.rightLeg
	local LeftLeg = p1.leftLeg
	ReactModule.useEffect(function()
		-- upvalues: Players (upval), Head (copy), Torso (copy), RightArm (copy), LeftArm (copy), RightLeg (copy), LeftLeg (copy), _Color3_1 (upval), UseRefResult1 (copy), UseBindingResult2 (copy)
		local Flag = false
		task.spawn(function()
			-- upvalues: Players (upval), Head (upval), Torso (upval), RightArm (upval), LeftArm (upval), RightLeg (upval), LeftLeg (upval), _Color3_1 (upval), UseRefResult1 (upval), Flag (ref), UseBindingResult2 (upval)
			local Success, Result = pcall(function()
				-- upvalues: Players (upval), Head (upval), Torso (upval), RightArm (upval), LeftArm (upval), RightLeg (upval), LeftLeg (upval), _Color3_1 (upval)
				local config = {
					head = Head,
					torso = Torso,
					rightArm = RightArm,
					leftArm = LeftArm,
					rightLeg = RightLeg,
					leftLeg = LeftLeg
				}
				local HumanoidDescription = Instance.new("HumanoidDescription")
				HumanoidDescription.Head = config.head
				HumanoidDescription.Torso = config.torso
				HumanoidDescription.RightArm = config.rightArm
				HumanoidDescription.LeftArm = config.leftArm
				HumanoidDescription.RightLeg = config.rightLeg
				HumanoidDescription.LeftLeg = config.leftLeg
				HumanoidDescription.HeadColor = _Color3_1
				HumanoidDescription.TorsoColor = _Color3_1
				HumanoidDescription.RightArmColor = _Color3_1
				HumanoidDescription.LeftArmColor = _Color3_1
				HumanoidDescription.RightLegColor = _Color3_1
				HumanoidDescription.LeftLegColor = _Color3_1
				
				return Players:CreateHumanoidModelFromDescriptionAsync(HumanoidDescription, Enum.HumanoidRigType.R15)
			end)
			local Result1 = if Success then Result else nil
			local Current = UseRefResult1.current
			
			if not Flag and Current ~= nil then
				Current:ClearAllChildren()
				
				if not Result1 then
					warn("Players:CreateHumanoidModelFromDescriptionAsync error:", Result)
					
					return
				end
				local HumanoidRootPart = Result1:FindFirstChild("HumanoidRootPart")
				
				if HumanoidRootPart and HumanoidRootPart:IsA("BasePart") then
					HumanoidRootPart.Anchored = true
				end
				Result1:PivotTo(CFrame.new())
				local Pivot = Result1:GetPivot()
				UseBindingResult2(CFrame.new(Pivot.Position + Pivot.LookVector * 6, Pivot.Position) - vector.create(0, 0.75, 0))
				Result1.Parent = Current
				
				return
			elseif Result1 then
				Result1:Destroy()
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {
		Head, Torso, RightArm, LeftArm, RightLeg, LeftLeg
	})
	
	return ReactModule.createElement("ViewportFrame", {
		BackgroundTransparency = 1,
		LightDirection = vector.create(-1, -1, 2),
		Size = UDim2.fromScale(1, 1),
		LightColor = _Color3,
		ref = UseRefResult
	}, {
		WorldModel = ReactModule.createElement("WorldModel", { ref = UseRefResult1 }),
		Camera = ReactModule.createElement("Camera", {
			CameraType = Enum.CameraType.Scriptable,
			CFrame = UseBindingResult,
			ref = UseRefResult2
		})
	})
end