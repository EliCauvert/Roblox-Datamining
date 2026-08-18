local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local _ = require(parent.LuauPolyfill)
local promiseModule = require(parent.Promise)
local makeAXResponseHandlerModule = require(avatarExperienceCatalog.Utils.makeAXResponseHandler)
local normalizeMarketplaceOffersBannerResponseModule = require(script.Parent.normalizeMarketplaceOffersBannerResponse)
local _ = require(script.Parent.MarketplaceOffersBannerTypes)
local constantsModule = require(script.Parent.constants)
local t = {
	offers = {
		{
			icon = "Star",
			localizedText = "[Mock] <b>First offer</b> from getOffersForUser",
			offerId = "mock-offer-1",
			modal = {
				modalHeroIcon = "TagSparkle",
				modalTitle = "You unlocked 10% off!",
				offerBodyLinkText = "Up to <b>\\u{E002}20 off</b> your next avatar item purchase. Valid through <font color=\"#335FFF\">Dec 25</font>. Apply at checkout. One time use.",
				termsModalTitle = "Terms and conditions",
				termsBody = "<b>These Special Offer Terms</b> supplement the Roblox Terms of Use and Marketplace rules. Discounts are subject to availability, account standing, and regional restrictions."
			}
		},
		{
			icon = "TagSparkle",
			localizedText = "[Mock] Second offer from getOffersForUser",
			offerId = "mock-offer-2"
		},
		"not-a-table-row",
		{
			modal = {
				modalTitle = "Orphan modal",
				offerBodyLinkText = "This row has no icon/text/offerId so it gets dropped."
			}
		},
		{
			icon = "Star",
			localizedText = "[Mock] Fifth offer (bad modal swallowed)",
			offerId = "mock-offer-5",
			modal = {
				offerBodyLinkText = "Missing modalTitle so this modal is dropped silently."
			}
		}
	}
}

return {
	mockGetOffersForUser = function() --[[ line: 85 ]]
		-- upvalues: promiseModule (ref), t (ref), makeAXResponseHandlerModule (ref), normalizeMarketplaceOffersBannerResponseModule (ref), constantsModule (ref)
		local var6 = false
		
		return makeAXResponseHandlerModule(promiseModule.new(function(p0) --[[ line: 90 ]]
			-- upvalues: var6 (write), t (copy)
			task.delay(2, function() --[[ line: 91 ]]
				-- upvalues: var6 (copy), p0 (ref), t (copy)
				if var6 then
					p0(nil)
					
					return
				end
				p0({ responseBody = t })
			end)
		end), normalizeMarketplaceOffersBannerResponseModule, {
			modelMismatchCounter = constantsModule.FETCH_MARKETPLACE_OFFERS_BANNER_MODEL_MISMATCH_COUNTER_NAME,
			latencyCounter = constantsModule.FETCH_MARKETPLACE_OFFERS_BANNER_LATENCY_COUNTER_NAME
		}), function() --[[ line: 105 ]]
			-- upvalues: var6 (write)
			var6 = true
		end
	end
}