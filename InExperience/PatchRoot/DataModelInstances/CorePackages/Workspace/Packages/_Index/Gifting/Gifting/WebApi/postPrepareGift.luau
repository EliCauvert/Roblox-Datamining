local Gifting = script:FindFirstAncestor("Gifting")
local PrepareGiftResponseModelModule = require(Gifting.Models.PrepareGiftResponseModel)
local FetchGiftingModule = require(Gifting.WebApi.fetchGifting)
local UrlsModule = require(Gifting.WebApi.Urls)
local _ = require(Gifting.Types)

return function(Body, Network)
	-- upvalues: FetchGiftingModule (copy), UrlsModule (copy), PrepareGiftResponseModelModule (copy)
	return FetchGiftingModule({
		method = "POST",
		analyticsKey = "gifting.prepare",
		network = Network,
		url = UrlsModule.prepare(),
		body = Body,
		decode = PrepareGiftResponseModelModule.format
	})
end