local gifting = script:FindFirstAncestor("Gifting")
local findRecipientsResponseModelModule = require(gifting.Models.FindRecipientsResponseModel)
local fetchGiftingModule = require(gifting.WebApi.fetchGifting)
local urlsModule = require(gifting.WebApi.Urls)
local _ = require(gifting.Types)

return function(p1, p2)
	-- upvalues: fetchGiftingModule (ref), urlsModule (ref), findRecipientsResponseModelModule (ref)
	return fetchGiftingModule({
		method = "POST",
		analyticsKey = "gifting.find-recipients",
		network = p2,
		url = urlsModule.findRecipients(),
		body = p1,
		decode = findRecipientsResponseModelModule.format
	})
end