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
		local MeasureDegenTriangles = p2.aqsSummaryData.Measure_Degen_Triangles
		
		if MeasureDegenTriangles == nil then
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Degen_Triangles" })
			
			return
		end
		for PartName, measureDegenTriangle in MeasureDegenTriangles do
			if PartName ~= "measurement_score" then
				if measureDegenTriangle == nil or measureDegenTriangle.score == nil then
					p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Degen_Triangles" })
					break
				end
				if tonumber(measureDegenTriangle.score) ~= 100 then
					p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_DegenTriangles, {
						partName = PartName,
						degenerate_triangle_percent = string.format("%.2f", (tonumber(measureDegenTriangle.degenerate_triangle_percent) or 0) * 100),
						score = tostring((math.floor(tonumber(measureDegenTriangle.score) or 0)))
					})
				end
			end
		end
	end
}