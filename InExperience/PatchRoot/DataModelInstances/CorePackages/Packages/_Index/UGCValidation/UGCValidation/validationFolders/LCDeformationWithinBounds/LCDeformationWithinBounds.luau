local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationRulesUtilModule = require(Parent.util.ValidationRulesUtil)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local Vector3UtilsModule = require(Parent.util.Vector3Utils)
local ValueToStringModule = require(Parent.util.valueToString)
local GetEngineFeatureLayeredClothingDecompositionModule = require(Parent.flags.getEngineFeatureLayeredClothingDecomposition)
local LCPostDeformSizeMultiplierEyebrowEyelashHundredthsRatio = game:DefineFastInt("LCPostDeformSizeMultiplierEyebrowEyelashHundredths", 100) / 100
local config = {
	[Enum.AssetType.EyebrowAccessory] = LCPostDeformSizeMultiplierEyebrowEyelashHundredthsRatio,
	[Enum.AssetType.EyelashAccessory] = LCPostDeformSizeMultiplierEyebrowEyelashHundredthsRatio
}
local LCPostDeformSizeMultiplierGeneralHundredthsRatio = game:DefineFastInt("LCPostDeformSizeMultiplierGeneralHundredths", 100) / 100

return {
	fflag = require(Parent.flags.getEngineFeatureEngineUGCValidationExactLCDeformationSize),
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	run = function(p1, p2)
		-- upvalues: ValidationRulesUtilModule (copy), config (copy), LCPostDeformSizeMultiplierGeneralHundredthsRatio (copy), GetEngineFeatureLayeredClothingDecompositionModule (copy), UGCValidationService (copy), Vector3UtilsModule (copy), ErrorSourceStringsModule (copy), ValueToStringModule (copy)
		local Handle = p2.rootInstance:FindFirstChild("Handle")
		local Handle1 = p2.renderMeshesData.Handle
		local AssetType = p2.uploadEnum.assetType
		
		if Handle == nil or Handle1 == nil then
			error("Schema should have ensured data exists for handle")
		end
		local LCSizeLimit, LCSizeLimit2 = ValidationRulesUtilModule:getLCSizeLimit(AssetType, Handle)
		
		if not LCSizeLimit or LCSizeLimit2 == nil then
			error("Could not find matching attachment on Handle for " .. AssetType.Name)
		end
		local ScaledLCSizeLimit = LCSizeLimit2 * (config[AssetType] or LCPostDeformSizeMultiplierGeneralHundredthsRatio)
		
		if not Vector3UtilsModule.isFirstLessOrEqual(if GetEngineFeatureLayeredClothingDecompositionModule() then UGCValidationService:GetLayeredClothingPostDeformationSizeAsync(p2.rootInstance, Handle1.editable, Handle1.scale) else UGCValidationService:GetLayeredClothingPostDeformationSize(p2.rootInstance, Handle1.editable, Handle1.scale), ScaledLCSizeLimit) then
			p1:fail(ErrorSourceStringsModule.Keys.LCDeformTooLarge, { maxSize = ValueToStringModule(ScaledLCSizeLimit) }, Handle)
		end
	end
}