local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LoadAssetModule = require(script.Parent.loadAsset)

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
		-- upvalues: emoteAnimationId (copy), staged (copy), ReplicatedStorage (copy), RunService (copy)
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
		local Live3DEmote = Instance.new("Animation")
		Live3DEmote.Name = "Live3DEmote"
		Live3DEmote.AnimationId = emoteAnimationId(p1)
		Live3DEmote.Parent = Parent
		local v1 = nil
		staged(Parent, ReplicatedStorage, function()
			-- upvalues: Animator1 (ref), Live3DEmote (copy), RunService (upval), v1 (ref)
			local Success, Result = pcall(function()
				-- upvalues: Animator1 (upval), Live3DEmote (upval)
				return Animator1:LoadAnimation(Live3DEmote)
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
			v1 = Result
		end)
		
		return v1
	end,
	emoteAnimationId = emoteAnimationId
}