local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local _ = require(script.Parent.ShareLinkMetadataStoreTypes)

local function _(p1)
	return if p1 == nil then nil else tostring(p1)
end

return function(p1, p2, p3)
	-- upvalues: httpClientModule (ref), urlBase (ref), httpService (ref)
	p3 = p3 or {}
	
	return httpClientModule.asPromise(httpClientModule.fetch({
		method = "POST",
		analyticsKey = "share-link-metadata.get",
		network = p3.network,
		url = (p3.baseUrl or urlBase.APIS) .. "/sharelinks/v1/get-metadata",
		body = { linkId = p1, linkType = p2 },
		decode = function(p4)
			-- upvalues: httpService (copy)
			if p4.data == nil then
				error("Share link metadata response is missing data")
			end
			local data = httpService:JSONDecode(p4.data)
			local t = {}
			local universeId = data.universeId
			t.universeId = if universeId == nil then nil else tostring(universeId)
			local placeId = data.placeId
			t.placeId = if placeId == nil then nil else tostring(placeId)
			
			return t
		end
	}))
end