local ValidateAccurateBoundingBoxRasterMethodModule = require(script.Parent.Parent.validation.validateAccurateBoundingBoxRasterMethod)

return {
	getBoundsViewsForAssetType = function(p1)
		-- upvalues: ValidateAccurateBoundingBoxRasterMethodModule (copy)
		return ValidateAccurateBoundingBoxRasterMethodModule.getBoundsViewsForAssetType(p1)
	end,
	validate = function(p1, p2, p3)
		-- upvalues: ValidateAccurateBoundingBoxRasterMethodModule (copy)
		return ValidateAccurateBoundingBoxRasterMethodModule.validate(p1, p2, p3)
	end
}