local curveAnimationHierarchyUtilsModule = require(script.Parent.Parent.util.CurveAnimationHierarchyUtils)

local function hasFloatCurveKeys(p1)
	for i, v in p1:GetChildren() do
		if v:IsA("FloatCurve") and #v:GetKeys() > 0 then
			return true
		end
	end
	return false
end

local function _(p2)
	-- upvalues: hasFloatCurveKeys (ref)
	return if p2:IsA("EulerRotationCurve") then hasFloatCurveKeys(p2) elseif p2:IsA("RotationCurve") then p2:GetNumberOfKeys() > 0 else false
end

local function folderHasTracks(p2)
	-- upvalues: hasFloatCurveKeys (ref)
	local var1
	local position = p2:FindFirstChild("Position")
	local rotation = p2:FindFirstChild("Rotation")
	
	if position ~= nil and position:IsA("Vector3Curve") then
		var1 = hasFloatCurveKeys(position)
		
		if not var1 then
			var1 = false
			
			if rotation ~= nil then
				if rotation:IsA("EulerRotationCurve") then
					return hasFloatCurveKeys(rotation)
				elseif rotation:IsA("RotationCurve") then
					return rotation:GetNumberOfKeys() > 0
				end
				var1 = false
			end
		end
		return var1
	end
end

local function subtreeHasTracks(p2)
	-- upvalues: folderHasTracks (ref)
	if folderHasTracks(p2) then
		return true
	end
	for i, v in p2:GetDescendants() do
		if v:IsA("Folder") and folderHasTracks(v) then
			return true
		end
	end
	return false
end

local _ = function(p3)
	for i, v in p3:GetChildren() do
		if v:IsA("Folder") then
			return v
		end
	end
	return nil
end

local function getAnimLength(p4)
	local var1 = 0
	
	for i, v in p4:GetDescendants() do
		if not v:IsA("FloatCurve") then
			if v:IsA("RotationCurve") then
				local numberOfKeys = v:GetNumberOfKeys()
				
				if numberOfKeys > 0 then
					local var2 = v:GetKeyAtIndex(numberOfKeys)
					
					if var1 < var2.Time then
						var1 = var2.Time
					end
				end
			end
		end
		for i_1, v_1 in v:GetKeys() do
			if var1 < v_1.Time then
				var1 = v_1.Time
			end
		end
	end
	return var1
end

local function samplePosition(p5, p6)
	local position = p5:FindFirstChild("Position")
	
	if not position or not position:IsA("Vector3Curve") then
		return Vector3.new(0, 0, 0)
	end
	local x = position:FindFirstChild("X")
	local y = position:FindFirstChild("Y")
	local z = position:FindFirstChild("Z")
	
	return Vector3.new(if x and x:IsA("FloatCurve") then x:GetValueAtTime(p6) else 0, if y and y:IsA("FloatCurve") then y:GetValueAtTime(p6) else 0, if z and z:IsA("FloatCurve") then z:GetValueAtTime(p6) else 0)
end

local function sampleRotation(p5, p6)
	local rotation = p5:FindFirstChild("Rotation")
	
	return if rotation then if rotation:IsA("EulerRotationCurve") then rotation:GetRotationAtTime(p6) elseif rotation:IsA("RotationCurve") then rotation:GetRotationAtTime(p6) else CFrame.new() else CFrame.new()
end

local function buildPoseAtTime(p5, p6, p7)
	-- upvalues: samplePosition (ref), sampleRotation (ref), curveAnimationHierarchyUtilsModule (ref), subtreeHasTracks (ref), buildPoseAtTime (ref)
	local pose = Instance.new("Pose")
	pose.Name = p5.Name
	pose.Weight = 1
	pose.CFrame = sampleRotation(p5, p6) + samplePosition(p5, p6)
	local t = {}
	
	for i, v in p5:GetChildren() do
		if v:IsA("Folder") and not p7[v.Name] and (curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(v.Name) or v.Name == curveAnimationHierarchyUtilsModule.humanoidRootPartName or subtreeHasTracks(v)) then
			p7[v.Name] = true
			buildPoseAtTime(v, p6, p7).Parent = pose
			t[v.Name] = true
		end
	end
	for i, v in curveAnimationHierarchyUtilsModule.calculateAcceptableChildBodyPartFolders(p5.Name) do
		local name = v.Name
		
		if name and not t[name] and not p7[name] then
			p7[name] = true
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

return function(p8, p9)
	-- upvalues: getAnimLength (ref), buildPoseAtTime (ref)
	local var3, v
	p9 = p9 or 0.041666666667
	
	for i, v in p8:GetChildren() do
		if v:IsA("Folder") then
			var3 = v
			if not var3 then
				warn("[buildEmoteKeyframeSequenceFromCurveAnim]: no folder root found in CurveAnimation")
				
				return Instance.new("KeyframeSequence")
			end
			local var4 = getAnimLength(var3)
			
			if var4 <= 0 then
				warn("[buildEmoteKeyframeSequenceFromCurveAnim]: animation has no keyframes")
				
				return Instance.new("KeyframeSequence")
			end
			local emoteAnimation = Instance.new("KeyframeSequence")
			emoteAnimation.Name = "EmoteAnimation"
			local var5 = 0
			while var5 <= var4 + p9 * 0.5 do
				local minValue = math.min(var5, var4)
				v = Instance.new("Keyframe")
				v.Time = minValue
				buildPoseAtTime(var3, minValue, { [var3.Name] = true }).Parent = v
				v.Parent = emoteAnimation
				var5 += p9
			end
			return emoteAnimation
		end
	end
	var3 = nil
end