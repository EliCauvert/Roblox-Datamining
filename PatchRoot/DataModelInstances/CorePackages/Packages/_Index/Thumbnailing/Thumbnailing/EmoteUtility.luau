-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:28 2026 Pacific Standard Time.

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

local function _() --[[ line: 75 | named "clearJointBlacklist" ]]
	-- upvalues: t_1 (write)
	t_1 = {}
end

local _ = function(p0) --[[ line: 79 | named "blacklistJoint" ]]
	-- upvalues: t_1 (write)
	t_1[p0] = true
end

local _ = function(p1) --[[ line: 83 | named "jointIsBlacklisted" ]]
	-- upvalues: t_1 (write)
	return t_1[p1]
end

local _ = function(value, p2) --[[ line: 90 | named "getCameraOffset" ]]
	return math.sqrt(p2.X ^ 2 + p2.Y ^ 2 + p2.Z ^ 2) / 2 * (1 / math.tan(math.rad(value) / 2))
end

local _ = function() --[[ line: 100 | named "isOnRCC" ]]
	local ok, status = pcall(function() --[[ line: 106 ]]
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	
	return ok and status
end

local _ = function() --[[ line: 115 | named "getAnalyticsTarget" ]]
	local ok, status = pcall(function() --[[ line: 106 ]]
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	
	return if ok and status then "RCC" else "Client"
end

local _ = function(p3, p4) --[[ line: 124 | named "reportCounter" ]]
	-- upvalues: rbxAnalyticsService (ref)
	local ok, status = pcall(function() --[[ line: 106 ]]
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	rbxAnalyticsService:ReportCounter((if ok and status then "RCC" else "Client") .. "_" .. p3 .. "_" .. (if p4 then "Success" else "Failure"))
end

local function getAnimationAndIsIdle(p5) --[[ line: 142 ]]
	-- upvalues: t (ref), rbxAnalyticsService (ref)
	local var29, var31
	assert(if typeof(p5) ~= "number" then typeof(p5) == "string" else true, "getAnimationAndIsIdle expects animationAssetIdOrUrl to be a number or string")
	local var26 = nil
	local _ = nil
	local _ = nil
	
	if typeof(p5) == "number" then
		local _ = nil
		local var27, var28 = t.LoadAsset(p5)
		var29 = var27
		local var30 = var28
		
		if var29 and var30 then
			var26 = var30:GetChildren()[1]
		end
		var31 = "EmoteUtility_LoadAsset"
	else
		local _ = nil
		local ok, status = pcall(function() --[[ line: 161 ]]
			-- upvalues: p5 (ref)
			return game:GetObjects(p5)[1]
		end)
		var29 = ok
		local var32 = status
		
		if var29 and var32 then
			var26 = var32
		end
		var31 = "EmoteUtility_GetObjects"
	end
	local var33 = var31
	local var34 = var29
	local ok, status = pcall(function() --[[ line: 106 ]]
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	rbxAnalyticsService:ReportCounter((if ok and status then "RCC" else "Client") .. "_" .. var33 .. "_" .. (if var34 then "Success" else "Failure"))
	
	if not var29 or not var26 then
		local text = var31 .. "_Failed"
		local ok_1, status_1 = pcall(function() --[[ line: 106 ]]
			return game.GetService(game, "ThumbnailGenerator") ~= nil
		end)
		rbxAnalyticsService:SendEventDeferred(if ok_1 and status_1 then "RCC" else "Client", "EmoteUtility_getPoseAsset", text, { animationAssetIdOrUrl = p5 })
		
		return nil, nil
	end
	assert(var26, "animation is non-nil. Silence type checker.")
	local var36 = false
	
	if var26.ClassName == "Folder" then
		var36 = true
		local var37 = var26:FindFirstChild("Pose", true) or var26:FindFirstChild("pose", true)
		
		if var37 == nil then
			var37 = var26:FindFirstChild("Idle", true) or var26:FindFirstChild("idle", true)
		end
		var26 = if var37 then var37:FindFirstChildWhichIsA("Animation", true) else var26:FindFirstChildWhichIsA("Animation", true)
	end
	return var26, var36
end

local function getAnimationClipByAssetId(value) --[[ line: 207 ]]
	-- upvalues: t (ref), animationClipProviderService (ref), rbxAnalyticsService (ref)
	local var43
	local _ = nil
	local var38 = nil
	
	if t.debugLoadAssetsFromFiles then
		local var39 = nil
		
		for i in string.gmatch(value, ".*id=([0-9]+)") do
			var39 = i
		end
		assert(var39, "assetId should be non-nil")
		local var40 = tonumber(var39)
		assert(var40, "assetIdAsNumber should be non-nil")
		local _ = nil
		local var41, var42 = t.LoadAsset(var40)
		var43 = var41
		local var44 = var42
		
		if var43 and var44 then
			var38 = var44
		end
	else
		local ok, status = pcall(function() --[[ line: 224 ]]
			-- upvalues: animationClipProviderService (copy), value (ref)
			return animationClipProviderService:GetAnimationClipAsync(value)
		end)
		var43 = ok
		var38 = status
	end
	local var45 = var43
	local ok, status = pcall(function() --[[ line: 106 ]]
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	rbxAnalyticsService:ReportCounter((if ok and status then "RCC" else "Client") .. "_" .. "EmoteUtility_GetAnimationClipAsync" .. "_" .. (if var45 then "Success" else "Failure"))
	
	if var43 then
		return var38
	end
	local ok_1, status_1 = pcall(function() --[[ line: 106 ]]
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	rbxAnalyticsService:SendEventDeferred(if ok_1 and status_1 then "RCC" else "Client", "EmoteUtility_GetAnimationClip", "EmoteUtility_GetAnimationClip_GetAnimationClipAsyncFailed", { keyframeSequenceId = value })
	
	return nil
end

local function getThumbnailKeyframeFromAnimationOrUrl(p6, p7, p8) --[[ line: 243 ]]
	-- upvalues: getAnimationClipByAssetId (ref), t (ref)
	local var48
	local var46 = p8
	local thumbnailTime = nil
	local _ = nil
	
	if typeof(p6) == "string" then
		var48 = getAnimationClipByAssetId(p6)
	else
		var46 = t.GetNumberValueWithDefault(p6, "ThumbnailKeyframe", p8)
		thumbnailTime = t.GetNumberValueWithDefault(p6, "ThumbnailTime", nil)
		var48 = t.GetAnimationClip(p6)
	end
	if not var48 then
		return nil
	elseif var48:IsA("KeyframeSequence") then
		return t.GetThumbnailKeyframe(var46, var48, p7)
	elseif var48:IsA("CurveAnimation") then
		return t.GetThumbnailKeyframeFromCurve(thumbnailTime, var48, p7)
	end
	error("Unsupported Animation type:" .. var48.ClassName)
	
	return nil
end

local _ = function(value, p9, p10) --[[ line: 275 | named "trySetProperty" ]]
	pcall(function() --[[ line: 276 ]]
		-- upvalues: value (ref), p9 (ref), p10 (ref)
		value[p9] = p10
	end)
end

local function applyControlsFolder(p11, p12, p13) --[[ line: 284 ]]
	if not p12 then return end
	assert(p12, "parentPose is non-nil. Silence type checker.")
	local name = p11:FindFirstChild(p12.Name)
	
	if not name then return end
	local name_1 = name:FindFirstChild(p13.Name)
	
	if not name_1 then return end
	for i, v in p13:GetChildren() do
		if v:IsA("NumberPose") then
			local name_2 = v.Name
			local value = v.Value
			pcall(function() --[[ line: 276 ]]
				-- upvalues: name_1 (ref), name_2 (ref), value (ref)
				name_1[name_2] = value
			end)
		end
	end
end

local function applyKeyframeInner(p14, p15) --[[ line: 313 ]]
	-- upvalues: t (ref), t_1 (write), applyControlsFolder (ref)
	local function recurApplyPoses(p16, p17) --[[ line: 314 ]]
		-- upvalues: p14 (ref), t (copy), t_1 (copy), applyControlsFolder (copy), recurApplyPoses (ref)
		if p16 and p17:IsA("Pose") then
			local jointBetween = t.GetJointBetween(p14:FindFirstChild(p16.Name), p14:FindFirstChild(p17.Name))
			
			if jointBetween and not (if not t_1[jointBetween] then false else true) then
				assert(jointBetween, "joint is non-nil. Silence type checker.")
				jointBetween.Transform = p17.CFrame
				t_1[jointBetween] = true
			end
		end
		if p17:IsA("Folder") then
			applyControlsFolder(p14, p16, p17)
			
			return
		end
		for i, v in p17:GetChildren() do
			recurApplyPoses(p17, v)
		end
	end
	
	if p15 then
		for i, v in pairs(p15:GetPoses()) do
			if not v:IsA("Folder") then
				for i_1, v_1 in v:GetChildren() do
					recurApplyPoses(v, v_1)
				end
			end
		end
	end
end

local function getRotatedKeyframe(p18, p19) --[[ line: 351 ]]
	if not p19 or p19 == 0 then
		return p18
	end
	assert(p19, "rotationDegrees is non-nil. Silence type checker.")
	local var53 = p18:Clone()
	local var54 = var53:GetPoses()[1]
	
	if var54 then
		local var55 = var54:GetSubPoses()[1]
		
		if var55 then
			var55.CFrame *= CFrame.Angles(0, math.rad(p19), 0)
		end
	end
	return var53
end

local function getRotationCFrame(p20, p21) --[[ line: 372 ]]
	if p20:IsA("EulerRotationCurve") then
		return p20:GetRotationAtTime(p21)
	elseif p20:IsA("RotationCurve") then
		return p20:GetValueAtTime(p21)
	end
	error("Unsupported rotation type:" .. p20.ClassName)
	
	return nil
end

local function findAttachmentsRecur(p22, p23) --[[ line: 383 ]]
	-- upvalues: findAttachmentsRecur (ref)
	for i, v in pairs(p22:GetChildren()) do
		if v:IsA("Attachment") then
			p23[v.Name] = v
		elseif not v:IsA("Tool") and not v:IsA("Accoutrement") then
			findAttachmentsRecur(v, p23)
		end
	end
end

local _ = function(p24) --[[ line: 394 | named "findAttachmentsInTool" ]]
	-- upvalues: findAttachmentsRecur (ref)
	local t = {}
	findAttachmentsRecur(p24, t)
	
	return t
end

local _ = function(p25) --[[ line: 400 | named "findAttachmentsInCharacter" ]]
	-- upvalues: findAttachmentsRecur (ref)
	local t = {}
	findAttachmentsRecur(p25, t)
	
	return t
end

local _ = function(p26, p27) --[[ line: 406 | named "weldAttachments" ]]
	local weld = Instance.new("Weld")
	weld.Part0 = p26.Parent
	weld.Part1 = p27.Parent
	weld.C0 = p26.CFrame
	weld.C1 = p27.CFrame
	weld.Parent = p26.Parent
	
	return weld
end

local function attachToolToCharacter(p28, p29, p30) --[[ line: 416 ]]
	-- upvalues: findAttachmentsRecur (ref)
	local t = {}
	findAttachmentsRecur(p28, t)
	local t_1 = {}
	findAttachmentsRecur(p30, t_1)
	local var61 = false
	
	for i, v in pairs(t_1) do
		local name = t[v.Name]
		
		if name then
			var61 = true
			local weld = Instance.new("Weld")
			weld.Part0 = name.Parent
			weld.Part1 = v.Parent
			weld.C0 = name.CFrame
			weld.C1 = v.CFrame
			weld.Parent = name.Parent
		end
	end
	if var61 then
		p30.Parent = p28
		
		return
	end
	p30.Parent = nil
	local handle = p30:FindFirstChild("Handle")
	local grip = p30.Grip
	
	if handle and grip then
		local rightGripAttachment = t.RightGripAttachment
		
		if rightGripAttachment then
			handle.CFrame = rightGripAttachment.Parent.CFrame * rightGripAttachment.CFrame * grip:Inverse()
		end
	end
	p29:EquipTool(p30)
end

local function applyR15KeyframeWithTool(p31, p32, p33, p34, p35, p36, p37) --[[ line: 448 ]]
	-- upvalues: applyKeyframeInner (ref), attachToolToCharacter (ref)
	if p37 then
		applyKeyframeInner(p31, p37)
		applyKeyframeInner(p31, p35)
	else
		applyKeyframeInner(p31, p36)
		
		if p34 ~= nil then
			applyKeyframeInner(p31, p35)
		end
	end
	attachToolToCharacter(p31, p32, p33)
end

local function getMainThumbnailKeyframe(p38, p39, p40, p41) --[[ line: 502 ]]
	-- upvalues: getAnimationAndIsIdle (ref), t (ref), getThumbnailKeyframeFromAnimationOrUrl (ref), emoteUtilityUseIdleAnimationFallback (ref)
	local var64 = nil
	local var65 = false
	local animationId = nil
	
	if p39 then
		animationId = p39
		local var66, var67 = getAnimationAndIsIdle(p39)
		
		if var66 == nil then
			return nil, var65, animationId
		end
		assert(var66, "animation is non-nil. Silence type checker.")
		
		if not var67 then
			var65 = true
		end
		var64 = getThumbnailKeyframeFromAnimationOrUrl(var66, if p40 then t.GetNumberValueWithDefault(var66, "ThumbnailCharacterRotation", 0) else 0)
		
		return var64, var65, animationId
	elseif p41 then
		local FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL = t.FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL
		local animate = p38:FindFirstChild("Animate")
		
		if animate then
			local var69 = animate:FindFirstChild("Pose") or animate:FindFirstChild("pose")
			
			if not var69 and emoteUtilityUseIdleAnimationFallback then
				var69 = animate:FindFirstChild("Idle") or animate:FindFirstChild("idle")
			end
			local var70 = if var69 then var69:FindFirstChildOfClass("Animation") else nil
			
			if var70 then
				FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL = var70
			end
		end
		var64 = getThumbnailKeyframeFromAnimationOrUrl(FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL, 0, 1)
		
		if typeof(FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL) == "string" then
			return var64, var65, FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL
		end
		animationId = FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL.AnimationId
	end
	return var64, var65, animationId
end

local _ = function(p42) --[[ line: 570 | named "getMoodThumbnailKeyframe" ]]
	-- upvalues: getAnimationAndIsIdle (ref), getThumbnailKeyframeFromAnimationOrUrl (ref)
	if not p42 then
		return nil
	end
	assert(p42, "moodAssetId is non-nil. Silence type checker.")
	local var71, _ = getAnimationAndIsIdle(p42)
	
	if var71 == nil then
		return nil
	end
	assert(var71, "animation is non-nil. Silence type checker.")
	
	return getThumbnailKeyframeFromAnimationOrUrl(var71, 0)
end

local function getToolKeyframes(p43, p44) --[[ line: 602 ]]
	-- upvalues: t (ref)
	local thumbnailPose = nil
	local thumbnailKeyframe = nil
	local tool = p43:FindFirstChildOfClass("Tool")
	
	if not tool then
		return nil, nil
	end
	assert(tool, "tool is non-nil. Silence type checker.")
	local var75 = false
	
	if not p44 then
		thumbnailPose = tool:FindFirstChild("ThumbnailPose")
		
		if thumbnailPose and thumbnailPose:IsA("Keyframe") then
			var75 = true
		end
	end
	if not var75 then
		thumbnailPose = nil
		local animate = p43:FindFirstChild("Animate")
		
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
			
			if tool:IsDescendantOf(p43) then
				return thumbnailPose, thumbnailKeyframe
			else
				return nil, nil
			end
		end
	end
end

local function getAttachmentCFrame(p45) --[[ line: 661 ]]
	local cFrame = p45.CFrame
	local parent = p45.Parent
	while parent and parent:IsA("Bone") do
		cFrame = parent.CFrame * cFrame
		parent = parent.Parent
	end
	return cFrame
end

local function getJointParts(p46) --[[ line: 671 ]]
	if p46:IsA("JointInstance") then
		return p46.Part0, p46.Part1
	elseif p46:IsA("Constraint") then
		local attachment0 = p46.Attachment0
		local attachment1 = p46.Attachment1
		
		return attachment0 and attachment0:FindFirstAncestorWhichIsA("BasePart"), attachment1 and attachment1:FindFirstAncestorWhichIsA("BasePart")
	end
	return nil, nil
end

local function applyCFrame(p47, p48, p49, p50) --[[ line: 684 ]]
	-- upvalues: getAttachmentCFrame (ref)
	if p49:IsA("AnimationConstraint") then
		p48.CFrame = p47.CFrame * getAttachmentCFrame(p49.Attachment0) * p50 * getAttachmentCFrame(p49.Attachment1):Inverse()
		
		return
	elseif p49:IsA("Motor6D") then
		local c0 = p49.C0
		local c1 = p49.C1
		p48.Anchored = true
		p48.CFrame = p47.CFrame * c0 * p50 * c1:Inverse()
	end
end

local function getJointPose(p51) --[[ line: 697 ]]
	if p51:IsA("AnimationConstraint") then
		return p51.Transform
	elseif not p51:IsA("Motor6D") then
		error("Unsupported joint type:" .. p51.ClassName)
		
		return CFrame.new()
	end
	local transform = p51.Transform
	
	if p51.CurrentAngle ~= 0 then
		transform *= CFrame.Angles(0, 0, p51.CurrentAngle)
	end
	return transform
end

function t.ForceAnimationToStep(p52) --[[ line: 717 ]]
	-- upvalues: getJointParts (ref), getJointPose (ref), applyCFrame (ref)
	local v
	local list = { p52:FindFirstChild("HumanoidRootPart") }
	local t = {}
	local t_1 = {}
	while #list > 0 do
		local removed = table.remove(list, 1)
		
		if t[removed] then continue end
		t[removed] = true
		
		for i, v in removed:GetJoints() do
			if v:IsA("Motor6D") or v:IsA("AnimationConstraint") then
				local var84, var85 = getJointParts(v)
				
				if var84 == removed and var85 and not t[var85] then
					table.insert(t_1, { part0 = removed, part1 = var85, joint = v })
					table.insert(list, var85)
				end
			end
		end
	end
	for i, v_1 in p52:GetDescendants() do
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

function t.LoadAsset(p53) --[[ line: 763 ]]
	-- upvalues: t (ref), insertService (ref)
	local ok, status = pcall(function() --[[ line: 764 ]]
		-- upvalues: t (copy), p53 (ref), insertService (copy)
		return if t.debugLoadAssetsFromFiles and t.mapAssetIdToFileName then insertService:LoadLocalAsset("rbxasset://" .. t.mapAssetIdToFileName(p53)) else insertService:LoadAsset(p53)
	end)
	
	return ok, status
end

function t.SetDebugLoadAssetsFromFiles(p54, p55) --[[ line: 785 ]]
	-- upvalues: t (ref)
	t.debugLoadAssetsFromFiles = p54
	t.mapAssetIdToFileName = p55
end

function t.GetJointBetween(p56, p57) --[[ line: 793 ]]
	if not p56 or not p57 then
		return nil
	end
	assert(p56, "part0 is non-nil. Silence type checker.")
	assert(p57, "part1 is non-nil. Silence type checker.")
	
	for i, v in p57:GetChildren() do
		if not v:IsA("Motor6D") or v.Part0 ~= p56 then
			if v:IsA("AnimationConstraint") and v.Part0 == p56 then
				return v
			end
		end
		return v
	end
	return nil
end

t.GetMotor6DBetween = t.GetJointBetween

function t.PoseKeyframeHasFaceAnimation(p58) --[[ line: 817 ]]
	if not p58 then
		return false
	end
	assert(p58, "poseKeyframe is non-nil. Silence type checker.")
	
	local function recurHasFaceAnimation(p59) --[[ line: 823 ]]
		-- upvalues: recurHasFaceAnimation (ref)
		if p59:IsA("Folder") then
			return true
		end
		for i, v in p59:GetChildren() do
			if recurHasFaceAnimation(v) then
				return true
			end
		end
		return false
	end
	
	for i, v in pairs(p58:GetPoses()) do
		if recurHasFaceAnimation(v) then
			return true
		end
	end
	return false
end

function t.ApplyKeyframe(p60, p61) --[[ line: 848 ]]
	-- upvalues: t_1 (write), applyKeyframeInner (ref), t (ref)
	t_1 = {}
	applyKeyframeInner(p60, p61)
	t_1 = {}
	local ok, status = pcall(function() --[[ line: 106 ]]
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	
	if ok and status then
		t.ForceAnimationToStep(p60)
	end
end

function t.GetNumberValueWithDefault(p62, p63, p64) --[[ line: 857 ]]
	local var87 = p64
	local var88 = p62:FindFirstChild(p63)
	
	if var88 and var88:IsA("NumberValue") then
		var87 = var88.Value
	end
	return var87
end

function t.GetAnimationClip(p65) --[[ line: 870 ]]
	-- upvalues: getAnimationClipByAssetId (ref)
	if p65:IsA("KeyframeSequence") then
		return p65
	elseif p65:IsA("CurveAnimation") then
		return p65
	elseif p65:IsA("Animation") then
		return getAnimationClipByAssetId(p65.AnimationId)
	end
	error("Cannot get AnimationClip from type:" .. p65.ClassName)
	
	return nil
end

function t.GetThumbnailKeyframe(p66, p67, p68) --[[ line: 886 ]]
	-- upvalues: getRotatedKeyframe (ref)
	local keyframes = p67:GetKeyframes()
	local _ = nil
	
	return getRotatedKeyframe(if p66 and p66 > 0 and p66 <= #keyframes then keyframes[p66] else keyframes[math.ceil(#keyframes / 2)], p68)
end

function t.GetCurveAnimationTimeLength(p69) --[[ line: 904 ]]
	local var90 = 0
	
	for i, v in p69:GetDescendants() do
		if v:IsA("FloatCurve") and v.Length ~= 0 then
			var90 = math.max(var90, v:GetKeyAtIndex(v.Length).Time)
		end
	end
	return var90
end

function t.GetThumbnailKeyframeFromCurve(p70, p71, p72) --[[ line: 922 ]]
	-- upvalues: t (ref), getRotationCFrame (ref), getRotatedKeyframe (ref)
	local curveAnimationTimeLength = t.GetCurveAnimationTimeLength(p71)
	
	if not p70 or p70 < 0 or curveAnimationTimeLength < p70 then
		p70 = curveAnimationTimeLength / 2
	end
	assert(p70, "thumbnailTime should be non-nil. Silence type checker")
	local t_1 = { Position = true, Rotation = true }
	
	local function _(p73) --[[ line: 940 | named "hasSubFolders" ]]
		for i, v in p73:GetChildren() do
			if v:IsA("Folder") then
				return true
			end
		end
		return false
	end
	
	local function recurGenerateKeyframe(p74, p75) --[[ line: 949 ]]
		-- upvalues: getRotationCFrame (copy), p70 (write), t_1 (ref), recurGenerateKeyframe (ref)
		local v
		local var95 = nil
		local position = p75:FindFirstChild("Position")
		local rotation = p75:FindFirstChild("Rotation")
		
		if position and rotation then
			local var100 = getRotationCFrame(rotation, p70)
			
			if var100 then
				local pose = Instance.new("Pose")
				pose.CFrame = var100 + Vector3.new(table.unpack(position:GetValueAtTime(p70)))
				pose.Name = p75.Name
				pose.Parent = p74
				var95 = pose
			end
		else
			local folder
			for i, v in p75:GetChildren() do
				if v:IsA("Folder") then
					folder = true
					if folder then
						local pose = Instance.new("Pose")
						pose.CFrame = CFrame.new()
						pose.Name = p75.Name
						pose.Parent = p74
						var95 = pose
					else
						folder = Instance.new("Folder")
						folder.Name = p75.Name
						folder.Parent = p74
						var95 = folder
					end
				end
			end
			folder = false
		end
		for i, v in p75:GetChildren() do
			if v:IsA("FloatCurve") and not t_1[v] then
				v = Instance.new("NumberPose")
				v.Name = v.Name
				local var102 = v:GetValueAtTime(p70) or 0
				assert(var102, "valueAtTime should be non-nil. Silence type checker.")
				v.Value = var102
				v.Parent = var95
			elseif v:IsA("Folder") then
				recurGenerateKeyframe(var95, v)
			end
		end
	end
	
	local keyframe = Instance.new("Keyframe")
	keyframe.Name = p71.Name
	keyframe.Time = p70
	
	for i, v in p71:GetChildren() do
		if v:IsA("Folder") then
			recurGenerateKeyframe(keyframe, v)
		end
	end
	return getRotatedKeyframe(keyframe, p72)
end

function t.ClearPlayerCharacterFace(p76) --[[ line: 1015 ]]
	local faceControls = p76:FindFirstChildWhichIsA("FaceControls", true)
	
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

function t.AdjustArmOnR6ForTool(p77) --[[ line: 1032 ]]
	local tool = p77:FindFirstChildOfClass("Tool")
	local torso = p77:FindFirstChild("Torso")
	
	if torso then
		local var108 = torso:FindFirstChild("Right Shoulder")
		
		if var108 then
			if tool then
				var108.CurrentAngle = 1.570796326795
				var108.DesiredAngle = 1.570796326795
				
				return
			end
			var108.CurrentAngle = 0
			var108.DesiredAngle = 0
		end
	end
end

function t.SetPlayerCharacterFace(p78, p79) --[[ line: 1054 ]]
	-- upvalues: getAnimationAndIsIdle (ref), getThumbnailKeyframeFromAnimationOrUrl (ref), t (ref)
	if not p79 then return end
	if p79 == "" then return end
	if p79 == 0 then return end
	local var109
	assert(if typeof(p79) ~= "number" then typeof(p79) == "string" else true, "EmoteUtility.SetPlayerCharacterFace expects animationAssetIdOrUrl to be a number or string")
	
	if not p78:FindFirstChildOfClass("Humanoid") then return end
	if p79 then
		assert(p79, "moodAssetId is non-nil. Silence type checker.")
		local var110, _ = getAnimationAndIsIdle(p79)
		
		if var110 == nil then
			var109 = nil
		else
			assert(var110, "animation is non-nil. Silence type checker.")
			var109 = getThumbnailKeyframeFromAnimationOrUrl(var110, 0)
		end
	else
		var109 = nil
	end
	if var109 then
		t.ClearPlayerCharacterFace(p78)
		t.ApplyKeyframe(p78, var109)
		
		return
	end
end

function t.SetPlayerCharacterNeutralPose(p80) --[[ line: 1095 ]]
	-- upvalues: t (ref)
	local humanoid = p80:FindFirstChildOfClass("Humanoid")
	
	if not humanoid then return end
	assert(humanoid, "humanoid should be non-nil. Silence type checker.")
	humanoid:BuildRigFromAttachments()
	
	if humanoid.RigType == Enum.HumanoidRigType.R15 then
		t.ClearPlayerCharacterFace(p80)
		
		local function recurResetJoint(value) --[[ line: 1110 ]]
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
		
		recurResetJoint(p80)
		
		return
	end
end

function t.FindDefaultMoodAnimationId(p81) --[[ line: 1127 ]]
	local animate = p81:FindFirstChild("Animate")
	
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

local function loadKeyframesForPoseR15(p82, p83, p84, p85, p86) --[[ line: 1146 ]]
	-- upvalues: getMainThumbnailKeyframe (ref), getToolKeyframes (ref), emoteUtilityDefaultMoodFromCharacter (ref), t (ref), getAnimationAndIsIdle (ref), getThumbnailKeyframeFromAnimationOrUrl (ref), getAnimationClipByAssetId (ref)
	local t_1 = { originalAnimationAssetId = p83 }
	local var117, var118, var119 = getMainThumbnailKeyframe(p82, p83, not p85, if p86 then false else true)
	local var120 = nil
	local var121 = nil
	
	if not p86 and var117 then
		local var122, var123 = getToolKeyframes(p82, var118)
		var120 = var122
		var121 = var123
	end
	local var124 = nil
	local var125 = false
	
	if emoteUtilityDefaultMoodFromCharacter or p84 and p84 ~= 0 then
		if p83 == nil then
			var125 = true
		elseif not t.PoseKeyframeHasFaceAnimation(var117) then
			var125 = true
		end
	end
	if var125 then
		if emoteUtilityDefaultMoodFromCharacter then
			if p84 and p84 ~= 0 then
				if p84 then
					assert(p84, "moodAssetId is non-nil. Silence type checker.")
					local var126, _ = getAnimationAndIsIdle(p84)
					
					if var126 == nil then
						var124 = nil
					else
						assert(var126, "animation is non-nil. Silence type checker.")
						var124 = getThumbnailKeyframeFromAnimationOrUrl(var126, 0)
					end
				else
					var124 = nil
				end
			end
			if not var124 then
				local var127 = t.FindDefaultMoodAnimationId(p82)
				
				if var127 then
					local var128 = getAnimationClipByAssetId(var127)
					
					if var128 and var128:IsA("KeyframeSequence") then
						var124 = t.GetThumbnailKeyframe(nil, var128, 0)
					end
				end
			end
		elseif p84 then
			assert(p84, "moodAssetId is non-nil. Silence type checker.")
			local var129, _ = getAnimationAndIsIdle(p84)
			
			if var129 == nil then
				var124 = nil
			else
				assert(var129, "animation is non-nil. Silence type checker.")
				var124 = getThumbnailKeyframeFromAnimationOrUrl(var129, 0)
			end
		else
			var124 = nil
		end
	end
	t_1.poseKeyframe = var117
	t_1.moodKeyframe = var124
	t_1.defaultToolKeyframe = var121
	t_1.suggestedKeyframeFromTool = var120
	t_1.finalAnimationAssetIdOrUrl = var119
	
	return t_1
end

function t.LoadKeyframesForPose(p87, p88, p89, p90, p91) --[[ line: 1247 ]]
	-- upvalues: loadKeyframesForPoseR15 (ref)
	assert(p87, "character should be non-nil")
	
	if p88 ~= nil then
		assert(typeof(p88) == "number", "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a number or nil")
		assert(p88 > 0, "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a real asset ID (positive number)")
	end
	if p89 ~= nil then
		assert(typeof(p89) == "number", "EmoteUtility.LoadKeyframesForPose expects moodAssetId to be a number or nil")
	end
	local humanoid = p87:FindFirstChildOfClass("Humanoid")
	
	if not humanoid then
		return nil
	end
	assert(humanoid, "humanoid should be non-nil. Silence type checker.")
	
	return if humanoid.RigType == Enum.HumanoidRigType.R15 then loadKeyframesForPoseR15(p87, p88, p89, p90, p91) else { originalAnimationAssetId = p88 }
end

function t.ApplyKeyframesForPose(p92, p93) --[[ line: 1295 ]]
	-- upvalues: t (ref), t_1 (write), applyR15KeyframeWithTool (ref), applyKeyframeInner (ref)
	assert(p92, "character should be non-nil")
	
	if not p93 then return end
	assert(p93, "keyframesForPose should be non-nil. Silence type checker.")
	local humanoid = p92:FindFirstChildOfClass("Humanoid")
	
	if not humanoid then return end
	assert(humanoid, "humanoid should be non-nil. Silence type checker.")
	t.SetPlayerCharacterNeutralPose(p92)
	t_1 = {}
	local tool = p92:FindFirstChildOfClass("Tool")
	
	if humanoid.RigType ~= Enum.HumanoidRigType.R15 then
		t.AdjustArmOnR6ForTool(p92)
	elseif tool then
		applyR15KeyframeWithTool(p92, humanoid, tool, p93.originalAnimationAssetId, p93.poseKeyframe, p93.defaultToolKeyframe, p93.suggestedKeyframeFromTool)
	else
		applyKeyframeInner(p92, p93.poseKeyframe)
	end
	if humanoid.RigType == Enum.HumanoidRigType.R15 then
		applyKeyframeInner(p92, p93.moodKeyframe)
	end
	t_1 = {}
	local ok, status = pcall(function() --[[ line: 106 ]]
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	
	if ok and status then
		t.ForceAnimationToStep(p92)
	end
end

function t.SetPlayerCharacterPoseWithMoodFallback(p94, p95, p96, p97, p98) --[[ line: 1361 ]]
	-- upvalues: t (ref), emoteUtilityReportPoseAnimationDownloadFailure (ref)
	local humanoid = p94:FindFirstChildOfClass("Humanoid")
	
	if not humanoid then return end
	assert(humanoid, "humanoid should be non-nil.  Silence type checker.")
	local var134 = t.LoadKeyframesForPose(p94, p95, p96, p97, p98)
	t.ApplyKeyframesForPose(p94, var134)
	
	return if not (not emoteUtilityReportPoseAnimationDownloadFailure or not var134) then if humanoid.RigType == Enum.HumanoidRigType.R15 and p95 ~= nil and var134.poseKeyframe == nil then "Failed to download requested pose animation" else nil else nil
end

function t.ThumbnailZoomExtents(p99, p100, p101, p102, p103) --[[ line: 1394 ]]
	local modelCFrame = p99:GetModelCFrame()
	local lookVector = modelCFrame.LookVector
	local humanoidRootPart = p99:FindFirstChild("HumanoidRootPart")
	
	if humanoidRootPart then
		lookVector = humanoidRootPart.CFrame.LookVector
	end
	local cFrame = CFrame.new(modelCFrame.Position + lookVector * 5, modelCFrame.Position)
	local extentsSize = p99:GetExtentsSize()
	
	return cFrame - cFrame.Position + (modelCFrame.Position + Vector3.new(p101, -p102, 0)) + lookVector * (math.sqrt(extentsSize.X ^ 2 + extentsSize.Y ^ 2 + extentsSize.Z ^ 2) / 2 * (1 / math.tan(math.rad(p100) / 2)) * (1 / p103))
end

return t