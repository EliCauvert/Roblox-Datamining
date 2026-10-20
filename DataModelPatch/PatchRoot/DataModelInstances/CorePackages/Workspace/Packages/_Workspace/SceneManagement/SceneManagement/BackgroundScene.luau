local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace1 = game:GetService("Workspace")
local Parent = script:FindFirstAncestor("SceneManagement").Parent
local Object = require(Parent.LuauPolyfill).Object
local FFlagSkipBackgroundModelMoveInWorkspace = require(Parent.SharedFlags).FFlagSkipBackgroundModelMoveInWorkspace
local config = { FieldOfView = 50, Position = vector.create(0, 20, 0) }
local config1 = {
	PositionOffset = vector.create(0, 0, 0),
	RotationOffset = vector.create(0, 0, 0),
	DistanceToCamera = 60
}

local function _()
	local CurrentCamera = workspace.CurrentCamera
	
	if CurrentCamera == nil then
		CurrentCamera = Instance.new("Camera")
		CurrentCamera.Parent = workspace
	end
	return CurrentCamera
end

local function configureCamera(Camera: Camera, CameraConfigs)
	-- upvalues: Object (copy), config (copy)
	local AssignResult = Object.assign({}, config, CameraConfigs or {})
	Camera.FieldOfView = AssignResult.FieldOfView
	Camera.CFrame = CFrame.new(AssignResult.Position)
	Camera.CameraType = Enum.CameraType.Fixed
end

local function configureBackground(Child, Camera, BackgroundConfigs)
	-- upvalues: Object (copy), config1 (copy)
	local AssignResult = Object.assign({}, config1, BackgroundConfigs)
	local RotationOffset = AssignResult.RotationOffset
	Child:PivotTo(CFrame.new(Camera.CFrame.Position + AssignResult.DistanceToCamera * Camera.CFrame.LookVector + AssignResult.PositionOffset) * CFrame.Angles(math.rad(RotationOffset.X), math.rad(RotationOffset.Y), (math.rad(RotationOffset.Z))))
end

return {
	initialize = function(p1)
		-- upvalues: configureCamera (copy), FFlagSkipBackgroundModelMoveInWorkspace (copy), Workspace1 (copy), ReplicatedStorage (copy), configureBackground (copy)
		local CurrentCamera = workspace.CurrentCamera
		
		if CurrentCamera == nil then
			CurrentCamera = Instance.new("Camera")
			CurrentCamera.Parent = workspace
		end
		local Camera = CurrentCamera
		configureCamera(Camera, p1.CameraConfigs)
		local BackgroundConfigs = p1.BackgroundConfigs
		local BackgroundModelName = BackgroundConfigs.BackgroundModelName
		
		if FFlagSkipBackgroundModelMoveInWorkspace then
			local BackgroundModelName1 = Workspace1:FindFirstChild(BackgroundModelName)
			
			if BackgroundModelName1 then
				return BackgroundModelName1, Camera
			end
		end
		assert(ReplicatedStorage:FindFirstChild(BackgroundModelName) ~= nil, string.format("Background Model %s is missing in ReplicatedStorage.", BackgroundModelName))
		local BackgroundModelName2 = ReplicatedStorage:WaitForChild(BackgroundModelName)
		
		if BackgroundModelName2 then
			BackgroundModelName2.Parent = workspace
		end
		configureBackground(BackgroundModelName2, Camera, BackgroundConfigs)
		
		return BackgroundModelName2, Camera
	end,
	getBackgroundInstance = function(ChildName)
		return (workspace:FindFirstChild(ChildName))
	end,
	updateXPosition = function(ChildName, X)
		local ChildName1 = workspace:FindFirstChild(ChildName)
		
		if ChildName1 then
			local Pivot = ChildName1:GetPivot()
			local Position = Pivot.Position
			ChildName1:PivotTo(CFrame.new((Vector3.new(X, Position.Y, Position.Z))) * (Pivot - Position))
		end
	end,
	updateZPosition = function(ChildName, Z)
		local ChildName1 = workspace:FindFirstChild(ChildName)
		
		if ChildName1 then
			local Pivot = ChildName1:GetPivot()
			local Position = Pivot.Position
			ChildName1:PivotTo(CFrame.new((Vector3.new(Position.X, Position.Y, Z))) * (Pivot - Position))
		end
	end
}