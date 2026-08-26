local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getDiffBetweenOrientationsModule = require(parent.util.getDiffBetweenOrientations)
local valueToStringModule = require(parent.util.valueToString)
local getAllInstancesWithNameModule = require(parent.util.getAllInstancesWithName)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { validationEnumsModule.SharedDataMember.rootInstance },
	fflag = r15plusUtilsModule.checkFlagEnabledForAllowHrd
}
local UGCValidationJointRotationMaximumHundredthPositionOffset = game:DefineFastInt("UGCValidationJointRotationMaximumHundredthPositionOffset", 1)
local UGCValidationJointRotationMaximumDegreeOrientationOffset = game:DefineFastInt("UGCValidationJointRotationMaximumDegreeOrientationOffset", 1)
local t_1 = {
	[Enum.AssetType.Torso] = {
		RightShoulderRigAttachment = CFrame.fromOrientation(0, 0, 0),
		LeftShoulderRigAttachment = CFrame.fromOrientation(0, 3.14159265359, 0)
	},
	[Enum.AssetType.RightArm] = {
		RightShoulderRigAttachment = CFrame.fromOrientation(0, 0, -1.570796326795)
	},
	[Enum.AssetType.LeftArm] = {
		LeftShoulderRigAttachment = CFrame.fromOrientation(0, 3.14159265359, -1.570796326795)
	}
}

function t.run(p1, p2)
	-- upvalues: getAllInstancesWithNameModule (ref), r15plusUtilsModule (ref), errorSourceStringsModule (ref), t_1 (ref), getDiffBetweenOrientationsModule (ref), UGCValidationJointRotationMaximumDegreeOrientationOffset (ref), valueToStringModule (ref), UGCValidationJointRotationMaximumHundredthPositionOffset (ref)
	local t = {
		LeftShoulderRigAttachment = 0,
		RightShoulderRigAttachment = 0
	}
	
	for i, v in getAllInstancesWithNameModule(p2.rootInstance, r15plusUtilsModule.JointRotationName) do
		local parent = v.Parent
		p1:setReportingInstance(v)
		
		if v.ClassName ~= "Attachment" or not parent:IsA("Attachment") then
			p1:fail(errorSourceStringsModule.Keys.JointRotAtt_WrongInstanceClass, { instPath = v:GetFullName() })
		elseif t[parent.Name] == nil then
			p1:fail(errorSourceStringsModule.Keys.JointRotAtt_UnrecognizedParent, { parentPath = parent:GetFullName() })
		elseif t[parent.Name] == 1 then
			p1:fail(errorSourceStringsModule.Keys.JointRotAtt_MultipleAttachments, { parentPath = parent:GetFullName() })
		else
			t[parent.Name] += 1
			
			if t_1[p2.uploadEnum.assetType] ~= nil and t_1[p2.uploadEnum.assetType][parent.Name] ~= nil then
				local name = t_1[p2.uploadEnum.assetType][parent.Name]
				local cFrame = v.CFrame
				
				if UGCValidationJointRotationMaximumDegreeOrientationOffset < getDiffBetweenOrientationsModule(name, cFrame) then
					local vector3 = Vector3.new(name:ToOrientation())
					p1:fail(errorSourceStringsModule.Keys.JointRotAtt_Rotated, {
						instPath = v:GetFullName(),
						expectedOrientation = valueToStringModule(Vector3.new(math.deg(vector3.X), math.deg(vector3.Y), math.deg(vector3.Z)))
					})
				end
				if UGCValidationJointRotationMaximumHundredthPositionOffset / 100 < (cFrame.Position - Vector3.new(0, 0, 0)).Magnitude then
					p1:fail(errorSourceStringsModule.Keys.JointRotAtt_Moved, {
						instPath = v:GetFullName(),
						expectedPosition = valueToStringModule(Vector3.new(0, 0, 0))
					})
				end
			end
		end
	end
end

return t