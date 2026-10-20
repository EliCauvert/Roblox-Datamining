local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetDiffBetweenOrientationsModule = require(Parent.util.getDiffBetweenOrientations)
local FloatEqualsModule = require(Parent.util.floatEquals)
local ValueToStringModule = require(Parent.util.valueToString)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local GetAttachmentCFrameInPartSpaceModule = require(Parent.util.getAttachmentCFrameInPartSpace)
local UGCValidateRigAttachmentRotationUsesDiff = game:DefineFastFlag("UGCValidateRigAttachmentRotationUsesDiff", false)
local ThresholdGetters = require(Parent.util.AttachmentRotationFInts).thresholdGetters
local v1 = CFrame.new(vector.create(0, 0, 0), vector.create(0, 0, -1)) * CFrame.fromEulerAnglesXYZ(-1.5707963267948966, 0, 0)

local function expectedGripAttCFrameRotation(Object, AssetType)
	-- upvalues: R15plusUtilsModule (copy), GetAttachmentCFrameInPartSpaceModule (copy), v1 (copy)
	local Right: string = if AssetType == Enum.AssetType.RightArm then "Right" else "Left"
	local Child = Object:FindFirstChild(Right .. "LowerArm")
	local Child1 = Object:FindFirstChild(Right .. "Hand")
	
	if not Child or not Child1 then
		return CFrame.identity
	end
	local Child2 = Child:FindFirstChild(Right .. "ElbowRigAttachment", R15plusUtilsModule.checkFlagEnabledForAllowHrd())
	local Child3 = Child:FindFirstChild(Right .. "WristRigAttachment", R15plusUtilsModule.checkFlagEnabledForAllowHrd())
	local Child4 = Child1:FindFirstChild(Right .. "WristRigAttachment", R15plusUtilsModule.checkFlagEnabledForAllowHrd())
	local Child41 = Child1:FindFirstChild(Right .. "GripAttachment", R15plusUtilsModule.checkFlagEnabledForAllowHrd())
	
	if Child2 and Child3 and Child4 and Child41 then
		local AttachmentCFrameInPartSpaceModule = GetAttachmentCFrameInPartSpaceModule(Child4)
		local PositionDelta = AttachmentCFrameInPartSpaceModule.Position - (AttachmentCFrameInPartSpaceModule * GetAttachmentCFrameInPartSpaceModule(Child3):Inverse() * GetAttachmentCFrameInPartSpaceModule(Child2)).Position
		
		return CFrame.fromEulerAnglesXYZ(0, 0, 1.5707963267948966 - math.acos(Vector3.new(PositionDelta.X, math.max(0, -PositionDelta.Y), 0).Unit.X)) * v1.Rotation
	else
		return CFrame.identity
	end
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.uploadEnum
	},
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: UGCValidateRigAttachmentRotationUsesDiff (copy), GetDiffBetweenOrientationsModule (copy), GetAttachmentCFrameInPartSpaceModule (copy), ThresholdGetters (copy), FloatEqualsModule (copy), ErrorSourceStringsModule (copy), expectedGripAttCFrameRotation (copy), ValueToStringModule (copy)
		local RootInstance = p2.rootInstance
		local AssetType = p2.uploadEnum.assetType
		
		for _, Attachment in RootInstance:GetDescendants() do
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
						p1:fail(ErrorSourceStringsModule.Keys.AttachmentOrientationRigRotated, { InstancePath = Attachment:GetFullName() })
					end
				elseif ThresholdGetters[Attachment.Name] ~= nil then
					local ExpectedGripAttCFrameRotationResult = if IsGripAttachment and AssetType and (AssetType == Enum.AssetType.RightArm or AssetType == Enum.AssetType.LeftArm) then expectedGripAttCFrameRotation(RootInstance, AssetType) else CFrame.new()
					
					if ThresholdGetters[Attachment.Name]() < GetDiffBetweenOrientationsModule(ExpectedGripAttCFrameRotationResult, GetAttachmentCFrameInPartSpaceModule(Attachment)) then
						local _Vector3 = Vector3.new(ExpectedGripAttCFrameRotationResult:ToOrientation())
						p1:fail(ErrorSourceStringsModule.Keys.AttachmentOrientationDeviation, {
							InstancePath = Attachment:GetFullName(),
							ExpectedOrientation = ValueToStringModule((Vector3.new(math.deg(_Vector3.X), math.deg(_Vector3.Y), (math.deg(_Vector3.Z))))),
							MaxDeviation = tostring(ThresholdGetters[Attachment.Name]())
						})
					end
				end
			end
		end
	end
}