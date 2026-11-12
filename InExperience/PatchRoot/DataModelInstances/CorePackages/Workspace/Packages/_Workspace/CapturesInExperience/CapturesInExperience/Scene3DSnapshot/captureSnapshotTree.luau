local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local SelectSnapshotSourcesModule = require(script.Parent.selectSnapshotSources)
local CaptureServiceModule = require(script.Parent.Parent.Services.CaptureService)

local function _(Vector): Vector3
	return (Vector3.new(math.floor(Vector.X / 4) * 4, math.floor(Vector.Y / 4) * 4, math.floor(Vector.Z / 4) * 4))
end

local _ = function(Object)
	local Humanoid = Object:FindFirstChildOfClass("Humanoid")
	
	if Humanoid == nil then
		return nil
	else
		local Success, Result = pcall(function()
			-- upvalues: Humanoid (copy)
			return Humanoid:GetAppliedDescription()
		end)
		
		return if Success then Result else nil
	end
end

local function freeze(Object)
	if Object:IsA("Sound") or Object:IsA("AudioPlayer") or Object:IsA("Explosion") then
		Object:Destroy()
		
		return
	end
	if Object:IsA("BasePart") then
		Object.Anchored = true
		
		return
	end
	if Object:IsA("VideoFrame") then
		Object.Playing = false
	end
end

return {
	HEADER_NAME = "SnapshotHeader",
	AVATAR_DESCRIPTION_NAME = "Scene3DInspectDescription",
	captureSnapshotTree = function(p1)
		-- upvalues: Workspace (copy), Players (copy), SelectSnapshotSourcesModule (copy), CaptureServiceModule (copy), freeze (copy)
		local P3 = p1 or {}
		local Camera = P3.camera or Workspace.CurrentCamera
		
		if Camera == nil then
			return nil
		end
		local LocalPlayer = Players.LocalPlayer
		local MaxDepth = P3.maxDepth or 800
		local FovMargin = P3.fovMargin or 25
		local CameraCFrame = Camera.CFrame
		local FieldOfView = Camera.FieldOfView
		local XRatio = Camera.ViewportSize.X / math.max(Camera.ViewportSize.Y, 1)
		local SelectSnapshotSourcesModuleResult = SelectSnapshotSourcesModule({
			nearRadius = 30,
			root = P3.sceneRoot or Workspace,
			cameraCFrame = CameraCFrame,
			fieldOfView = FieldOfView,
			aspect = XRatio,
			maxDepth = MaxDepth,
			fovMargin = FovMargin,
			localCharacter = P3.localCharacter or (if LocalPlayer == nil then nil else LocalPlayer.Character)
		})
		
		if #SelectSnapshotSourcesModuleResult.looseParts == 0 and #SelectSnapshotSourcesModuleResult.characters == 0 then
			return nil
		end
		local SnapshotHeader = Instance.new("Configuration")
		SnapshotHeader.Name = "SnapshotHeader"
		local Position = CameraCFrame.Position
		SnapshotHeader:SetAttribute("PresentationOrigin", (Vector3.new(math.floor(Position.X / 4) * 4, math.floor(Position.Y / 4) * 4, math.floor(Position.Z / 4) * 4)))
		SnapshotHeader:SetAttribute("SelectionCameraCFrame", CameraCFrame)
		SnapshotHeader:SetAttribute("SelectionFovDeg", FieldOfView)
		SnapshotHeader:SetAttribute("SelectionAspect", XRatio)
		SnapshotHeader:SetAttribute("SelectionFovMarginDeg", FovMargin)
		SnapshotHeader:SetAttribute("SelectionMaxDepth", MaxDepth)
		SnapshotHeader:SetAttribute("SelectionNearRadius", 30)
		local Copy = table.clone(SelectSnapshotSourcesModuleResult.looseParts)
		local v1 = #Copy + 1
		
		for _, character in SelectSnapshotSourcesModuleResult.characters do
			table.insert(Copy, character)
		end
		table.insert(Copy, SnapshotHeader)
		local Success1, Result1 = pcall(function()
			-- upvalues: CaptureServiceModule (upval), Copy (copy)
			return CaptureServiceModule:CloneForSnapshot(Copy, true)
		end)
		SnapshotHeader:Destroy()
		
		if not Success1 then
			warn("CloneForSnapshot failed with error:", Result1)
			
			return nil
		end
		local Roots = Result1:GetRoots()
		
		for _, root in Roots do
			for _, descendant in root:GetDescendants() do
				freeze(descendant)
			end
			freeze(root)
		end
		for i, character1 in SelectSnapshotSourcesModuleResult.characters do
			local Root = Roots[v1 + i - 1]
			
			if Root ~= nil and Root.ClassName == character1.ClassName and Root.Name == character1.Name then
				local Humanoid = character1:FindFirstChildOfClass("Humanoid")
				local Scene3DInspectDescription = nil
				
				if Humanoid == nil then
					Scene3DInspectDescription = nil
				else
					local Success, Result = pcall(function()
						-- upvalues: Humanoid (copy)
						return Humanoid:GetAppliedDescription()
					end)
					Scene3DInspectDescription = if Success then Result else nil
				end
				if Scene3DInspectDescription ~= nil then
					Scene3DInspectDescription.Name = "Scene3DInspectDescription"
					Scene3DInspectDescription.Parent = Root
				end
			end
		end
		return Result1
	end
}