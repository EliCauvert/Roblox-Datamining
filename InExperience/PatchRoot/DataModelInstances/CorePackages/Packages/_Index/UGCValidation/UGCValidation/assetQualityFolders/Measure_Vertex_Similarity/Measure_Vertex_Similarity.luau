local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateAQMeshQualityBlockUploadModule = require(parent.flags.getFFlagUGCValidateAQMeshQualityBlockUpload)
local t = {
	[validationEnumsModule.UploadCategory.FULL_BODY] = true,
	[validationEnumsModule.UploadCategory.DYNAMIC_HEAD] = true
}
local UGCValidationVertexSimilarityMaxPercent = game:DefineFastInt("UGCValidationVertexSimilarityMaxPercent", 30)

return {
	categories = {
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.FULL_BODY,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(parent.flags.getFFlagUGCValidateAQMeshQuality),
	run = function(p1, p2)
		-- upvalues: getFFlagUGCValidateAQMeshQualityBlockUploadModule (ref), t (ref), errorSourceStringsModule (ref), UGCValidationVertexSimilarityMaxPercent (ref)
		local measureVertexSimilarity = p2.aqsSummaryData.Measure_Vertex_Similarity
		local uploadCategory = getFFlagUGCValidateAQMeshQualityBlockUploadModule() and t[p2.uploadCategory]
		
		if measureVertexSimilarity == nil then
			if uploadCategory then
				error("Measure_Vertex_Similarity: AQS summary data is nil")
				
				return
			end
			p1:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Vertex_Similarity" })
			
			return
		else
			local var1 = UGCValidationVertexSimilarityMaxPercent / 100
			
			for i, v in measureVertexSimilarity do
				if i ~= "measurement_score" then
					if v ~= nil and v.similar_vertex_percent ~= nil then
						local similarVertexPercent = tonumber(v.similar_vertex_percent) or 0
						
						if var1 < similarVertexPercent then
							local t_1 = {
								partName = i,
								similar_vertex_percent = string.format("%.2f", similarVertexPercent * 100),
								threshold = tostring(UGCValidationVertexSimilarityMaxPercent)
							}
							
							if uploadCategory then
								p1:fail(errorSourceStringsModule.Keys.AQSWarn_VertexSimilarity, t_1)
							else
								p1:warn(errorSourceStringsModule.Keys.AQSWarn_VertexSimilarity, t_1)
							end
						end
					end
					p1:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Vertex_Similarity" })
					
					return
				end
			end
		end
	end
}