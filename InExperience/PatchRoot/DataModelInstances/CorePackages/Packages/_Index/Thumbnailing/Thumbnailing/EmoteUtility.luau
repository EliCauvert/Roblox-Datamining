local AnimationClipProvider = game:GetService("AnimationClipProvider")
local InsertService = game:GetService("InsertService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local EmoteUtilityFallbackKeyframeSequenceAssetId = game:DefineFastString("EmoteUtilityFallbackKeyframeSequenceAssetId", "10921261056")
local EmoteUtilityDefaultMoodFromCharacter = game:DefineFastFlag("EmoteUtilityDefaultMoodFromCharacter", false)
local EmoteUtilityUseIdleAnimationFallback = game:DefineFastFlag("EmoteUtilityUseIdleAnimationFallback", false)
local EmoteUtilityReportPoseAnimationDownloadFailure = game:DefineFastFlag("EmoteUtilityReportPoseAnimationDownloadFailure", false)
local EmoteUtilityRetargetPoses = game:DefineFastFlag("EmoteUtilityRetargetPoses", false)
local EmoteUtilityCanonicalR15RigUri = game:DefineFastString("EmoteUtilityCanonicalR15RigUri", "rbxasset://avatar/characterR15.rbxm")
local EmoteUtilityCurveRotationOnlyJoints = game:DefineFastFlag("EmoteUtilityCurveRotationOnlyJoints", false)
local EmoteUtilityModule = {
	FallbackKeyframeSequenceAssetId = EmoteUtilityFallbackKeyframeSequenceAssetId,
	debugLoadAssetsFromFiles = false,
	mapAssetIdToFileName = nil,
	EmoteUtilitySupportAJU = true,
	FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL = "http://www.roblox.com/asset/?id=" .. EmoteUtilityFallbackKeyframeSequenceAssetId
}
local T = {}

local function _()
	-- upvalues: T (ref)
	T = {}
end

local _ = function(Key)
	-- upvalues: T (ref)
	T[Key] = true
end

local _ = function(p1): boolean
	-- upvalues: T (ref)
	return if T[p1] then true else false
end

local _ = function(Degrees: number, Vector): number
	return math.sqrt(Vector.X ^ 2 + Vector.Y ^ 2 + Vector.Z ^ 2) / 2 * (1 / math.tan(math.rad(Degrees) / 2))
end

local _ = function()
	local Success, Result = pcall(function(): boolean
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	
	return Success and Result
end

local _ = function(): string
	local Success, Result = pcall(function(): boolean
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	
	return if Success and Result then "RCC" else "Client"
end

local _ = function(Text, p1)
	-- upvalues: RbxAnalyticsService (copy)
	local Success, Result = pcall(function(): boolean
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	RbxAnalyticsService:ReportCounter((if Success and Result then "RCC" else "Client") .. "_" .. Text .. "_" .. (if p1 then "Success" else "Failure"))
end

local function getAnimationAndIsIdle(AnimationAssetIdOrUrl)
	-- upvalues: EmoteUtilityModule (copy), RbxAnalyticsService (copy)
	assert(typeof(AnimationAssetIdOrUrl) == "number" or typeof(AnimationAssetIdOrUrl) == "string", "getAnimationAndIsIdle expects animationAssetIdOrUrl to be a number or string")
	local Animation = nil
	local Asset = nil
	local v1 = nil
	
	if typeof(AnimationAssetIdOrUrl) == "number" then
		local Asset2
		Asset, Asset2 = EmoteUtilityModule.LoadAsset(AnimationAssetIdOrUrl)
		
		if Asset and Asset2 then
			Animation = Asset2:GetChildren()[1]
		end
		v1 = "EmoteUtility_LoadAsset"
	else
		local Result
		Asset, Result = pcall(function()
			-- upvalues: AnimationAssetIdOrUrl (copy)
			return game:GetObjects(AnimationAssetIdOrUrl)[1]
		end)
		
		if Asset and Result then
			Animation = Result
		end
		v1 = "EmoteUtility_GetObjects"
	end
	local Success, Result1 = pcall(function(): boolean
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	RbxAnalyticsService:ReportCounter((if Success and Result1 then "RCC" else "Client") .. "_" .. v1 .. "_" .. (if Asset then "Success" else "Failure"))
	
	if not Asset or not Animation then
		local Text = v1 .. "_Failed"
		local Success1, Result2 = pcall(function(): boolean
			return game.GetService(game, "ThumbnailGenerator") ~= nil
		end)
		RbxAnalyticsService:SendEventDeferred(if Success1 and Result2 then "RCC" else "Client", "EmoteUtility_getPoseAsset", Text, { animationAssetIdOrUrl = AnimationAssetIdOrUrl })
		
		return nil, nil
	end
	assert(Animation, "animation is non-nil. Silence type checker.")
	local Flag = false
	
	if Animation.ClassName == "Folder" then
		Flag = true
		local Pose = Animation:FindFirstChild("Pose", true) or Animation:FindFirstChild("pose", true)
		
		if Pose == nil then
			Pose = Animation:FindFirstChild("Idle", true) or Animation:FindFirstChild("idle", true)
		end
		if Pose then
			Animation = Pose:FindFirstChildWhichIsA("Animation", true)
		else
			Animation = Animation:FindFirstChildWhichIsA("Animation", true)
		end
	end
	return Animation, Flag
end

local function getAnimationClipByAssetId(Text: string)
	-- upvalues: EmoteUtilityModule (copy), AnimationClipProvider (copy), RbxAnalyticsService (copy)
	local v1 = nil
	local Success = nil
	
	if EmoteUtilityModule.debugLoadAssetsFromFiles then
		local v2 = nil
		
		for i in string.gmatch(Text, ".*id=([0-9]+)") do
			v2 = i
		end
		assert(v2, "assetId should be non-nil")
		local Number: number? = tonumber(v2)
		assert(Number, "assetIdAsNumber should be non-nil")
		local Asset2
		Success, Asset2 = EmoteUtilityModule.LoadAsset(Number)
		
		if Success and Asset2 then
			v1 = Asset2
		end
	else
		Success, v74 = pcall(function()
			-- upvalues: AnimationClipProvider (upval), Text (copy)
			return AnimationClipProvider:GetAnimationClipAsync(Text)
		end)
	end
	local Success1, Result = pcall(function(): boolean
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	RbxAnalyticsService:ReportCounter((if Success1 and Result then "RCC" else "Client") .. "_" .. "EmoteUtility_GetAnimationClipAsync" .. "_" .. (if Success then "Success" else "Failure"))
	
	if Success then
		return v1
	else
		local Success2, Result1 = pcall(function(): boolean
			return game.GetService(game, "ThumbnailGenerator") ~= nil
		end)
		RbxAnalyticsService:SendEventDeferred(if Success2 and Result1 then "RCC" else "Client", "EmoteUtility_GetAnimationClip", "EmoteUtility_GetAnimationClip_GetAnimationClipAsyncFailed", { keyframeSequenceId = Text })
		
		return nil
	end
end

local function getThumbnailKeyframeFromAnimationOrUrl(FALLBACKKEYFRAMESEQUENCEASSETURL, ThumbnailCharacterRotationNumberValueWithDefault, ThumbnailKeyframeNumberValueWithDefault)
	-- upvalues: getAnimationClipByAssetId (copy), EmoteUtilityModule (copy)
	local ThumbnailKeyframeNumberValueWithDefault1 = ThumbnailKeyframeNumberValueWithDefault
	local ThumbnailTimeNumberValueWithDefault = nil
	local AnimationClipByAssetId = nil
	
	if typeof(FALLBACKKEYFRAMESEQUENCEASSETURL) == "string" then
		AnimationClipByAssetId = getAnimationClipByAssetId(FALLBACKKEYFRAMESEQUENCEASSETURL)
	else
		ThumbnailKeyframeNumberValueWithDefault1 = EmoteUtilityModule.GetNumberValueWithDefault(FALLBACKKEYFRAMESEQUENCEASSETURL, "ThumbnailKeyframe", ThumbnailKeyframeNumberValueWithDefault)
		ThumbnailTimeNumberValueWithDefault = EmoteUtilityModule.GetNumberValueWithDefault(FALLBACKKEYFRAMESEQUENCEASSETURL, "ThumbnailTime", nil)
		AnimationClipByAssetId = EmoteUtilityModule.GetAnimationClip(FALLBACKKEYFRAMESEQUENCEASSETURL)
	end
	if not AnimationClipByAssetId then
		return nil
	end
	local AnimationRigData = AnimationClipByAssetId:FindFirstChildOfClass("AnimationRigData")
	
	if AnimationClipByAssetId:IsA("KeyframeSequence") then
		return EmoteUtilityModule.GetThumbnailKeyframe(ThumbnailKeyframeNumberValueWithDefault1, AnimationClipByAssetId, ThumbnailCharacterRotationNumberValueWithDefault), AnimationRigData
	elseif AnimationClipByAssetId:IsA("CurveAnimation") then
		return EmoteUtilityModule.GetThumbnailKeyframeFromCurve(ThumbnailTimeNumberValueWithDefault, AnimationClipByAssetId, ThumbnailCharacterRotationNumberValueWithDefault), AnimationRigData
	else
		error("Unsupported Animation type:" .. AnimationClipByAssetId.ClassName)
		
		return nil
	end
end

local _ = function(p1, p2, p3)
	pcall(function()
		-- upvalues: p1 (copy), p2 (copy), p3 (copy)
		p1[p2] = p3
	end)
end

local function applyControlsFolder(Object, p1, Folder)
	if not p1 then return end
	assert(p1, "parentPose is non-nil. Silence type checker.")
	local Name = Object:FindFirstChild(p1.Name)
	
	if not Name then return end
	local Name1 = Name:FindFirstChild(Folder.Name)
	
	if not Name1 then return end
	for _, NumberPose in Folder:GetChildren() do
		if NumberPose:IsA("NumberPose") then
			local Name2 = NumberPose.Name
			local Value = NumberPose.Value
			pcall(function()
				-- upvalues: Name1 (copy), Name2 (copy), Value (copy)
				Name1[Name2] = Value
			end)
		end
	end
end

local function applyKeyframeControls(p2, MoodKeyframe)
	-- upvalues: applyControlsFolder (copy)
	local function recurApplyControls(Folder, Folder1: Folder)
		-- upvalues: applyControlsFolder (upval), p2 (copy), recurApplyControls (copy)
		if Folder1:IsA("Folder") then
			applyControlsFolder(p2, Folder, Folder1)
			
			return
		end
		for _, child in Folder1:GetChildren() do
			recurApplyControls(Folder1, child)
		end
	end
	
	if MoodKeyframe then
		for _, pos in MoodKeyframe:GetPoses() do
			recurApplyControls(nil, pos)
		end
	end
end

local function applyKeyframeInner(Object, Keyframe)
	-- upvalues: EmoteUtilityModule (copy), T (ref), applyControlsFolder (copy)
	local function recurApplyPoses(Folder, Object1)
		-- upvalues: Object (copy), EmoteUtilityModule (upval), T (upval), applyControlsFolder (upval), recurApplyPoses (copy)
		if Folder and Object1:IsA("Pose") then
			local JointBetween = EmoteUtilityModule.GetJointBetween(Object:FindFirstChild(Folder.Name), (Object:FindFirstChild(Object1.Name)))
			
			if JointBetween and not (if T[JointBetween] then true else false) then
				assert(JointBetween, "joint is non-nil. Silence type checker.")
				JointBetween.Transform = Object1.CFrame
				T[JointBetween] = true
			end
		end
		if Object1:IsA("Folder") then
			applyControlsFolder(Object, Folder, Object1)
			
			return
		end
		for _, child in Object1:GetChildren() do
			recurApplyPoses(Object1, child)
		end
	end
	
	if Keyframe then
		for _, pos in pairs(Keyframe:GetPoses()) do
			if not pos:IsA("Folder") then
				for _, child in pos:GetChildren() do
					recurApplyPoses(pos, child)
				end
			end
		end
	end
end

local function getRotatedKeyframe(Keyframe, Degrees: number)
	if not Degrees or Degrees == 0 then
		return Keyframe
	end
	assert(Degrees, "rotationDegrees is non-nil. Silence type checker.")
	local KeyframeClone = Keyframe:Clone()
	local Pos = KeyframeClone:GetPoses()[1]
	
	if Pos then
		local SubPos = Pos:GetSubPoses()[1]
		
		if SubPos then
			SubPos.CFrame *= CFrame.Angles(0, math.rad(Degrees), 0)
		end
	end
	return KeyframeClone
end

local function getRotationCFrame(Object, Time)
	if Object:IsA("EulerRotationCurve") then
		return Object:GetRotationAtTime(Time)
	elseif Object:IsA("RotationCurve") then
		return Object:GetValueAtTime(Time)
	else
		error("Unsupported rotation type:" .. Object.ClassName)
		
		return nil
	end
end

local function findAttachmentsRecur(Parent, p3)
	-- upvalues: findAttachmentsRecur (copy)
	for _, child in pairs(Parent:GetChildren()) do
		if child:IsA("Attachment") then
			p3[child.Name] = child
		elseif not child:IsA("Tool") and not child:IsA("Accoutrement") then
			findAttachmentsRecur(child, p3)
		end
	end
end

local _ = function(p4)
	-- upvalues: findAttachmentsRecur (copy)
	local t = {}
	findAttachmentsRecur(p4, t)
	
	return t
end

local _ = function(p4)
	-- upvalues: findAttachmentsRecur (copy)
	local t = {}
	findAttachmentsRecur(p4, t)
	
	return t
end

local _ = function(p4, p5)
	local Weld = Instance.new("Weld")
	Weld.Part0 = p4.Parent
	Weld.Part1 = p5.Parent
	Weld.C0 = p4.CFrame
	Weld.C1 = p5.CFrame
	Weld.Parent = p4.Parent
	
	return Weld
end

local function attachToolToCharacter(Parent, Humanoid: Humanoid, Tool: Tool)
	-- upvalues: findAttachmentsRecur (copy)
	local t = {}
	findAttachmentsRecur(Parent, t)
	local t1 = {}
	findAttachmentsRecur(Tool, t1)
	local Flag = false
	
	for _, value in pairs(t1) do
		local Entry = t[value.Name]
		
		if Entry then
			Flag = true
			local Weld = Instance.new("Weld")
			Weld.Part0 = Entry.Parent
			Weld.Part1 = value.Parent
			Weld.C0 = Entry.CFrame
			Weld.C1 = value.CFrame
			Weld.Parent = Entry.Parent
		end
	end
	if Flag then
		Tool.Parent = Parent
		
		return
	end
	Tool.Parent = nil
	local Handle = Tool:FindFirstChild("Handle")
	local Grip = Tool.Grip
	
	if Handle and Grip then
		local RightGripAttachment = t.RightGripAttachment
		
		if RightGripAttachment then
			Handle.CFrame = RightGripAttachment.Parent.CFrame * RightGripAttachment.CFrame * Grip:Inverse()
		end
	end
	Humanoid:EquipTool(Tool)
end

local function getToolBodyLayersInPriorityOrder(p4)
	local List = {}
	
	local function _(Keyframe, SourceRig)
		-- upvalues: List (copy)
		if Keyframe then
			table.insert(List, { keyframe = Keyframe, sourceRig = SourceRig })
		end
	end
	
	if p4.suggestedKeyframeFromTool then
		local SuggestedKeyframeFromTool = p4.suggestedKeyframeFromTool
		local SuggestedToolSourceRig = p4.suggestedToolSourceRig
		
		if SuggestedKeyframeFromTool then
			table.insert(List, {
				keyframe = SuggestedKeyframeFromTool,
				sourceRig = SuggestedToolSourceRig
			})
		end
		local PoseKeyframe = p4.poseKeyframe
		local PoseSourceRig = p4.poseSourceRig
		
		if PoseKeyframe then
			table.insert(List, { keyframe = PoseKeyframe, sourceRig = PoseSourceRig })
			
			return List
		end
	else
		local DefaultToolKeyframe = p4.defaultToolKeyframe
		local DefaultToolSourceRig = p4.defaultToolSourceRig
		
		if DefaultToolKeyframe then
			table.insert(List, {
				keyframe = DefaultToolKeyframe,
				sourceRig = DefaultToolSourceRig
			})
		end
		if p4.originalAnimationAssetId ~= nil then
			local PoseKeyframe = p4.poseKeyframe
			local PoseSourceRig = p4.poseSourceRig
			
			if PoseKeyframe then
				table.insert(List, { keyframe = PoseKeyframe, sourceRig = PoseSourceRig })
			end
		end
	end
	return List
end

local function applyR15KeyframeWithTool(Parent, Humanoid, Tool, p4)
	-- upvalues: getToolBodyLayersInPriorityOrder (copy), applyKeyframeInner (copy), attachToolToCharacter (copy)
	for _, value in getToolBodyLayersInPriorityOrder(p4) do
		applyKeyframeInner(Parent, value.keyframe)
	end
	attachToolToCharacter(Parent, Humanoid, Tool)
end

local function rotationBetween(Vector, p5): CFrame
	local CrossProduct = Vector:Cross(p5)
	
	return if CrossProduct.Magnitude < 0.000001 then CFrame.new() else CFrame.fromAxisAngle(CrossProduct.Unit, (math.atan2(CrossProduct.Magnitude, (Vector:Dot(p5)))))
end

local _ = function(Object)
	return if Object and Object:IsA("Motor6D") then Object elseif Object and Object:IsA("AnimationConstraint") and Object.Attachment0 and Object.Attachment1 then Object else nil
end

local _ = function(Object, ChildName, ChildName1)
	local ChildName2 = Object:FindFirstChild(ChildName)
	local ChildName3 = ChildName2 and ChildName2:FindFirstChild(ChildName1)
	
	return if ChildName3 and ChildName3:IsA("Motor6D") then ChildName3 elseif ChildName3 and ChildName3:IsA("AnimationConstraint") and ChildName3.Attachment0 and ChildName3.Attachment1 then ChildName3 else nil
end

local function findBodyJoint(Parent, ChildName)
	local ChildName1 = nil
	for _, Part in Parent:GetChildren() do
		if Part:IsA("BasePart") then
			ChildName1 = Part:FindFirstChild(ChildName, true)
			
			if ChildName1 and (ChildName1:IsA("Bone") or (if ChildName1 and ChildName1:IsA("Motor6D") then ChildName1 elseif ChildName1 and ChildName1:IsA("AnimationConstraint") and ChildName1.Attachment0 and ChildName1.Attachment1 then ChildName1 else nil)) then
				return ChildName1
			end
		end
	end
	return nil
end

local _ = function(Weld)
	if Weld:IsA("Motor6D") then
		return Weld.C0, Weld.C1
	else
		local function inPart(Attachment)
			local AttachmentCFrame = Attachment.CFrame
			local Parent = Attachment.Parent
			while Parent and Parent:IsA("Bone") do
				AttachmentCFrame = Parent.CFrame * AttachmentCFrame
				Parent = Parent.Parent
			end
			return AttachmentCFrame
		end
		
		return inPart(Weld.Attachment0), (inPart(Weld.Attachment1))
	end
end

local function getArmRestGeometry(Object, Text)
	local Text1 = Text .. "Shoulder"
	local Child = Object:FindFirstChild(Text .. "UpperArm")
	local Text2 = Child and Child:FindFirstChild(Text1)
	local Text3 = if Text2 and Text2:IsA("Motor6D") then Text2 elseif Text2 and Text2:IsA("AnimationConstraint") and Text2.Attachment0 and Text2.Attachment1 then Text2 else nil
	local Text4 = Text .. "Elbow"
	local Child1 = Object:FindFirstChild(Text .. "LowerArm")
	local Text5 = Child1 and Child1:FindFirstChild(Text4)
	local Text6 = if Text5 and Text5:IsA("Motor6D") then Text5 elseif Text5 and Text5:IsA("AnimationConstraint") and Text5.Attachment0 and Text5.Attachment1 then Text5 else nil
	local Text7 = Text .. "Wrist"
	local Child2 = Object:FindFirstChild(Text .. "Hand")
	local Text8 = Child2 and Child2:FindFirstChild(Text7)
	local Text9 = if Text8 and Text8:IsA("Motor6D") then Text8 elseif Text8 and Text8:IsA("AnimationConstraint") and Text8.Attachment0 and Text8.Attachment1 then Text8 else nil
	
	if not Text3 or not Text6 or not Text9 then
		return nil
	end
	local C0 = nil
	local C1 = nil
	if Text3:IsA("Motor6D") then
		C0 = Text3.C0
		C1 = Text3.C1
	else
		local function inPart(Attachment)
			local AttachmentCFrame = Attachment.CFrame
			local Parent = Attachment.Parent
			while Parent and Parent:IsA("Bone") do
				AttachmentCFrame = Parent.CFrame * AttachmentCFrame
				Parent = Parent.Parent
			end
			return AttachmentCFrame
		end
		
		C0 = inPart(Text3.Attachment0)
		C1 = inPart(Text3.Attachment1)
	end
	local C0_1 = nil
	local C1_1 = nil
	if Text6:IsA("Motor6D") then
		C0_1 = Text6.C0
		C1_1 = Text6.C1
	else
		local function inPart(Attachment)
			local AttachmentCFrame = Attachment.CFrame
			local Parent = Attachment.Parent
			while Parent and Parent:IsA("Bone") do
				AttachmentCFrame = Parent.CFrame * AttachmentCFrame
				Parent = Parent.Parent
			end
			return AttachmentCFrame
		end
		
		C0_1 = inPart(Text6.Attachment0)
		C1_1 = inPart(Text6.Attachment1)
	end
	local C0_2 = nil
	if Text9:IsA("Motor6D") then
		C0_2 = Text9.C0
		local _ = Text9.C1
	else
		local function inPart(Attachment)
			local AttachmentCFrame = Attachment.CFrame
			local Parent = Attachment.Parent
			while Parent and Parent:IsA("Bone") do
				AttachmentCFrame = Parent.CFrame * AttachmentCFrame
				Parent = Parent.Parent
			end
			return AttachmentCFrame
		end
		
		C0_2 = inPart(Text9.Attachment0)
		local _ = inPart(Text9.Attachment1)
	end
	local ScaledC = C0 * C1:Inverse()
	local ScaledScaledC = ScaledC * C0_1
	local ScaledScaledScaledC = ScaledScaledC * C1_1:Inverse()
	
	return {
		shoulderFrame = C0,
		elbowFrame = ScaledScaledC,
		upperDirection = (ScaledScaledC.Position - ScaledC.Position).Unit,
		lowerDirection = ((ScaledScaledScaledC * C0_2).Position - ScaledScaledScaledC.Position).Unit
	}
end

local function ensureRigDescription(Parent): boolean
	-- upvalues: findBodyJoint (copy), getArmRestGeometry (copy), rotationBetween (copy)
	if Parent:FindFirstChildWhichIsA("HumanoidRigDescription", true) then
		return false
	end
	local HumanoidRigDescription = Instance.new("HumanoidRigDescription")
	local JointNames = HumanoidRigDescription:GetJointNames()
	
	for _, enumItem in Enum.RigLabel:GetEnumItems() do
		if table.find(JointNames, enumItem.Name) then
			local BodyJoint = findBodyJoint(Parent, enumItem.Name)
			
			if BodyJoint then
				HumanoidRigDescription:SetJoint(enumItem, BodyJoint)
			end
		end
	end
	for _, value in {
		{
			name = "Right",
			outward = vector.create(1, 0, 0),
			shoulder = Enum.RigLabel.RightShoulder,
			elbow = Enum.RigLabel.RightElbow
		},
		{
			name = "Left",
			outward = vector.create(-1, -0, -0),
			shoulder = Enum.RigLabel.LeftShoulder,
			elbow = Enum.RigLabel.LeftElbow
		}
	} do
		local ArmRestGeometry = getArmRestGeometry(Parent, value.name)
		
		if ArmRestGeometry then
			HumanoidRigDescription:SetTposeAdjustment(value.shoulder, rotationBetween(ArmRestGeometry.shoulderFrame:VectorToObjectSpace(ArmRestGeometry.upperDirection), ArmRestGeometry.shoulderFrame:VectorToObjectSpace(value.outward)))
			HumanoidRigDescription:SetTposeAdjustment(value.elbow, rotationBetween(ArmRestGeometry.elbowFrame:VectorToObjectSpace(ArmRestGeometry.lowerDirection), ArmRestGeometry.elbowFrame:VectorToObjectSpace(ArmRestGeometry.upperDirection)))
		end
	end
	HumanoidRigDescription.Parent = Parent
	
	return true
end

local function restsArmsDown(p5): boolean
	-- upvalues: getArmRestGeometry (copy)
	for _, value in { "Right", "Left" } do
		local ArmRestGeometry = getArmRestGeometry(p5, value)
		
		if ArmRestGeometry and math.deg((math.acos((math.clamp(ArmRestGeometry.upperDirection:Dot(vector.create(-0, -1, -0)), -1, 1))))) > 30 then
			return false
		end
	end
	return true
end

EmoteUtilityModule.RestsArmsDown = restsArmsDown
EmoteUtilityModule.EnsureRigDescription = ensureRigDescription
local v3 = nil

local function loadCanonicalR15Rig()
	-- upvalues: v3 (ref), EmoteUtilityCanonicalR15RigUri (copy), ensureRigDescription (copy), RbxAnalyticsService (copy)
	if v3 then return end
	local Success, Result = pcall(function()
		-- upvalues: EmoteUtilityCanonicalR15RigUri (upval)
		return game:GetObjects(EmoteUtilityCanonicalR15RigUri)[1]
	end)
	local AnimationRigData = nil
	
	if Success and Result and Result:IsA("Model") then
		ensureRigDescription(Result)
		local AnimationRigData1 = Instance.new("AnimationRigData")
		
		if AnimationRigData1:LoadFromModel(Result) then
			AnimationRigData = AnimationRigData1
		end
	end
	local HasAnimationRigData = AnimationRigData ~= nil
	local Success1, Result1 = pcall(function(): boolean
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	RbxAnalyticsService:ReportCounter((if Success1 and Result1 then "RCC" else "Client") .. "_" .. "EmoteUtility_GetCanonicalR15Rig" .. "_" .. (if HasAnimationRigData then "Success" else "Failure"))
	v3 = AnimationRigData
end

local list = {
	Enum.AnimationPriority.Action4, Enum.AnimationPriority.Action3,
	Enum.AnimationPriority.Action2, Enum.AnimationPriority.Action,
	Enum.AnimationPriority.Movement, Enum.AnimationPriority.Idle
}
local self = setmetatable({}, { __mode = "k" })

local function stopRetargetedTracks(Parent)
	-- upvalues: self (copy)
	local SelfEntry = self[Parent]
	
	if not SelfEntry then return end
	for _, value in SelfEntry do
		value:Stop(0)
		value:Destroy()
	end
	self[Parent] = nil
end

local function applyKeyframesRetargeted(Parent, Parent1, List): boolean
	-- upvalues: v3 (ref), ensureRigDescription (copy), stopRetargetedTracks (copy), self (copy), AnimationClipProvider (copy), list (copy)
	local SourceRigs = {}
	
	for i, value in List do
		local SourceRig = value.sourceRig or v3
		
		if not SourceRig then
			return false
		end
		SourceRigs[i] = SourceRig
	end
	for _, AnimationConstraint in Parent:GetDescendants() do
		if AnimationConstraint:IsA("AnimationConstraint") then
			AnimationConstraint.Enabled = true
		end
	end
	local Animator = Parent1:FindFirstChildOfClass("Animator")
	
	if ensureRigDescription(Parent) and Animator then
		Animator:Destroy()
		Animator = nil
	end
	if not Animator then
		local Animator1 = Instance.new("Animator")
		Animator1.Parent = Parent1
		Animator = Animator1
	end
	assert(Animator, "animator is non-nil. Silence type checker.")
	stopRetargetedTracks(Parent)
	local List1 = {}
	self[Parent] = List1
	local Count = 1
	
	for i1, value1 in List do
		local KeyframeSeq = Instance.new("KeyframeSequence")
		
		for _, Time in { 0, 1 } do
			local Keyframe = value1.keyframe:Clone()
			Keyframe.Time = Time
			Keyframe.Parent = KeyframeSeq
		end
		SourceRigs[i1]:Clone().Parent = KeyframeSeq
		local Animation = Instance.new("Animation")
		Animation.AnimationId = AnimationClipProvider:RegisterActiveAnimationClip(KeyframeSeq)
		local AnimationTrack = Animator:LoadAnimation(Animation)
		AnimationTrack.Priority = list[math.min(Count, #list)]
		AnimationTrack:Play(0)
		table.insert(List1, AnimationTrack)
		Count += 1
	end
	Animator:StepAnimations(0.03333333333333333)
	
	return true
end

local function getMainThumbnailKeyframe(Object, AnimationAssetIdOrUrl, p6, p7)
	-- upvalues: getAnimationAndIsIdle (copy), EmoteUtilityModule (copy), getThumbnailKeyframeFromAnimationOrUrl (copy), EmoteUtilityUseIdleAnimationFallback (copy)
	local v4 = nil
	local v5 = nil
	local Flag = false
	local AnimationId = nil
	
	if AnimationAssetIdOrUrl then
		AnimationId = AnimationAssetIdOrUrl
		local AnimationAndIsIdle, AnimationAndIsIdle2 = getAnimationAndIsIdle(AnimationAssetIdOrUrl)
		
		if AnimationAndIsIdle == nil then
			return nil, Flag, AnimationId
		end
		assert(AnimationAndIsIdle, "animation is non-nil. Silence type checker.")
		
		if not AnimationAndIsIdle2 then
			Flag = true
		end
		v4, v174 = getThumbnailKeyframeFromAnimationOrUrl(AnimationAndIsIdle, if p6 then EmoteUtilityModule.GetNumberValueWithDefault(AnimationAndIsIdle, "ThumbnailCharacterRotation", 0) else 0)
	elseif p7 then
		local FALLBACKKEYFRAMESEQUENCEASSETURL = EmoteUtilityModule.FALLBACK_KEYFRAME_SEQUENCE_ASSET_URL
		local Animate = Object:FindFirstChild("Animate")
		
		if Animate then
			local Pose = Animate:FindFirstChild("Pose") or Animate:FindFirstChild("pose")
			
			if not Pose and EmoteUtilityUseIdleAnimationFallback then
				Pose = Animate:FindFirstChild("Idle") or Animate:FindFirstChild("idle")
			end
			local Animation = if Pose then Pose:FindFirstChildOfClass("Animation") else nil
			
			if Animation then
				FALLBACKKEYFRAMESEQUENCEASSETURL = Animation
			end
		end
		v4, v174 = getThumbnailKeyframeFromAnimationOrUrl(FALLBACKKEYFRAMESEQUENCEASSETURL, 0, 1)
		AnimationId = if typeof(FALLBACKKEYFRAMESEQUENCEASSETURL) == "string" then FALLBACKKEYFRAMESEQUENCEASSETURL else FALLBACKKEYFRAMESEQUENCEASSETURL.AnimationId
	end
	return v4, Flag, AnimationId, v5
end

local _ = function(AnimationAssetIdOrUrl)
	-- upvalues: getAnimationAndIsIdle (copy), getThumbnailKeyframeFromAnimationOrUrl (copy)
	if not AnimationAssetIdOrUrl then
		return nil
	end
	assert(AnimationAssetIdOrUrl, "moodAssetId is non-nil. Silence type checker.")
	local AnimationAndIsIdle, _ = getAnimationAndIsIdle(AnimationAssetIdOrUrl)
	
	if AnimationAndIsIdle == nil then
		return nil
	else
		assert(AnimationAndIsIdle, "animation is non-nil. Silence type checker.")
		
		return getThumbnailKeyframeFromAnimationOrUrl(AnimationAndIsIdle, 0)
	end
end

local function getToolKeyframes(Object, p6)
	-- upvalues: EmoteUtilityModule (copy)
	local Keyframe = nil
	local ThumbnailKeyframe = nil
	local AnimationRigData = nil
	local AnimationRigData1 = nil
	local Tool = Object:FindFirstChildOfClass("Tool")
	
	if not Tool then
		return nil, nil
	end
	assert(Tool, "tool is non-nil. Silence type checker.")
	local Flag = false
	
	if not p6 then
		Keyframe = Tool:FindFirstChild("ThumbnailPose")
		
		if Keyframe and Keyframe:IsA("Keyframe") then
			Flag = true
			AnimationRigData = Keyframe:FindFirstChildOfClass("AnimationRigData")
		end
	end
	if not Flag then
		Keyframe = nil
		local Animate = Object:FindFirstChild("Animate")
		
		if not Animate then
			return nil, nil
		end
		assert(Animate, "animateScript is non-nil. Silence type checker.")
		local Toolnone = Animate:FindFirstChild("toolnone")
		
		if not Toolnone then
			return nil, nil
		end
		assert(Toolnone, "toolNoneStringValue is non-nil. Silence type checker.")
		local ToolNoneAnim = Toolnone:FindFirstChild("ToolNoneAnim")
		
		if ToolNoneAnim then
			local AnimationClip = EmoteUtilityModule.GetAnimationClip(ToolNoneAnim)
			
			if not AnimationClip then
				return nil, nil
			end
			assert(AnimationClip, "toolAnimationClip is non-nil. Silence type checker.")
			assert(AnimationClip:IsA("KeyframeSequence"), "ToolNoneAnim must be a KeyframeSequence")
			ThumbnailKeyframe = EmoteUtilityModule.GetThumbnailKeyframe(nil, AnimationClip, 0)
			AnimationRigData1 = AnimationClip:FindFirstChildOfClass("AnimationRigData")
			
			if not Tool:IsDescendantOf(Object) then
				return nil, nil
			end
		end
	end
	return Keyframe, ThumbnailKeyframe, AnimationRigData, AnimationRigData1
end

local function getAttachmentCFrame(Attachment)
	-- upvalues: EmoteUtilityRetargetPoses (copy)
	local AttachmentCFrame = Attachment.CFrame
	local Parent = Attachment.Parent
	while Parent and Parent:IsA("Bone") do
		if EmoteUtilityRetargetPoses then
			AttachmentCFrame = Parent.CFrame * Parent.Transform * AttachmentCFrame
		else
			AttachmentCFrame = Parent.CFrame * AttachmentCFrame
		end
		Parent = Parent.Parent
	end
	return AttachmentCFrame
end

local function getJointParts(Weld)
	if Weld:IsA("JointInstance") then
		return Weld.Part0, Weld.Part1
	elseif Weld:IsA("Constraint") then
		local Attachment0 = Weld.Attachment0
		local Attachment1 = Weld.Attachment1
		
		return Attachment0 and Attachment0:FindFirstAncestorWhichIsA("BasePart"), Attachment1 and Attachment1:FindFirstAncestorWhichIsA("BasePart")
	else
		return nil, nil
	end
end

local function applyCFrame(Part, Part1, Weld, p6)
	-- upvalues: getAttachmentCFrame (copy)
	if Weld:IsA("AnimationConstraint") then
		Part1.CFrame = Part.CFrame * getAttachmentCFrame(Weld.Attachment0) * p6 * getAttachmentCFrame(Weld.Attachment1):Inverse()
		
		return
	end
	if Weld:IsA("Motor6D") then
		Part1.Anchored = true
		Part1.CFrame = Part.CFrame * Weld.C0 * p6 * Weld.C1:Inverse()
	end
end

local function getJointPose(Motor)
	if Motor:IsA("AnimationConstraint") then
		return Motor.Transform
	end
	if not Motor:IsA("Motor6D") then
		error("Unsupported joint type:" .. Motor.ClassName)
		
		return CFrame.new()
	end
	local Transform = Motor.Transform
	
	if Motor.CurrentAngle ~= 0 then
		Transform *= CFrame.Angles(0, 0, Motor.CurrentAngle)
	end
	return Transform
end

function EmoteUtilityModule.ForceAnimationToStep(Object)
	-- upvalues: getJointParts (copy), getJointPose (copy), applyCFrame (copy)
	local List = { (Object:FindFirstChild("HumanoidRootPart")) }
	local t = {}
	local List1 = {}
	while #List > 0 do
		local Removed = table.remove(List, 1)
		
		if t[Removed] then continue end
		t[Removed] = true
		
		for _, joint in Removed:GetJoints() do
			if joint:IsA("Motor6D") or joint:IsA("AnimationConstraint") then
				local JointParts, JointParts2 = getJointParts(joint)
				
				if JointParts == Removed and JointParts2 and not t[JointParts2] then
					table.insert(List1, { part0 = Removed, part1 = JointParts2, joint = joint })
					table.insert(List, JointParts2)
				end
			end
		end
	end
	for _, AnimationConstraint in Object:GetDescendants() do
		if AnimationConstraint:IsA("AnimationConstraint") then
			AnimationConstraint.Enabled = false
		end
	end
	for _, value in List1 do
		local Joint = value.joint
		
		if Joint:IsA("Motor6D") or Joint:IsA("AnimationConstraint") then
			applyCFrame(value.part0, value.part1, Joint, (getJointPose(Joint)))
		end
	end
end

function EmoteUtilityModule.LoadAsset(AnimationAssetIdOrUrl)
	-- upvalues: EmoteUtilityModule (copy), InsertService (copy)
	local Success, Result = pcall(function()
		-- upvalues: EmoteUtilityModule (upval), AnimationAssetIdOrUrl (copy), InsertService (upval)
		return if EmoteUtilityModule.debugLoadAssetsFromFiles and EmoteUtilityModule.mapAssetIdToFileName then InsertService:LoadLocalAsset("rbxasset://" .. EmoteUtilityModule.mapAssetIdToFileName(AnimationAssetIdOrUrl)) else InsertService:LoadAsset(AnimationAssetIdOrUrl)
	end)
	
	return Success, Result
end

function EmoteUtilityModule.SetDebugLoadAssetsFromFiles(DebugLoadAssetsFromFiles, MapAssetIdToFileName)
	-- upvalues: EmoteUtilityModule (copy)
	EmoteUtilityModule.debugLoadAssetsFromFiles = DebugLoadAssetsFromFiles
	EmoteUtilityModule.mapAssetIdToFileName = MapAssetIdToFileName
end

function EmoteUtilityModule.GetJointBetween(Part, Name)
	if not Part or not Name then
		return nil
	end
	assert(Part, "part0 is non-nil. Silence type checker.")
	assert(Name, "part1 is non-nil. Silence type checker.")
	
	for _, child in Name:GetChildren() do
		if child:IsA("Motor6D") and child.Part0 == Part then
			return child
		elseif child:IsA("AnimationConstraint") and child.Part0 == Part then
			return child
		end
	end
	return nil
end

EmoteUtilityModule.GetMotor6DBetween = EmoteUtilityModule.GetJointBetween

function EmoteUtilityModule.PoseKeyframeHasFaceAnimation(PoseKeyframe): boolean
	if not PoseKeyframe then
		return false
	end
	assert(PoseKeyframe, "poseKeyframe is non-nil. Silence type checker.")
	
	local function recurHasFaceAnimation(Folder: Folder): boolean
		-- upvalues: recurHasFaceAnimation (copy)
		if Folder:IsA("Folder") then
			return true
		end
		for _, child in Folder:GetChildren() do
			if recurHasFaceAnimation(child) then
				return true
			end
		end
		return false
	end
	
	for _, pos in pairs(PoseKeyframe:GetPoses()) do
		if recurHasFaceAnimation(pos) then
			return true
		end
	end
	return false
end

function EmoteUtilityModule.ApplyKeyframe(p6, p7)
	-- upvalues: T (ref), applyKeyframeInner (copy), EmoteUtilityModule (copy)
	T = {}
	applyKeyframeInner(p6, p7)
	T = {}
	local Success, Result = pcall(function(): boolean
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	
	if Success and Result then
		EmoteUtilityModule.ForceAnimationToStep(p6)
	end
end

function EmoteUtilityModule.GetNumberValueWithDefault(KeyframeSequenceId, ChildName, ThumbnailKeyframeNumberValueWithDefault)
	local ThumbnailKeyframeNumberValueWithDefault1 = ThumbnailKeyframeNumberValueWithDefault
	local ChildName1 = KeyframeSequenceId:FindFirstChild(ChildName)
	
	if ChildName1 and ChildName1:IsA("NumberValue") then
		ThumbnailKeyframeNumberValueWithDefault1 = ChildName1.Value
	end
	return ThumbnailKeyframeNumberValueWithDefault1
end

function EmoteUtilityModule.GetAnimationClip(Object)
	-- upvalues: getAnimationClipByAssetId (copy)
	if Object:IsA("KeyframeSequence") then
		return Object
	elseif Object:IsA("CurveAnimation") then
		return Object
	elseif Object:IsA("Animation") then
		return (getAnimationClipByAssetId(Object.AnimationId))
	else
		error("Cannot get AnimationClip from type:" .. Object.ClassName)
		
		return nil
	end
end

function EmoteUtilityModule.GetThumbnailKeyframe(ThumbnailKeyframeNumberValueWithDefault: number, AnimationClip, p6)
	-- upvalues: getRotatedKeyframe (copy)
	local Keyframes = AnimationClip:GetKeyframes()
	
	return (getRotatedKeyframe(if ThumbnailKeyframeNumberValueWithDefault and ThumbnailKeyframeNumberValueWithDefault > 0 and ThumbnailKeyframeNumberValueWithDefault <= #Keyframes then Keyframes[ThumbnailKeyframeNumberValueWithDefault] else Keyframes[math.ceil(#Keyframes / 2)], p6))
end

function EmoteUtilityModule.GetCurveAnimationTimeLength(Object): number
	local Largest = 0
	
	for _, FloatCurve in Object:GetDescendants() do
		if FloatCurve:IsA("FloatCurve") and FloatCurve.Length ~= 0 then
			Largest = math.max(Largest, FloatCurve:GetKeyAtIndex(FloatCurve.Length).Time)
		end
	end
	return Largest
end

function EmoteUtilityModule.GetThumbnailKeyframeFromCurve(Time: number, Object, p6)
	-- upvalues: EmoteUtilityModule (copy), EmoteUtilityCurveRotationOnlyJoints (copy), getRotationCFrame (copy), getRotatedKeyframe (copy)
	local CurveAnimationTimeLength: number = EmoteUtilityModule.GetCurveAnimationTimeLength(Object)
	
	if not Time or Time < 0 or CurveAnimationTimeLength < Time then
		Time = CurveAnimationTimeLength / 2
	end
	assert(Time, "thumbnailTime should be non-nil. Silence type checker")
	local config = { Position = true, Rotation = true }
	
	local function _(Object): boolean
		for _, Folder in Object:GetChildren() do
			if Folder:IsA("Folder") then
				return true
			end
		end
		return false
	end
	
	local function recurGenerateKeyframe(Parent, Object)
		-- upvalues: EmoteUtilityCurveRotationOnlyJoints (upval), getRotationCFrame (upval), Time (ref), config (copy), recurGenerateKeyframe (copy)
		local Pose = nil
		local Position = Object:FindFirstChild("Position")
		local Rotation = Object:FindFirstChild("Rotation")
		
		if if EmoteUtilityCurveRotationOnlyJoints then Position or Rotation else Position and Rotation then
			local RotationCFrame = if Rotation then getRotationCFrame(Rotation, Time) else CFrame.new()
			
			if not RotationCFrame and EmoteUtilityCurveRotationOnlyJoints then
				RotationCFrame = CFrame.new()
			end
			if RotationCFrame then
				if Position then
					RotationCFrame += Vector3.new(table.unpack(Position:GetValueAtTime(Time)))
				end
				local Pose1 = Instance.new("Pose")
				Pose1.CFrame = RotationCFrame
				Pose1.Name = Object.Name
				Pose1.Parent = Parent
				Pose = Pose1
			end
		else
			local Flag = false
			
			for _, Folder in Object:GetChildren() do
				if Folder:IsA("Folder") then
					Flag = true
					break
				end
			end
			if Flag then
				local Pose2 = Instance.new("Pose")
				Pose2.CFrame = CFrame.new()
				Pose2.Name = Object.Name
				Pose2.Parent = Parent
				Pose = Pose2
			else
				local Folder1 = Instance.new("Folder")
				Folder1.Name = Object.Name
				Folder1.Parent = Parent
				Pose = Folder1
			end
		end
		for _, child in Object:GetChildren() do
			if child:IsA("FloatCurve") and not config[child] then
				local NumberPose = Instance.new("NumberPose")
				NumberPose.Name = child.Name
				local ValueAtTime = child:GetValueAtTime(Time) or 0
				assert(ValueAtTime, "valueAtTime should be non-nil. Silence type checker.")
				NumberPose.Value = ValueAtTime
				NumberPose.Parent = Pose
			elseif child:IsA("Folder") then
				recurGenerateKeyframe(Pose, child)
			end
		end
	end
	
	local Keyframe = Instance.new("Keyframe")
	Keyframe.Name = Object.Name
	Keyframe.Time = Time
	
	for _, Folder in Object:GetChildren() do
		if Folder:IsA("Folder") then
			recurGenerateKeyframe(Keyframe, Folder)
		end
	end
	return (getRotatedKeyframe(Keyframe, p6))
end

function EmoteUtilityModule.ClearPlayerCharacterFace(Object)
	local FaceControls = Object:FindFirstChildWhichIsA("FaceControls", true)
	
	if FaceControls then
		local FaceControls1 = Instance.new("FaceControls")
		FaceControls1.Parent = FaceControls.Parent
		
		for _, child in FaceControls:GetChildren() do
			child.Parent = FaceControls1
		end
		FaceControls:Destroy()
	end
end

function EmoteUtilityModule.AdjustArmOnR6ForTool(Object)
	local Tool = Object:FindFirstChildOfClass("Tool")
	local Torso = Object:FindFirstChild("Torso")
	
	if Torso then
		local RightShoulder = Torso:FindFirstChild("Right Shoulder")
		
		if RightShoulder then
			if Tool then
				RightShoulder.CurrentAngle = 1.5707963267948966
				RightShoulder.DesiredAngle = 1.5707963267948966
				
				return
			end
			RightShoulder.CurrentAngle = 0
			RightShoulder.DesiredAngle = 0
		end
	end
end

function EmoteUtilityModule.SetPlayerCharacterFace(Object, AnimationAssetIdOrUrl)
	-- upvalues: getAnimationAndIsIdle (copy), getThumbnailKeyframeFromAnimationOrUrl (copy), EmoteUtilityModule (copy)
	if not AnimationAssetIdOrUrl then return end
	if AnimationAssetIdOrUrl == "" then return end
	if AnimationAssetIdOrUrl == 0 then return end
	assert(typeof(AnimationAssetIdOrUrl) == "number" or typeof(AnimationAssetIdOrUrl) == "string", "EmoteUtility.SetPlayerCharacterFace expects animationAssetIdOrUrl to be a number or string")
	
	if not Object:FindFirstChildOfClass("Humanoid") then return end
	local v4 = nil
	if AnimationAssetIdOrUrl then
		assert(AnimationAssetIdOrUrl, "moodAssetId is non-nil. Silence type checker.")
		local AnimationAndIsIdle, _ = getAnimationAndIsIdle(AnimationAssetIdOrUrl)
		
		if AnimationAndIsIdle == nil then
			v4 = nil
		else
			assert(AnimationAndIsIdle, "animation is non-nil. Silence type checker.")
			v4 = getThumbnailKeyframeFromAnimationOrUrl(AnimationAndIsIdle, 0)
		end
	else
		v4 = nil
	end
	if v4 then
		EmoteUtilityModule.ClearPlayerCharacterFace(Object)
		EmoteUtilityModule.ApplyKeyframe(Object, v4)
		
		return
	end
end

function EmoteUtilityModule.SetPlayerCharacterNeutralPose(Object)
	-- upvalues: EmoteUtilityModule (copy), EmoteUtilityRetargetPoses (copy)
	local Humanoid = Object:FindFirstChildOfClass("Humanoid")
	
	if not Humanoid then return end
	assert(Humanoid, "humanoid should be non-nil. Silence type checker.")
	Humanoid:BuildRigFromAttachments()
	
	if Humanoid.RigType == Enum.HumanoidRigType.R15 then
		EmoteUtilityModule.ClearPlayerCharacterFace(Object)
		
		local function recurResetJoint(Object)
			-- upvalues: EmoteUtilityRetargetPoses (upval), recurResetJoint (copy)
			if Object:IsA("Motor6D") then
				Object.Transform = CFrame.new()
			elseif Object:IsA("AnimationConstraint") then
				Object.Transform = CFrame.new()
			elseif EmoteUtilityRetargetPoses and Object:IsA("Bone") then
				Object.Transform = CFrame.new()
			end
			for _, child in Object:GetChildren() do
				recurResetJoint(child)
			end
		end
		
		recurResetJoint(Object)
		
		return
	end
end

function EmoteUtilityModule.FindDefaultMoodAnimationId(Object)
	local Animate = Object:FindFirstChild("Animate")
	
	if not Animate then
		return nil
	end
	local Mood = Animate:FindFirstChild("mood")
	
	if Mood then
		local Animation = Mood:FindFirstChildOfClass("Animation")
		
		return if Animation and Animation.AnimationId ~= "" then Animation.AnimationId else nil
	else
		return nil
	end
end

local function loadKeyframesForPoseR15(p7, OriginalAnimationAssetId, AnimationAssetIdOrUrl, p8, p9)
	-- upvalues: EmoteUtilityRetargetPoses (copy), loadCanonicalR15Rig (copy), getMainThumbnailKeyframe (copy), getToolKeyframes (copy), EmoteUtilityDefaultMoodFromCharacter (copy), EmoteUtilityModule (copy), getAnimationAndIsIdle (copy), getThumbnailKeyframeFromAnimationOrUrl (copy), getAnimationClipByAssetId (copy)
	local config = { originalAnimationAssetId = OriginalAnimationAssetId }
	local NoP109 = not p9
	
	if EmoteUtilityRetargetPoses then
		local Success, Result = pcall(function(): boolean
			return game.GetService(game, "ThumbnailGenerator") ~= nil
		end)
		
		if Success and Result then
			loadCanonicalR15Rig()
		end
	end
	local MainThumbnailKeyframe, MainThumbnailKeyframe2, MainThumbnailKeyframe3, MainThumbnailKeyframe4 = getMainThumbnailKeyframe(p7, OriginalAnimationAssetId, not p8, NoP109)
	local SuggestedKeyframeFromTool = nil
	local DefaultToolKeyframe = nil
	local SuggestedToolSourceRig = nil
	local DefaultToolSourceRig = nil
	
	if not p9 and MainThumbnailKeyframe then
		SuggestedKeyframeFromTool, DefaultToolKeyframe, SuggestedToolSourceRig, DefaultToolSourceRig = getToolKeyframes(p7, MainThumbnailKeyframe2)
	end
	local ThumbnailKeyframe = nil
	local AnimationRigData = nil
	local Flag = false
	
	if EmoteUtilityDefaultMoodFromCharacter or AnimationAssetIdOrUrl and AnimationAssetIdOrUrl ~= 0 then
		if OriginalAnimationAssetId == nil then
			Flag = true
		elseif not EmoteUtilityModule.PoseKeyframeHasFaceAnimation(MainThumbnailKeyframe) then
			Flag = true
		end
	end
	if Flag then
		if EmoteUtilityDefaultMoodFromCharacter then
			if AnimationAssetIdOrUrl and AnimationAssetIdOrUrl ~= 0 then
				local v4 = nil
				local v5 = nil
				if AnimationAssetIdOrUrl then
					assert(AnimationAssetIdOrUrl, "moodAssetId is non-nil. Silence type checker.")
					local AnimationAndIsIdle, _ = getAnimationAndIsIdle(AnimationAssetIdOrUrl)
					
					if AnimationAndIsIdle == nil then
						v5 = nil
						v4 = nil
					else
						assert(AnimationAndIsIdle, "animation is non-nil. Silence type checker.")
						v5, v260 = getThumbnailKeyframeFromAnimationOrUrl(AnimationAndIsIdle, 0)
					end
				else
					v5 = nil
					v4 = nil
				end
				ThumbnailKeyframe = v5
				AnimationRigData = v4
			end
			if not ThumbnailKeyframe then
				local DefaultMoodAnimationId = EmoteUtilityModule.FindDefaultMoodAnimationId(p7)
				
				if DefaultMoodAnimationId then
					local AnimationClipByAssetId = getAnimationClipByAssetId(DefaultMoodAnimationId)
					
					if AnimationClipByAssetId and AnimationClipByAssetId:IsA("KeyframeSequence") then
						ThumbnailKeyframe = EmoteUtilityModule.GetThumbnailKeyframe(nil, AnimationClipByAssetId, 0)
						AnimationRigData = AnimationClipByAssetId:FindFirstChildOfClass("AnimationRigData")
					end
				end
			end
		else
			local v6 = nil
			local v7 = nil
			if AnimationAssetIdOrUrl then
				assert(AnimationAssetIdOrUrl, "moodAssetId is non-nil. Silence type checker.")
				local AnimationAndIsIdle1, _ = getAnimationAndIsIdle(AnimationAssetIdOrUrl)
				
				if AnimationAndIsIdle1 == nil then
					v6 = nil
					v7 = nil
				else
					assert(AnimationAndIsIdle1, "animation is non-nil. Silence type checker.")
					v6, v266 = getThumbnailKeyframeFromAnimationOrUrl(AnimationAndIsIdle1, 0)
				end
			else
				v6 = nil
				v7 = nil
			end
			ThumbnailKeyframe = v6
			AnimationRigData = v7
		end
	end
	config.poseKeyframe = MainThumbnailKeyframe
	config.moodKeyframe = ThumbnailKeyframe
	config.defaultToolKeyframe = DefaultToolKeyframe
	config.suggestedKeyframeFromTool = SuggestedKeyframeFromTool
	config.finalAnimationAssetIdOrUrl = MainThumbnailKeyframe3
	config.poseSourceRig = MainThumbnailKeyframe4
	config.moodSourceRig = AnimationRigData
	config.defaultToolSourceRig = DefaultToolSourceRig
	config.suggestedToolSourceRig = SuggestedToolSourceRig
	
	return config
end

function EmoteUtilityModule.LoadKeyframesForPose(Object, OriginalAnimationAssetId: number, AnimationAssetIdOrUrl, p7, p8)
	-- upvalues: loadKeyframesForPoseR15 (copy)
	assert(Object, "character should be non-nil")
	
	if OriginalAnimationAssetId ~= nil then
		assert(typeof(OriginalAnimationAssetId) == "number", "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a number or nil")
		assert(OriginalAnimationAssetId > 0, "EmoteUtility.LoadKeyframesForPose expects animationAssetId to be a real asset ID (positive number)")
	end
	if AnimationAssetIdOrUrl ~= nil then
		assert(typeof(AnimationAssetIdOrUrl) == "number", "EmoteUtility.LoadKeyframesForPose expects moodAssetId to be a number or nil")
	end
	local Humanoid = Object:FindFirstChildOfClass("Humanoid")
	
	if Humanoid then
		assert(Humanoid, "humanoid should be non-nil. Silence type checker.")
		
		return if Humanoid.RigType == Enum.HumanoidRigType.R15 then loadKeyframesForPoseR15(Object, OriginalAnimationAssetId, AnimationAssetIdOrUrl, p7, p8) else { originalAnimationAssetId = OriginalAnimationAssetId }
	else
		return nil
	end
end

function EmoteUtilityModule.ApplyKeyframesForPose(Object, KeyframesForPose)
	-- upvalues: EmoteUtilityModule (copy), T (ref), EmoteUtilityRetargetPoses (copy), restsArmsDown (copy), getToolBodyLayersInPriorityOrder (copy), applyKeyframesRetargeted (copy), attachToolToCharacter (copy), applyR15KeyframeWithTool (copy), applyKeyframeInner (copy), applyKeyframeControls (copy)
	assert(Object, "character should be non-nil")
	
	if not KeyframesForPose then return end
	assert(KeyframesForPose, "keyframesForPose should be non-nil. Silence type checker.")
	local Humanoid = Object:FindFirstChildOfClass("Humanoid")
	
	if not Humanoid then return end
	assert(Humanoid, "humanoid should be non-nil. Silence type checker.")
	EmoteUtilityModule.SetPlayerCharacterNeutralPose(Object)
	T = {}
	local Tool = Object:FindFirstChildOfClass("Tool")
	local v4 = false
	local EmoteUtilityRetargetPoses1: boolean = EmoteUtilityRetargetPoses
	
	if EmoteUtilityRetargetPoses1 then
		EmoteUtilityRetargetPoses1 = false
		
		if Humanoid.RigType == Enum.HumanoidRigType.R15 then
			local Success, Result = pcall(function(): boolean
				return game.GetService(game, "ThumbnailGenerator") ~= nil
			end)
			EmoteUtilityRetargetPoses1 = Success and Result and (not restsArmsDown(Object) or Tool ~= nil and (KeyframesForPose.suggestedKeyframeFromTool ~= nil and KeyframesForPose.suggestedToolSourceRig ~= nil))
		end
	end
	if EmoteUtilityRetargetPoses1 then
		local ToolBodyLayersInPriorityOrder = if Tool then getToolBodyLayersInPriorityOrder(KeyframesForPose) else {}
		
		if not Tool and KeyframesForPose.poseKeyframe then
			table.insert(ToolBodyLayersInPriorityOrder, {
				keyframe = KeyframesForPose.poseKeyframe,
				sourceRig = KeyframesForPose.poseSourceRig
			})
		end
		if KeyframesForPose.moodKeyframe then
			table.insert(ToolBodyLayersInPriorityOrder, {
				keyframe = KeyframesForPose.moodKeyframe,
				sourceRig = KeyframesForPose.moodSourceRig
			})
		end
		v4 = applyKeyframesRetargeted(Object, Humanoid, ToolBodyLayersInPriorityOrder)
		
		if v4 and Tool then
			attachToolToCharacter(Object, Humanoid, Tool)
		end
	end
	if Humanoid.RigType == Enum.HumanoidRigType.R15 and not v4 then
		if Tool then
			applyR15KeyframeWithTool(Object, Humanoid, Tool, KeyframesForPose)
		else
			applyKeyframeInner(Object, KeyframesForPose.poseKeyframe)
		end
	elseif Humanoid.RigType ~= Enum.HumanoidRigType.R15 then
		EmoteUtilityModule.AdjustArmOnR6ForTool(Object)
	end
	if Humanoid.RigType == Enum.HumanoidRigType.R15 then
		if v4 then
			applyKeyframeControls(Object, KeyframesForPose.moodKeyframe)
		else
			applyKeyframeInner(Object, KeyframesForPose.moodKeyframe)
		end
	end
	T = {}
	local Success1, Result1 = pcall(function(): boolean
		return game.GetService(game, "ThumbnailGenerator") ~= nil
	end)
	
	if Success1 and Result1 then
		EmoteUtilityModule.ForceAnimationToStep(Object)
	end
end

function EmoteUtilityModule.SetPlayerCharacterPoseWithMoodFallback(Object, OriginalAnimationAssetId, p7, p8, p9)
	-- upvalues: EmoteUtilityModule (copy), EmoteUtilityReportPoseAnimationDownloadFailure (copy)
	local Humanoid = Object:FindFirstChildOfClass("Humanoid")
	
	if not Humanoid then return end
	assert(Humanoid, "humanoid should be non-nil.  Silence type checker.")
	local KeyframesForPose = EmoteUtilityModule.LoadKeyframesForPose(Object, OriginalAnimationAssetId, p7, p8, p9)
	EmoteUtilityModule.ApplyKeyframesForPose(Object, KeyframesForPose)
	
	return if EmoteUtilityReportPoseAnimationDownloadFailure and KeyframesForPose and (Humanoid.RigType == Enum.HumanoidRigType.R15 and OriginalAnimationAssetId ~= nil and KeyframesForPose.poseKeyframe == nil) then "Failed to download requested pose animation" else nil
end

function EmoteUtilityModule.ThumbnailZoomExtents(Model: Model, Degrees: number, X, p7, p8: number): CFrame
	local ModelCFrame = Model:GetModelCFrame()
	local LookVector = ModelCFrame.LookVector
	local HumanoidRootPart = Model:FindFirstChild("HumanoidRootPart")
	
	if HumanoidRootPart then
		LookVector = HumanoidRootPart.CFrame.LookVector
	end
	local _CFrame = CFrame.new(ModelCFrame.Position + LookVector * 5, ModelCFrame.Position)
	local ExtentsSize = Model:GetExtentsSize()
	
	return _CFrame - _CFrame.Position + (ModelCFrame.Position + Vector3.new(X, -p7, 0)) + LookVector * (math.sqrt(ExtentsSize.X ^ 2 + ExtentsSize.Y ^ 2 + ExtentsSize.Z ^ 2) / 2 * (1 / math.tan(math.rad(Degrees) / 2)) * (1 / p8))
end

return EmoteUtilityModule