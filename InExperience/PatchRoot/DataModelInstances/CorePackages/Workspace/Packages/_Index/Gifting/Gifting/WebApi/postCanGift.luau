local Gifting = script:FindFirstAncestor("Gifting")
local Parent = Gifting.Parent
local PromiseModule = require(Parent.Promise)
local TModule = require(Parent.t)
local CanGiftResponseModelModule = require(Gifting.Models.CanGiftResponseModel)
local GiftErrorModelModule = require(Gifting.Models.GiftErrorModel)
local FetchGiftingModule = require(Gifting.WebApi.fetchGifting)
local UrlsModule = require(Gifting.WebApi.Urls)
local _ = require(Gifting.Types)
local StrictInterfaceResult = TModule.strictInterface({
	items = TModule.array(TModule.strictInterface({ itemType = TModule.string, itemId = TModule.string }))
})

return function(Body, Network)
	-- upvalues: StrictInterfaceResult (copy), PromiseModule (copy), GiftErrorModelModule (copy), FetchGiftingModule (copy), UrlsModule (copy), CanGiftResponseModelModule (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(Body)
	
	return if StrictInterfaceResultResult then FetchGiftingModule({
		method = "POST",
		analyticsKey = "gifting.can-gift",
		network = Network,
		url = UrlsModule.canGift(),
		body = Body,
		decode = CanGiftResponseModelModule.format
	}) else PromiseModule.reject(GiftErrorModelModule.invalidRequest(StrictInterfaceResultResult2))
end