local gifting = script:FindFirstAncestor("Gifting")
local parent = gifting.Parent
local promiseModule = require(parent.Promise)
local tModule = require(parent.t)
local giftErrorModelModule = require(gifting.Models.GiftErrorModel)
local pendingGiftsResponseModelModule = require(gifting.Models.PendingGiftsResponseModel)
local fetchGiftingModule = require(gifting.WebApi.fetchGifting)
local urlsModule = require(gifting.WebApi.Urls)
local _ = require(gifting.Types)
local var1 = tModule.optional(tModule.intersection(tModule.integer, tModule.numberPositive))

return function(p1, p2, p3)
	-- upvalues: var1 (ref), promiseModule (ref), giftErrorModelModule (ref), fetchGiftingModule (ref), urlsModule (ref), pendingGiftsResponseModelModule (ref)
	local var2, var3 = var1(p1)
	
	return if var2 then fetchGiftingModule({
		method = "GET",
		analyticsKey = "gifting.pending",
		network = p3,
		url = urlsModule.pending(p1, p2),
		decode = pendingGiftsResponseModelModule.format
	}) else promiseModule.reject(giftErrorModelModule.invalidRequest(`limit: {var3}`))
end