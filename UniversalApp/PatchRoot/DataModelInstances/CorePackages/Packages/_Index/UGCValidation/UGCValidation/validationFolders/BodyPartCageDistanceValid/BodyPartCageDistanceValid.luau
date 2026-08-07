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
	run = function(p0, p1) --[[ line: 23 ]]
		-- upvalues: assetCalculatorModule (ref), UGCValidationService (ref), getFStringUGCValidationMaxCageDistanceModule (ref), errorSourceStringsModule (ref)
		local t = {}
		
		for i, v in p1.rootInstance:GetChildren() do
			t[v.Name] = v
		end
		if next(t) == nil then return end
		local var6 = assetCalculatorModule.calculateAllTransformsForFullBody(t)
		local t_1 = {}
		
		for i_1, v_1 in t do
			local var10 = p1.renderMeshesData[i_1]
			local var11 = p1.outerCagesData[i_1]
			
			if var10 ~= nil and var11 ~= nil then
				table.insert(t_1, {
					renderMesh = var10.editable,
					outerCage = var11.editable,
					renderMeshTransform = var6[i_1],
					outerCageLocalTransform = var11.origin,
					scale = v_1.Size / var10.originalSize,
					name = i_1
				})
			end
		end
		if #t_1 == 0 then return end
		local var8, var9 = UGCValidationService:CalculateBodyMaxCageDistance(t_1)
		
		if getFStringUGCValidationMaxCageDistanceModule.asNumber() < var8 then
			p0:fail(errorSourceStringsModule.Keys.BodyPartCageDistanceValid_TooFar, {
				partName = var9,
				distance = string.format("%.2f", var8),
				maxDistance = getFStringUGCValidationMaxCageDistanceModule.asString()
			})
		end
	end
}