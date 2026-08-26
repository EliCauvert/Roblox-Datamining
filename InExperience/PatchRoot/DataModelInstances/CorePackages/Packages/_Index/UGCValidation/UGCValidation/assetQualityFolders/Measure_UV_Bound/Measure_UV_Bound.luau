local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateAQMeshQualityBlockUploadModule = require(parent.flags.getFFlagUGCValidateAQMeshQualityBlockUpload)

return {
	categories = {
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.FULL_BODY,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(parent.flags.getFFlagUGCValidateAQMeshQuality),
	run = function(p1, p2)
		-- upvalues: getFFlagUGCValidateAQMeshQualityBlockUploadModule (ref), errorSourceStringsModule (ref)
		local measureUVBound = p2.aqsSummaryData.Measure_UV_Bound
		
		if measureUVBound == nil then
			if getFFlagUGCValidateAQMeshQualityBlockUploadModule() then
				error("Measure_UV_Bound: AQS summary data is nil")
				
				return
			end
			p1:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_UV_Bound" })
			
			return
		else
			for i, v in measureUVBound do
				if i ~= "measurement_score" then
					if v ~= nil and v.score ~= nil then
						if tonumber(v.score) ~= 100 then
							local t = {
								partName = i,
								uv_outside_bound_vert_percent = string.format("%.2f", (tonumber(v.uv_outside_bound_vert_percent) or 0) * 100),
								score = tostring(math.floor(tonumber(v.score) or 0))
							}
							
							if getFFlagUGCValidateAQMeshQualityBlockUploadModule() then
								p1:fail(errorSourceStringsModule.Keys.AQSWarn_UVBound, t)
							else
								p1:warn(errorSourceStringsModule.Keys.AQSWarn_UVBound, t)
							end
						end
					end
					p1:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_UV_Bound" })
					
					return
				end
			end
		end
	end
}