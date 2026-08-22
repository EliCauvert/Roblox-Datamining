local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local UGCValidationVertexSimilarityMaxPercent = game:DefineFastInt("UGCValidationVertexSimilarityMaxPercent", 30)

return {
	categories = {
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.FULL_BODY,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(parent.flags.getFFlagUGCValidateAQMeshQuality),
	run = function(p0, p1) --[[ line: 18 ]]
		-- upvalues: errorSourceStringsModule (ref), UGCValidationVertexSimilarityMaxPercent (ref)
		local measureVertexSimilarity = p1.aqsSummaryData.Measure_Vertex_Similarity
		
		if measureVertexSimilarity == nil then
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Vertex_Similarity" })
			
			return
		end
		local var3 = UGCValidationVertexSimilarityMaxPercent / 100
		
		for i, v in measureVertexSimilarity do
			if i ~= "measurement_score" then
				if v ~= nil and v.similar_vertex_percent ~= nil then
					local similarVertexPercent = tonumber(v.similar_vertex_percent) or 0
					
					if var3 < similarVertexPercent then
						p0:warn(errorSourceStringsModule.Keys.AQSWarn_VertexSimilarity, {
							partName = i,
							similar_vertex_percent = string.format("%.2f", similarVertexPercent * 100),
							threshold = tostring(UGCValidationVertexSimilarityMaxPercent)
						})
					end
				end
				p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Vertex_Similarity" })
				
				return
			end
		end
	end
}