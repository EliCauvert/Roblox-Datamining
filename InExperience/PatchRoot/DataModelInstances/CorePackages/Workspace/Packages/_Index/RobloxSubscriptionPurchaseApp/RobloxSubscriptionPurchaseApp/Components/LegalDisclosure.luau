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

local function _(p1)
	return p1:gsub("\\u{(%x+)}", function(p2)
		local var1 = tonumber(p2, 16)
		
		return if var1 == nil or var1 < 0 or var1 > 1114111 then "" else utf8.char(var1)
	end)
end

local function decodeInlineRichTextEntities(p1)
	return p1:gsub("&amp;lt;", "<"):gsub("&amp;gt;", ">"):gsub("&amp;quot;", "\""):gsub("&amp;apos;", "'"):gsub("&amp;amp;", "&"):gsub("&lt;", "<"):gsub("&gt;", ">"):gsub("&quot;", "\""):gsub("&apos;", "'"):gsub("&amp;", "&")
end

local function replaceQuotesOutsideTags(p1)
	local var1
	local t = {}
	local var2 = false
	local var3 = true
	
	for i = 1, #p1 do
		var1 = p1:sub(i, i)
		
		if var1 == "<" then
			var2 = true
			table.insert(t, var1)
			continue
		end
		if var1 == ">" then
			var2 = false
			table.insert(t, var1)
		elseif var1 == "\"" and not var2 then
			table.insert(t, if var3 then utf8.char(8220) else utf8.char(8221))
			var3 = not var3
		else
			table.insert(t, var1)
		end
	end
	return table.concat(t)
end

local _ = function(p2)
	-- upvalues: fFlagSupportFreeTrialModule (ref), replaceQuotesOutsideTags (ref), decodeInlineRichTextEntities (ref)
	return if fFlagSupportFreeTrialModule then replaceQuotesOutsideTags(decodeInlineRichTextEntities(p2:gsub("\\u{(%x+)}", function(p3)
		local var4 = tonumber(p3, 16)
		
		return if var4 == nil or var4 < 0 or var4 > 1114111 then "" else utf8.char(var4)
	end))) else decodeInlineRichTextEntities(p2:gsub("\\u{(%x+)}", function(p3)
		local var4 = tonumber(p3, 16)
		
		return if var4 == nil or var4 < 0 or var4 > 1114111 then "" else utf8.char(var4)
	end))
end

return function(p2)
	-- upvalues: foundationModule (ref), useLocalization (ref), robloxSubscriptionTermsOfUseLink (ref), fFlagSupportFreeTrialModule (ref), fFlagRobloxPlusFAEFreeTrialModule (ref), reactModule (ref), linkBehavior (ref), renderer (ref), replaceQuotesOutsideTags (ref), decodeInlineRichTextEntities (ref)
	local var4 = foundationModule.Hooks.useTokens()
	local var5 = useLocalization({
		termsAgreement = {
			"Feature.RobloxSubscription.Disclosure.BlackbirdTermsAgreement",
			termsUrl = robloxSubscriptionTermsOfUseLink,
			ctaText = if p2.ctaText and p2.ctaText ~= "" then p2.ctaText else useLocalization({
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
	local var6 = if fFlagRobloxPlusFAEFreeTrialModule and p2.shortenFreeTrialTerms then var5.shortFreeTrialTermsAgreement elseif fFlagSupportFreeTrialModule and p2.isFreeTrial then var5.freeTrialTermsAgreement else var5.termsAgreement
	
	return reactModule.createElement(renderer, {
		text = if fFlagSupportFreeTrialModule then replaceQuotesOutsideTags(decodeInlineRichTextEntities(var6:gsub("\\u{(%x+)}", function(p3)
			local var7 = tonumber(p3, 16)
			
			return if var7 == nil or var7 < 0 or var7 > 1114111 then "" else utf8.char(var7)
		end))) else decodeInlineRichTextEntities(var6:gsub("\\u{(%x+)}", function(p3)
			local var7 = tonumber(p3, 16)
			
			return if var7 == nil or var7 < 0 or var7 > 1114111 then "" else utf8.char(var7)
		end)),
		textStyle = var4.Color.Content.Default,
		fontStyle = var4.Typography.BodySmall,
		linkerOptions = reactModule.useMemo(function()
			-- upvalues: linkBehavior (copy)
			return {
				evaluateLinkBehavior = function(_, _)
					-- upvalues: linkBehavior (copy)
					return linkBehavior.Webview
				end
			}
		end, {}),
		wrapperProps = { tag = "size-full-0 auto-y", LayoutOrder = p2.layoutOrder },
		nodeProps = { LINK = { showUnderline = true } }
	})
end