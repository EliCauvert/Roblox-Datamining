local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local inlineRichTextModule = require(parent.InlineRichText)
local renderer = inlineRichTextModule.Renderer
local linkBehavior = inlineRichTextModule.Enums.LinkBehavior
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagSupportFreeTrialModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagSupportFreeTrial)
local fFlagRobloxPlusFAEFreeTrialModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusFAEFreeTrial)
local robloxSubscriptionTermsOfUseLink = game:DefineFastString("RobloxSubscriptionTermsOfUseLink", "https://en.help.roblox.com/hc/articles/46804865425300")

local function _(p0)
	return p0:gsub("\\u{(%x+)}", function(p1)
		local var9 = tonumber(p1, 16)
		
		return if var9 == nil or var9 < 0 or var9 > 1114111 then "" else utf8.char(var9)
	end)
end

local function decodeInlineRichTextEntities(p2)
	return p2:gsub("&amp;lt;", "<"):gsub("&amp;gt;", ">"):gsub("&amp;quot;", "\""):gsub("&amp;apos;", "'"):gsub("&amp;amp;", "&"):gsub("&lt;", "<"):gsub("&gt;", ">"):gsub("&quot;", "\""):gsub("&apos;", "'"):gsub("&amp;", "&")
end

local function replaceQuotesOutsideTags(p3)
	local var13
	local t = {}
	local var11 = false
	local var12 = true
	
	for i = 1, #p3 do
		var13 = p3:sub(i, i)
		
		if var13 == "<" then
			var11 = true
			table.insert(t, var13)
			continue
		end
		if var13 == ">" then
			var11 = false
			table.insert(t, var13)
		elseif var13 == "\"" and not var11 then
			table.insert(t, if var12 then utf8.char(8220) else utf8.char(8221))
			var12 = not var12
		else
			table.insert(t, var13)
		end
	end
	return table.concat(t)
end

local _ = function(p4)
	-- upvalues: fFlagSupportFreeTrialModule (ref), replaceQuotesOutsideTags (ref), decodeInlineRichTextEntities (ref)
	return if fFlagSupportFreeTrialModule then replaceQuotesOutsideTags(decodeInlineRichTextEntities(p4:gsub("\\u{(%x+)}", function(p6)
		local var9 = tonumber(p6, 16)
		
		return if var9 == nil or var9 < 0 or var9 > 1114111 then "" else utf8.char(var9)
	end))) else decodeInlineRichTextEntities(p4:gsub("\\u{(%x+)}", function(p5)
		local var9 = tonumber(p5, 16)
		
		return if var9 == nil or var9 < 0 or var9 > 1114111 then "" else utf8.char(var9)
	end))
end

return function(p7)
	-- upvalues: foundationModule (ref), useLocalization (ref), robloxSubscriptionTermsOfUseLink (ref), fFlagSupportFreeTrialModule (ref), fFlagRobloxPlusFAEFreeTrialModule (ref), reactModule (ref), linkBehavior (ref), renderer (ref), replaceQuotesOutsideTags (ref), decodeInlineRichTextEntities (ref)
	local var14 = foundationModule.Hooks.useTokens()
	local var15 = useLocalization({
		termsAgreement = {
			"Feature.RobloxSubscription.Disclosure.BlackbirdTermsAgreement",
			termsUrl = robloxSubscriptionTermsOfUseLink,
			ctaText = if p7.ctaText and p7.ctaText ~= "" then p7.ctaText else useLocalization({
				subscribe = "Feature.RobloxSubscription.Action.Subscribe"
			}).subscribe
		},
		freeTrialTermsAgreement = if fFlagSupportFreeTrialModule then {
			"Feature.RobloxSubscription.Label.FreeTrialDisclosureV2",
			linkStart = "<a href=\"" .. robloxSubscriptionTermsOfUseLink .. "\">",
			linkEnd = "</a>"
		} else nil,
		shortFreeTrialTermsAgreement = if fFlagRobloxPlusFAEFreeTrialModule then {
			"Feature.RobloxSubscription.Label.FreeTrialDisclosureShort",
			linkStart = "<a href=\"" .. robloxSubscriptionTermsOfUseLink .. "\">",
			linkEnd = "</a>"
		} else nil
	})
	local var16 = if fFlagRobloxPlusFAEFreeTrialModule and p7.shortenFreeTrialTerms then var15.shortFreeTrialTermsAgreement elseif fFlagSupportFreeTrialModule and p7.isFreeTrial then var15.freeTrialTermsAgreement else var15.termsAgreement
	
	return reactModule.createElement(renderer, {
		text = if fFlagSupportFreeTrialModule then replaceQuotesOutsideTags(decodeInlineRichTextEntities(var16:gsub("\\u{(%x+)}", function(p9)
			local var9 = tonumber(p9, 16)
			
			return if var9 == nil or var9 < 0 or var9 > 1114111 then "" else utf8.char(var9)
		end))) else decodeInlineRichTextEntities(var16:gsub("\\u{(%x+)}", function(p8)
			local var9 = tonumber(p8, 16)
			
			return if var9 == nil or var9 < 0 or var9 > 1114111 then "" else utf8.char(var9)
		end)),
		textStyle = var14.Color.Content.Default,
		fontStyle = var14.Typography.BodySmall,
		linkerOptions = reactModule.useMemo(function()
			-- upvalues: linkBehavior (copy)
			return {
				evaluateLinkBehavior = function(_, _)
					-- upvalues: linkBehavior (copy)
					return linkBehavior.Webview
				end
			}
		end, {}),
		wrapperProps = { tag = "size-full-0 auto-y", LayoutOrder = p7.layoutOrder },
		nodeProps = { LINK = { showUnderline = true } }
	})
end