-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:32 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	categories = {
		validationEnumsModule.UploadCategory.FULL_BODY,
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	fflag = require(parent.flags.getFFlagUGCValidateAQTextureQuality),
	run = function(p0, p1) --[[ line: 16 ]]
		-- upvalues: errorSourceStringsModule (ref)
		local measureTextureResolution = p1.aqsSummaryData.Measure_Texture_Resolution
		
		if measureTextureResolution == nil then
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Texture_Resolution" })
			
			return
		end
		for i, v in measureTextureResolution do
			if i ~= "measurement_score" then
				if v ~= nil and v.score ~= nil then
					if tonumber(v.score) ~= 100 then
						p0:warn(errorSourceStringsModule.Keys.AQSWarn_TextureResolution, {
							textureName = i,
							texture_width = v.texture_width or "unknown",
							texture_height = v.texture_height or "unknown",
							score = tostring(math.floor(tonumber(v.score) or 0))
						})
					end
				end
				p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Texture_Resolution" })
				
				return
			end
		end
	end
}