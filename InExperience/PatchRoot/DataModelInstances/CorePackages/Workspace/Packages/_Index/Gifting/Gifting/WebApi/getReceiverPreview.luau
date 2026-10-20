local Gifting = script:FindFirstAncestor("Gifting")
local PromiseModule = require(Gifting.Parent.Promise)
local GiftErrorModelModule = require(Gifting.Models.GiftErrorModel)
local GiftModelUtilsModule = require(Gifting.Models.GiftModelUtils)
local ReceiverPreviewResponseModelModule = require(Gifting.Models.ReceiverPreviewResponseModel)
local FetchGiftingModule = require(Gifting.WebApi.fetchGifting)
local UrlsModule = require(Gifting.WebApi.Urls)
local _ = require(Gifting.Types)

return function(p1, Network)
	-- upvalues: GiftModelUtilsModule (copy), PromiseModule (copy), GiftErrorModelModule (copy), FetchGiftingModule (copy), UrlsModule (copy), ReceiverPreviewResponseModelModule (copy)
	local NonEmptyStringResult, NonEmptyStringResult2 = GiftModelUtilsModule.nonEmptyString(p1)
	
	return if NonEmptyStringResult then FetchGiftingModule({
		method = "GET",
		analyticsKey = "gifting.receiver-preview",
		network = Network,
		url = UrlsModule.receiverPreview(p1),
		decode = ReceiverPreviewResponseModelModule.format
	}) else PromiseModule.reject(GiftErrorModelModule.invalidRequest(`giftId: {NonEmptyStringResult2}`))
end