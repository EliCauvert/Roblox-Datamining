local Parent = script:FindFirstAncestor("DataHydration").Parent
local Url = require(Parent.Http).Url
local HttpClientModule = require(Parent.HttpClient)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local IXPServiceWrapper = require(Parent.IxpServiceWrapper).IXPServiceWrapper
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local GameIconConstantsModule = require(script.Parent.GameIconConstants)
local SizeStringFunction = GameIconConstantsModule.sizeString
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagGetGameIconsFromThumbnailsDeliveryApiIxp = SharedFlagsModule.FFlagGetGameIconsFromThumbnailsDeliveryApiIxp
local FFlagForceGetGameIconsFromThumbnailsDeliveryApi = SharedFlagsModule.FFlagForceGetGameIconsFromThumbnailsDeliveryApi
local FIntGameIconSmallSizePx = GameIconConstantsModule.FIntGameIconSmallSizePx

local function _()
	-- upvalues: FFlagForceGetGameIconsFromThumbnailsDeliveryApi (copy), Url (copy), FFlagGetGameIconsFromThumbnailsDeliveryApiIxp (copy), IXPServiceWrapper (copy), AppUserLayers (copy)
	if FFlagForceGetGameIconsFromThumbnailsDeliveryApi then
		return Url.THUMBNAILSDELIVERY_URL
	end
	if FFlagGetGameIconsFromThumbnailsDeliveryApiIxp then
		local LayerData = IXPServiceWrapper:GetLayerData(AppUserLayers.ServeThumbnailsFromEdge)
		
		if LayerData and LayerData.get_gamesicons_from_edge then
			return Url.THUMBNAILSDELIVERY_URL
		end
	end
	return Url.THUMBNAILS_URL
end

return function(List, p1, p2)
	-- upvalues: UrlBuilder (copy), FFlagForceGetGameIconsFromThumbnailsDeliveryApi (copy), Url (copy), FFlagGetGameIconsFromThumbnailsDeliveryApiIxp (copy), IXPServiceWrapper (copy), AppUserLayers (copy), SizeStringFunction (copy), FIntGameIconSmallSizePx (copy), FetchFunction (copy), AsPromiseFunction (copy)
	local P1 = p2 or {}
	local AddQueryStringFunction = UrlBuilder.addQueryString
	local FormatFunction = string.format
	local v1 = "%sv1/games/icons"
	local THUMBNAILSDELIVERYURL = nil
	repeat
		if FFlagForceGetGameIconsFromThumbnailsDeliveryApi then
			THUMBNAILSDELIVERYURL = Url.THUMBNAILSDELIVERY_URL
			break
		end
		if FFlagGetGameIconsFromThumbnailsDeliveryApiIxp then
			local LayerData = IXPServiceWrapper:GetLayerData(AppUserLayers.ServeThumbnailsFromEdge)
			
			if LayerData and LayerData.get_gamesicons_from_edge then
				THUMBNAILSDELIVERYURL = Url.THUMBNAILSDELIVERY_URL
				break
			end
		end
		THUMBNAILSDELIVERYURL = Url.THUMBNAILS_URL
	until true
	return AsPromiseFunction((FetchFunction({
		method = "GET",
		analyticsKey = "games-icons.get",
		network = P1.network,
		url = AddQueryStringFunction(FormatFunction(v1, THUMBNAILSDELIVERYURL), {
			format = "png",
			universeIds = table.concat(List, ","),
			size = p1 or SizeStringFunction(FIntGameIconSmallSizePx)
		}),
		decode = function(p3)
			return p3.data or {}
		end
	})))
end