return {
	mock = function(p0)
		return {
			assetTypeId = -1,
			assetType = "Image",
			videoHash = nil,
			videoTitle = nil,
			approved = true,
			altText = "Alt Text",
			imageId = p0 or 123456789
		}
	end
}