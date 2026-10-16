local Gifting = script:FindFirstAncestor("Gifting")
local FindRecipientsResponseModelModule = require(Gifting.Models.FindRecipientsResponseModel)
local FetchGiftingModule = require(Gifting.WebApi.fetchGifting)
local UrlsModule = require(Gifting.WebApi.Urls)
local _ = require(Gifting.Types)

return function(Body, Network) --[[ Line: 24 | Named "postFindRecipients" ]]
	-- upvalues: FetchGiftingModule (copy), UrlsModule (copy), FindRecipientsResponseModelModule (copy)
	return FetchGiftingModule({
		method = "POST",
		analyticsKey = "gifting.find-recipients",
		network = Network,
		url = UrlsModule.findRecipients(),
		body = Body,
		decode = FindRecipientsResponseModelModule.format
	})
end