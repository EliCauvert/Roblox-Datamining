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

local function _(value)
	return if value.uploadEnum and value.uploadEnum.assetType then value.uploadEnum.assetType else nil
end

local function buildEditableMeshesFromSharedData(p1)
	local t = {}
	
	for i, v in p1.renderMeshesData do
		local var1 = p1.rootInstance:FindFirstChild(i, true)
		
		if not var1 and p1.rootInstance.Name == i then
			var1 = p1.rootInstance
		end
		if var1 and v.editable then
			t[var1] = { MeshId = { created = false, instance = v.editable } }
		end
	end
	return t
end

function t.run(p2, p3)
	-- upvalues: buildEditableMeshesFromSharedData (ref), validationEnumsModule (ref), accurateBoundingBoxRasterUtilModule (ref), bodyAssetMasksRendererModule (ref), errorSourceStringsModule (ref)
	local var2 = if p3.uploadEnum and p3.uploadEnum.assetType then p3.uploadEnum.assetType else nil
	
	if not var2 then return end
	local rootInstance = p3.rootInstance
	local t = {
		shouldYield = false,
		assetTypeEnum = var2,
		isServer = p3.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend,
		editableMeshes = buildEditableMeshesFromSharedData(p3)
	}
	local var3, var4 = bodyAssetMasksRendererModule.new(rootInstance, accurateBoundingBoxRasterUtilModule.getBoundsViewsForAssetType(var2), t)
	
	if var3 then
		local var5, var6 = accurateBoundingBoxRasterUtilModule.validate(rootInstance, var4, t)
		
		if not var5 and var6 then
			for i, v in var6 do
				p2:fail(errorSourceStringsModule.Keys.BoundingBox_ValidationFailed, { reason = v })
			end
		end
		return
	elseif var4 then
		for i, v in var4 do
			p2:fail(errorSourceStringsModule.Keys.BoundingBox_ValidationFailed, { reason = v })
		end
	end
end

return t