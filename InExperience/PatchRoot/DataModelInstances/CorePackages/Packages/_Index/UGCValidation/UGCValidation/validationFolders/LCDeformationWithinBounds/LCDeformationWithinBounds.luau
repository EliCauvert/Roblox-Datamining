local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationRulesUtilModule = require(parent.util.ValidationRulesUtil)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getEngineFeatureEngineUGCValidationExpandReturnSchemaModule = require(parent.flags.getEngineFeatureEngineUGCValidationExpandReturnSchema)
local vector3UtilsModule = require(parent.util.Vector3Utils)
local valueToStringModule = require(parent.util.valueToString)
local t = {
	fflag = require(parent.flags.getEngineFeatureEngineUGCValidationExactLCDeformationSize),
	categories = { validationEnumsModule.UploadCategory.LAYERED_CLOTHING },
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData }
}
local var8 = game:DefineFastInt("LCPostDeformSizeMultiplierEyebrowEyelashHundredths", 100) / 100
local t_1 = {
	[Enum.AssetType.EyebrowAccessory] = var8,
	[Enum.AssetType.EyelashAccessory] = var8
}
local var10 = game:DefineFastInt("LCPostDeformSizeMultiplierGeneralHundredths", 100) / 100

function t.run(p0, p1) --[[ line: 30 ]]
	-- upvalues: validationRulesUtilModule (ref), t_1 (ref), var10 (ref), UGCValidationService (ref), vector3UtilsModule (ref), errorSourceStringsModule (ref), valueToStringModule (ref), getEngineFeatureEngineUGCValidationExpandReturnSchemaModule (ref)
	local handle = p1.rootInstance:FindFirstChild("Handle")
	local handle_1 = p1.renderMeshesData.Handle
	local assetType = p1.uploadEnum.assetType
	
	if handle == nil or handle_1 == nil then
		error("Schema should have ensured data exists for handle")
	end
	local var12, var13 = validationRulesUtilModule:getLCSizeLimit(assetType, handle)
	
	if not var12 or var13 == nil then
		error("Could not find matching attachment on Handle for " .. assetType.Name)
	end
	local var14 = var13 * (t_1[assetType] or var10)
	
	if not vector3UtilsModule.isFirstLessOrEqual(UGCValidationService:GetLayeredClothingPostDeformationSize(p1.rootInstance, handle_1.editable, handle_1.scale), var14) then
		p0:fail(errorSourceStringsModule.Keys.LCDeformTooLarge, { maxSize = valueToStringModule(var14) }, if getEngineFeatureEngineUGCValidationExpandReturnSchemaModule() then handle else nil)
	end
end

return t