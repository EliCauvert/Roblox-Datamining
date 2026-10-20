local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local _ = require(script.Parent.ShareLinkMetadataStoreTypes)

local function _(p1)
	return if p1 == nil then nil else tostring(p1)
end

return function(LinkId, LinkType, p1)
	-- upvalues: HttpClientModule (copy), UrlBase (copy), HttpService (copy)
	local P3 = p1 or {}
	
	return HttpClientModule.asPromise((HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "share-link-metadata.get",
		network = P3.network,
		url = (P3.baseUrl or UrlBase.APIS) .. "/sharelinks/v1/get-metadata",
		body = { linkId = LinkId, linkType = LinkType },
		decode = function(p2)
			-- upvalues: HttpService (upval)
			if p2.data == nil then
				error("Share link metadata response is missing data")
			end
			local Data = HttpService:JSONDecode(p2.data)
			local UniverseId = Data.universeId
			local Text = if UniverseId == nil then nil else tostring(UniverseId)
			local PlaceId = Data.placeId
			
			return {
				universeId = Text,
				placeId = if PlaceId == nil then nil else tostring(PlaceId)
			}
		end
	})))
end