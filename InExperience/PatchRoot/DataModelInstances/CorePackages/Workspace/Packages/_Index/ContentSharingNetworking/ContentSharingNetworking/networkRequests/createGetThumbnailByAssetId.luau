local THUMBNAILS_URL = require(script.Parent.Parent.Parent.Http).Url.THUMBNAILS_URL

return function(p1)
	-- upvalues: THUMBNAILS_URL (ref)
	return p1.roduxNetworking.POST("GetThumbnailByAssetId", function(p2, p3)
		-- upvalues: THUMBNAILS_URL (copy)
		return p2(THUMBNAILS_URL):path("v1"):path("batch"):body({
			{
				targetId = p3.assetId,
				type = p3.assetType,
				size = p3.size
			}
		})
	end)
end