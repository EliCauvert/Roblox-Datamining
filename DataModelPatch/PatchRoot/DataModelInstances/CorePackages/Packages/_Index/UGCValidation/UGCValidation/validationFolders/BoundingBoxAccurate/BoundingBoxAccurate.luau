local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local BodyAssetMasksRendererModule = require(Parent.util.bodyAssetMasksRenderer)
local AccurateBoundingBoxRasterUtilModule = require(Parent.util.AccurateBoundingBoxRasterUtil)

local function _(p1)
	return if p1.uploadEnum and p1.uploadEnum.assetType then p1.uploadEnum.assetType else nil
end

local function buildEditableMeshesFromSharedData(p1)
	local t = {}
	
	for ChildName, value in p1.renderMeshesData do
		local Child = p1.rootInstance:FindFirstChild(ChildName, true)
		
		if not Child and p1.rootInstance.Name == ChildName then
			Child = p1.rootInstance
		end
		if Child and value.editable then
			t[Child] = { MeshId = { created = false, instance = value.editable } }
		end
	end
	return t
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.renderMeshesData
	},
	fflag = require(Parent.flags.getFFlagUGCValidateMigratePoseBlocking),
	expectedFailures = {},
	run = function(p2, p3)
		-- upvalues: buildEditableMeshesFromSharedData (copy), ValidationEnumsModule (copy), AccurateBoundingBoxRasterUtilModule (copy), BodyAssetMasksRendererModule (copy), ErrorSourceStringsModule (copy)
		local AssetType = if p3.uploadEnum and p3.uploadEnum.assetType then p3.uploadEnum.assetType else nil
		
		if not AssetType then return end
		local RootInstance = p3.rootInstance
		local config = {
			shouldYield = false,
			assetTypeEnum = AssetType,
			isServer = p3.consumerConfig.consumerEnv == ValidationEnumsModule.ConsumerEnv.Backend,
			editableMeshes = buildEditableMeshesFromSharedData(p3)
		}
		local NewBodyAssetMasksRenderer, NewBodyAssetMasksRenderer2 = BodyAssetMasksRendererModule.new(RootInstance, AccurateBoundingBoxRasterUtilModule.getBoundsViewsForAssetType(AssetType), config)
		
		if NewBodyAssetMasksRenderer then
			local ValidateResult, ValidateResult2 = AccurateBoundingBoxRasterUtilModule.validate(RootInstance, NewBodyAssetMasksRenderer2, config)
			
			if not ValidateResult and ValidateResult2 then
				for _, Reason1 in ValidateResult2 do
					p2:fail(ErrorSourceStringsModule.Keys.BoundingBox_ValidationFailed, { reason = Reason1 })
				end
			end
			return
		else
			if NewBodyAssetMasksRenderer2 then
				for _, Reason in NewBodyAssetMasksRenderer2 do
					p2:fail(ErrorSourceStringsModule.Keys.BoundingBox_ValidationFailed, { reason = Reason })
				end
			end
		end
	end
}