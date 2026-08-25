local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getDiffBetweenOrientationsModule = require(parent.util.getDiffBetweenOrientations)
local floatEqualsModule = require(parent.util.floatEquals)
local valueToStringModule = require(parent.util.valueToString)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getAttachmentCFrameInPartSpaceModule = require(parent.util.getAttachmentCFrameInPartSpace)
local attachmentRotationFIntsModule = require(parent.util.AttachmentRotationFInts)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local UGCValidateRigAttachmentRotationUsesDiff = game:DefineFastFlag("UGCValidateRigAttachmentRotationUsesDiff", false)
local thresholdGetters = attachmentRotationFIntsModule.thresholdGetters
local var10 = CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, -1)) * CFrame.fromEulerAnglesXYZ(-1.570796326795, 0, 0)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.uploadEnum
	},
	fflag = getFFlagUGCValidateMigrateSchemaPropertiesModule,
	expectedFailures = {}
}

local function expectedGripAttCFrameRotation(p0, p1)
	-- upvalues: r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref), var10 (ref)
	local var13 = if p1 == Enum.AssetType.RightArm then "Right" else "Left"
	local var14 = p0:FindFirstChild(var13 .. "LowerArm")
	local var15 = p0:FindFirstChild(var13 .. "Hand")
	
	if not var14 or not var15 then
		return CFrame.identity
	end
	local var16 = var14:FindFirstChild(var13 .. "ElbowRigAttachment", r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	local var17 = var14:FindFirstChild(var13 .. "WristRigAttachment", r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	local var18 = var15:FindFirstChild(var13 .. "WristRigAttachment", r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	
	if var16 and var17 and (var18 and var15:FindFirstChild(var13 .. "GripAttachment", r15plusUtilsModule.checkFlagEnabledForAllowHrd())) then
		local var19 = getAttachmentCFrameInPartSpaceModule(var18)
		local var20 = var19.Position - (var19 * getAttachmentCFrameInPartSpaceModule(var17):Inverse() * getAttachmentCFrameInPartSpaceModule(var16)).Position
		
		return CFrame.fromEulerAnglesXYZ(0, 0, 1.570796326795 - math.acos(Vector3.new(var20.X, math.max(0, -var20.Y), 0).Unit.X)) * var10.Rotation
	end
	return CFrame.identity
end

function t.run(p2, p3)
	-- upvalues: UGCValidateRigAttachmentRotationUsesDiff (ref), getDiffBetweenOrientationsModule (ref), getAttachmentCFrameInPartSpaceModule (ref), thresholdGetters (ref), floatEqualsModule (ref), errorSourceStringsModule (ref), expectedGripAttCFrameRotation (ref), valueToStringModule (ref)
	local rootInstance = p3.rootInstance
	local assetType = p3.uploadEnum.assetType
	
	for i, v in rootInstance:GetDescendants() do
		if v.ClassName == "Attachment" then
			local isGripAttachment = string.sub(v.Name, -14) == "GripAttachment"
			
			if string.sub(v.Name, -13) == "RigAttachment" then
				local var27
				local _ = nil
				
				if UGCValidateRigAttachmentRotationUsesDiff then
					local _ = thresholdGetters.RigAttachment() < getDiffBetweenOrientationsModule(CFrame.identity, getAttachmentCFrameInPartSpaceModule(v))
				else
					local var24, var25, var26 = getAttachmentCFrameInPartSpaceModule(v):ToOrientation()
					var27 = if floatEqualsModule(var24, 0) then if floatEqualsModule(var25, 0) then not floatEqualsModule(var26, 0) else not floatEqualsModule(var25, 0) else not floatEqualsModule(var24, 0)
				end
				if var27 then
					p2:fail(errorSourceStringsModule.Keys.AttachmentOrientationRigRotated, { InstancePath = v:GetFullName() })
				end
			elseif thresholdGetters[v.Name] ~= nil then
				local var22 = if isGripAttachment and assetType and (assetType == Enum.AssetType.RightArm or assetType == Enum.AssetType.LeftArm) then expectedGripAttCFrameRotation(rootInstance, assetType) else CFrame.new()
				
				if thresholdGetters[v.Name]() < getDiffBetweenOrientationsModule(var22, getAttachmentCFrameInPartSpaceModule(v)) then
					local vector3 = Vector3.new(var22:ToOrientation())
					p2:fail(errorSourceStringsModule.Keys.AttachmentOrientationDeviation, {
						InstancePath = v:GetFullName(),
						ExpectedOrientation = valueToStringModule(Vector3.new(math.deg(vector3.X), math.deg(vector3.Y), math.deg(vector3.Z))),
						MaxDeviation = tostring(thresholdGetters[v.Name]())
					})
				end
			end
		end
	end
end

return t