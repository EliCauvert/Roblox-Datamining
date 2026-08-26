local animationClipProviderService = game:GetService("AnimationClipProvider")
local insertService = game:GetService("InsertService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local emoteUtilityFallbackKeyframeSequenceAssetId = game:DefineFastString("EmoteUtilityFallbackKeyframeSequenceAssetId", "10921261056")
local emoteUtilityDefaultMoodFromCharacter = game:DefineFastFlag("EmoteUtilityDefaultMoodFromCharacter", false)
local emoteUtilityUseIdleAnimationFallback = game:DefineFastFlag("EmoteUtilityUseIdleAnimationFallback", false)
local emoteUtilityReportPoseAnimationDownloadFailure = game:DefineFastFlag("EmoteUtilityReportPoseAnimationDownloadFailure", false)
local t = {
	FallbackKeyframeSequenceAssetId = emoteUtilityFallbackKeyframeSequenceAssetId,
	debugLoadAssetsFromFiles = false,
	mapAssetIdToFileName = nil,
	EmoteUtilitySupportAJU = true,
	FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL = "http://www.roblox.com/asset/?id=" .. emoteUtilityFallbackKeyframeSequenceAssetId
}
local t_1 = {}

local function _()
	-- upvalues: t_1 (write)
	t_1 = {}
end

local _ = function(p1)
	-- upvalues: t_1 (write)
	t_1[p1] = true
end

local _ = function(p1)
	-- upvalues: t_1 (write)
	return t_1[p1]
end

local _ = function(value, p1)
	return math.sqrt(p1.X ^ 2 + p1.Y ^ 2 + p1.Z ^ 2) / 2 * (1 / math.tan(math.rad(value) / 2))
end

local _ = function()
	local ok, status = pcall(function()
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	
	return ok and status
end

local _ = function()
	local ok, status = pcall(function()
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	
	return if ok and status then "RCC" else "Client"
end

local _ = function(p1, p2)
	-- upvalues: rbxAnalyticsService (ref)
	local ok, status = pcall(function()
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	rbxAnalyticsService:ReportCounter((if ok and status then "RCC" else "Client") .. "_" .. p3 .. "_" .. (if p2 then "Success" else "Failure"))
end

local function getAnimationAndIsIdle(p1)
	-- upvalues: t (ref), rbxAnalyticsService (ref)
	local var1, var2
	assert(if typeof(p1) ~= "number" then typeof(p1) == "string" else true, "getAnimationAndIsIdle expects animationAssetIdOrUrl to be a number or string")
	local var3 = nil
	local _ = nil
	local _ = nil
	
	if typeof(p1) == "number" then
		local _ = nil
		local var4, var5 = t.LoadAsset(p1)
		var1 = var4
		local var6 = var5
		
		if var1 and var6 then
			var3 = var6:GetChildren()[1]
		end
		var2 = "EmoteUtility_LoadAsset"
	else
		local _ = nil
		local ok, status = pcall(function()
			-- upvalues: p1 (ref)
			return game:GetObjects(p1)[1]
		end)
		var1 = ok
		local var7 = status
		
		if var1 and var7 then
			var3 = var7
		end
		var2 = "EmoteUtility_GetObjects"
	end
	local var8 = var2
	local var9 = var1
	local ok, status = pcall(function()
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	rbxAnalyticsService:ReportCounter((if ok and status then "RCC" else "Client") .. "_" .. var33 .. "_" .. (if var9 then "Success" else "Failure"))
	
	if not var1 or not var3 then
		local text = var2 .. "_Failed"
		local ok_1, status_1 = pcall(function()
			return game.GetService(game, "ThumbnailGenerator") ~= nil
		end)
		rbxAnalyticsService:SendEventDeferred(if ok_1 and status_1 then "RCC" else "Client", "EmoteUtility_getPoseAsset", text, { animationAssetIdOrUrl = p1 })
		
		return nil, nil
	end
	assert(var3, "animation is non-nil. Silence type checker.")
	local var10 = false
	
	if var3.ClassName == "Folder" then
		var10 = true
		local var11 = var3:FindFirstChild("Pose", true) or var3:FindFirstChild("pose", true)
		
		if var11 == nil then
			var11 = var3:FindFirstChild("Idle", true) or var3:FindFirstChild("idle", true)
		end
		var3 = if var11 then var11:FindFirstChildWhichIsA("Animation", true) else var3:FindFirstChildWhichIsA("Animation", true)
	end
	return var3, var10
end

local function getAnimationClipByAssetId(value)
	-- upvalues: t (ref), animationClipProviderService (ref), rbxAnalyticsService (ref)
	local var1
	local _ = nil
	local var2 = nil
	
	if t.debugLoadAssetsFromFiles then
		local var3 = nil
		
		for i in string.gmatch(value, ".*id=([0-9]+)") do
			var3 = i
		end
		assert(var3, "assetId should be non-nil")
		local var4 = tonumber(var3)
		assert(var4, "assetIdAsNumber should be non-nil")
		local _ = nil
		local var5, var6 = t.LoadAsset(var4)
		var1 = var5
		local var7 = var6
		
		if var1 and var7 then
			var2 = var7
		end
	else
		local ok, status = pcall(function()
			-- upvalues: animationClipProviderService (copy), value (ref)
			return animationClipProviderService:GetAnimationClipAsync(value)
		end)
		var1 = ok
		var2 = status
	end
	local var8 = var1
	local ok, status = pcall(function()
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	rbxAnalyticsService:ReportCounter((if ok and status then "RCC" else "Client") .. "_" .. "EmoteUtility_GetAnimationClipAsync" .. "_" .. (if var8 then "Success" else "Failure"))
	
	if var1 then
		return var2
	end
	local ok_1, status_1 = pcall(function()
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	rbxAnalyticsService:SendEventDeferred(if ok_1 and status_1 then "RCC" else "Client", "EmoteUtility_GetAnimationClip", "EmoteUtility_GetAnimationClip_GetAnimationClipAsyncFailed", { keyframeSequenceId = value })
	
	return nil
end

local function getThumbnailKeyframeFromAnimationOrUrl(p1, p2, p3)
	-- upvalues: getAnimationClipByAssetId (ref), t (ref)
	local var9
	local var10 = p3
	local thumbnailTime = nil
	local _ = nil
	
	if typeof(p1) == "string" then
		var9 = getAnimationClipByAssetId(p1)
	else
		var10 = t.GetNumberValueWithDefault(p1, "ThumbnailKeyframe", p3)
		thumbnailTime = t.GetNumberValueWithDefault(p1, "ThumbnailTime", nil)
		var9 = t.GetAnimationClip(p1)
	end
	if not var9 then
		return nil
	elseif var9:IsA("KeyframeSequence") then
		return t.GetThumbnailKeyframe(var10, var9, p2)
	elseif var9:IsA("CurveAnimation") then
		return t.GetThumbnailKeyframeFromCurve(thumbnailTime, var9, p2)
	end
	error("Unsupported Animation type:" .. var48.ClassName)
	
	return nil
end

local _ = function(value, p1, p2)
	pcall(function()
		-- upvalues: value (ref), p1 (ref), p2 (ref)
		value[p1] = p2
	end)
end

local function applyControlsFolder(p1, p2, p3)
	if not p2 then return end
	assert(p2, "parentPose is non-nil. Silence type checker.")
	local name = p1:FindFirstChild(p2.Name)
	
	if not name then return end
	local name_1 = name:FindFirstChild(p3.Name)
	
	if not name_1 then return end
	for i, v in p3:GetChildren() do
		if v:IsA("NumberPose") then
			local name_2 = v.Name
			local value = v.Value
			pcall(function()
				-- upvalues: name_1 (ref), name_2 (ref), value (ref)
				name_1[name_2] = value
			end)
		end
	end
end

local function applyKeyframeInner(p4, p5)
	-- upvalues: t (ref), t_1 (write), applyControlsFolder (ref)
	local function recurApplyPoses(p6, p7)
		-- upvalues: p4 (ref), t (copy), t_1 (copy), applyControlsFolder (copy), recurApplyPoses (ref)
		if p6 and p7:IsA("Pose") then
			local jointBetween = t.GetJointBetween(p4:FindFirstChild(p6.Name), p4:FindFirstChild(p7.Name))
			
			if jointBetween and not (if not t_1[jointBetween] then false else true) then
				assert(jointBetween, "joint is non-nil. Silence type checker.")
				jointBetween.Transform = p7.CFrame
				t_1[jointBetween] = true
			end
		end
		if p7:IsA("Folder") then
			applyControlsFolder(p4, p6, p7)
			
			return
		end
		for i, v in p7:GetChildren() do
			recurApplyPoses(p7, v)
		end
	end
	
	if p5 then
		for i, v in pairs(p5:GetPoses()) do
			if not v:IsA("Folder") then
				for i_1, v_1 in v:GetChildren() do
					recurApplyPoses(v, v_1)
				end
			end
		end
	end
end

local function getRotatedKeyframe(p8, p9)
	if not p9 or p9 == 0 then
		return p8
	end
	assert(p9, "rotationDegrees is non-nil. Silence type checker.")
	local var9 = p8:Clone()
	local var10 = var9:GetPoses()[1]
	
	if var10 then
		local var11 = var10:GetSubPoses()[1]
		
		if var11 then
			var11.CFrame *= CFrame.Angles(0, math.rad(p9), 0)
		end
	end
	return var9
end

local function getRotationCFrame(p8, p9)
	if p8:IsA("EulerRotationCurve") then
		return p8:GetRotationAtTime(p9)
	elseif p8:IsA("RotationCurve") then
		return p8:GetValueAtTime(p9)
	end
	error("Unsupported rotation type:" .. p20.ClassName)
	
	return nil
end

local function findAttachmentsRecur(p8, p9)
	-- upvalues: findAttachmentsRecur (ref)
	for i, v in pairs(p8:GetChildren()) do
		if v:IsA("Attachment") then
			p9[v.Name] = v
		elseif not v:IsA("Tool") and not v:IsA("Accoutrement") then
			findAttachmentsRecur(v, p9)
		end
	end
end

local _ = function(p10)
	-- upvalues: findAttachmentsRecur (ref)
	local t = {}
	findAttachmentsRecur(p10, t)
	
	return t
end

local _ = function(p10)
	-- upvalues: findAttachmentsRecur (ref)
	local t = {}
	findAttachmentsRecur(p10, t)
	
	return t
end

local _ = function(p10, p11)
	local weld = Instance.new("Weld")
	weld.Part0 = p10.Parent
	weld.Part1 = p11.Parent
	weld.C0 = p10.CFrame
	weld.C1 = p11.CFrame
	weld.Parent = p10.Parent
	
	return weld
end

local function attachToolToCharacter(p10, p11, p12)
	-- upvalues: findAttachmentsRecur (ref)
	local t = {}
	findAttachmentsRecur(p10, t)
	local t_1 = {}
	findAttachmentsRecur(p12, t_1)
	local var9 = false
	
	for i, v in pairs(t_1) do
		local name = t[v.Name]
		
		if name then
			var9 = true
			local weld = Instance.new("Weld")
			weld.Part0 = name.Parent
			weld.Part1 = v.Parent
			weld.C0 = name.CFrame
			weld.C1 = v.CFrame
			weld.Parent = name.Parent
		end
	end
	if var9 then
		p12.Parent = p10
		
		return
	end
	p12.Parent = nil
	local handle = p12:FindFirstChild("Handle")
	local grip = p12.Grip
	
	if handle and grip then
		local rightGripAttachment = t.RightGripAttachment
		
		if rightGripAttachment then
			handle.CFrame = rightGripAttachment.Parent.CFrame * rightGripAttachment.CFrame * grip:Inverse()
		end
	end
	p11:EquipTool(p12)
end

local function applyR15KeyframeWithTool(p13, p14, p15, p16, p17, p18, p19)
	-- upvalues: applyKeyframeInner (ref), attachToolToCharacter (ref)
	if p19 then
		applyKeyframeInner(p13, p19)
		applyKeyframeInner(p13, p17)
	else
		applyKeyframeInner(p13, p18)
		
		if p16 ~= nil then
			applyKeyframeInner(p13, p17)
		end
	end
	attachToolToCharacter(p13, p14, p15)
end

local function getMainThumbnailKeyframe(p13, p14, p15, p16)
	-- upvalues: getAnimationAndIsIdle (ref), t (ref), getThumbnailKeyframeFromAnimationOrUrl (ref), emoteUtilityUseIdleAnimationFallback (ref)
	local var10 = nil
	local var11 = false
	local animationId = nil
	
	if p14 then
		animationId = p14
		local var12, var13 = getAnimationAndIsIdle(p14)
		
		if var12 == nil then
			return nil, var11, animationId
		end
		assert(var12, "animation is non-nil. Silence type checker.")
		
		if not var13 then
			var11 = true
		end
		var10 = getThumbnailKeyframeFromAnimationOrUrl(var12, if p15 then t.GetNumberValueWithDefault(var12, "ThumbnailCharacterRotation", 0) else 0)
		
		return var10, var11, animationId
	elseif p16 then
		local FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL = t.FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL
		local animate = p13:FindFirstChild("Animate")
		
		if animate then
			local var14 = animate:FindFirstChild("Pose") or animate:FindFirstChild("pose")
			
			if not var14 and emoteUtilityUseIdleAnimationFallback then
				var14 = animate:FindFirstChild("Idle") or animate:FindFirstChild("idle")
			end
			local var15 = if var14 then var14:FindFirstChildOfClass("Animation") else nil
			
			if var15 then
				FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL = var15
			end
		end
		var10 = getThumbnailKeyframeFromAnimationOrUrl(FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL, 0, 1)
		
		if typeof(FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL) == "string" then
			return var10, var11, FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL
		end
		animationId = FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL.AnimationId
	end
	return var10, var11, animationId
end

local _ = function(p13)
	-- upvalues: getAnimationAndIsIdle (ref), getThumbnailKeyframeFromAnimationOrUrl (ref)
	if not p13 then
		return nil
	end
	assert(p13, "moodAssetId is non-nil. Silence type checker.")
	local var10, _ = getAnimationAndIsIdle(p13)
	
	if var10 == nil then
		return nil
	end
	assert(var10, "animation is non-nil. Silence type checker.")
	
	return getThumbnailKeyframeFromAnimationOrUrl(var10, 0)
end

local function getToolKeyframes(p13, p14)
	-- upvalues: t (ref)
	local thumbnailPose = nil
	local thumbnailKeyframe = nil
	local tool = p13:FindFirstChildOfClass("Tool")
	
	if not tool then
		return nil, nil
	end
	assert(tool, "tool is non-nil. Silence type checker.")
	local var10 = false
	
	if not p14 then
		thumbnailPose = tool:FindFirstChild("ThumbnailPose")
		
		if thumbnailPose and thumbnailPose:IsA("Keyframe") then
			var10 = true
		end
	end
	if not var10 then
		thumbnailPose = nil
		local animate = p13:FindFirstChild("Animate")
		
		if not animate then
			return nil, nil
		end
		assert(animate, "animateScript is non-nil. Silence type checker.")
		local toolnone = animate:FindFirstChild("toolnone")
		
		if not toolnone then
			return nil, nil
		end
		assert(toolnone, "toolNoneStringValue is non-nil. Silence type checker.")
		local toolNoneAnim = toolnone:FindFirstChild("ToolNoneAnim")
		
		if toolNoneAnim then
			local animationClip = t.GetAnimationClip(toolNoneAnim)
			
			if not animationClip then
				return nil, nil
			end
			assert(animationClip, "toolAnimationClip is non-nil. Silence type checker.")
			assert(animationClip:IsA("KeyframeSequence"), "ToolNoneAnim must be a KeyframeSequence")
			thumbnailKeyframe = t.GetThumbnailKeyframe(nil, animationClip, 0)
			
			if tool:IsDescendantOf(p13) then
				return thumbnailPose, thumbnailKeyframe
			else
				return nil, nil
			end
		end
	end
end

local function getAttachmentCFrame(p13)
	local cFrame = p13.CFrame
	local parent = p13.Parent
	while parent and parent:IsA("Bone") do
		cFrame = parent.CFrame * cFrame
		parent = parent.Parent
	end
	return cFrame
end

local function getJointParts(p14)
	if p14:IsA("JointInstance") then
		return p14.Part0, p14.Part1
	elseif p14:IsA("Constraint") then
		local attachment0 = p14.Attachment0
		local attachment1 = p14.Attachment1
		
		return attachment0 and attachment0:FindFirstAncestorWhichIsA("BasePart"), attachment1 and attachment1:FindFirstAncestorWhichIsA("BasePart")
	end
	return nil, nil
end

local function applyCFrame(p14, p15, p16, p17)
	-- upvalues: getAttachmentCFrame (ref)
	if p16:IsA("AnimationConstraint") then
		p15.CFrame = p14.CFrame * getAttachmentCFrame(p16.Attachment0) * p17 * getAttachmentCFrame(p16.Attachment1):Inverse()
		
		return
	elseif p16:IsA("Motor6D") then
		local c0 = p16.C0
		local c1 = p16.C1
		p15.Anchored = true
		p15.CFrame = p14.CFrame * c0 * p17 * c1:Inverse()
	end
end

local function getJointPose(p14)
	if p14:IsA("AnimationConstraint") then
		return p14.Transform
	elseif not p14:IsA("Motor6D") then
		error("Unsupported joint type:" .. p51.ClassName)
		
		return CFrame.new()
	end
	local transform = p14.Transform
	
	if p14.CurrentAngle ~= 0 then
		transform *= CFrame.Angles(0, 0, p14.CurrentAngle)
	end
	return transform
end

function t.ForceAnimationToStep(p14)
	-- upvalues: getJointParts (ref), getJointPose (ref), applyCFrame (ref)
	local v
	local list = { p14:FindFirstChild("HumanoidRootPart") }
	local t = {}
	local t_1 = {}
	while #list > 0 do
		local removed = table.remove(list, 1)
		
		if t[removed] then continue end
		t[removed] = true
		
		for i, v in removed:GetJoints() do
			if v:IsA("Motor6D") or v:IsA("AnimationConstraint") then
				local var10, var11 = getJointParts(v)
				
				if var10 == removed and var11 and not t[var11] then
					table.insert(t_1, { part0 = removed, part1 = var11, joint = v })
					table.insert(list, var11)
				end
			end
		end
	end
	for i, v_1 in p14:GetDescendants() do
		if v_1:IsA("AnimationConstraint") then
			v_1.Enabled = false
		end
	end
	for i, v_2 in t_1 do
		v = v_2.joint
		
		if v:IsA("Motor6D") or v:IsA("AnimationConstraint") then
			applyCFrame(v_2.part0, v_2.part1, v, getJointPose(v))
		end
	end
end

function t.LoadAsset(p15)
	-- upvalues: t (ref), insertService (ref)
	local ok, status = pcall(function()
		-- upvalues: t (copy), p15 (ref), insertService (copy)
		return if t.debugLoadAssetsFromFiles and t.mapAssetIdToFileName then insertService:LoadLocalAsset("rbxasset://" .. t.mapAssetIdToFileName(p15)) else insertService:LoadAsset(p15)
	end)
	
	return ok, status
end

function t.SetDebugLoadAssetsFromFiles(p15, p16)
	-- upvalues: t (ref)
	t.debugLoadAssetsFromFiles = p15
	t.mapAssetIdToFileName = p16
end

function t.GetJointBetween(p15, p16)
	if not p15 or not p16 then
		return nil
	end
	assert(p15, "part0 is non-nil. Silence type checker.")
	assert(p16, "part1 is non-nil. Silence type checker.")
	
	for i, v in p16:GetChildren() do
		if not v:IsA("Motor6D") or v.Part0 ~= p15 then
			if v:IsA("AnimationConstraint") and v.Part0 == p15 then
				return v
			end
		end
		return v
	end
	return nil
end

t.GetMotor6DBetween = t.GetJointBetween

function t.PoseKeyframeHasFaceAnimation(p17)
	if not p17 then
		return false
	end
	assert(p17, "poseKeyframe is non-nil. Silence type checker.")
	
	local function recurHasFaceAnimation(p18)
		-- upvalues: recurHasFaceAnimation (ref)
		if p18:IsA("Folder") then
			return true
		end
		for i, v in p18:GetChildren() do
			if recurHasFaceAnimation(v) then
				return true
			end
		end
		return false
	end
	
	for i, v in pairs(p17:GetPoses()) do
		if recurHasFaceAnimation(v) then
			return true
		end
	end
	return false
end

function t.ApplyKeyframe(p19, p20)
	-- upvalues: t_1 (write), applyKeyframeInner (ref), t (ref)
	t_1 = {}
	applyKeyframeInner(p19, p20)
	t_1 = {}
	local ok, status = pcall(function()
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	
	if ok and status then
		t.ForceAnimationToStep(p19)
	end
end

function t.GetNumberValueWithDefault(p19, p20, p21)
	local var12 = p21
	local var13 = p19:FindFirstChild(p20)
	
	if var13 and var13:IsA("NumberValue") then
		var12 = var13.Value
	end
	return var12
end

function t.GetAnimationClip(p19)
	-- upvalues: getAnimationClipByAssetId (ref)
	if p19:IsA("KeyframeSequence") then
		return p19
	elseif p19:IsA("CurveAnimation") then
		return p19
	elseif p19:IsA("Animation") then
		return getAnimationClipByAssetId(p19.AnimationId)
	end
	error("Cannot get AnimationClip from type:" .. p65.ClassName)
	
	return nil
end

function t.GetThumbnailKeyframe(p19, p20, p21)
	-- upvalues: getRotatedKeyframe (ref)
	local keyframes = p20:GetKeyframes()
	local _ = nil
	
	return getRotatedKeyframe(if p19 and p19 > 0 and p19 <= #keyframes then keyframes[p19] else keyframes[math.ceil(#keyframes / 2)], p21)
end

function t.GetCurveAnimationTimeLength(p19)
	local var12 = 0
	
	for i, v in p19:GetDescendants() do
		if v:IsA("FloatCurve") and v.Length ~= 0 then
			var12 = math.max(var12, v:GetKeyAtIndex(v.Length).Time)
		end
	end
	return var12
end

function t.GetThumbnailKeyframeFromCurve(p20, p21, p22)
	-- upvalues: t (ref), getRotationCFrame (ref), getRotatedKeyframe (ref)
	local curveAnimationTimeLength = t.GetCurveAnimationTimeLength(p21)
	
	if not p20 or p20 < 0 or curveAnimationTimeLength < p20 then
		p20 = curveAnimationTimeLength / 2
	end
	assert(p20, "thumbnailTime should be non-nil. Silence type checker")
	local t_1 = { Position = true, Rotation = true }
	
	local function _(p23)
		for i, v in p23:GetChildren() do
			if v:IsA("Folder") then
				return true
			end
		end
		return false
	end
	
	local function recurGenerateKeyframe(p24, p25)
		-- upvalues: getRotationCFrame (copy), p20 (write), t_1 (ref), recurGenerateKeyframe (ref)
		local v
		local var13 = nil
		local position = p25:FindFirstChild("Position")
		local rotation = p25:FindFirstChild("Rotation")
		
		if position and rotation then
			local var14 = getRotationCFrame(rotation, p20)
			
			if var14 then
				local pose = Instance.new("Pose")
				pose.CFrame = var14 + Vector3.new(table.unpack(position:GetValueAtTime(p20)))
				pose.Name = p25.Name
				pose.Parent = p24
				var13 = pose
			end
		else
			local folder
			for i, v in p25:GetChildren() do
				if v:IsA("Folder") then
					folder = true
					if folder then
						local pose = Instance.new("Pose")
						pose.CFrame = CFrame.new()
						pose.Name = p25.Name
						pose.Parent = p24
						var13 = pose
					else
						folder = Instance.new("Folder")
						folder.Name = p25.Name
						folder.Parent = p24
						var13 = folder
					end
				end
			end
			folder = false
		end
		for i, v in p25:GetChildren() do
			if v:IsA("FloatCurve") and not t_1[v] then
				v = Instance.new("NumberPose")
				v.Name = v.Name
				local var15 = v:GetValueAtTime(p20) or 0
				assert(var15, "valueAtTime should be non-nil. Silence type checker.")
				v.Value = var15
				v.Parent = var13
			elseif v:IsA("Folder") then
				recurGenerateKeyframe(var13, v)
			end
		end
	end
	
	local keyframe = Instance.new("Keyframe")
	keyframe.Name = p21.Name
	keyframe.Time = p20
	
	for i, v in p21:GetChildren() do
		if v:IsA("Folder") then
			recurGenerateKeyframe(keyframe, v)
		end
	end
	return getRotatedKeyframe(keyframe, p22)
end

function t.ClearPlayerCharacterFace(p26)
	local faceControls = p26:FindFirstChildWhichIsA("FaceControls", true)
	
	if faceControls then
		local parent = faceControls.Parent
		local children = faceControls:GetChildren()
		local faceControls_1 = Instance.new("FaceControls")
		faceControls_1.Parent = parent
		
		for i, v in children do
			v.Parent = faceControls_1
		end
		faceControls:Destroy()
	end
end

function t.AdjustArmOnR6ForTool(p27)
	local tool = p27:FindFirstChildOfClass("Tool")
	local torso = p27:FindFirstChild("Torso")
	
	if torso then
		local var16 = torso:FindFirstChild("Right Shoulder")
		
		if var16 then
			if tool then
				var16.CurrentAngle = 1.570796326795
				var16.DesiredAngle = 1.570796326795
				
				return
			end
			var16.CurrentAngle = 0
			var16.DesiredAngle = 0
		end
	end
end

function t.SetPlayerCharacterFace(p27, p28)
	-- upvalues: getAnimationAndIsIdle (ref), getThumbnailKeyframeFromAnimationOrUrl (ref), t (ref)
	if not p28 then return end
	if p28 == "" then return end
	if p28 == 0 then return end
	local var16
	assert(if typeof(p28) ~= "number" then typeof(p28) == "string" else true, "EmoteUtility.SetPlayerCharacterFace expects animationAssetIdOrUrl to be a number or string")
	
	if not p27:FindFirstChildOfClass("Humanoid") then return end
	if p28 then
		assert(p28, "moodAssetId is non-nil. Silence type checker.")
		local var17, _ = getAnimationAndIsIdle(p28)
		
		if var17 == nil then
			var16 = nil
		else
			assert(var17, "animation is non-nil. Silence type checker.")
			var16 = getThumbnailKeyframeFromAnimationOrUrl(var17, 0)
		end
	else
		var16 = nil
	end
	if var16 then
		t.ClearPlayerCharacterFace(p27)
		t.ApplyKeyframe(p27, var16)
		
		return
	end
end

function t.SetPlayerCharacterNeutralPose(p27)
	-- upvalues: t (ref)
	local humanoid = p27:FindFirstChildOfClass("Humanoid")
	
	if not humanoid then return end
	assert(humanoid, "humanoid should be non-nil. Silence type checker.")
	humanoid:BuildRigFromAttachments()
	
	if humanoid.RigType == Enum.HumanoidRigType.R15 then
		t.ClearPlayerCharacterFace(p27)
		
		local function recurResetJoint(value)
			-- upvalues: recurResetJoint (ref)
			if value:IsA("Motor6D") then
				value.Transform = CFrame.new()
			elseif value:IsA("AnimationConstraint") then
				value.Transform = CFrame.new()
			end
			for i, v in value:GetChildren() do
				recurResetJoint(v)
			end
		end
		
		recurResetJoint(p27)
		
		return
	end
end

function t.FindDefaultMoodAnimationId(p28)
	local animate = p28:FindFirstChild("Animate")
	
	if not animate then
		return nil
	end
	local mood = animate:FindFirstChild("mood")
	
	if not mood then
		return nil
	end
	local animation = mood:FindFirstChildOfClass("Animation")
	
	return if animation and animation.AnimationId ~= "" then animation.AnimationId else nil
end

local function loadKeyframesForPoseR15(p28, p29, p30, p31, p32)
	-- upvalues: getMainThumbnailKeyframe (ref), getToolKeyframes (ref), emoteUtilityDefaultMoodFromCharacter (ref), t (ref), getAnimationAndIsIdle (ref), getThumbnailKeyframeFromAnimationOrUrl (ref), getAnimationClipByAssetId (ref)
	local t_1 = { originalAnimationAssetId = p29 }
	local var16, var17, var18 = getMainThumbnailKeyframe(p28, p29, not p31, if p32 then false else true)
	local var19 = nil
	local var20 = nil
	
	if not p32 and var16 then
		local var21, var22 = getToolKeyframes(p28, var17)
		var19 = var21
		var20 = var22
	end
	local var23 = nil
	local var24 = false
	
	if emoteUtilityDefaultMoodFromCharacter or p30 and p30 ~= 0 then
		if p29 == nil then
			var24 = true
		elseif not t.PoseKeyframeHasFaceAnimation(var16) then
			var24 = true
		end
	end
	if var24 then
		if emoteUtilityDefaultMoodFromCharacter then
			if p30 and p30 ~= 0 then
				if p30 then
					assert(p30, "moodAssetId is non-nil. Silence type checker.")
					local var25, _ = getAnimationAndIsIdle(p30)
					
					if var25 == nil then
						var23 = nil
					else
						assert(var25, "animation is non-nil. Silence type checker.")
						var23 = getThumbnailKeyframeFromAnimationOrUrl(var25, 0)
					end
				else
					var23 = nil
				end
			end
			if not var23 then
				local var26 = t.FindDefaultMoodAnimationId(p28)
				
				if var26 then
					local var27 = getAnimationClipByAssetId(var26)
					
					if var27 and var27:IsA("KeyframeSequence") then
						var23 = t.GetThumbnailKeyframe(nil, var27, 0)
					end
				end
			end
		elseif p30 then
			assert(p30, "moodAssetId is non-nil. Silence type checker.")
			local var28, _ = getAnimationAndIsIdle(p30)
			
			if var28 == nil then
				var23 = nil
			else
				assert(var28, "animation is non-nil. Silence type checker.")
				var23 = getThumbnailKeyframeFromAnimationOrUrl(var28, 0)
			end
		else
			var23 = nil
		end
	end
	t_1.poseKeyframe = var16
	t_1.moodKeyframe = var23
	t_1.defaultToolKeyframe = var20
	t_1.suggestedKeyframeFromTool = var19
	t_1.finalAnimationAssetIdOrUrl = var18
	
	return t_1
end

function t.LoadKeyframesForPose(p28, p29, p30, p31, p32)
	-- upvalues: loadKeyframesForPoseR15 (ref)
	assert(p28, "character should be non-nil")
	
	if p29 ~= nil then
		assert(typeof(p29) == "number", "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a number or nil")
		assert(p29 > 0, "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a real asset ID (positive number)")
	end
	if p30 ~= nil then
		assert(typeof(p30) == "number", "EmoteUtility.LoadKeyframesForPose expects moodAssetId to be a number or nil")
	end
	local humanoid = p28:FindFirstChildOfClass("Humanoid")
	
	if not humanoid then
		return nil
	end
	assert(humanoid, "humanoid should be non-nil. Silence type checker.")
	
	return if humanoid.RigType == Enum.HumanoidRigType.R15 then loadKeyframesForPoseR15(p28, p29, p30, p31, p32) else { originalAnimationAssetId = p29 }
end

function t.ApplyKeyframesForPose(p28, p29)
	-- upvalues: t (ref), t_1 (write), applyR15KeyframeWithTool (ref), applyKeyframeInner (ref)
	assert(p28, "character should be non-nil")
	
	if not p29 then return end
	assert(p29, "keyframesForPose should be non-nil. Silence type checker.")
	local humanoid = p28:FindFirstChildOfClass("Humanoid")
	
	if not humanoid then return end
	assert(humanoid, "humanoid should be non-nil. Silence type checker.")
	t.SetPlayerCharacterNeutralPose(p28)
	t_1 = {}
	local tool = p28:FindFirstChildOfClass("Tool")
	
	if humanoid.RigType ~= Enum.HumanoidRigType.R15 then
		t.AdjustArmOnR6ForTool(p28)
	elseif tool then
		applyR15KeyframeWithTool(p28, humanoid, tool, p29.originalAnimationAssetId, p29.poseKeyframe, p29.defaultToolKeyframe, p29.suggestedKeyframeFromTool)
	else
		applyKeyframeInner(p28, p29.poseKeyframe)
	end
	if humanoid.RigType == Enum.HumanoidRigType.R15 then
		applyKeyframeInner(p28, p29.moodKeyframe)
	end
	t_1 = {}
	local ok, status = pcall(function()
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	
	if ok and status then
		t.ForceAnimationToStep(p28)
	end
end

function t.SetPlayerCharacterPoseWithMoodFallback(p28, p29, p30, p31, p32)
	-- upvalues: t (ref), emoteUtilityReportPoseAnimationDownloadFailure (ref)
	local humanoid = p28:FindFirstChildOfClass("Humanoid")
	
	if not humanoid then return end
	assert(humanoid, "humanoid should be non-nil.  Silence type checker.")
	local var16 = t.LoadKeyframesForPose(p28, p29, p30, p31, p32)
	t.ApplyKeyframesForPose(p28, var16)
	
	return if not (not emoteUtilityReportPoseAnimationDownloadFailure or not var16) then if humanoid.RigType == Enum.HumanoidRigType.R15 and p29 ~= nil and var16.poseKeyframe == nil then "Failed to download requested pose animation" else nil else nil
end

function t.ThumbnailZoomExtents(p28, p29, p30, p31, p32)
	local modelCFrame = p28:GetModelCFrame()
	local lookVector = modelCFrame.LookVector
	local humanoidRootPart = p28:FindFirstChild("HumanoidRootPart")
	
	if humanoidRootPart then
		lookVector = humanoidRootPart.CFrame.LookVector
	end
	local cFrame = CFrame.new(modelCFrame.Position + lookVector * 5, modelCFrame.Position)
	local extentsSize = p28:GetExtentsSize()
	
	return cFrame - cFrame.Position + (modelCFrame.Position + Vector3.new(p30, -p31, 0)) + lookVector * (math.sqrt(extentsSize.X ^ 2 + extentsSize.Y ^ 2 + extentsSize.Z ^ 2) / 2 * (1 / math.tan(math.rad(p29) / 2)) * (1 / p32))
end

return t