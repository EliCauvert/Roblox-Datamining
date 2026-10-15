local gifting = script:FindFirstAncestor("Gifting")
local parent = gifting.Parent
local promiseModule = require(parent.Promise)
local tModule = require(parent.t)
local canGiftResponseModelModule = require(gifting.Models.CanGiftResponseModel)
local giftErrorModelModule = require(gifting.Models.GiftErrorModel)
local fetchGiftingModule = require(gifting.WebApi.fetchGifting)
local urlsModule = require(gifting.WebApi.Urls)
local _ = require(gifting.Types)
local var1 = tModule.strictInterface({
	items = tModule.array(tModule.strictInterface({ itemType = tModule.string, itemId = tModule.string }))
})

return function(p1, p2)
	-- upvalues: var1 (ref), promiseModule (ref), giftErrorModelModule (ref), fetchGiftingModule (ref), urlsModule (ref), canGiftResponseModelModule (ref)
	local var2, var3 = var1(p1)
	
	return if var2 then fetchGiftingModule({
		method = "POST",
		analyticsKey = "gifting.can-gift",
		network = p2,
		url = urlsModule.canGift(),
		body = p1,
		decode = canGiftResponseModelModule.format
	}) else promiseModule.reject(giftErrorModelModule.invalidRequest(var3))
end