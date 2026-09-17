local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateAQMeshQualityBlockUploadModule = require(parent.flags.getFFlagUGCValidateAQMeshQualityBlockUpload)
local t = {
	[validationEnumsModule.UploadCategory.FULL_BODY] = true,
	[validationEnumsModule.UploadCategory.DYNAMIC_HEAD] = true
}

return {
	categories = {
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.FULL_BODY,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(parent.flags.getFFlagUGCValidateAQMeshQuality),
	run = function(p1, p2)
		-- upvalues: getFFlagUGCValidateAQMeshQualityBlockUploadModule (ref), t (ref), errorSourceStringsModule (ref)
		local measureDegenTriangles = p2.aqsSummaryData.Measure_Degen_Triangles
		local uploadCategory = getFFlagUGCValidateAQMeshQualityBlockUploadModule() and t[p2.uploadCategory]
		
		if measureDegenTriangles == nil then
			if uploadCategory then
				error("Measure_Degen_Triangles: AQS summary data is nil")
				
				return
			end
			p1:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Degen_Triangles" })
			
			return
		else
			for i, v in measureDegenTriangles do
				if i ~= "measurement_score" then
					if v ~= nil and v.score ~= nil then
						if tonumber(v.score) ~= 100 then
							local t_1 = {
								partName = i,
								degenerate_triangle_percent = string.format("%.2f", (tonumber(v.degenerate_triangle_percent) or 0) * 100),
								score = tostring(math.floor(tonumber(v.score) or 0))
							}
							
							if uploadCategory then
								p1:fail(errorSourceStringsModule.Keys.AQSWarn_DegenTriangles, t_1)
							else
								p1:warn(errorSourceStringsModule.Keys.AQSWarn_DegenTriangles, t_1)
							end
						end
					end
					p1:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Degen_Triangles" })
					
					return
				end
			end
		end
	end
}