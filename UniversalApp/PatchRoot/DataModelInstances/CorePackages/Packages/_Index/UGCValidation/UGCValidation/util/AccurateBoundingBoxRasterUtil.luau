local validateAccurateBoundingBoxRasterMethodModule = require(script.Parent.Parent.validation.validateAccurateBoundingBoxRasterMethod)

return {
	getBoundsViewsForAssetType = function(value)
		-- upvalues: validateAccurateBoundingBoxRasterMethodModule (ref)
		return validateAccurateBoundingBoxRasterMethodModule.getBoundsViewsForAssetType(value)
	end,
	validate = function(p0, p1, p2)
		-- upvalues: validateAccurateBoundingBoxRasterMethodModule (ref)
		return validateAccurateBoundingBoxRasterMethodModule.validate(p0, p1, p2)
	end
}