local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.FULL_BODY,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQMeshQuality),
	run = function(p1, p2)
		-- upvalues: ErrorSourceStringsModule (copy)
		local MeasureTriangleIntersection = p2.aqsSummaryData.Measure_Triangle_Intersection
		
		if MeasureTriangleIntersection == nil then
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Triangle_Intersection" })
			
			return
		end
		for PartName, value in MeasureTriangleIntersection do
			if PartName ~= "measurement_score" then
				if value == nil or value.score == nil then
					p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Triangle_Intersection" })
					break
				end
				if tonumber(value.score) ~= 100 then
					p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_TriangleIntersection, {
						partName = PartName,
						intersecting_tri_face_percent = string.format("%.2f", (tonumber(value.intersecting_tri_face_percent) or 0) * 100),
						score = tostring((math.floor(tonumber(value.score) or 0)))
					})
				end
			end
		end
	end
}