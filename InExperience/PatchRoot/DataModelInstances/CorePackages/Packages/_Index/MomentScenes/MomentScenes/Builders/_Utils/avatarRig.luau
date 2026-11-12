local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LoadAssetModule = require(script.Parent.loadAsset)
local v1 = CFrame.new(0, -1, 0) * CFrame.Angles(-1.5707963267948966, 0, 0)

local function staged(Parent, WorkspaceService, Callback)
	local Parent1 = Parent.Parent
	local MomentScenesStaging = Instance.new("Folder")
	MomentScenesStaging.Name = "MomentScenesStaging"
	MomentScenesStaging.Parent = WorkspaceService
	Parent.Parent = MomentScenesStaging
	local Success, Result = pcall(function()
		-- upvalues: Callback (copy)
		Callback()
		
		return nil
	end)
	Parent.Parent = Parent1
	MomentScenesStaging:Destroy()
	
	if not Success then
		error(Result)
	end
end

local function emoteAnimationId(p1)
	-- upvalues: LoadAssetModule (copy)
	local AssetId: string = `rbxassetid://{p1}`
	local Success, Result = pcall(LoadAssetModule.loadAsset, p1)
	
	if Success and Result ~= nil and typeof(Result) == "Instance" then
		local Animation = Result:FindFirstChildWhichIsA("Animation")
		local AssetId1 = if Animation == nil or Animation.AnimationId == "" then AssetId else Animation.AnimationId
		Result:Destroy()
		
		return AssetId1
	else
		return AssetId
	end
end

local function playAnimation(Parent, Name, AnimationId)
	-- upvalues: staged (copy), ReplicatedStorage (copy), RunService (copy)
	local Humanoid = Parent:FindFirstChildOfClass("Humanoid")
	
	if Humanoid == nil then
		return nil
	end
	local Animator = Humanoid:FindFirstChildOfClass("Animator")
	local Animator1 = nil
	
	if Animator == nil then
		Animator1 = Instance.new("Animator")
		Animator1.Parent = Humanoid
	else
		Animator1 = Animator
	end
	local Animation = Instance.new("Animation")
	Animation.Name = Name
	Animation.AnimationId = AnimationId
	Animation.Parent = Parent
	local v2 = nil
	staged(Parent, ReplicatedStorage, function()
		-- upvalues: Animator1 (ref), Animation (copy), RunService (upval), v2 (ref)
		local Success, Result = pcall(function()
			-- upvalues: Animator1 (upval), Animation (upval)
			return Animator1:LoadAnimation(Animation)
		end)
		
		if not Success or Result == nil then return end
		Result.Looped = true
		Result:Play(0)
		local ClockTime = os.clock()
		while Result.Length == 0 do
			if RunService:IsRunning() then
				task.wait()
			else
				wait(0)
			end
			if os.clock() - ClockTime > 2 then break end
		end
		Result:AdjustSpeed(0)
		v2 = Result
	end)
	
	return v2
end

local function applyGearGrip(Parent, Tool, Part1, HumanoidRigType)
	-- upvalues: v1 (copy)
	local Child = Parent:FindFirstChild(if HumanoidRigType == Enum.HumanoidRigType.R6 then "Right Arm" else "RightHand")
	
	if Child == nil or not Child:IsA("BasePart") then return end
	local RightGrip = Child:FindFirstChild("RightGrip")
	
	if RightGrip == nil then
		local RightGripAttachment = Child:FindFirstChild("RightGripAttachment")
		
		if RightGripAttachment == nil or not RightGripAttachment:IsA("Attachment") then return end
		local RightGrip1 = Instance.new("Weld")
		RightGrip1.Name = "RightGrip"
		RightGrip1.Part0 = Child
		RightGrip1.C0 = if HumanoidRigType == Enum.HumanoidRigType.R6 then v1 else RightGripAttachment.CFrame
		RightGrip1.Parent = Child
		RightGrip = RightGrip1
	end
	if RightGrip ~= nil and RightGrip:IsA("JointInstance") then
		if HumanoidRigType == Enum.HumanoidRigType.R6 then
			RightGrip.C0 = v1
		end
		RightGrip.Part1 = Part1
		RightGrip.C1 = Tool.Grip
	end
end

return {
	createAvatar = function(Description, RigType)
		-- upvalues: Players (copy), staged (copy), Workspace (copy)
		local Success, Result = pcall(function()
			-- upvalues: Players (upval), Description (copy), RigType (copy)
			return Players:CreateHumanoidModelFromDescriptionAsync(Description, RigType)
		end)
		
		if not Success or Result == nil then
			error(`avatarRig.createAvatar: CreateHumanoidModelFromDescriptionAsync failed: {Result}`)
		end
		local HumanoidRootPart = Result:FindFirstChild("HumanoidRootPart")
		
		if HumanoidRootPart ~= nil and HumanoidRootPart:IsA("BasePart") then
			HumanoidRootPart.Anchored = true
			Result.PrimaryPart = HumanoidRootPart
		end
		staged(Result, Workspace, function()
			-- upvalues: Result (copy)
			for _, Part in Result:GetDescendants() do
				if Part:IsA("BasePart") then
					local _ = Part.CFrame
				end
			end
		end)
		
		return Result
	end,
	solveJoints = function(Object)
		-- upvalues: staged (copy), Workspace (copy)
		staged(Object, Workspace, function()
			-- upvalues: Object (copy)
			for _, Part in Object:GetDescendants() do
				if Part:IsA("BasePart") then
					local _ = Part.CFrame
				end
			end
		end)
	end,
	playEmote = function(Parent, p1)
		-- upvalues: playAnimation (copy), emoteAnimationId (copy)
		return if Parent:FindFirstChildOfClass("Humanoid") == nil then nil else playAnimation(Parent, "Live3DEmote", (emoteAnimationId(p1)))
	end,
	emoteAnimationId = emoteAnimationId,
	equipGear = function(Parent, p1, HumanoidRigType)
		-- upvalues: LoadAssetModule (copy), applyGearGrip (copy), playAnimation (copy)
		local Success, Result = pcall(LoadAssetModule.loadAsset, p1)
		
		if not Success then
			warn(`avatarRig.equipGear: Gear {p1} failed to load ({Result})`)
			
			return nil
		end
		if typeof(Result) ~= "Instance" then
			warn(`avatarRig.equipGear: Gear {p1} loaded a {typeof(Result)}, expected an Instance`)
			
			return nil
		end
		local Tool = Result:FindFirstChildWhichIsA("Tool", true)
		
		if Tool == nil then
			Result:Destroy()
			
			return nil
		end
		local Handle = Tool:FindFirstChild("Handle")
		
		if Handle == nil or not Handle:IsA("BasePart") then
			Result:Destroy()
			
			return nil
		end
		for _, ScriptObject in Tool:GetDescendants() do
			if ScriptObject:IsA("LuaSourceContainer") then
				ScriptObject:Destroy()
			end
		end
		Tool.Parent = Parent
		applyGearGrip(Parent, Tool, Handle, HumanoidRigType)
		Result:Destroy()
		
		return (playAnimation(Parent, "Live3DGearEquipped", `rbxassetid://{if HumanoidRigType == Enum.HumanoidRigType.R6 then 182393478 else 507768375}`))
	end,
	equippedAnimationId = function(HumanoidRigType): number
		return if HumanoidRigType == Enum.HumanoidRigType.R6 then 182393478 else 507768375
	end
}