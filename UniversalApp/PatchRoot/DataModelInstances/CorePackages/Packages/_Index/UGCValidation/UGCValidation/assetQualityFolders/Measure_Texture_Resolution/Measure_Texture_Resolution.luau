local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.FULL_BODY,
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH,
		ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQTextureQuality),
	run = function(p1, p2) --[[ Line: 17 ]]
		-- upvalues: ErrorSourceStringsModule (copy)
		local MeasureTextureResolution = p2.aqsSummaryData.Measure_Texture_Resolution
		
		if MeasureTextureResolution == nil then
			p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Texture_Resolution" })
			
			return
		end
		for TextureName, value in MeasureTextureResolution do
			if TextureName ~= "measurement_score" then
				if value == nil or value.score == nil then
					p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Texture_Resolution" })
					break
				end
				if tonumber(value.score) ~= 100 then
					p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_TextureResolution, {
						textureName = TextureName,
						texture_width = value.texture_width or "unknown",
						texture_height = value.texture_height or "unknown"
					})
				end
			end
		end
	end
}