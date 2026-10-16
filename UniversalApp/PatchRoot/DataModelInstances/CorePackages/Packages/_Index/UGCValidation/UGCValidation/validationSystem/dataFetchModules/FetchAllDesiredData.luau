local Parent = script.Parent.Parent.Parent
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local FetchEditablesModule = require(Parent.validationSystem.dataFetchModules.FetchEditables)
local FetchCurveAnimationsModule = require(Parent.validationSystem.dataFetchModules.FetchCurveAnimations)
local FetchCurveAnimComputedFramesModule = require(Parent.validationSystem.dataFetchModules.FetchCurveAnimComputedFrames)
local FetchContentIdsModule = require(Parent.validationSystem.dataFetchModules.FetchContentIds)
local FetchHSRAssetsModule = require(Parent.validationSystem.dataFetchModules.FetchHSRAssets)
local FetchCurveAnimBoneDataModule = require(Parent.validationSystem.dataFetchModules.FetchCurveAnimBoneData)
local FetchFullBodyPartsMetricsModule = require(Parent.validationSystem.dataFetchModules.FetchFullBodyPartsMetrics)
local _ = require(Parent.util.Types)
local SharedDataMember = ValidationEnumsModule.SharedDataMember
local GetFFlagUGCValidationAllowFullVaasModule = require(Parent.flags.getFFlagUGCValidationAllowFullVaas)
local GetFFlagUGCValidateHeadAboveTorsoModule = require(Parent.flags.getFFlagUGCValidateHeadAboveTorso)
local ResetPhysicsDataModule = require(Parent.util.resetPhysicsData)
local list = {
	SharedDataMember.renderMeshesData,
	SharedDataMember.innerCagesData,
	SharedDataMember.outerCagesData,
	SharedDataMember.meshTextures
}
local FetchAllDesiredDataModule = { DATA_FETCH_FAILURE = {} }

function FetchAllDesiredDataModule.storeDesiredData(DATAFETCHFAILUREs, p1) --[[ Line: 32 ]]
	-- upvalues: GetFFlagUGCValidationAllowFullVaasModule (copy), ValidationEnumsModule (copy), ResetPhysicsDataModule (copy), list (copy), FetchEditablesModule (copy), FetchAllDesiredDataModule (copy), SharedDataMember (copy), FetchCurveAnimationsModule (copy), FetchCurveAnimComputedFramesModule (copy), FetchContentIdsModule (copy), FetchHSRAssetsModule (copy), FetchCurveAnimBoneDataModule (copy), GetFFlagUGCValidateHeadAboveTorsoModule (copy), FetchFullBodyPartsMetricsModule (copy)
	local RootInstance = DATAFETCHFAILUREs.rootInstance
	local PreloadedEditableMeshes = DATAFETCHFAILUREs.consumerConfig.preloadedEditableMeshes or {}
	local PreloadedEditableImages = DATAFETCHFAILUREs.consumerConfig.preloadedEditableImages or {}
	
	if not GetFFlagUGCValidationAllowFullVaasModule() and DATAFETCHFAILUREs.consumerConfig.consumerEnv ~= ValidationEnumsModule.ConsumerEnv.IEC then
		pcall(ResetPhysicsDataModule, { RootInstance }, {
			isServer = DATAFETCHFAILUREs.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.Backend,
			bypassFlags = {}
		})
	end
	local IsConsumerEnvMatch = DATAFETCHFAILUREs.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.IEC
	for _, value in list do
		if p1[value] then
			local Success, Result = pcall(function() --[[ Line: 49 ]]
				-- upvalues: FetchEditablesModule (upval), RootInstance (copy), value (copy), IsConsumerEnvMatch (copy), PreloadedEditableMeshes (copy), PreloadedEditableImages (copy)
				return (FetchEditablesModule.getDatas(RootInstance, value, IsConsumerEnvMatch, PreloadedEditableMeshes, PreloadedEditableImages))
			end)
			
			if Success and Result then
				DATAFETCHFAILUREs[value] = Result
			else
				DATAFETCHFAILUREs[value] = FetchAllDesiredDataModule.DATA_FETCH_FAILURE
			end
		end
	end
	if p1[SharedDataMember.curveAnimations] then
		DATAFETCHFAILUREs.curveAnimations = FetchCurveAnimationsModule.getData(RootInstance, DATAFETCHFAILUREs.consumerConfig) or FetchAllDesiredDataModule.DATA_FETCH_FAILURE
	end
	if p1[SharedDataMember.curveAnimComputedFrames] then
		if DATAFETCHFAILUREs.curveAnimations and DATAFETCHFAILUREs.curveAnimations ~= FetchAllDesiredDataModule.DATA_FETCH_FAILURE then
			DATAFETCHFAILUREs.curveAnimComputedFrames = FetchCurveAnimComputedFramesModule.getData(DATAFETCHFAILUREs.curveAnimations) or FetchAllDesiredDataModule.DATA_FETCH_FAILURE
		else
			DATAFETCHFAILUREs.curveAnimComputedFrames = FetchAllDesiredDataModule.DATA_FETCH_FAILURE
		end
	end
	if p1[SharedDataMember.contentIds] then
		DATAFETCHFAILUREs.contentIds = FetchContentIdsModule.getData(DATAFETCHFAILUREs)
	end
	if p1[SharedDataMember.hsrAssets] then
		DATAFETCHFAILUREs.hsrAssets = FetchHSRAssetsModule.getData(RootInstance, DATAFETCHFAILUREs.consumerConfig) or FetchAllDesiredDataModule.DATA_FETCH_FAILURE
	end
	if p1[SharedDataMember.curveAnimBoneData] then
		DATAFETCHFAILUREs[SharedDataMember.curveAnimBoneData] = FetchCurveAnimBoneDataModule.getData(DATAFETCHFAILUREs[SharedDataMember.curveAnimations])
	end
	if GetFFlagUGCValidateHeadAboveTorsoModule() and p1[SharedDataMember.fullBodyPartsMetrics] then
		if DATAFETCHFAILUREs.uploadCategory == ValidationEnumsModule.UploadCategory.FULL_BODY and DATAFETCHFAILUREs.renderMeshesData and DATAFETCHFAILUREs.renderMeshesData ~= FetchAllDesiredDataModule.DATA_FETCH_FAILURE then
			local Success1, Result1 = pcall(FetchFullBodyPartsMetricsModule.getData, DATAFETCHFAILUREs)
			
			if Success1 and Result1 then
				DATAFETCHFAILUREs.fullBodyPartsMetrics = Result1
				
				return
			else
				DATAFETCHFAILUREs.fullBodyPartsMetrics = {}
				
				return
			end
		else
			DATAFETCHFAILUREs.fullBodyPartsMetrics = {}
		end
	end
end

return FetchAllDesiredDataModule