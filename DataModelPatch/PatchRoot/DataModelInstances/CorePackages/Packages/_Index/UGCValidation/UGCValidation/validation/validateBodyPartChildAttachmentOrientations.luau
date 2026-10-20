local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local _ = require(Parent.util.Types)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local GetDiffBetweenOrientationsModule = require(Parent.util.getDiffBetweenOrientations)
local FloatEqualsModule = require(Parent.util.floatEquals)
local ValueToStringModule = require(Parent.util.valueToString)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local GetAttachmentCFrameInPartSpaceModule = require(Parent.util.getAttachmentCFrameInPartSpace)
local UGCValidateRigAttachmentRotationUsesDiff = game:DefineFastFlag("UGCValidateRigAttachmentRotationUsesDiff", false)
local ThresholdGetters = require(Parent.util.AttachmentRotationFInts).thresholdGetters
local v1 = CFrame.new(vector.create(0, 0, 0), vector.create(0, 0, -1)) * CFrame.fromEulerAnglesXYZ(-1.5707963267948966, 0, 0)
local ValidateBodyPartChildAttachmentOrientationsModule = {
	expectedGripAttCFrameRotation = function(Object, AssetType): CFrame
		-- upvalues: R15plusUtilsModule (copy), GetAttachmentCFrameInPartSpaceModule (copy), v1 (copy)
		assert(AssetType == Enum.AssetType.RightArm or AssetType == Enum.AssetType.LeftArm)
		local Right: string = if AssetType == Enum.AssetType.RightArm then "Right" else "Left"
		local Child = Object:FindFirstChild(Right .. "LowerArm")
		local Child1 = Object:FindFirstChild(Right .. "Hand")
		assert(Child)
		assert(Child1)
		local Child2 = Child:FindFirstChild(Right .. "ElbowRigAttachment", R15plusUtilsModule.checkFlagEnabledForAllowHrd())
		local Child3 = Child:FindFirstChild(Right .. "WristRigAttachment", R15plusUtilsModule.checkFlagEnabledForAllowHrd())
		local Child4 = Child1:FindFirstChild(Right .. "WristRigAttachment", R15plusUtilsModule.checkFlagEnabledForAllowHrd())
		local Child41 = Child1:FindFirstChild(Right .. "GripAttachment", R15plusUtilsModule.checkFlagEnabledForAllowHrd())
		assert(Child2)
		assert(Child3)
		assert(Child4)
		assert(Child41)
		local AttachmentCFrameInPartSpaceModule = GetAttachmentCFrameInPartSpaceModule(Child4)
		local PositionDelta = AttachmentCFrameInPartSpaceModule.Position - (AttachmentCFrameInPartSpaceModule * GetAttachmentCFrameInPartSpaceModule(Child3):Inverse() * GetAttachmentCFrameInPartSpaceModule(Child2)).Position
		
		return CFrame.fromEulerAnglesXYZ(0, 0, 1.5707963267948966 - math.acos(Vector3.new(PositionDelta.X, math.max(0, -PositionDelta.Y), 0).Unit.X)) * v1.Rotation
	end
}

function ValidateBodyPartChildAttachmentOrientationsModule.runValidation(Object, p1)
	-- upvalues: FailureReasonsAccumulatorModule (copy), UGCValidateRigAttachmentRotationUsesDiff (copy), GetDiffBetweenOrientationsModule (copy), GetAttachmentCFrameInPartSpaceModule (copy), ThresholdGetters (copy), FloatEqualsModule (copy), AnalyticsModule (copy), ValidateBodyPartChildAttachmentOrientationsModule (copy), ValueToStringModule (copy)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	for _, Attachment in Object:GetDescendants() do
		if Attachment.ClassName == "Attachment" then
			local IsGripAttachment = string.sub(Attachment.Name, -14) == "GripAttachment"
			
			if string.sub(Attachment.Name, -13) == "RigAttachment" then
				local IsRigAttachmentResultBelow = nil
				if UGCValidateRigAttachmentRotationUsesDiff then
					IsRigAttachmentResultBelow = ThresholdGetters.RigAttachment() < GetDiffBetweenOrientationsModule(CFrame.identity, GetAttachmentCFrameInPartSpaceModule(Attachment))
				else
					local Rx, Ry, Rz = GetAttachmentCFrameInPartSpaceModule(Attachment):ToOrientation()
					IsRigAttachmentResultBelow = not FloatEqualsModule(Rx, 0) or (not FloatEqualsModule(Ry, 0) or not FloatEqualsModule(Rz, 0))
				end
				if IsRigAttachmentResultBelow then
					AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateBodyPartChildAttachmentOrientations_RotatedRig, nil, p1)
					NewFailureReasonsAccumulator:updateReasons(false, {
						string.format("Rig attachments cannot be rotated, please set %s's orientation to (0,0,0)", Attachment:GetFullName())
					})
				end
			elseif ThresholdGetters[Attachment.Name] ~= nil then
				local _CFrame = CFrame.new()
				
				if IsGripAttachment then
					assert(p1.assetTypeEnum)
					_CFrame = ValidateBodyPartChildAttachmentOrientationsModule.expectedGripAttCFrameRotation(Object, p1.assetTypeEnum)
				end
				if ThresholdGetters[Attachment.Name]() < GetDiffBetweenOrientationsModule(_CFrame, GetAttachmentCFrameInPartSpaceModule(Attachment)) then
					AnalyticsModule.reportFailure(IsGripAttachment and AnalyticsModule.ErrorType.validateBodyPartChildAttachmentOrientations_RotatedGrip or AnalyticsModule.ErrorType.validateBodyPartChildAttachmentOrientations_RotatedBasic, nil, p1)
					local _Vector3 = Vector3.new(_CFrame:ToOrientation())
					NewFailureReasonsAccumulator:updateReasons(false, {
						string.format("Attachment %s's orientation deviates too far from expectation, which will make attached accessories look unaligned. Recommended orientation is %s, and you can deviate up to %d degrees", Attachment:GetFullName(), ValueToStringModule((Vector3.new(math.deg(_Vector3.X), math.deg(_Vector3.Y), (math.deg(_Vector3.Z))))), ThresholdGetters[Attachment.Name]())
					})
				end
			end
		end
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end

return ValidateBodyPartChildAttachmentOrientationsModule