local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local _ = require(script.Parent.PlaceMediaStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p1, p2)
	return ("%s/v1/places/%d/media"):format(p1, p2)
end

return {
	fetchMedia = function(p1, p2)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p2 = p2 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "place-media.get",
			legacy = true,
			network = p2.network,
			url = ("%s/v1/places/%d/media"):format(p2.baseUrl or urlBase.new("develop"), p1),
			decode = function(p3)
				return p3
			end
		}))
	end
}