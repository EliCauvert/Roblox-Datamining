local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local assetCalculatorModule = require(parent.util.AssetCalculator)
local getFStringUGCValidationMaxCageDistanceModule = require(parent.flags.GetFStringUGCValidationMaxCageDistance)

return {
	fflag = require(parent.flags.getFFlagUGCValidateMigrateCageGeometry),
	categories = { validationEnumsModule.UploadCategory.FULL_BODY },
	requiredData = {
		validationEnumsModule.SharedDataMember.renderMeshesData,
		validationEnumsModule.SharedDataMember.outerCagesData
	},
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: assetCalculatorModule (ref), UGCValidationService (ref), getFStringUGCValidationMaxCageDistanceModule (ref), errorSourceStringsModule (ref)
		local t = {}
		
		for i, v in p2.rootInstance:GetChildren() do
			t[v.Name] = v
		end
		if next(t) == nil then return end
		local var1 = assetCalculatorModule.calculateAllTransformsForFullBody(t)
		local t_1 = {}
		
		for i_1, v_1 in t do
			local var2 = p2.renderMeshesData[i_1]
			local var3 = p2.outerCagesData[i_1]
			
			if var2 ~= nil and var3 ~= nil then
				table.insert(t_1, {
					renderMesh = var2.editable,
					outerCage = var3.editable,
					renderMeshTransform = var1[i_1],
					outerCageLocalTransform = var3.origin,
					scale = v_1.Size / var2.originalSize,
					name = i_1
				})
			end
		end
		if #t_1 == 0 then return end
		local var4, var5 = UGCValidationService:CalculateBodyMaxCageDistance(t_1)
		
		if getFStringUGCValidationMaxCageDistanceModule.asNumber() < var4 then
			p1:fail(errorSourceStringsModule.Keys.BodyPartCageDistanceValid_TooFar, {
				partName = var5,
				distance = string.format("%.2f", var4),
				maxDistance = getFStringUGCValidationMaxCageDistanceModule.asString()
			})
		end
	end
}