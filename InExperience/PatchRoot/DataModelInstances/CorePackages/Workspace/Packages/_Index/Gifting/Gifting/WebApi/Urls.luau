local UrlBuilderModule = require(script:FindFirstAncestor("Gifting").Parent.UrlBuilder)
local UrlBuilder = UrlBuilderModule.UrlBuilder
local Economy = UrlBuilderModule.UrlBase.new("economy")

return {
	canGift = function() --[[ Line: 14 ]]
		-- upvalues: UrlBuilder (copy), Economy (copy)
		return UrlBuilder.new({ path = "gifting/v1/gifts/can-gift", base = Economy })()
	end,
	findRecipients = function() --[[ Line: 21 ]]
		-- upvalues: UrlBuilder (copy), Economy (copy)
		return UrlBuilder.new({
			path = "gifting/v1/gifts/find-recipients",
			base = Economy
		})()
	end,
	prepare = function() --[[ Line: 28 ]]
		-- upvalues: UrlBuilder (copy), Economy (copy)
		return UrlBuilder.new({ path = "gifting/v1/gifts/prepare", base = Economy })()
	end,
	purchase = function() --[[ Line: 35 ]]
		-- upvalues: UrlBuilder (copy), Economy (copy)
		return UrlBuilder.new({ path = "gifting/v1/gifts/purchase", base = Economy })()
	end,
	accept = function() --[[ Line: 42 ]]
		-- upvalues: UrlBuilder (copy), Economy (copy)
		return UrlBuilder.new({ path = "gifting/v1/gifts/accept", base = Economy })()
	end,
	reject = function() --[[ Line: 49 ]]
		-- upvalues: UrlBuilder (copy), Economy (copy)
		return UrlBuilder.new({ path = "gifting/v1/gifts/reject", base = Economy })()
	end,
	pending = function(p1, Cursor) --[[ Line: 56 ]]
		-- upvalues: UrlBuilder (copy), Economy (copy)
		return UrlBuilder.new({
			path = "gifting/v1/gifts/pending",
			base = Economy,
			query = {
				{ name = "limit", value = "{limit}", optional = true },
				{ name = "cursor", value = "{cursor}", optional = true }
			}
		})({
			limit = if p1 == nil then nil else tostring(p1),
			cursor = Cursor
		})
	end,
	receiverPreview = function(GiftId) --[[ Line: 70 ]]
		-- upvalues: UrlBuilder (copy), Economy (copy)
		return UrlBuilder.new({
			path = "gifting/v1/gifts/{giftId}/receiver-preview",
			base = Economy
		})({ giftId = GiftId })
	end
}