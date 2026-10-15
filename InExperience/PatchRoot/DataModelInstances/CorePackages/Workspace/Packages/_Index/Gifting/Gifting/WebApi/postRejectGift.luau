local gifting = script:FindFirstAncestor("Gifting")
local fetchGiftingModule = require(gifting.WebApi.fetchGifting)
local urlsModule = require(gifting.WebApi.Urls)
local _ = require(gifting.Types)

return function(p1, p2)
	-- upvalues: fetchGiftingModule (ref), urlsModule (ref)
	return fetchGiftingModule({
		method = "POST",
		analyticsKey = "gifting.reject",
		network = p2,
		url = urlsModule.reject(),
		body = p1,
		decode = function()
			return {}
		end
	})
end