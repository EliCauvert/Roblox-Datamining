local urlBuilderModule = require(script:FindFirstAncestor("Gifting").Parent.UrlBuilder)
local urlBuilder = urlBuilderModule.UrlBuilder
local economy = urlBuilderModule.UrlBase.new("economy")

return {
	canGift = function()
		-- upvalues: urlBuilder (ref), economy (ref)
		return urlBuilder.new({ path = "gifting/v1/gifts/can-gift", base = economy })()
	end,
	findRecipients = function()
		-- upvalues: urlBuilder (ref), economy (ref)
		return urlBuilder.new({
			path = "gifting/v1/gifts/find-recipients",
			base = economy
		})()
	end,
	prepare = function()
		-- upvalues: urlBuilder (ref), economy (ref)
		return urlBuilder.new({ path = "gifting/v1/gifts/prepare", base = economy })()
	end,
	purchase = function()
		-- upvalues: urlBuilder (ref), economy (ref)
		return urlBuilder.new({ path = "gifting/v1/gifts/purchase", base = economy })()
	end,
	accept = function()
		-- upvalues: urlBuilder (ref), economy (ref)
		return urlBuilder.new({ path = "gifting/v1/gifts/accept", base = economy })()
	end,
	reject = function()
		-- upvalues: urlBuilder (ref), economy (ref)
		return urlBuilder.new({ path = "gifting/v1/gifts/reject", base = economy })()
	end,
	pending = function(p1, p2)
		-- upvalues: urlBuilder (ref), economy (ref)
		return urlBuilder.new({
			path = "gifting/v1/gifts/pending",
			base = economy,
			query = {
				{ name = "limit", value = "{limit}", optional = true },
				{ name = "cursor", value = "{cursor}", optional = true }
			}
		})({
			limit = if p1 ~= nil then nil else tostring(p1),
			cursor = p2
		})
	end,
	receiverPreview = function(p1)
		-- upvalues: urlBuilder (ref), economy (ref)
		return urlBuilder.new({
			path = "gifting/v1/gifts/{giftId}/receiver-preview",
			base = economy
		})({ giftId = p1 })
	end
}