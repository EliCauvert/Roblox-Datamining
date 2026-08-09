local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local _ = require(script.Parent.PlaceMediaStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p0, p1) --[[ line: 18 | named "mediaUrl" ]]
	return ("%s/v1/places/%d/media"):format(p0, p1)
end

return {
	fetchMedia = function(p2, p3) --[[ line: 24 ]]
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p3 = p3 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "place-media.get",
			legacy = true,
			network = p3.network,
			url = ("%s/v1/places/%d/media"):format(p3.baseUrl or urlBase.new("develop"), p2),
			decode = function(p4) --[[ line: 33 ]]
				return p4
			end
		}))
	end
}