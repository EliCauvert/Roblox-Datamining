local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local _ = require(script.Parent.PlaceMediaStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function _(p1, p2): string
	return ("%s/v1/places/%d/media"):format(p1, p2)
end

return {
	fetchMedia = function(p1, p2)
		-- upvalues: UrlBase (copy), FetchFunction (copy), AsPromiseFunction (copy)
		local P3 = p2 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "place-media.get",
			legacy = true,
			network = P3.network,
			url = ("%s/v1/places/%d/media"):format(P3.baseUrl or UrlBase.new("develop"), p1),
			decode = function(p3)
				return p3
			end
		})))
	end
}