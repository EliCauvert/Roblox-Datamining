local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateAQMeshQualityBlockUploadModule = require(Parent.flags.getFFlagUGCValidateAQMeshQualityBlockUpload)
local config = {
	[ValidationEnumsModule.UploadCategory.FULL_BODY] = true,
	[ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD] = true
}
local UGCValidationTriangleIntersectionMaxPercent = game:DefineFastInt("UGCValidationTriangleIntersectionMaxPercent", 20)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.FULL_BODY,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQMeshQuality),
	run = function(p1, p2)
		-- upvalues: GetFFlagUGCValidateAQMeshQualityBlockUploadModule (copy), config (copy), ErrorSourceStringsModule (copy), UGCValidationTriangleIntersectionMaxPercent (copy)
		local MeasureTriangleIntersection = p2.aqsSummaryData.Measure_Triangle_Intersection
		local Entry = GetFFlagUGCValidateAQMeshQualityBlockUploadModule() and config[p2.uploadCategory]
		
		if MeasureTriangleIntersection ~= nil then
			local UGCValidationTriangleIntersectionMaxPercentRatio = UGCValidationTriangleIntersectionMaxPercent / 100
			
			for PartName, value in MeasureTriangleIntersection do
				if PartName ~= "measurement_score" then
					if value == nil or value.intersecting_tri_face_percent == nil then
						p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Triangle_Intersection" })
						break
					end
					local Number: number = tonumber(value.intersecting_tri_face_percent) or 0
					
					if UGCValidationTriangleIntersectionMaxPercentRatio < Number then
						local config1 = {
							partName = PartName,
							intersecting_tri_face_percent = string.format("%.2f", Number * 100),
							threshold = tostring(UGCValidationTriangleIntersectionMaxPercent)
						}
						
						if Entry then
							p1:fail(ErrorSourceStringsModule.Keys.AQSWarn_TriangleIntersection, config1)
						else
							p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_TriangleIntersection, config1)
						end
					end
				end
			end
			return
		elseif Entry then
			error("Measure_Triangle_Intersection: AQS summary data is nil")
			
			return
		else
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Triangle_Intersection" })
		end
	end
}