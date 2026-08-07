local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local bodyAssetMasksRendererModule = require(parent.util.bodyAssetMasksRenderer)
local accurateBoundingBoxRasterUtilModule = require(parent.util.AccurateBoundingBoxRasterUtil)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.renderMeshesData
	},
	fflag = require(parent.flags.getFFlagUGCValidateMigratePoseBlocking),
	expectedFailures = {}
}

local function _(value) --[[ line: 37 | named "getAssetTypeFromUploadEnum" ]]
	return if value.uploadEnum and value.uploadEnum.assetType then value.uploadEnum.assetType else nil
end

local function buildEditableMeshesFromSharedData(p0) --[[ line: 44 ]]
	local t = {}
	
	for i, v in p0.renderMeshesData do
		local var7 = p0.rootInstance:FindFirstChild(i, true)
		
		if not var7 and p0.rootInstance.Name == i then
			var7 = p0.rootInstance
		end
		if var7 and v.editable then
			t[var7] = { MeshId = { created = false, instance = v.editable } }
		end
	end
	return t
end

function t.run(p1, p2) --[[ line: 61 ]]
	-- upvalues: buildEditableMeshesFromSharedData (ref), validationEnumsModule (ref), accurateBoundingBoxRasterUtilModule (ref), bodyAssetMasksRendererModule (ref), errorSourceStringsModule (ref)
	local var8 = if p2.uploadEnum and p2.uploadEnum.assetType then p2.uploadEnum.assetType else nil
	
	if not var8 then return end
	local rootInstance = p2.rootInstance
	local t = {
		shouldYield = false,
		assetTypeEnum = var8,
		isServer = p2.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend,
		editableMeshes = buildEditableMeshesFromSharedData(p2)
	}
	local var10, var11 = bodyAssetMasksRendererModule.new(rootInstance, accurateBoundingBoxRasterUtilModule.getBoundsViewsForAssetType(var8), t)
	
	if var10 then
		local var12, var13 = accurateBoundingBoxRasterUtilModule.validate(rootInstance, var11, t)
		
		if not var12 and var13 then
			for i, v in var13 do
				p1:fail(errorSourceStringsModule.Keys.BoundingBox_ValidationFailed, { reason = v })
			end
		end
		return
	elseif var11 then
		for i, v in var11 do
			p1:fail(errorSourceStringsModule.Keys.BoundingBox_ValidationFailed, { reason = v })
		end
	end
end

return t