local Gifting = script:FindFirstAncestor("Gifting")
local FetchGiftingModule = require(Gifting.WebApi.fetchGifting)
local UrlsModule = require(Gifting.WebApi.Urls)
local _ = require(Gifting.Types)

return function(Body, Network) --[[ Line: 20 | Named "postAcceptGift" ]]
	-- upvalues: FetchGiftingModule (copy), UrlsModule (copy)
	return FetchGiftingModule({
		method = "POST",
		analyticsKey = "gifting.accept",
		network = Network,
		url = UrlsModule.accept(),
		body = Body,
		decode = function() --[[ Line: 27 ]]
			return {}
		end
	})
end