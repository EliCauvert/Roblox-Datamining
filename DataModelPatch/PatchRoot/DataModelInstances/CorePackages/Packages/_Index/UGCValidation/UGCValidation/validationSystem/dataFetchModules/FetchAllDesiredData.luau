local Parent = script.Parent.Parent.Parent
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local FetchEditablesModule = require(Parent.validationSystem.dataFetchModules.FetchEditables)
local FetchCurveAnimationsModule = require(Parent.validationSystem.dataFetchModules.FetchCurveAnimations)
local FetchCurveAnimComputedFramesModule = require(Parent.validationSystem.dataFetchModules.FetchCurveAnimComputedFrames)
local FetchContentIdsModule = require(Parent.validationSystem.dataFetchModules.FetchContentIds)
local FetchHSRAssetsModule = require(Parent.validationSystem.dataFetchModules.FetchHSRAssets)
local FetchCurveAnimBoneDataModule = require(Parent.validationSystem.dataFetchModules.FetchCurveAnimBoneData)
local _ = require(Parent.util.Types)
local SharedDataMember = ValidationEnumsModule.SharedDataMember
local GetFFlagUGCValidateMigrateSchemaPropertiesModule = require(Parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local GetFFlagUGCValidateMigrateBodyPartBoundsModule = require(Parent.flags.getFFlagUGCValidateMigrateBodyPartBounds)
local ResetPhysicsDataModule = require(Parent.util.resetPhysicsData)
local list = {
	SharedDataMember.renderMeshesData,
	SharedDataMember.innerCagesData,
	SharedDataMember.outerCagesData,
	SharedDataMember.meshTextures
}
local config = { InExpServer = true, InExpClient = true }
local FetchAllDesiredDataModule = { DATA_FETCH_FAILURE = {} }

function FetchAllDesiredDataModule.storeDesiredData(DATAFETCHFAILUREs, p1)
	-- upvalues: GetFFlagUGCValidateMigrateBodyPartBoundsModule (copy), ValidationEnumsModule (copy), ResetPhysicsDataModule (copy), GetFFlagUGCValidateMigrateSchemaPropertiesModule (copy), config (copy), list (copy), FetchEditablesModule (copy), FetchAllDesiredDataModule (copy), SharedDataMember (copy), FetchCurveAnimationsModule (copy), FetchCurveAnimComputedFramesModule (copy), FetchContentIdsModule (copy), FetchHSRAssetsModule (copy), FetchCurveAnimBoneDataModule (copy)
	local RootInstance = DATAFETCHFAILUREs.rootInstance
	local PreloadedEditableMeshes = DATAFETCHFAILUREs.consumerConfig.preloadedEditableMeshes or {}
	local PreloadedEditableImages = DATAFETCHFAILUREs.consumerConfig.preloadedEditableImages or {}
	
	if GetFFlagUGCValidateMigrateBodyPartBoundsModule() and DATAFETCHFAILUREs.consumerConfig.consumerEnv ~= ValidationEnumsModule.ConsumerEnv.IEC then
		pcall(ResetPhysicsDataModule, { RootInstance }, {
			isServer = DATAFETCHFAILUREs.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.Backend,
			bypassFlags = {}
		})
	end
	local IsConsumerEnvMatch = nil
	IsConsumerEnvMatch = if GetFFlagUGCValidateMigrateSchemaPropertiesModule() then DATAFETCHFAILUREs.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.IEC else config[DATAFETCHFAILUREs.consumerConfig.source] == true
	for _, value in list do
		if p1[value] then
			local Success, Result = pcall(function()
				-- upvalues: FetchEditablesModule (upval), RootInstance (copy), value (copy), IsConsumerEnvMatch (ref), PreloadedEditableMeshes (copy), PreloadedEditableImages (copy)
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
		DATAFETCHFAILUREs.curveAnimations = FetchCurveAnimationsModule.getData(RootInstance) or FetchAllDesiredDataModule.DATA_FETCH_FAILURE
	end
	if p1[SharedDataMember.curveAnimComputedFrames] then
		if DATAFETCHFAILUREs.curveAnimations and DATAFETCHFAILUREs.curveAnimations ~= FetchAllDesiredDataModule.DATA_FETCH_FAILURE then
			DATAFETCHFAILUREs.curveAnimComputedFrames = FetchCurveAnimComputedFramesModule.getData(DATAFETCHFAILUREs.curveAnimations) or FetchAllDesiredDataModule.DATA_FETCH_FAILURE
		else
			DATAFETCHFAILUREs.curveAnimComputedFrames = FetchAllDesiredDataModule.DATA_FETCH_FAILURE
		end
	end
	if GetFFlagUGCValidateMigrateSchemaPropertiesModule() then
		if p1[SharedDataMember.contentIds] then
			DATAFETCHFAILUREs.contentIds = FetchContentIdsModule.getData(DATAFETCHFAILUREs)
		end
		if p1[SharedDataMember.hsrAssets] then
			DATAFETCHFAILUREs.hsrAssets = FetchHSRAssetsModule.getData(RootInstance, DATAFETCHFAILUREs.consumerConfig) or FetchAllDesiredDataModule.DATA_FETCH_FAILURE
		end
	end
	if p1[SharedDataMember.curveAnimBoneData] then
		DATAFETCHFAILUREs[SharedDataMember.curveAnimBoneData] = FetchCurveAnimBoneDataModule.getData(DATAFETCHFAILUREs[SharedDataMember.curveAnimations])
	end
end

return FetchAllDesiredDataModule