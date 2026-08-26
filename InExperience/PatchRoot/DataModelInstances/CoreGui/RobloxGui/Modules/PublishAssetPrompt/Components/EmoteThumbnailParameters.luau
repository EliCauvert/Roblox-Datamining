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
	encodeAsATable = function(p1)
		return {
			ThumbnailBundleId = 515,
			ThumbnailCharacterRotation = p1.thumbnailCharacterRotation,
			ThumbnailHorizontalOffset = p1.thumbnailHorizontalOffset,
			ThumbnailVerticalOffset = p1.thumbnailVerticalOffset,
			ThumbnailZoom = p1.thumbnailZoom,
			ThumbnailKeyframe = p1.thumbnailKeyframe,
			ThumbnailTime = p1.thumbnailTime
		}
	end
}