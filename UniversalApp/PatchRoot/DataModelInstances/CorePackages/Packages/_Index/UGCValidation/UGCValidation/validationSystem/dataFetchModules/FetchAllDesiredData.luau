local parent = script.Parent.Parent.Parent
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local fetchEditablesModule = require(parent.validationSystem.dataFetchModules.FetchEditables)
local fetchCurveAnimationsModule = require(parent.validationSystem.dataFetchModules.FetchCurveAnimations)
local fetchCurveAnimComputedFramesModule = require(parent.validationSystem.dataFetchModules.FetchCurveAnimComputedFrames)
local fetchContentIdsModule = require(parent.validationSystem.dataFetchModules.FetchContentIds)
local fetchHSRAssetsModule = require(parent.validationSystem.dataFetchModules.FetchHSRAssets)
local fetchCurveAnimBoneDataModule = require(parent.validationSystem.dataFetchModules.FetchCurveAnimBoneData)
local _ = require(parent.util.Types)
local sharedDataMember = validationEnumsModule.SharedDataMember
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagUGCValidateMigrateBodyPartBoundsModule = require(parent.flags.getFFlagUGCValidateMigrateBodyPartBounds)
local resetPhysicsDataModule = require(parent.util.resetPhysicsData)
local list = {
	sharedDataMember.renderMeshesData,
	sharedDataMember.innerCagesData,
	sharedDataMember.outerCagesData,
	sharedDataMember.meshTextures
}
local t = { InExpServer = true, InExpClient = true }
local t_1 = { DATA_FETCH_FAILURE = {} }

function t_1.storeDesiredData(p1, p2)
	-- upvalues: getFFlagUGCValidateMigrateBodyPartBoundsModule (ref), validationEnumsModule (ref), resetPhysicsDataModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), t (ref), list (ref), fetchEditablesModule (ref), t_1 (ref), sharedDataMember (ref), fetchCurveAnimationsModule (ref), fetchCurveAnimComputedFramesModule (ref), fetchContentIdsModule (ref), fetchHSRAssetsModule (ref), fetchCurveAnimBoneDataModule (ref)
	local rootInstance = p1.rootInstance
	local preloadedEditableMeshes = p1.consumerConfig.preloadedEditableMeshes or {}
	local preloadedEditableImages = p1.consumerConfig.preloadedEditableImages or {}
	
	if getFFlagUGCValidateMigrateBodyPartBoundsModule() and p1.consumerConfig.consumerEnv ~= validationEnumsModule.ConsumerEnv.IEC then
		pcall(resetPhysicsDataModule, { rootInstance }, {
			isServer = p1.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend,
			bypassFlags = {}
		})
	end
	local var1
	local _ = nil
	
	if getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var1 = p1.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC
		var1 = nil
	else
		var1 = t[p1.consumerConfig.source] == true
	end
	for i, v in list do
		if p2[v] then
			local ok, status = pcall(function()
				-- upvalues: fetchEditablesModule (copy), rootInstance (ref), v (ref), var1 (write), preloadedEditableMeshes (ref), preloadedEditableImages (ref)
				return fetchEditablesModule.getDatas(rootInstance, v, var1, preloadedEditableMeshes, preloadedEditableImages)
			end)
			
			if ok and status then
				p1[v] = status
			else
				p1[v] = t_1.DATA_FETCH_FAILURE
			end
		end
	end
	if p2[sharedDataMember.curveAnimations] then
		p1.curveAnimations = fetchCurveAnimationsModule.getData(rootInstance) or t_1.DATA_FETCH_FAILURE
	end
	if p2[sharedDataMember.curveAnimComputedFrames] then
		if p1.curveAnimations and p1.curveAnimations ~= t_1.DATA_FETCH_FAILURE then
			p1.curveAnimComputedFrames = fetchCurveAnimComputedFramesModule.getData(p1.curveAnimations) or t_1.DATA_FETCH_FAILURE
		else
			p1.curveAnimComputedFrames = t_1.DATA_FETCH_FAILURE
		end
	end
	if getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		if p2[sharedDataMember.contentIds] then
			p1.contentIds = fetchContentIdsModule.getData(p1)
		end
		if p2[sharedDataMember.hsrAssets] then
			p1.hsrAssets = fetchHSRAssetsModule.getData(rootInstance, p1.consumerConfig) or t_1.DATA_FETCH_FAILURE
		end
	end
	if p2[sharedDataMember.curveAnimBoneData] then
		p1[sharedDataMember.curveAnimBoneData] = fetchCurveAnimBoneDataModule.getData(p1[sharedDataMember.curveAnimations])
	end
end

return t_1