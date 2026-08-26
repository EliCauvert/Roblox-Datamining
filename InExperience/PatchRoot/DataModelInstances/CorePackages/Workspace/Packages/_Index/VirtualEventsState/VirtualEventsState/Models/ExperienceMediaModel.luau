return {
	mock = function(p1)
		return {
			assetTypeId = -1,
			assetType = "Image",
			videoHash = nil,
			videoTitle = nil,
			approved = true,
			altText = "Alt Text",
			imageId = p1 or 123456789
		}
	end
}