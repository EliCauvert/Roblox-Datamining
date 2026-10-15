local gifting = script:FindFirstAncestor("Gifting")
local promiseModule = require(gifting.Parent.Promise)
local giftErrorModelModule = require(gifting.Models.GiftErrorModel)
local giftModelUtilsModule = require(gifting.Models.GiftModelUtils)
local receiverPreviewResponseModelModule = require(gifting.Models.ReceiverPreviewResponseModel)
local fetchGiftingModule = require(gifting.WebApi.fetchGifting)
local urlsModule = require(gifting.WebApi.Urls)
local _ = require(gifting.Types)

return function(p1, p2)
	-- upvalues: giftModelUtilsModule (ref), promiseModule (ref), giftErrorModelModule (ref), fetchGiftingModule (ref), urlsModule (ref), receiverPreviewResponseModelModule (ref)
	local var1, var2 = giftModelUtilsModule.nonEmptyString(p1)
	
	return if var1 then fetchGiftingModule({
		method = "GET",
		analyticsKey = "gifting.receiver-preview",
		network = p2,
		url = urlsModule.receiverPreview(p1),
		decode = receiverPreviewResponseModelModule.format
	}) else promiseModule.reject(giftErrorModelModule.invalidRequest(`giftId: {var2}`))
end