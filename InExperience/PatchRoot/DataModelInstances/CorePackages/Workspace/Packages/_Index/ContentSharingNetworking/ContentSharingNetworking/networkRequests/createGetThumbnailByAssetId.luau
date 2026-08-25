local THUMBNAILS_URL = require(script.Parent.Parent.Parent.Http).Url.THUMBNAILS_URL

return function(p0)
	-- upvalues: THUMBNAILS_URL (ref)
	return p0.roduxNetworking.POST("GetThumbnailByAssetId", function(p1, p2)
		-- upvalues: THUMBNAILS_URL (copy)
		return p1(THUMBNAILS_URL):path("v1"):path("batch"):body({
			{
				targetId = p2.assetId,
				type = p2.assetType,
				size = p2.size
			}
		})
	end)
end