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
local var1 = CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, -1)) * CFrame.fromEulerAnglesXYZ(-1.570796326795, 0, 0)
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

local function expectedGripAttCFrameRotation(p1, p2)
	-- upvalues: r15plusUtilsModule (ref), getAttachmentCFrameInPartSpaceModule (ref), var1 (ref)
	local var2 = if p2 == Enum.AssetType.RightArm then "Right" else "Left"
	local var3 = p1:FindFirstChild(var2 .. "LowerArm")
	local var4 = p1:FindFirstChild(var2 .. "Hand")
	
	if not var3 or not var4 then
		return CFrame.identity
	end
	local var5 = var3:FindFirstChild(var2 .. "ElbowRigAttachment", r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	local var6 = var3:FindFirstChild(var2 .. "WristRigAttachment", r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	local var7 = var4:FindFirstChild(var2 .. "WristRigAttachment", r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	
	if var5 and var6 and (var7 and var4:FindFirstChild(var2 .. "GripAttachment", r15plusUtilsModule.checkFlagEnabledForAllowHrd())) then
		local var8 = getAttachmentCFrameInPartSpaceModule(var7)
		local var9 = var8.Position - (var8 * getAttachmentCFrameInPartSpaceModule(var6):Inverse() * getAttachmentCFrameInPartSpaceModule(var5)).Position
		
		return CFrame.fromEulerAnglesXYZ(0, 0, 1.570796326795 - math.acos(Vector3.new(var9.X, math.max(0, -var9.Y), 0).Unit.X)) * var1.Rotation
	end
	return CFrame.identity
end

function t.run(p1, p2)
	-- upvalues: UGCValidateRigAttachmentRotationUsesDiff (ref), getDiffBetweenOrientationsModule (ref), getAttachmentCFrameInPartSpaceModule (ref), thresholdGetters (ref), floatEqualsModule (ref), errorSourceStringsModule (ref), expectedGripAttCFrameRotation (ref), valueToStringModule (ref)
	local rootInstance = p2.rootInstance
	local assetType = p2.uploadEnum.assetType
	
	for i, v in rootInstance:GetDescendants() do
		if v.ClassName == "Attachment" then
			local isGripAttachment = string.sub(v.Name, -14) == "GripAttachment"
			
			if string.sub(v.Name, -13) == "RigAttachment" then
				local var2
				local _ = nil
				
				if UGCValidateRigAttachmentRotationUsesDiff then
					local _ = thresholdGetters.RigAttachment() < getDiffBetweenOrientationsModule(CFrame.identity, getAttachmentCFrameInPartSpaceModule(v))
				else
					local var3, var4, var5 = getAttachmentCFrameInPartSpaceModule(v):ToOrientation()
					var2 = if floatEqualsModule(var3, 0) then if floatEqualsModule(var4, 0) then not floatEqualsModule(var5, 0) else not floatEqualsModule(var4, 0) else not floatEqualsModule(var3, 0)
				end
				if var2 then
					p1:fail(errorSourceStringsModule.Keys.AttachmentOrientationRigRotated, { InstancePath = v:GetFullName() })
				end
			elseif thresholdGetters[v.Name] ~= nil then
				local var6 = if isGripAttachment and assetType and (assetType == Enum.AssetType.RightArm or assetType == Enum.AssetType.LeftArm) then expectedGripAttCFrameRotation(rootInstance, assetType) else CFrame.new()
				
				if thresholdGetters[v.Name]() < getDiffBetweenOrientationsModule(var6, getAttachmentCFrameInPartSpaceModule(v)) then
					local vector3 = Vector3.new(var6:ToOrientation())
					p1:fail(errorSourceStringsModule.Keys.AttachmentOrientationDeviation, {
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