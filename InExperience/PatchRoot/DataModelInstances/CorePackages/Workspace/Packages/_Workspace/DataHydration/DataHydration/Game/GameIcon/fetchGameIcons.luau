local parent = script:FindFirstAncestor("DataHydration").Parent
local url = require(parent.Http).Url
local httpClientModule = require(parent.HttpClient)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local IXPServiceWrapper = require(parent.IxpServiceWrapper).IXPServiceWrapper
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local gameIconConstantsModule = require(script.Parent.GameIconConstants)
local sizeString = gameIconConstantsModule.sizeString
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagGetGameIconsFromThumbnailsDeliveryApiIxp = sharedFlagsModule.FFlagGetGameIconsFromThumbnailsDeliveryApiIxp
local fFlagForceGetGameIconsFromThumbnailsDeliveryApi = sharedFlagsModule.FFlagForceGetGameIconsFromThumbnailsDeliveryApi
local fIntGameIconSmallSizePx = gameIconConstantsModule.FIntGameIconSmallSizePx

local function _()
	-- upvalues: fFlagForceGetGameIconsFromThumbnailsDeliveryApi (ref), url (ref), fFlagGetGameIconsFromThumbnailsDeliveryApiIxp (ref), IXPServiceWrapper (ref), appUserLayers (ref)
	if fFlagForceGetGameIconsFromThumbnailsDeliveryApi then
		return url.THUMBNAILSDELIVERY_URL
	elseif fFlagGetGameIconsFromThumbnailsDeliveryApiIxp then
		local serveThumbnailsFromEdgeLayerData = IXPServiceWrapper:GetLayerData(appUserLayers.ServeThumbnailsFromEdge)
		
		return if serveThumbnailsFromEdgeLayerData and serveThumbnailsFromEdgeLayerData.get_gamesicons_from_edge then url.THUMBNAILSDELIVERY_URL else url.THUMBNAILS_URL
	end
end

return function(p0, p1, p2)
	-- upvalues: urlBuilder (ref), fFlagForceGetGameIconsFromThumbnailsDeliveryApi (ref), url (ref), fFlagGetGameIconsFromThumbnailsDeliveryApiIxp (ref), IXPServiceWrapper (ref), appUserLayers (ref), sizeString (ref), fIntGameIconSmallSizePx (ref), fetch (ref), asPromise (ref)
	local var7
	p2 = p2 or {}
	local addQueryString = urlBuilder.addQueryString
	local format = string.format
	local var5 = "%sv1/games/icons"
	
	if fFlagForceGetGameIconsFromThumbnailsDeliveryApi then
		var7 = url.THUMBNAILSDELIVERY_URL
	elseif fFlagGetGameIconsFromThumbnailsDeliveryApiIxp then
		local serveThumbnailsFromEdgeLayerData = IXPServiceWrapper:GetLayerData(appUserLayers.ServeThumbnailsFromEdge)
		var7 = if serveThumbnailsFromEdgeLayerData and serveThumbnailsFromEdgeLayerData.get_gamesicons_from_edge then url.THUMBNAILSDELIVERY_URL else url.THUMBNAILS_URL
	end
	return asPromise(fetch({
		method = "GET",
		analyticsKey = "games-icons.get",
		network = p2.network,
		url = addQueryString(format(var5, var7), {
			format = "png",
			universeIds = table.concat(p0, ","),
			size = p1 or sizeString(fIntGameIconSmallSizePx)
		}),
		decode = function(p3)
			return p3.data or {}
		end
	}))
end