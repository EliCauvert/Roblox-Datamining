local validateAccurateBoundingBoxRasterMethodModule = require(script.Parent.Parent.validation.validateAccurateBoundingBoxRasterMethod)

return {
	getBoundsViewsForAssetType = function(value)
		-- upvalues: validateAccurateBoundingBoxRasterMethodModule (ref)
		return validateAccurateBoundingBoxRasterMethodModule.getBoundsViewsForAssetType(value)
	end,
	validate = function(p1, p2, p3)
		-- upvalues: validateAccurateBoundingBoxRasterMethodModule (ref)
		return validateAccurateBoundingBoxRasterMethodModule.validate(p1, p2, p3)
	end
}