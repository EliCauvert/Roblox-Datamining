local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local _ = require(Parent.LuauPolyfill)
local PromiseModule = require(Parent.Promise)
local MakeAXResponseHandlerModule = require(AvatarExperienceCatalog.Utils.makeAXResponseHandler)
local NormalizeMarketplaceOffersBannerResponseModule = require(script.Parent.normalizeMarketplaceOffersBannerResponse)
local _ = require(script.Parent.MarketplaceOffersBannerTypes)
local ConstantsModule = require(script.Parent.constants)
local ResponseBody = {
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
	mockGetOffersForUser = function() --[[ Line: 85 ]]
		-- upvalues: PromiseModule (copy), ResponseBody (copy), MakeAXResponseHandlerModule (copy), NormalizeMarketplaceOffersBannerResponseModule (copy), ConstantsModule (copy)
		local Flag = false
		
		return MakeAXResponseHandlerModule(PromiseModule.new(function(Callback) --[[ Line: 90 ]]
			-- upvalues: Flag (ref), ResponseBody (upval)
			task.delay(2, function() --[[ Line: 91 ]]
				-- upvalues: Flag (upval), Callback (copy), ResponseBody (upval)
				if Flag then
					Callback(nil)
					
					return
				else
					Callback({ responseBody = ResponseBody })
				end
			end)
		end), NormalizeMarketplaceOffersBannerResponseModule, {
			modelMismatchCounter = ConstantsModule.FETCH_MARKETPLACE_OFFERS_BANNER_MODEL_MISMATCH_COUNTER_NAME,
			latencyCounter = ConstantsModule.FETCH_MARKETPLACE_OFFERS_BANNER_LATENCY_COUNTER_NAME
		}), function() --[[ Line: 105 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end
}