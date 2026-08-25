local tModule = require(game:GetService("CorePackages").Packages.t)

return {
	validate = tModule.strictInterface({
		thumbnailKeyframe = tModule.number,
		thumbnailTime = tModule.number,
		thumbnailZoom = tModule.number,
		thumbnailVerticalOffset = tModule.number,
		thumbnailHorizontalOffset = tModule.number,
		thumbnailCharacterRotation = tModule.number
	}),
	defaultParameters = {
		thumbnailKeyframe = 1,
		thumbnailTime = 0,
		thumbnailZoom = 1,
		thumbnailVerticalOffset = 0,
		thumbnailHorizontalOffset = 0,
		thumbnailCharacterRotation = 0
	},
	encodeAsATable = function(p0)
		return {
			ThumbnailBundleId = 515,
			ThumbnailCharacterRotation = p0.thumbnailCharacterRotation,
			ThumbnailHorizontalOffset = p0.thumbnailHorizontalOffset,
			ThumbnailVerticalOffset = p0.thumbnailVerticalOffset,
			ThumbnailZoom = p0.thumbnailZoom,
			ThumbnailKeyframe = p0.thumbnailKeyframe,
			ThumbnailTime = p0.thumbnailTime
		}
	end
}