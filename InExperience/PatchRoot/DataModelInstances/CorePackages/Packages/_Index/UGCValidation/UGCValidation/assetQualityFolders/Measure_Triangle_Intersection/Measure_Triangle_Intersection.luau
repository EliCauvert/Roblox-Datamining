local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local UGCValidationTriangleIntersectionMaxPercent = game:DefineFastInt("UGCValidationTriangleIntersectionMaxPercent", 20)

return {
	categories = {
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.FULL_BODY,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(parent.flags.getFFlagUGCValidateAQMeshQuality),
	run = function(p0, p1) --[[ line: 18 ]]
		-- upvalues: errorSourceStringsModule (ref), UGCValidationTriangleIntersectionMaxPercent (ref)
		local measureTriangleIntersection = p1.aqsSummaryData.Measure_Triangle_Intersection
		
		if measureTriangleIntersection == nil then
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Triangle_Intersection" })
			
			return
		end
		local var3 = UGCValidationTriangleIntersectionMaxPercent / 100
		
		for i, v in measureTriangleIntersection do
			if i ~= "measurement_score" then
				if v ~= nil and v.intersecting_tri_face_percent ~= nil then
					local intersectingTriFacePercent = tonumber(v.intersecting_tri_face_percent) or 0
					
					if var3 < intersectingTriFacePercent then
						p0:warn(errorSourceStringsModule.Keys.AQSWarn_TriangleIntersection, {
							partName = i,
							intersecting_tri_face_percent = string.format("%.2f", intersectingTriFacePercent * 100),
							threshold = tostring(UGCValidationTriangleIntersectionMaxPercent)
						})
					end
				end
				p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Triangle_Intersection" })
				
				return
			end
		end
	end
}