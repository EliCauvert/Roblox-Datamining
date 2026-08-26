local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	fflag = require(parent.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning),
	categories = { validationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	run = function(p1, p2)
		-- upvalues: UGCValidationService (ref), constantsModule (ref), errorSourceStringsModule (ref)
		local handle = p2.rootInstance:FindFirstChild("Handle")
		local handle_1 = p2.renderMeshesData.Handle
		
		if handle == nil or handle_1 == nil then
			error("Schema should have ensured data exists for handle")
		end
		local t = {}
		
		for i, v in handle_1.editable:GetBones() do
			table.insert(t, handle_1.editable:GetBoneName(v))
		end
		local list = {
			UGCValidationService:GetSkinnedJointNamesFromEditableMesh(handle_1.editable)
		}
		local editableEditableMeshSkinningTransferJointsInfo = UGCValidationService:GetEditableMeshSkinningTransferJointsInfo(handle_1.editable)
		local wrapLayer = handle:FindFirstChildOfClass("WrapLayer")
		assert(wrapLayer, "WrapLayer not found on handle")
		local var1 = wrapLayer.AutoSkin == Enum.WrapLayerAutoSkin.EnabledOverride
		p1:setReportingInstance(handle)
		
		for i_1, v_1 in t do
			if constantsModule.ALLOWED_SKINNING_TRANSFER_JOINT_NAMES[v_1] then
				if not var1 then
					p1:fail(errorSourceStringsModule.Keys.AccessorySkinning_TransferJointWithoutAutoSkin, { jointName = v_1 })
				end
			elseif not constantsModule.R15_STANDARD_JOINT_NAMES[v_1] then
				p1:fail(errorSourceStringsModule.Keys.AccessorySkinning_ExtraJoint, { jointName = v_1 })
			end
		end
		for i_2, v_2 in editableEditableMeshSkinningTransferJointsInfo do
			if not v_2 then
				p1:fail(errorSourceStringsModule.Keys.AccessorySkinning_WeightNotFull)
				break
			end
		end
		if constantsModule.SkinningTransferRequiredTypes[p2.uploadEnum.assetType] then
			if not var1 then
				p1:fail(errorSourceStringsModule.Keys.AccessorySkinning_RequiredSkinningTransfer, { assetType = p2.uploadEnum.assetType.Name })
			end
			for i_3, v_2 in constantsModule.ALLOWED_SKINNING_TRANSFER_JOINT_NAMES do
				if table.find(list, i_3) == nil then
					p1:fail(errorSourceStringsModule.Keys.AccessorySkinning_MissingTransferJoint, {
						assetType = p2.uploadEnum.assetType.Name,
						requiredJointName = i_3
					})
				end
			end
			for i_4, v_2 in list do
				if constantsModule.R15_STANDARD_JOINT_NAMES[v_2] then
					local t_1 = {}
					
					for i_5, v_5 in constantsModule.ALLOWED_SKINNING_TRANSFER_JOINT_NAMES do
						table.insert(t_1, i_5)
					end
					p1:fail(errorSourceStringsModule.Keys.AccessorySkinning_NotLeaderOrFollower, {
						jointName = v_2,
						validJointNameList = table.concat(t_1, ", ")
					})
				end
			end
		end
	end
}