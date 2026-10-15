local gifting = script:FindFirstAncestor("Gifting")
local prepareGiftResponseModelModule = require(gifting.Models.PrepareGiftResponseModel)
local fetchGiftingModule = require(gifting.WebApi.fetchGifting)
local urlsModule = require(gifting.WebApi.Urls)
local _ = require(gifting.Types)

return function(p1, p2)
	-- upvalues: fetchGiftingModule (ref), urlsModule (ref), prepareGiftResponseModelModule (ref)
	return fetchGiftingModule({
		method = "POST",
		analyticsKey = "gifting.prepare",
		network = p2,
		url = urlsModule.prepare(),
		body = p1,
		decode = prepareGiftResponseModelModule.format
	})
end