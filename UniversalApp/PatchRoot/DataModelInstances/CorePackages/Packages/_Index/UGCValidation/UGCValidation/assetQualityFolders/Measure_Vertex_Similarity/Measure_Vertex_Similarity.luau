local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateAQMeshQualityBlockUploadModule = require(Parent.flags.getFFlagUGCValidateAQMeshQualityBlockUpload)
local config = {
	[ValidationEnumsModule.UploadCategory.FULL_BODY] = true,
	[ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD] = true
}
local UGCValidationVertexSimilarityMaxPercent = game:DefineFastInt("UGCValidationVertexSimilarityMaxPercent", 30)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.FULL_BODY,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQMeshQuality),
	run = function(p1, p2) --[[ Line: 25 ]]
		-- upvalues: GetFFlagUGCValidateAQMeshQualityBlockUploadModule (copy), config (copy), ErrorSourceStringsModule (copy), UGCValidationVertexSimilarityMaxPercent (copy)
		local MeasureVertexSimilarity = p2.aqsSummaryData.Measure_Vertex_Similarity
		local Entry = GetFFlagUGCValidateAQMeshQualityBlockUploadModule() and config[p2.uploadCategory]
		
		if MeasureVertexSimilarity ~= nil then
			local UGCValidationVertexSimilarityMaxPercentRatio = UGCValidationVertexSimilarityMaxPercent / 100
			
			for PartName, value in MeasureVertexSimilarity do
				if PartName ~= "measurement_score" then
					if value == nil or value.similar_vertex_percent == nil then
						p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Vertex_Similarity" })
						break
					end
					local Number: number = tonumber(value.similar_vertex_percent) or 0
					
					if UGCValidationVertexSimilarityMaxPercentRatio < Number then
						local config1 = {
							partName = PartName,
							similar_vertex_percent = string.format("%.2f", Number * 100),
							threshold = tostring(UGCValidationVertexSimilarityMaxPercent)
						}
						
						if Entry then
							p1:fail(ErrorSourceStringsModule.Keys.AQSWarn_VertexSimilarity, config1)
						else
							p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_VertexSimilarity, config1)
						end
					end
				end
			end
			return
		elseif Entry then
			error("Measure_Vertex_Similarity: AQS summary data is nil")
			
			return
		else
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Vertex_Similarity" })
		end
	end
}