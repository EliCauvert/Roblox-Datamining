local Gifting = script:FindFirstAncestor("Gifting")
local Parent = Gifting.Parent
local PromiseModule = require(Parent.Promise)
local TModule = require(Parent.t)
local GiftErrorModelModule = require(Gifting.Models.GiftErrorModel)
local PendingGiftsResponseModelModule = require(Gifting.Models.PendingGiftsResponseModel)
local FetchGiftingModule = require(Gifting.WebApi.fetchGifting)
local UrlsModule = require(Gifting.WebApi.Urls)
local _ = require(Gifting.Types)
local OptionalResult = TModule.optional(TModule.intersection(TModule.integer, TModule.numberPositive))

return function(p1, p2, Network) --[[ Line: 22 | Named "getPendingGifts" ]]
	-- upvalues: OptionalResult (copy), PromiseModule (copy), GiftErrorModelModule (copy), FetchGiftingModule (copy), UrlsModule (copy), PendingGiftsResponseModelModule (copy)
	local OptionalResultResult, OptionalResultResult2 = OptionalResult(p1)
	
	return if OptionalResultResult then FetchGiftingModule({
		method = "GET",
		analyticsKey = "gifting.pending",
		network = Network,
		url = UrlsModule.pending(p1, p2),
		decode = PendingGiftsResponseModelModule.format
	}) else PromiseModule.reject(GiftErrorModelModule.invalidRequest(`limit: {OptionalResultResult2}`))
end