local animationClipProviderService = game:GetService("AnimationClipProvider")
local insertService = game:GetService("InsertService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local emoteUtilityFallbackKeyframeSequenceAssetId = game:DefineFastString("EmoteUtilityFallbackKeyframeSequenceAssetId", "10921261056")
local emoteUtilityDefaultMoodFromCharacter = game:DefineFastFlag("EmoteUtilityDefaultMoodFromCharacter", false)
local t = {
	FallbackKeyframeSequenceAssetId = emoteUtilityFallbackKeyframeSequenceAssetId,
	debugLoadAssetsFromFiles = false,
	mapAssetIdToFileName = nil,
	EmoteUtilitySupportAJU = true,
	FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL = "http://www.roblox.com/asset/?id=" .. emoteUtilityFallbackKeyframeSequenceAssetId
}
local t_1 = {}

local function _() --[[ line: 72 | named "clearJointBlacklist" ]]
	-- upvalues: t_1 (write)
	t_1 = {}
end

local _ = function(p0) --[[ line: 76 | named "blacklistJoint" ]]
	-- upvalues: t_1 (write)
	t_1[p0] = true
end

local _ = function(p1) --[[ line: 80 | named "jointIsBlacklisted" ]]
	-- upvalues: t_1 (write)
	return t_1[p1]
end

local _ = function(value, p2) --[[ line: 87 | named "getCameraOffset" ]]
	return math.sqrt(p2.X ^ 2 + p2.Y ^ 2 + p2.Z ^ 2) / 2 * (1 / math.tan(math.rad(value) / 2))
end

local _ = function() --[[ line: 97 | named "isOnRCC" ]]
	local ok, status = pcall(function() --[[ line: 103 ]]
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	
	return ok and status
end

local _ = function(p3, p4) --[[ line: 113 | named "reportCounter" ]]
	-- upvalues: rbxAnalyticsService (ref)
	local _ = nil
	local _ = nil
	local ok, status = pcall(function() --[[ line: 103 ]]
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	rbxAnalyticsService:ReportCounter((if ok and status then "RCC" else "Client") .. "_" .. p3 .. "_" .. (if p4 then "Success" else "Failure"))
end

local function getAnimationAndIsIdle(p5) --[[ line: 136 ]]
	-- upvalues: t (ref), rbxAnalyticsService (ref)
	local var27, var29
	assert(if typeof(p5) ~= "number" then typeof(p5) == "string" else true, "getAnimationAndIsIdle expects animationAssetIdOrUrl to be a number or string")
	local var24 = nil
	local _ = nil
	local _ = nil
	
	if typeof(p5) == "number" then
		local _ = nil
		local var25, var26 = t.LoadAsset(p5)
		var27 = var25
		local var28 = var26
		
		if var27 and var28 then
			var24 = var28:GetChildren()[1]
		end
		var29 = "EmoteUtility_LoadAsset"
	else
		local _ = nil
		local ok, status = pcall(function() --[[ line: 155 ]]
			-- upvalues: p5 (ref)
			return game:GetObjects(p5)[1]
		end)
		var27 = ok
		local var30 = status
		
		if var27 and var30 then
			var24 = var30
		end
		var29 = "EmoteUtility_GetObjects"
	end
	local var31 = var29
	local var32 = var27
	local _ = nil
	local _ = nil
	local ok, status = pcall(function() --[[ line: 103 ]]
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	rbxAnalyticsService:ReportCounter((if ok and status then "RCC" else "Client") .. "_" .. var31 .. "_" .. (if var32 then "Success" else "Failure"))
	
	if not var27 or not var24 then
		local _ = nil
		local ok_1, status_1 = pcall(function() --[[ line: 103 ]]
			return game.GetService(game, "ThumbnailGenerator") ~= nil
		end)
		rbxAnalyticsService:SendEventDeferred(if ok_1 and status_1 then "RCC" else "Client", "EmoteUtility_getPoseAsset", var29 .. "_Failed", { animationAssetIdOrUrl = p5 })
		
		return nil, nil
	end
	assert(var24, "animation is non-nil. Silence type checker.")
	local var33 = false
	
	if var24.ClassName == "Folder" then
		var33 = true
		local var34 = var24:FindFirstChild("Pose", true) or var24:FindFirstChild("pose", true)
		
		if var34 == nil then
			var34 = var24:FindFirstChild("Idle", true) or var24:FindFirstChild("idle", true)
		end
		var24 = if var34 then var34:FindFirstChildWhichIsA("Animation", true) else var24:FindFirstChildWhichIsA("Animation", true)
	end
	return var24, var33
end

local function getAnimationClipByAssetId(value) --[[ line: 208 ]]
	-- upvalues: t (ref), animationClipProviderService (ref), rbxAnalyticsService (ref)
	local var40
	local _ = nil
	local var35 = nil
	
	if t.debugLoadAssetsFromFiles then
		local var36 = nil
		
		for i in string.gmatch(value, ".*id=([0-9]+)") do
			var36 = i
		end
		assert(var36, "assetId should be non-nil")
		local var37 = tonumber(var36)
		assert(var37, "assetIdAsNumber should be non-nil")
		local _ = nil
		local var38, var39 = t.LoadAsset(var37)
		var40 = var38
		local var41 = var39
		
		if var40 and var41 then
			var35 = var41
		end
	else
		local ok, status = pcall(function() --[[ line: 225 ]]
			-- upvalues: animationClipProviderService (copy), value (ref)
			return animationClipProviderService:GetAnimationClipAsync(value)
		end)
		var40 = ok
		var35 = status
	end
	local var42 = var40
	local _ = nil
	local _ = nil
	local ok, status = pcall(function() --[[ line: 103 ]]
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	rbxAnalyticsService:ReportCounter((if ok and status then "RCC" else "Client") .. "_" .. "EmoteUtility_GetAnimationClipAsync" .. "_" .. (if var42 then "Success" else "Failure"))
	
	if var40 then
		return var35
	end
	local _ = nil
	local ok_1, status_1 = pcall(function() --[[ line: 103 ]]
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	rbxAnalyticsService:SendEventDeferred(if ok_1 and status_1 then "RCC" else "Client", "EmoteUtility_GetAnimationClip", "EmoteUtility_GetAnimationClip_GetAnimationClipAsyncFailed", { keyframeSequenceId = value })
	
	return nil
end

local _ = function(value, p6, p7) --[[ line: 252 | named "trySetProperty" ]]
	pcall(function() --[[ line: 253 ]]
		-- upvalues: value (ref), p6 (ref), p7 (ref)
		value[p6] = p7
	end)
end

local function applyControlsFolder(p8, p9, p10) --[[ line: 261 ]]
	if not p9 then return end
	assert(p9, "parentPose is non-nil. Silence type checker.")
	local name = p8:FindFirstChild(p9.Name)
	
	if not name then return end
	local name_1 = name:FindFirstChild(p10.Name)
	
	if not name_1 then return end
	for i, v in p10:GetChildren() do
		if v:IsA("NumberPose") then
			local name_2 = v.Name
			local value = v.Value
			pcall(function() --[[ line: 253 ]]
				-- upvalues: name_1 (ref), name_2 (ref), value (ref)
				name_1[name_2] = value
			end)
		end
	end
end

local function applyKeyframeInner(p11, p12) --[[ line: 290 ]]
	-- upvalues: t (ref), t_1 (write), applyControlsFolder (ref)
	local function recurApplyPoses(p13, p14) --[[ line: 291 ]]
		-- upvalues: p11 (ref), t (copy), t_1 (copy), applyControlsFolder (copy), recurApplyPoses (ref)
		if p13 and p14:IsA("Pose") then
			local jointBetween = t.GetJointBetween(p11:FindFirstChild(p13.Name), p11:FindFirstChild(p14.Name))
			
			if jointBetween and not (if not t_1[jointBetween] then false else true) then
				assert(jointBetween, "joint is non-nil. Silence type checker.")
				jointBetween.Transform = p14.CFrame
				t_1[jointBetween] = true
			end
		end
		if p14:IsA("Folder") then
			applyControlsFolder(p11, p13, p14)
			
			return
		end
		for i, v in p14:GetChildren() do
			recurApplyPoses(p14, v)
		end
	end
	
	if p12 then
		for i, v in pairs(p12:GetPoses()) do
			if not v:IsA("Folder") then
				for i_1, v_1 in v:GetChildren() do
					recurApplyPoses(v, v_1)
				end
			end
		end
	end
end

local function getRotatedKeyframe(p15, p16) --[[ line: 328 ]]
	if not p16 or p16 == 0 then
		return p15
	end
	assert(p16, "rotationDegrees is non-nil. Silence type checker.")
	local var47 = p15:Clone()
	local var48 = var47:GetPoses()[1]
	
	if var48 then
		local var49 = var48:GetSubPoses()[1]
		
		if var49 then
			var49.CFrame *= CFrame.Angles(0, math.rad(p16), 0)
		end
	end
	return var47
end

local function getRotationCFrame(p17, p18) --[[ line: 349 ]]
	if p17:IsA("EulerRotationCurve") then
		return p17:GetRotationAtTime(p18)
	elseif p17:IsA("RotationCurve") then
		return p17:GetValueAtTime(p18)
	end
	error("Unsupported rotation type:" .. p17.ClassName)
	
	return nil
end

local function findAttachmentsRecur(p19, p20) --[[ line: 360 ]]
	-- upvalues: findAttachmentsRecur (ref)
	for i, v in pairs(p19:GetChildren()) do
		if v:IsA("Attachment") then
			p20[v.Name] = v
		elseif not v:IsA("Tool") and not v:IsA("Accoutrement") then
			findAttachmentsRecur(v, p20)
		end
	end
end

local _ = function(p21) --[[ line: 371 | named "findAttachmentsInTool" ]]
	-- upvalues: findAttachmentsRecur (ref)
	local t = {}
	findAttachmentsRecur(p21, t)
	
	return t
end

local _ = function(p22) --[[ line: 377 | named "findAttachmentsInCharacter" ]]
	-- upvalues: findAttachmentsRecur (ref)
	local t = {}
	findAttachmentsRecur(p22, t)
	
	return t
end

local _ = function(p23, p24) --[[ line: 383 | named "weldAttachments" ]]
	local weld = Instance.new("Weld")
	weld.Part0 = p23.Parent
	weld.Part1 = p24.Parent
	weld.C0 = p23.CFrame
	weld.C1 = p24.CFrame
	weld.Parent = p23.Parent
	
	return weld
end

local function attachToolToCharacter(p25, p26, p27) --[[ line: 393 ]]
	-- upvalues: findAttachmentsRecur (ref)
	local t = {}
	findAttachmentsRecur(p25, t)
	local t_1 = {}
	findAttachmentsRecur(p27, t_1)
	local var55 = false
	
	for i, v in pairs(t_1) do
		local name = t[v.Name]
		
		if name then
			var55 = true
			local weld = Instance.new("Weld")
			weld.Part0 = name.Parent
			weld.Part1 = v.Parent
			weld.C0 = name.CFrame
			weld.C1 = v.CFrame
			weld.Parent = name.Parent
		end
	end
	if var55 then
		p27.Parent = p25
		
		return
	end
	p27.Parent = nil
	local handle = p27:FindFirstChild("Handle")
	local grip = p27.Grip
	
	if handle and grip then
		local rightGripAttachment = t.RightGripAttachment
		
		if rightGripAttachment then
			handle.CFrame = rightGripAttachment.Parent.CFrame * rightGripAttachment.CFrame * grip:Inverse()
		end
	end
	p26:EquipTool(p27)
end

local function applyR15KeyframeWithTool(p28, p29, p30, p31, p32, p33, p34) --[[ line: 425 ]]
	-- upvalues: applyKeyframeInner (ref), attachToolToCharacter (ref)
	if p34 then
		applyKeyframeInner(p28, p34)
		applyKeyframeInner(p28, p32)
	else
		applyKeyframeInner(p28, p33)
		
		if p31 ~= nil then
			applyKeyframeInner(p28, p32)
		end
	end
	attachToolToCharacter(p28, p29, p30)
end

local function getMainThumbnailKeyframe(p35, p36, p37, p38) --[[ line: 479 ]]
	-- upvalues: getAnimationAndIsIdle (ref), t (ref), getAnimationClipByAssetId (ref)
	local var58 = nil
	local var59 = false
	local var60 = nil
	
	if p36 then
		var60 = p36
		local var61, var62 = getAnimationAndIsIdle(p36)
		
		if var61 == nil then
			return nil, var59, var60
		end
		assert(var61, "animation is non-nil. Silence type checker.")
		
		if not var62 then
			var59 = true
		end
		local thumbnailKeyframe = t.GetNumberValueWithDefault(var61, "ThumbnailKeyframe", nil)
		local thumbnailTime = t.GetNumberValueWithDefault(var61, "ThumbnailTime", nil)
		local var65 = if p37 then t.GetNumberValueWithDefault(var61, "ThumbnailCharacterRotation", 0) else 0
		local animationClip = t.GetAnimationClip(var61)
		
		if not animationClip then
			return var58, var59, var60
		end
		if animationClip:IsA("KeyframeSequence") then
			var58 = t.GetThumbnailKeyframe(thumbnailKeyframe, animationClip, var65)
			
			return var58, var59, var60
		elseif animationClip:IsA("CurveAnimation") then
			var58 = t.GetThumbnailKeyframeFromCurve(thumbnailTime, animationClip, var65)
			
			return var58, var59, var60
		end
		error("Unsupported Animation type:" .. animationClip.ClassName)
		
		return var58, var59, var60
	elseif p38 then
		local FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL = t.FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL
		local animate = p35:FindFirstChild("Animate")
		
		if animate then
			local pose = animate:FindFirstChild("Pose") or animate:FindFirstChild("pose")
			
			if pose then
				local animation = pose:FindFirstChildOfClass("Animation")
				
				if animation then
					FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL = animation.AnimationId
				end
			end
		end
		var60 = FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL
		local var70 = getAnimationClipByAssetId(FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL)
		
		if var70 then
			if not var70:IsA("KeyframeSequence") then
				return nil, false, var60
			end
			var58 = var70:GetKeyframes()[1]
		end
	end
end

local function getMoodThumbnailKeyframe(p39) --[[ line: 563 ]]
	-- upvalues: getAnimationAndIsIdle (ref), t (ref)
	local thumbnailKeyframeFromCurve = nil
	
	if not p39 then
		return nil
	end
	assert(p39, "moodAssetId is non-nil. Silence type checker.")
	local var72, _ = getAnimationAndIsIdle(p39)
	
	if var72 == nil then
		return nil
	end
	assert(var72, "animation is non-nil. Silence type checker.")
	local thumbnailKeyframe = t.GetNumberValueWithDefault(var72, "ThumbnailKeyframe", nil)
	local thumbnailTime = t.GetNumberValueWithDefault(var72, "ThumbnailTime", nil)
	local animationClip = t.GetAnimationClip(var72)
	
	if animationClip then
		if animationClip:IsA("KeyframeSequence") then
			thumbnailKeyframeFromCurve = t.GetThumbnailKeyframe(thumbnailKeyframe, animationClip, 0)
			
			return thumbnailKeyframeFromCurve
		elseif animationClip:IsA("CurveAnimation") then
			thumbnailKeyframeFromCurve = t.GetThumbnailKeyframeFromCurve(thumbnailTime, animationClip, 0)
			
			return thumbnailKeyframeFromCurve
		end
		error("Unsupported Animation type:" .. animationClip.ClassName)
	end
	return thumbnailKeyframeFromCurve
end

local function getToolKeyframes(p40, p41) --[[ line: 611 ]]
	-- upvalues: t (ref)
	local thumbnailPose = nil
	local thumbnailKeyframe = nil
	local tool = p40:FindFirstChildOfClass("Tool")
	
	if not tool then
		return nil, nil
	end
	assert(tool, "tool is non-nil. Silence type checker.")
	local var79 = false
	
	if not p41 then
		thumbnailPose = tool:FindFirstChild("ThumbnailPose")
		
		if thumbnailPose and thumbnailPose:IsA("Keyframe") then
			var79 = true
		end
	end
	if not var79 then
		thumbnailPose = nil
		local animate = p40:FindFirstChild("Animate")
		
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
			
			if tool:IsDescendantOf(p40) then
				return thumbnailPose, thumbnailKeyframe
			else
				return nil, nil
			end
		end
	end
end

local function getAttachmentCFrame(p42) --[[ line: 670 ]]
	local cFrame = p42.CFrame
	local parent = p42.Parent
	while parent and parent:IsA("Bone") do
		cFrame = parent.CFrame * cFrame
		parent = parent.Parent
	end
	return cFrame
end

local function getJointParts(p43) --[[ line: 680 ]]
	if p43:IsA("JointInstance") then
		return p43.Part0, p43.Part1
	elseif p43:IsA("Constraint") then
		local attachment0 = p43.Attachment0
		local attachment1 = p43.Attachment1
		
		return attachment0 and attachment0:FindFirstAncestorWhichIsA("BasePart"), attachment1 and attachment1:FindFirstAncestorWhichIsA("BasePart")
	end
	return nil, nil
end

local function applyCFrame(p44, p45, p46, p47) --[[ line: 693 ]]
	-- upvalues: getAttachmentCFrame (ref)
	if p46:IsA("AnimationConstraint") then
		p45.CFrame = p44.CFrame * getAttachmentCFrame(p46.Attachment0) * p47 * getAttachmentCFrame(p46.Attachment1):Inverse()
		
		return
	elseif p46:IsA("Motor6D") then
		local c0 = p46.C0
		local c1 = p46.C1
		p45.Anchored = true
		p45.CFrame = p44.CFrame * c0 * p47 * c1:Inverse()
	end
end

local function getJointPose(p48) --[[ line: 706 ]]
	if p48:IsA("AnimationConstraint") then
		return p48.Transform
	elseif not p48:IsA("Motor6D") then
		error("Unsupported joint type:" .. p48.ClassName)
		
		return CFrame.new()
	end
	local transform = p48.Transform
	
	if p48.CurrentAngle ~= 0 then
		transform *= CFrame.Angles(0, 0, p48.CurrentAngle)
	end
	return transform
end

function t.ForceAnimationToStep(p49) --[[ line: 726 ]]
	-- upvalues: getJointParts (ref), getJointPose (ref), applyCFrame (ref)
	local v
	local list = { p49:FindFirstChild("HumanoidRootPart") }
	local t = {}
	local t_1 = {}
	while #list > 0 do
		local removed = table.remove(list, 1)
		
		if t[removed] then continue end
		t[removed] = true
		
		for i, v in removed:GetJoints() do
			if v:IsA("Motor6D") or v:IsA("AnimationConstraint") then
				local var88, var89 = getJointParts(v)
				
				if var88 == removed and var89 and not t[var89] then
					table.insert(t_1, { part0 = removed, part1 = var89, joint = v })
					table.insert(list, var89)
				end
			end
		end
	end
	for i, v_1 in p49:GetDescendants() do
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

function t.LoadAsset(p50) --[[ line: 772 ]]
	-- upvalues: t (ref), insertService (ref)
	local ok, status = pcall(function() --[[ line: 773 ]]
		-- upvalues: t (copy), p50 (ref), insertService (copy)
		return if t.debugLoadAssetsFromFiles and t.mapAssetIdToFileName then insertService:LoadLocalAsset("rbxasset://" .. t.mapAssetIdToFileName(p50)) else insertService:LoadAsset(p50)
	end)
	
	return ok, status
end

function t.SetDebugLoadAssetsFromFiles(p51, p52) --[[ line: 794 ]]
	-- upvalues: t (ref)
	t.debugLoadAssetsFromFiles = p51
	t.mapAssetIdToFileName = p52
end

function t.GetJointBetween(p53, p54) --[[ line: 802 ]]
	if not p53 or not p54 then
		return nil
	end
	assert(p53, "part0 is non-nil. Silence type checker.")
	assert(p54, "part1 is non-nil. Silence type checker.")
	
	for i, v in p54:GetChildren() do
		if not v:IsA("Motor6D") or v.Part0 ~= p53 then
			if v:IsA("AnimationConstraint") and v.Part0 == p53 then
				return v
			end
		end
		return v
	end
	return nil
end

t.GetMotor6DBetween = t.GetJointBetween

function t.PoseKeyframeHasFaceAnimation(p55) --[[ line: 826 ]]
	if not p55 then
		return false
	end
	assert(p55, "poseKeyframe is non-nil. Silence type checker.")
	
	local function recurHasFaceAnimation(p56) --[[ line: 832 ]]
		-- upvalues: recurHasFaceAnimation (ref)
		if p56:IsA("Folder") then
			return true
		end
		for i, v in p56:GetChildren() do
			if recurHasFaceAnimation(v) then
				return true
			end
		end
		return false
	end
	
	for i, v in pairs(p55:GetPoses()) do
		if recurHasFaceAnimation(v) then
			return true
		end
	end
	return false
end

function t.ApplyKeyframe(p57, p58) --[[ line: 857 ]]
	-- upvalues: t_1 (write), applyKeyframeInner (ref), t (ref)
	t_1 = {}
	applyKeyframeInner(p57, p58)
	t_1 = {}
	local ok, status = pcall(function() --[[ line: 103 ]]
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	
	if ok and status then
		t.ForceAnimationToStep(p57)
	end
end

function t.GetNumberValueWithDefault(p59, p60, p61) --[[ line: 866 ]]
	local var91 = p61
	local var92 = p59:FindFirstChild(p60)
	
	if var92 and var92:IsA("NumberValue") then
		var91 = var92.Value
	end
	return var91
end

function t.GetAnimationClip(p62) --[[ line: 879 ]]
	-- upvalues: getAnimationClipByAssetId (ref)
	if p62:IsA("KeyframeSequence") then
		return p62
	elseif p62:IsA("CurveAnimation") then
		return p62
	elseif p62:IsA("Animation") then
		return getAnimationClipByAssetId(p62.AnimationId)
	end
	error("Cannot get AnimationClip from type:" .. p62.ClassName)
	
	return nil
end

function t.GetThumbnailKeyframe(p63, p64, p65) --[[ line: 895 ]]
	-- upvalues: getRotatedKeyframe (ref)
	local keyframes = p64:GetKeyframes()
	local _ = nil
	
	return getRotatedKeyframe(if p63 and p63 > 0 and p63 <= #keyframes then keyframes[p63] else keyframes[math.ceil(#keyframes / 2)], p65)
end

function t.GetCurveAnimationTimeLength(p66) --[[ line: 913 ]]
	local var94 = 0
	
	for i, v in p66:GetDescendants() do
		if v:IsA("FloatCurve") and v.Length ~= 0 then
			var94 = math.max(var94, v:GetKeyAtIndex(v.Length).Time)
		end
	end
	return var94
end

function t.GetThumbnailKeyframeFromCurve(p67, p68, p69) --[[ line: 931 ]]
	-- upvalues: t (ref), getRotationCFrame (ref), getRotatedKeyframe (ref)
	local curveAnimationTimeLength = t.GetCurveAnimationTimeLength(p68)
	
	if not p67 or p67 < 0 or curveAnimationTimeLength < p67 then
		p67 = curveAnimationTimeLength / 2
	end
	assert(p67, "thumbnailTime should be non-nil. Silence type checker")
	local t_1 = { Position = true, Rotation = true }
	
	local function _(p70) --[[ line: 949 | named "hasSubFolders" ]]
		for i, v in p70:GetChildren() do
			if v:IsA("Folder") then
				return true
			end
		end
		return false
	end
	
	local function recurGenerateKeyframe(p71, p72) --[[ line: 958 ]]
		-- upvalues: getRotationCFrame (copy), p67 (write), t_1 (ref), recurGenerateKeyframe (ref)
		local v
		local var99 = nil
		local position = p72:FindFirstChild("Position")
		local rotation = p72:FindFirstChild("Rotation")
		
		if position and rotation then
			local var104 = getRotationCFrame(rotation, p67)
			
			if var104 then
				local pose = Instance.new("Pose")
				pose.CFrame = var104 + Vector3.new(table.unpack(position:GetValueAtTime(p67)))
				pose.Name = p72.Name
				pose.Parent = p71
				var99 = pose
			end
		else
			local folder
			for i, v in p72:GetChildren() do
				if v:IsA("Folder") then
					folder = true
					if folder then
						local pose = Instance.new("Pose")
						pose.CFrame = CFrame.new()
						pose.Name = p72.Name
						pose.Parent = p71
						var99 = pose
					else
						folder = Instance.new("Folder")
						folder.Name = p72.Name
						folder.Parent = p71
						var99 = folder
					end
				end
			end
			folder = false
		end
		for i, v in p72:GetChildren() do
			if v:IsA("FloatCurve") and not t_1[v] then
				v = Instance.new("NumberPose")
				v.Name = v.Name
				local var106 = v:GetValueAtTime(p67) or 0
				assert(var106, "valueAtTime should be non-nil. Silence type checker.")
				v.Value = var106
				v.Parent = var99
			elseif v:IsA("Folder") then
				recurGenerateKeyframe(var99, v)
			end
		end
	end
	
	local keyframe = Instance.new("Keyframe")
	keyframe.Name = p68.Name
	keyframe.Time = p67
	
	for i, v in p68:GetChildren() do
		if v:IsA("Folder") then
			recurGenerateKeyframe(keyframe, v)
		end
	end
	return getRotatedKeyframe(keyframe, p69)
end

function t.ClearPlayerCharacterFace(p73) --[[ line: 1024 ]]
	local faceControls = p73:FindFirstChildWhichIsA("FaceControls", true)
	
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

function t.AdjustArmOnR6ForTool(p74) --[[ line: 1041 ]]
	local tool = p74:FindFirstChildOfClass("Tool")
	local torso = p74:FindFirstChild("Torso")
	
	if torso then
		local var112 = torso:FindFirstChild("Right Shoulder")
		
		if var112 then
			if tool then
				var112.CurrentAngle = 1.570796326795
				var112.DesiredAngle = 1.570796326795
				
				return
			end
			var112.CurrentAngle = 0
			var112.DesiredAngle = 0
		end
	end
end

function t.SetPlayerCharacterFace(p75, p76) --[[ line: 1063 ]]
	-- upvalues: getMoodThumbnailKeyframe (ref), t (ref)
	if not p76 then return end
	if p76 == "" then return end
	if p76 == 0 then return end
	assert(if typeof(p76) ~= "number" then typeof(p76) == "string" else true, "EmoteUtility.SetPlayerCharacterFace expects animationAssetIdOrUrl to be a number or string")
	
	if not p75:FindFirstChildOfClass("Humanoid") then return end
	local var113 = getMoodThumbnailKeyframe(p76)
	
	if var113 then
		t.ClearPlayerCharacterFace(p75)
		t.ApplyKeyframe(p75, var113)
		
		return
	end
end

function t.SetPlayerCharacterNeutralPose(p77) --[[ line: 1104 ]]
	-- upvalues: t (ref)
	local humanoid = p77:FindFirstChildOfClass("Humanoid")
	
	if not humanoid then return end
	assert(humanoid, "humanoid should be non-nil. Silence type checker.")
	humanoid:BuildRigFromAttachments()
	
	if humanoid.RigType == Enum.HumanoidRigType.R15 then
		t.ClearPlayerCharacterFace(p77)
		
		local function recurResetJoint(value) --[[ line: 1119 ]]
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
		
		recurResetJoint(p77)
		
		return
	end
end

function t.FindDefaultMoodAnimationId(p78) --[[ line: 1136 ]]
	local animate = p78:FindFirstChild("Animate")
	
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

local function loadKeyframesForPoseR15(p79, p80, p81, p82, p83) --[[ line: 1155 ]]
	-- upvalues: getMainThumbnailKeyframe (ref), getToolKeyframes (ref), emoteUtilityDefaultMoodFromCharacter (ref), t (ref), getMoodThumbnailKeyframe (ref), getAnimationClipByAssetId (ref)
	local t_1 = { originalAnimationAssetId = p80 }
	local var120, var121, var122 = getMainThumbnailKeyframe(p79, p80, not p82, if p83 then false else true)
	local var123 = nil
	local var124 = nil
	
	if not p83 and var120 then
		local var125, var126 = getToolKeyframes(p79, var121)
		var123 = var125
		var124 = var126
	end
	local thumbnailKeyframe = nil
	local var128 = false
	
	if emoteUtilityDefaultMoodFromCharacter or p81 and p81 ~= 0 then
		if p80 == nil then
			var128 = true
		elseif not t.PoseKeyframeHasFaceAnimation(var120) then
			var128 = true
		end
	end
	if var128 then
		if emoteUtilityDefaultMoodFromCharacter then
			if p81 and p81 ~= 0 then
				thumbnailKeyframe = getMoodThumbnailKeyframe(p81)
			end
			if not thumbnailKeyframe then
				local var129 = t.FindDefaultMoodAnimationId(p79)
				
				if var129 then
					local var130 = getAnimationClipByAssetId(var129)
					
					if var130 and var130:IsA("KeyframeSequence") then
						thumbnailKeyframe = t.GetThumbnailKeyframe(nil, var130, 0)
					end
				end
			end
		else
			thumbnailKeyframe = getMoodThumbnailKeyframe(p81)
		end
	end
	t_1.poseKeyframe = var120
	t_1.moodKeyframe = thumbnailKeyframe
	t_1.defaultToolKeyframe = var124
	t_1.suggestedKeyframeFromTool = var123
	t_1.finalAnimationAssetIdOrUrl = var122
	
	return t_1
end

function t.LoadKeyframesForPose(p84, p85, p86, p87, p88) --[[ line: 1256 ]]
	-- upvalues: loadKeyframesForPoseR15 (ref)
	assert(p84, "character should be non-nil")
	
	if p85 ~= nil then
		assert(typeof(p85) == "number", "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a number or nil")
		assert(p85 > 0, "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a real asset ID (positive number)")
	end
	if p86 ~= nil then
		assert(typeof(p86) == "number", "EmoteUtility.LoadKeyframesForPose expects moodAssetId to be a number or nil")
	end
	local humanoid = p84:FindFirstChildOfClass("Humanoid")
	
	if not humanoid then
		return nil
	end
	assert(humanoid, "humanoid should be non-nil. Silence type checker.")
	
	return if humanoid.RigType == Enum.HumanoidRigType.R15 then loadKeyframesForPoseR15(p84, p85, p86, p87, p88) else { originalAnimationAssetId = p85 }
end

function t.ApplyKeyframesForPose(p89, p90) --[[ line: 1304 ]]
	-- upvalues: t (ref), t_1 (write), applyR15KeyframeWithTool (ref), applyKeyframeInner (ref)
	assert(p89, "character should be non-nil")
	
	if not p90 then return end
	assert(p90, "keyframesForPose should be non-nil. Silence type checker.")
	local humanoid = p89:FindFirstChildOfClass("Humanoid")
	
	if not humanoid then return end
	assert(humanoid, "humanoid should be non-nil. Silence type checker.")
	t.SetPlayerCharacterNeutralPose(p89)
	t_1 = {}
	local tool = p89:FindFirstChildOfClass("Tool")
	
	if humanoid.RigType ~= Enum.HumanoidRigType.R15 then
		t.AdjustArmOnR6ForTool(p89)
	elseif tool then
		applyR15KeyframeWithTool(p89, humanoid, tool, p90.originalAnimationAssetId, p90.poseKeyframe, p90.defaultToolKeyframe, p90.suggestedKeyframeFromTool)
	else
		applyKeyframeInner(p89, p90.poseKeyframe)
	end
	if humanoid.RigType == Enum.HumanoidRigType.R15 then
		applyKeyframeInner(p89, p90.moodKeyframe)
	end
	t_1 = {}
	local ok, status = pcall(function() --[[ line: 103 ]]
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	
	if ok and status then
		t.ForceAnimationToStep(p89)
	end
end

function t.SetPlayerCharacterPoseWithMoodFallback(p91, p92, p93, p94, p95) --[[ line: 1370 ]]
	-- upvalues: t (ref)
	local humanoid = p91:FindFirstChildOfClass("Humanoid")
	
	if humanoid then
		assert(humanoid, "humanoid should be non-nil.  Silence type checker.")
		t.ApplyKeyframesForPose(p91, t.LoadKeyframesForPose(p91, p92, p93, p94, p95))
		
		return
	end
end

function t.ThumbnailZoomExtents(p96, p97, p98, p99, p100) --[[ line: 1394 ]]
	local modelCFrame = p96:GetModelCFrame()
	local lookVector = modelCFrame.LookVector
	local humanoidRootPart = p96:FindFirstChild("HumanoidRootPart")
	
	if humanoidRootPart then
		lookVector = humanoidRootPart.CFrame.LookVector
	end
	local cFrame = CFrame.new(modelCFrame.Position + lookVector * 5, modelCFrame.Position)
	local extentsSize = p96:GetExtentsSize()
	
	return cFrame - cFrame.Position + (modelCFrame.Position + Vector3.new(p98, -p99, 0)) + lookVector * (math.sqrt(extentsSize.X ^ 2 + extentsSize.Y ^ 2 + extentsSize.Z ^ 2) / 2 * (1 / math.tan(math.rad(p97) / 2)) * (1 / p100))
end

return t