-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:37 2026 Pacific Standard Time.

local validateAccurateBoundingBoxRasterMethodModule = require(script.Parent.Parent.validation.validateAccurateBoundingBoxRasterMethod)

return {
	getBoundsViewsForAssetType = function(value) --[[ line: 22 ]]
		-- upvalues: validateAccurateBoundingBoxRasterMethodModule (ref)
		return validateAccurateBoundingBoxRasterMethodModule.getBoundsViewsForAssetType(value)
	end,
	validate = function(p0, p1, p2) --[[ line: 26 ]]
		-- upvalues: validateAccurateBoundingBoxRasterMethodModule (ref)
		return validateAccurateBoundingBoxRasterMethodModule.validate(p0, p1, p2)
	end
}