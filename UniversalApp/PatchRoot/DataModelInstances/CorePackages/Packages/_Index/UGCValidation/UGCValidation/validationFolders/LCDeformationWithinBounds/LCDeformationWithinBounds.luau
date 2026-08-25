local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationRulesUtilModule = require(parent.util.ValidationRulesUtil)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local vector3UtilsModule = require(parent.util.Vector3Utils)
local valueToStringModule = require(parent.util.valueToString)
local t = {
	fflag = require(parent.flags.getEngineFeatureEngineUGCValidationExactLCDeformationSize),
	categories = { validationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData }
}
local var7 = game:DefineFastInt("LCPostDeformSizeMultiplierEyebrowEyelashHundredths", 100) / 100
local t_1 = {
	[Enum.AssetType.EyebrowAccessory] = var7,
	[Enum.AssetType.EyelashAccessory] = var7
}
local var9 = game:DefineFastInt("LCPostDeformSizeMultiplierGeneralHundredths", 100) / 100

function t.run(p0, p1)
	-- upvalues: validationRulesUtilModule (ref), t_1 (ref), var9 (ref), UGCValidationService (ref), vector3UtilsModule (ref), errorSourceStringsModule (ref), valueToStringModule (ref)
	local handle = p1.rootInstance:FindFirstChild("Handle")
	local handle_1 = p1.renderMeshesData.Handle
	local assetType = p1.uploadEnum.assetType
	
	if handle == nil or handle_1 == nil then
		error("Schema should have ensured data exists for handle")
	end
	local var11, var12 = validationRulesUtilModule:getLCSizeLimit(assetType, handle)
	
	if not var11 or var12 == nil then
		error("Could not find matching attachment on Handle for " .. assetType.Name)
	end
	local var13 = var12 * (t_1[assetType] or var9)
	
	if not vector3UtilsModule.isFirstLessOrEqual(UGCValidationService:GetLayeredClothingPostDeformationSize(p1.rootInstance, handle_1.editable, handle_1.scale), var13) then
		p0:fail(errorSourceStringsModule.Keys.LCDeformTooLarge, { maxSize = valueToStringModule(var13) }, handle)
	end
end

return t