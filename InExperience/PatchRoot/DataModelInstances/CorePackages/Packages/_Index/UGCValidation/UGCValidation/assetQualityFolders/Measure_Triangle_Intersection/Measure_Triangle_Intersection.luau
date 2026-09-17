local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateAQMeshQualityBlockUploadModule = require(parent.flags.getFFlagUGCValidateAQMeshQualityBlockUpload)
local t = {
	[validationEnumsModule.UploadCategory.FULL_BODY] = true,
	[validationEnumsModule.UploadCategory.DYNAMIC_HEAD] = true
}
local UGCValidationTriangleIntersectionMaxPercent = game:DefineFastInt("UGCValidationTriangleIntersectionMaxPercent", 20)

return {
	categories = {
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.FULL_BODY,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(parent.flags.getFFlagUGCValidateAQMeshQuality),
	run = function(p1, p2)
		-- upvalues: getFFlagUGCValidateAQMeshQualityBlockUploadModule (ref), t (ref), errorSourceStringsModule (ref), UGCValidationTriangleIntersectionMaxPercent (ref)
		local measureTriangleIntersection = p2.aqsSummaryData.Measure_Triangle_Intersection
		local uploadCategory = getFFlagUGCValidateAQMeshQualityBlockUploadModule() and t[p2.uploadCategory]
		
		if measureTriangleIntersection == nil then
			if uploadCategory then
				error("Measure_Triangle_Intersection: AQS summary data is nil")
				
				return
			end
			p1:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Triangle_Intersection" })
			
			return
		else
			local var1 = UGCValidationTriangleIntersectionMaxPercent / 100
			
			for i, v in measureTriangleIntersection do
				if i ~= "measurement_score" then
					if v ~= nil and v.intersecting_tri_face_percent ~= nil then
						local intersectingTriFacePercent = tonumber(v.intersecting_tri_face_percent) or 0
						
						if var1 < intersectingTriFacePercent then
							local t_1 = {
								partName = i,
								intersecting_tri_face_percent = string.format("%.2f", intersectingTriFacePercent * 100),
								threshold = tostring(UGCValidationTriangleIntersectionMaxPercent)
							}
							
							if uploadCategory then
								p1:fail(errorSourceStringsModule.Keys.AQSWarn_TriangleIntersection, t_1)
							else
								p1:warn(errorSourceStringsModule.Keys.AQSWarn_TriangleIntersection, t_1)
							end
						end
					end
					p1:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Triangle_Intersection" })
					
					return
				end
			end
		end
	end
}