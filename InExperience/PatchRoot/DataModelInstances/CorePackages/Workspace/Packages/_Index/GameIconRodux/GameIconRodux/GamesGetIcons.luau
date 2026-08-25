local parent = script:FindFirstAncestor("GameIconRodux").Parent
local IXPServiceWrapper = require(parent.IxpServiceWrapper).IXPServiceWrapper
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local fFlagGetGameIconsFromThumbnailsDeliveryApiIxp = require(parent.SharedFlags).FFlagGetGameIconsFromThumbnailsDeliveryApiIxp
local fFlagForceGetGameIconsFromThumbnailsDeliveryApi = require(parent.SharedFlags).FFlagForceGetGameIconsFromThumbnailsDeliveryApi
local url = require(parent.Http).Url

return function(p0, p1, p2)
	-- upvalues: url (ref), fFlagForceGetGameIconsFromThumbnailsDeliveryApi (ref), fFlagGetGameIconsFromThumbnailsDeliveryApiIxp (ref), IXPServiceWrapper (ref), appUserLayers (ref)
	local var0 = url:makeQueryString({
		format = "png",
		universeIds = table.concat(p1, ","),
		size = p2
	})
	local THUMBNAILS_URL = url.THUMBNAILS_URL
	
	if fFlagForceGetGameIconsFromThumbnailsDeliveryApi then
		THUMBNAILS_URL = url.THUMBNAILSDELIVERY_URL
	elseif fFlagGetGameIconsFromThumbnailsDeliveryApiIxp then
		local serveThumbnailsFromEdgeLayerData = IXPServiceWrapper:GetLayerData(appUserLayers.ServeThumbnailsFromEdge)
		
		if serveThumbnailsFromEdgeLayerData and serveThumbnailsFromEdgeLayerData.get_gamesicons_from_edge then
			THUMBNAILS_URL = url.THUMBNAILSDELIVERY_URL
		end
	end
	return p0(string.format("%sv1/games/icons?%s", THUMBNAILS_URL, var0), "GET")
end