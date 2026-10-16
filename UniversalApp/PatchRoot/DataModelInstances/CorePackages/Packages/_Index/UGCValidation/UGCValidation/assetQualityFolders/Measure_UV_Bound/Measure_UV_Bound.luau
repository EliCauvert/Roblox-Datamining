local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateAQMeshQualityBlockUploadModule = require(Parent.flags.getFFlagUGCValidateAQMeshQualityBlockUpload)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.FULL_BODY,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQMeshQuality),
	run = function(p1, p2) --[[ Line: 18 ]]
		-- upvalues: GetFFlagUGCValidateAQMeshQualityBlockUploadModule (copy), ErrorSourceStringsModule (copy)
		local MeasureUVBound = p2.aqsSummaryData.Measure_UV_Bound
		
		if MeasureUVBound ~= nil then
			for PartName, value in MeasureUVBound do
				if PartName ~= "measurement_score" then
					if value == nil or value.score == nil then
						p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_UV_Bound" })
						break
					end
					if tonumber(value.score) ~= 100 then
						local config = {
							partName = PartName,
							uv_outside_bound_vert_percent = string.format("%.2f", (tonumber(value.uv_outside_bound_vert_percent) or 0) * 100)
						}
						
						if GetFFlagUGCValidateAQMeshQualityBlockUploadModule() then
							p1:fail(ErrorSourceStringsModule.Keys.AQSWarn_UVBound, config)
						else
							p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_UVBound, config)
						end
					end
				end
			end
			return
		elseif GetFFlagUGCValidateAQMeshQualityBlockUploadModule() then
			error("Measure_UV_Bound: AQS summary data is nil")
			
			return
		else
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_UV_Bound" })
		end
	end
}