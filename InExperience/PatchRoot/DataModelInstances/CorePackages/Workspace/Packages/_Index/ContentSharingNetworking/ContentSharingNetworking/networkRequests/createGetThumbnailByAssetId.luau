local THUMBNAILSURL = require(script.Parent.Parent.Parent.Http).Url.THUMBNAILS_URL

return function(p1) --[[ Line: 15 ]]
	-- upvalues: THUMBNAILSURL (copy)
	return p1.roduxNetworking.POST("GetThumbnailByAssetId", function(Callback, p2) --[[ Line: 18 ]]
		-- upvalues: THUMBNAILSURL (upval)
		return Callback(THUMBNAILSURL):path("v1"):path("batch"):body({
			{
				targetId = p2.assetId,
				type = p2.assetType,
				size = p2.size
			}
		})
	end)
end