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
		local measureTextureComplexity = p1.aqsSummaryData.Measure_Texture_Complexity
		
		if measureTextureComplexity == nil then
			p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Texture_Complexity" })
			
			return
		end
		for i, v in measureTextureComplexity do
			if i ~= "measurement_score" then
				if v ~= nil and v.score ~= nil then
					if tonumber(v.score) ~= 100 then
						p0:warn(errorSourceStringsModule.Keys.AQSWarn_TextureComplexity, {
							textureName = i,
							score = tostring(math.floor(tonumber(v.score) or 0))
						})
					end
				end
				p0:warn(errorSourceStringsModule.Keys.AQSWarn_MissingData, { measureName = "Measure_Texture_Complexity" })
				
				return
			end
		end
	end
}