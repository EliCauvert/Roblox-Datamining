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
local var1 = game:DefineFastInt("LCPostDeformSizeMultiplierEyebrowEyelashHundredths", 100) / 100
local t_1 = {
	[Enum.AssetType.EyebrowAccessory] = var1,
	[Enum.AssetType.EyelashAccessory] = var1
}
local var2 = game:DefineFastInt("LCPostDeformSizeMultiplierGeneralHundredths", 100) / 100

function t.run(p1, p2)
	-- upvalues: validationRulesUtilModule (ref), t_1 (ref), var2 (ref), UGCValidationService (ref), vector3UtilsModule (ref), errorSourceStringsModule (ref), valueToStringModule (ref)
	local handle = p2.rootInstance:FindFirstChild("Handle")
	local handle_1 = p2.renderMeshesData.Handle
	local assetType = p2.uploadEnum.assetType
	
	if handle == nil or handle_1 == nil then
		error("Schema should have ensured data exists for handle")
	end
	local var3, var4 = validationRulesUtilModule:getLCSizeLimit(assetType, handle)
	
	if not var3 or var4 == nil then
		error("Could not find matching attachment on Handle for " .. assetType.Name)
	end
	local var5 = var4 * (t_1[assetType] or var2)
	
	if not vector3UtilsModule.isFirstLessOrEqual(UGCValidationService:GetLayeredClothingPostDeformationSize(p2.rootInstance, handle_1.editable, handle_1.scale), var5) then
		p1:fail(errorSourceStringsModule.Keys.LCDeformTooLarge, { maxSize = valueToStringModule(var5) }, handle)
	end
end

return t