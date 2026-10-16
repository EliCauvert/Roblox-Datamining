local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetDiffBetweenOrientationsModule = require(Parent.util.getDiffBetweenOrientations)
local ValueToStringModule = require(Parent.util.valueToString)
local GetAllInstancesWithNameModule = require(Parent.util.getAllInstancesWithName)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local UGCValidationJointRotationMaximumHundredthPositionOffset = game:DefineFastInt("UGCValidationJointRotationMaximumHundredthPositionOffset", 1)
local UGCValidationJointRotationMaximumDegreeOrientationOffset = game:DefineFastInt("UGCValidationJointRotationMaximumDegreeOrientationOffset", 1)
local config = {
	[Enum.AssetType.Torso] = {
		RightShoulderRigAttachment = CFrame.fromOrientation(0, 0, 0),
		LeftShoulderRigAttachment = CFrame.fromOrientation(0, 3.141592653589793, 0)
	},
	[Enum.AssetType.RightArm] = {
		RightShoulderRigAttachment = CFrame.fromOrientation(0, 0, -1.5707963267948966)
	},
	[Enum.AssetType.LeftArm] = {
		LeftShoulderRigAttachment = CFrame.fromOrientation(0, 3.141592653589793, -1.5707963267948966)
	}
}

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.rootInstance },
	fflag = R15plusUtilsModule.checkFlagEnabledForAllowHrd,
	run = function(p1, p2) --[[ Line: 36 ]]
		-- upvalues: GetAllInstancesWithNameModule (copy), R15plusUtilsModule (copy), ErrorSourceStringsModule (copy), config (copy), GetDiffBetweenOrientationsModule (copy), UGCValidationJointRotationMaximumDegreeOrientationOffset (copy), ValueToStringModule (copy), UGCValidationJointRotationMaximumHundredthPositionOffset (copy)
		local config1 = {
			LeftShoulderRigAttachment = 0,
			RightShoulderRigAttachment = 0
		}
		
		for _, Attachment in GetAllInstancesWithNameModule(p2.rootInstance, R15plusUtilsModule.JointRotationName) do
			local Parent = Attachment.Parent
			p1:setReportingInstance(Attachment)
			
			if Attachment.ClassName ~= "Attachment" or not Parent:IsA("Attachment") then
				p1:fail(ErrorSourceStringsModule.Keys.JointRotAtt_WrongInstanceClass, { instPath = Attachment:GetFullName() })
				continue
			end
			if config1[Parent.Name] == nil then
				p1:fail(ErrorSourceStringsModule.Keys.JointRotAtt_UnrecognizedParent, { parentPath = Parent:GetFullName() })
			elseif config1[Parent.Name] == 1 then
				p1:fail(ErrorSourceStringsModule.Keys.JointRotAtt_MultipleAttachments, { parentPath = Parent:GetFullName() })
			else
				local Name = Parent.Name
				config1[Name] += 1
				
				if config[p2.uploadEnum.assetType] ~= nil and config[p2.uploadEnum.assetType][Parent.Name] ~= nil then
					local Entry = config[p2.uploadEnum.assetType][Parent.Name]
					local AttachmentCFrame = Attachment.CFrame
					
					if UGCValidationJointRotationMaximumDegreeOrientationOffset < GetDiffBetweenOrientationsModule(Entry, AttachmentCFrame) then
						local _Vector3 = Vector3.new(Entry:ToOrientation())
						p1:fail(ErrorSourceStringsModule.Keys.JointRotAtt_Rotated, {
							instPath = Attachment:GetFullName(),
							expectedOrientation = ValueToStringModule((Vector3.new(math.deg(_Vector3.X), math.deg(_Vector3.Y), (math.deg(_Vector3.Z)))))
						})
					end
					if UGCValidationJointRotationMaximumHundredthPositionOffset / 100 < (AttachmentCFrame.Position - vector.create(0, 0, 0)).Magnitude then
						p1:fail(ErrorSourceStringsModule.Keys.JointRotAtt_Moved, {
							instPath = Attachment:GetFullName(),
							expectedPosition = ValueToStringModule(vector.create(0, 0, 0))
						})
					end
				end
			end
		end
	end
}