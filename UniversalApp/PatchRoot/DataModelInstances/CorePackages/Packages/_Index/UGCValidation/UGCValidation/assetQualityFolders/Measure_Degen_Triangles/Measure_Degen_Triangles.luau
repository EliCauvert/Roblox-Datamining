local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateAQMeshQualityBlockUploadModule = require(Parent.flags.getFFlagUGCValidateAQMeshQualityBlockUpload)
local config = {
	[ValidationEnumsModule.UploadCategory.FULL_BODY] = true,
	[ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD] = true
}

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.FULL_BODY,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQMeshQuality),
	run = function(p1, p2) --[[ Line: 23 ]]
		-- upvalues: GetFFlagUGCValidateAQMeshQualityBlockUploadModule (copy), config (copy), ErrorSourceStringsModule (copy)
		local MeasureDegenTriangles = p2.aqsSummaryData.Measure_Degen_Triangles
		local Entry = GetFFlagUGCValidateAQMeshQualityBlockUploadModule() and config[p2.uploadCategory]
		
		if MeasureDegenTriangles ~= nil then
			for PartName, measureDegenTriangle in MeasureDegenTriangles do
				if PartName ~= "measurement_score" then
					if measureDegenTriangle == nil or measureDegenTriangle.score == nil then
						p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Degen_Triangles" })
						break
					end
					if tonumber(measureDegenTriangle.score) ~= 100 then
						local config1 = {
							partName = PartName,
							degenerate_triangle_percent = string.format("%.2f", (tonumber(measureDegenTriangle.degenerate_triangle_percent) or 0) * 100)
						}
						
						if Entry then
							p1:fail(ErrorSourceStringsModule.Keys.AQSWarn_DegenTriangles, config1)
						else
							p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_DegenTriangles, config1)
						end
					end
				end
			end
			return
		elseif Entry then
			error("Measure_Degen_Triangles: AQS summary data is nil")
			
			return
		else
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Degen_Triangles" })
		end
	end
}