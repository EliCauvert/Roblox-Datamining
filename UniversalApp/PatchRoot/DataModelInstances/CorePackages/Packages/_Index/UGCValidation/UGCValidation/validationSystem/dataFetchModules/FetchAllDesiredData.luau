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

function t_1.storeDesiredData(p0, p1)
	-- upvalues: getFFlagUGCValidateMigrateBodyPartBoundsModule (ref), validationEnumsModule (ref), resetPhysicsDataModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), t (ref), list (ref), fetchEditablesModule (ref), t_1 (ref), sharedDataMember (ref), fetchCurveAnimationsModule (ref), fetchCurveAnimComputedFramesModule (ref), fetchContentIdsModule (ref), fetchHSRAssetsModule (ref), fetchCurveAnimBoneDataModule (ref)
	local rootInstance = p0.rootInstance
	local preloadedEditableMeshes = p0.consumerConfig.preloadedEditableMeshes or {}
	local preloadedEditableImages = p0.consumerConfig.preloadedEditableImages or {}
	
	if getFFlagUGCValidateMigrateBodyPartBoundsModule() and p0.consumerConfig.consumerEnv ~= validationEnumsModule.ConsumerEnv.IEC then
		pcall(resetPhysicsDataModule, { rootInstance }, {
			isServer = p0.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend,
			bypassFlags = {}
		})
	end
	local var15
	local _ = nil
	
	if getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var15 = p0.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.IEC
		var15 = nil
	else
		var15 = t[p0.consumerConfig.source] == true
	end
	for i, v in list do
		if p1[v] then
			local ok, status = pcall(function()
				-- upvalues: fetchEditablesModule (copy), rootInstance (ref), v (ref), var15 (write), preloadedEditableMeshes (ref), preloadedEditableImages (ref)
				return fetchEditablesModule.getDatas(rootInstance, v, var15, preloadedEditableMeshes, preloadedEditableImages)
			end)
			
			if ok and status then
				p0[v] = status
			else
				p0[v] = t_1.DATA_FETCH_FAILURE
			end
		end
	end
	if p1[sharedDataMember.curveAnimations] then
		p0.curveAnimations = fetchCurveAnimationsModule.getData(rootInstance) or t_1.DATA_FETCH_FAILURE
	end
	if p1[sharedDataMember.curveAnimComputedFrames] then
		if p0.curveAnimations and p0.curveAnimations ~= t_1.DATA_FETCH_FAILURE then
			p0.curveAnimComputedFrames = fetchCurveAnimComputedFramesModule.getData(p0.curveAnimations) or t_1.DATA_FETCH_FAILURE
		else
			p0.curveAnimComputedFrames = t_1.DATA_FETCH_FAILURE
		end
	end
	if getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		if p1[sharedDataMember.contentIds] then
			p0.contentIds = fetchContentIdsModule.getData(p0)
		end
		if p1[sharedDataMember.hsrAssets] then
			p0.hsrAssets = fetchHSRAssetsModule.getData(rootInstance, p0.consumerConfig) or t_1.DATA_FETCH_FAILURE
		end
	end
	if p1[sharedDataMember.curveAnimBoneData] then
		p0[sharedDataMember.curveAnimBoneData] = fetchCurveAnimBoneDataModule.getData(p0[sharedDataMember.curveAnimations])
	end
end

return t_1