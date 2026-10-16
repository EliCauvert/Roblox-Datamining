local CurveAnimationHierarchyUtilsModule = require(script.Parent.Parent.util.CurveAnimationHierarchyUtils)

local function hasFloatCurveKeys(Position): boolean --[[ Line: 33 ]]
	for _, FloatCurve in Position:GetChildren() do
		if FloatCurve:IsA("FloatCurve") and #FloatCurve:GetKeys() > 0 then
			return true
		end
	end
	return false
end

local function _(Object) --[[ Line: 42 | Named "rotationCurveHasKeys" ]]
	-- upvalues: hasFloatCurveKeys (copy)
	return if Object:IsA("EulerRotationCurve") then hasFloatCurveKeys(Object) elseif Object:IsA("RotationCurve") then Object:GetNumberOfKeys() > 0 else false
end

local function folderHasTracks(Object) --[[ Line: 51 ]]
	-- upvalues: hasFloatCurveKeys (copy)
	local Position = Object:FindFirstChild("Position")
	local Rotation = Object:FindFirstChild("Rotation")
	local Flag = nil
	repeat
		if Position ~= nil and Position:IsA("Vector3Curve") then
			Flag = hasFloatCurveKeys(Position)
			
			if Flag then break end
		end
		Flag = false
		
		if Rotation == nil then break end
		if Rotation:IsA("EulerRotationCurve") then
			return (hasFloatCurveKeys(Rotation))
		end
		if Rotation:IsA("RotationCurve") then
			return Rotation:GetNumberOfKeys() > 0
		end
		Flag = false
	until true
	return Flag
end

local function subtreeHasTracks(Folder): boolean --[[ Line: 61 ]]
	-- upvalues: folderHasTracks (copy)
	if folderHasTracks(Folder) then
		return true
	end
	for _, Folder1 in Folder:GetDescendants() do
		if Folder1:IsA("Folder") and folderHasTracks(Folder1) then
			return true
		end
	end
	return false
end

local _ = function(Object) --[[ Line: 73 | Named "getFolderRoot" ]]
	for _, Folder in Object:GetChildren() do
		if Folder:IsA("Folder") then
			return Folder
		end
	end
	return nil
end

local function getAnimLength(Object) --[[ Line: 82 ]]
	local Time = 0
	
	for _, descendant in Object:GetDescendants() do
		if not descendant:IsA("FloatCurve") then
			if descendant:IsA("RotationCurve") then
				local NumberOfKeys: number = descendant:GetNumberOfKeys()
				
				if NumberOfKeys > 0 then
					local KeyAtIndex = descendant:GetKeyAtIndex(NumberOfKeys)
					
					if Time < KeyAtIndex.Time then
						Time = KeyAtIndex.Time
						continue
					end
					continue
				end
				continue
			end
			continue
		end
		for _, key in descendant:GetKeys() do
			if Time < key.Time then
				Time = key.Time
			end
		end
	end
	return Time
end

local function samplePosition(Object, Time) --[[ Line: 104 ]]
	local Position = Object:FindFirstChild("Position")
	
	if Position and Position:IsA("Vector3Curve") then
		local X = Position:FindFirstChild("X")
		local Y = Position:FindFirstChild("Y")
		local Z = Position:FindFirstChild("Z")
		
		return (Vector3.new(if X and X:IsA("FloatCurve") then X:GetValueAtTime(Time) else 0, if Y and Y:IsA("FloatCurve") then Y:GetValueAtTime(Time) else 0, if Z and Z:IsA("FloatCurve") then Z:GetValueAtTime(Time) else 0))
	else
		return vector.create(0, 0, 0)
	end
end

local function sampleRotation(Object, p1) --[[ Line: 119 ]]
	local Rotation = Object:FindFirstChild("Rotation")
	
	return if Rotation then if Rotation:IsA("EulerRotationCurve") then Rotation:GetRotationAtTime(p1) elseif Rotation:IsA("RotationCurve") then Rotation:GetRotationAtTime(p1) else CFrame.new() else CFrame.new()
end

local function buildPoseAtTime(Folder, Smallest, p1) --[[ Line: 134 ]]
	-- upvalues: samplePosition (copy), sampleRotation (copy), CurveAnimationHierarchyUtilsModule (copy), subtreeHasTracks (copy), buildPoseAtTime (copy)
	local Pose = Instance.new("Pose")
	Pose.Name = Folder.Name
	Pose.Weight = 1
	Pose.CFrame = sampleRotation(Folder, Smallest) + samplePosition(Folder, Smallest)
	local t = {}
	
	for _, Folder1 in Folder:GetChildren() do
		if Folder1:IsA("Folder") and not p1[Folder1.Name] and (CurveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(Folder1.Name) or Folder1.Name == CurveAnimationHierarchyUtilsModule.humanoidRootPartName or subtreeHasTracks(Folder1)) then
			p1[Folder1.Name] = true
			buildPoseAtTime(Folder1, Smallest, p1).Parent = Pose
			t[Folder1.Name] = true
		end
	end
	for _, value in CurveAnimationHierarchyUtilsModule.calculateAcceptableChildBodyPartFolders(Folder.Name) do
		local Name = value.Name
		
		if Name and not t[Name] and not p1[Name] then
			p1[Name] = true
			local Pose1 = Instance.new("Pose")
			Pose1.Name = Name
			Pose1.CFrame = CFrame.new()
			Pose1.Weight = 1
			Pose1.Parent = Pose
			t[Name] = true
		end
	end
	return Pose
end

return function(Object, p2) --[[ Line: 179 | Named "buildEmoteKeyframeSequenceFromCurveAnim" ]]
	-- upvalues: getAnimLength (copy), buildPoseAtTime (copy)
	local P14 = p2 or 0.041666666666666664
	local v1 = nil
	
	for _, Folder in Object:GetChildren() do
		if Folder:IsA("Folder") then
			v1 = Folder
			break
		end
	end
	if not v1 then
		warn("[buildEmoteKeyframeSequenceFromCurveAnim]: no folder root found in CurveAnimation")
		
		return Instance.new("KeyframeSequence")
	end
	local AnimLength: number = getAnimLength(v1)
	
	if AnimLength <= 0 then
		warn("[buildEmoteKeyframeSequenceFromCurveAnim]: animation has no keyframes")
		
		return Instance.new("KeyframeSequence")
	end
	local EmoteAnimation = Instance.new("KeyframeSequence")
	EmoteAnimation.Name = "EmoteAnimation"
	local Total = 0
	while Total <= AnimLength + P14 * 0.5 do
		local Smallest = math.min(Total, AnimLength)
		local Keyframe = Instance.new("Keyframe")
		Keyframe.Time = Smallest
		buildPoseAtTime(v1, Smallest, { [v1.Name] = true }).Parent = Keyframe
		Keyframe.Parent = EmoteAnimation
		Total += P14
	end
	return EmoteAnimation
end