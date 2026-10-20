local Gifting = script:FindFirstAncestor("Gifting")
local FetchGiftingModule = require(Gifting.WebApi.fetchGifting)
local UrlsModule = require(Gifting.WebApi.Urls)
local _ = require(Gifting.Types)

return function(Body, Network)
	-- upvalues: FetchGiftingModule (copy), UrlsModule (copy)
	return FetchGiftingModule({
		method = "POST",
		analyticsKey = "gifting.purchase",
		network = Network,
		url = UrlsModule.purchase(),
		body = Body,
		decode = function()
			return {}
		end
	})
end