local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	fflag = require(Parent.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning),
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	run = function(p1, p2)
		-- upvalues: UGCValidationService (copy), ConstantsModule (copy), ErrorSourceStringsModule (copy)
		local Handle = p2.rootInstance:FindFirstChild("Handle")
		local Handle1 = p2.renderMeshesData.Handle
		
		if Handle == nil or Handle1 == nil then
			error("Schema should have ensured data exists for handle")
		end
		local BoneNames = {}
		
		for _, bone in Handle1.editable:GetBones() do
			table.insert(BoneNames, Handle1.editable:GetBoneName(bone))
		end
		local List = {
			UGCValidationService:GetSkinnedJointNamesFromEditableMesh(Handle1.editable)
		}
		local EditableMeshSkinningTransferJointsInfo = UGCValidationService:GetEditableMeshSkinningTransferJointsInfo(Handle1.editable)
		local WrapLayer = Handle:FindFirstChildOfClass("WrapLayer")
		assert(WrapLayer, "WrapLayer not found on handle")
		local IsAutoSkinMatch = WrapLayer.AutoSkin == Enum.WrapLayerAutoSkin.EnabledOverride
		p1:setReportingInstance(Handle)
		
		for RequiredJointName, boneName in BoneNames do
			if ConstantsModule.ALLOWED_SKINNING_TRANSFER_JOINT_NAMES[boneName] then
				if not IsAutoSkinMatch then
					p1:fail(ErrorSourceStringsModule.Keys.AccessorySkinning_TransferJointWithoutAutoSkin, { jointName = boneName })
				end
			elseif not ConstantsModule.R15_STANDARD_JOINT_NAMES[boneName] then
				p1:fail(ErrorSourceStringsModule.Keys.AccessorySkinning_ExtraJoint, { jointName = boneName })
			end
		end
		for RequiredJointName, value in EditableMeshSkinningTransferJointsInfo do
			if not value then
				p1:fail(ErrorSourceStringsModule.Keys.AccessorySkinning_WeightNotFull)
				break
			end
		end
		if ConstantsModule.SkinningTransferRequiredTypes[p2.uploadEnum.assetType] then
			if not IsAutoSkinMatch then
				p1:fail(ErrorSourceStringsModule.Keys.AccessorySkinning_RequiredSkinningTransfer, { assetType = p2.uploadEnum.assetType.Name })
			end
			for RequiredJointName, _ in ConstantsModule.ALLOWED_SKINNING_TRANSFER_JOINT_NAMES do
				if table.find(List, RequiredJointName) == nil then
					p1:fail(ErrorSourceStringsModule.Keys.AccessorySkinning_MissingTransferJoint, {
						assetType = p2.uploadEnum.assetType.Name,
						requiredJointName = RequiredJointName
					})
				end
			end
			for _, JointName in List do
				if ConstantsModule.R15_STANDARD_JOINT_NAMES[JointName] then
					local List1 = {}
					
					for i, _ in ConstantsModule.ALLOWED_SKINNING_TRANSFER_JOINT_NAMES do
						table.insert(List1, i)
					end
					p1:fail(ErrorSourceStringsModule.Keys.AccessorySkinning_NotLeaderOrFollower, {
						jointName = JointName,
						validJointNameList = table.concat(List1, ", ")
					})
				end
			end
		end
	end
}