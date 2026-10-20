local Parent = script:FindFirstAncestor("GameIconRodux").Parent
local IXPServiceWrapper = require(Parent.IxpServiceWrapper).IXPServiceWrapper
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local FFlagGetGameIconsFromThumbnailsDeliveryApiIxp = require(Parent.SharedFlags).FFlagGetGameIconsFromThumbnailsDeliveryApiIxp
local FFlagForceGetGameIconsFromThumbnailsDeliveryApi = require(Parent.SharedFlags).FFlagForceGetGameIconsFromThumbnailsDeliveryApi
local Url = require(Parent.Http).Url

return function(Callback, List, Size)
	-- upvalues: Url (copy), FFlagForceGetGameIconsFromThumbnailsDeliveryApi (copy), FFlagGetGameIconsFromThumbnailsDeliveryApiIxp (copy), IXPServiceWrapper (copy), AppUserLayers (copy)
	local QueryString = Url:makeQueryString({
		format = "png",
		universeIds = table.concat(List, ","),
		size = Size
	})
	local THUMBNAILSURL = Url.THUMBNAILS_URL
	
	if FFlagForceGetGameIconsFromThumbnailsDeliveryApi then
		THUMBNAILSURL = Url.THUMBNAILSDELIVERY_URL
	elseif FFlagGetGameIconsFromThumbnailsDeliveryApiIxp then
		local LayerData = IXPServiceWrapper:GetLayerData(AppUserLayers.ServeThumbnailsFromEdge)
		
		if LayerData and LayerData.get_gamesicons_from_edge then
			THUMBNAILSURL = Url.THUMBNAILSDELIVERY_URL
		end
	end
	return Callback(string.format("%sv1/games/icons?%s", THUMBNAILSURL, QueryString), "GET")
end