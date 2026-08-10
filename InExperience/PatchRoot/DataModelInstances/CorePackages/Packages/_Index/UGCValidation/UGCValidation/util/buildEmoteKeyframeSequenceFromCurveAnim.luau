local curveAnimationHierarchyUtilsModule = require(script.Parent.Parent.util.CurveAnimationHierarchyUtils)

local function hasFloatCurveKeys(p0) --[[ line: 33 ]]
	for i, v in p0:GetChildren() do
		if v:IsA("FloatCurve") and #v:GetKeys() > 0 then
			return true
		end
	end
	return false
end

local function _(p1) --[[ line: 42 | named "rotationCurveHasKeys" ]]
	-- upvalues: hasFloatCurveKeys (ref)
	return if p1:IsA("EulerRotationCurve") then hasFloatCurveKeys(p1) elseif p1:IsA("RotationCurve") then p1:GetNumberOfKeys() > 0 else false
end

local function folderHasTracks(p2) --[[ line: 51 ]]
	-- upvalues: hasFloatCurveKeys (ref)
	local var10
	local position = p2:FindFirstChild("Position")
	local rotation = p2:FindFirstChild("Rotation")
	
	if position ~= nil and position:IsA("Vector3Curve") then
		var10 = hasFloatCurveKeys(position)
		
		if not var10 then
			var10 = false
			
			if rotation ~= nil then
				if rotation:IsA("EulerRotationCurve") then
					return hasFloatCurveKeys(rotation)
				elseif rotation:IsA("RotationCurve") then
					return rotation:GetNumberOfKeys() > 0
				end
				var10 = false
			end
		end
		return var10
	end
end

local function subtreeHasTracks(p3) --[[ line: 61 ]]
	-- upvalues: folderHasTracks (ref)
	if folderHasTracks(p3) then
		return true
	end
	for i, v in p3:GetDescendants() do
		if v:IsA("Folder") and folderHasTracks(v) then
			return true
		end
	end
	return false
end

local _ = function(p4) --[[ line: 73 | named "getFolderRoot" ]]
	for i, v in p4:GetChildren() do
		if v:IsA("Folder") then
			return v
		end
	end
	return nil
end

local function getAnimLength(p5) --[[ line: 82 ]]
	local var11 = 0
	
	for i, v in p5:GetDescendants() do
		if not v:IsA("FloatCurve") then
			if v:IsA("RotationCurve") then
				local numberOfKeys = v:GetNumberOfKeys()
				
				if numberOfKeys > 0 then
					local var13 = v:GetKeyAtIndex(numberOfKeys)
					
					if var11 < var13.Time then
						var11 = var13.Time
					end
				end
			end
		end
		for i_1, v_1 in v:GetKeys() do
			if var11 < v_1.Time then
				var11 = v_1.Time
			end
		end
	end
	return var11
end

local function samplePosition(p6, p7) --[[ line: 104 ]]
	local position = p6:FindFirstChild("Position")
	
	if not position or not position:IsA("Vector3Curve") then
		return Vector3.new(0, 0, 0)
	end
	local x = position:FindFirstChild("X")
	local y = position:FindFirstChild("Y")
	local z = position:FindFirstChild("Z")
	
	return Vector3.new(if x and x:IsA("FloatCurve") then x:GetValueAtTime(p7) else 0, if y and y:IsA("FloatCurve") then y:GetValueAtTime(p7) else 0, if z and z:IsA("FloatCurve") then z:GetValueAtTime(p7) else 0)
end

local function sampleRotation(p8, p9) --[[ line: 119 ]]
	local rotation = p8:FindFirstChild("Rotation")
	
	return if rotation then if rotation:IsA("EulerRotationCurve") then rotation:GetRotationAtTime(p9) elseif rotation:IsA("RotationCurve") then rotation:GetRotationAtTime(p9) else CFrame.new() else CFrame.new()
end

local function buildPoseAtTime(p10, p11, p12) --[[ line: 134 ]]
	-- upvalues: samplePosition (ref), sampleRotation (ref), curveAnimationHierarchyUtilsModule (ref), subtreeHasTracks (ref), buildPoseAtTime (ref)
	local pose = Instance.new("Pose")
	pose.Name = p10.Name
	pose.Weight = 1
	pose.CFrame = sampleRotation(p10, p11) + samplePosition(p10, p11)
	local t = {}
	
	for i, v in p10:GetChildren() do
		if v:IsA("Folder") and not p12[v.Name] and (curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(v.Name) or v.Name == curveAnimationHierarchyUtilsModule.humanoidRootPartName or subtreeHasTracks(v)) then
			p12[v.Name] = true
			buildPoseAtTime(v, p11, p12).Parent = pose
			t[v.Name] = true
		end
	end
	for i, v in curveAnimationHierarchyUtilsModule.calculateAcceptableChildBodyPartFolders(p10.Name) do
		local name = v.Name
		
		if name and not t[name] and not p12[name] then
			p12[name] = true
			local pose_1 = Instance.new("Pose")
			pose_1.Name = name
			pose_1.CFrame = CFrame.new()
			pose_1.Weight = 1
			pose_1.Parent = pose
			t[name] = true
		end
	end
	return pose
end

return function(p13, p14) --[[ line: 179 | named "buildEmoteKeyframeSequenceFromCurveAnim" ]]
	-- upvalues: getAnimLength (ref), buildPoseAtTime (ref)
	local var23, v
	p14 = p14 or 0.041666666667
	
	for i, v in p13:GetChildren() do
		if v:IsA("Folder") then
			var23 = v
			if not var23 then
				warn("[buildEmoteKeyframeSequenceFromCurveAnim]: no folder root found in CurveAnimation")
				
				return Instance.new("KeyframeSequence")
			end
			local var24 = getAnimLength(var23)
			
			if var24 <= 0 then
				warn("[buildEmoteKeyframeSequenceFromCurveAnim]: animation has no keyframes")
				
				return Instance.new("KeyframeSequence")
			end
			local emoteAnimation = Instance.new("KeyframeSequence")
			emoteAnimation.Name = "EmoteAnimation"
			local var26 = 0
			while var26 <= var24 + p14 * 0.5 do
				local minValue = math.min(var26, var24)
				v = Instance.new("Keyframe")
				v.Time = minValue
				buildPoseAtTime(var23, minValue, { [var23.Name] = true }).Parent = v
				v.Parent = emoteAnimation
				var26 += p14
			end
			return emoteAnimation
		end
	end
	var23 = nil
end