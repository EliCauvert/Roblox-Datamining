local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local parent = robloxSubscriptionPurchaseApp.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local inlineRichTextModule = require(parent.InlineRichText)
local renderer = inlineRichTextModule.Renderer
local linkBehavior = inlineRichTextModule.Enums.LinkBehavior
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagSupportFreeTrialModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagSupportFreeTrial)
local robloxSubscriptionTermsOfUseLink = game:DefineFastString("RobloxSubscriptionTermsOfUseLink", "https://en.help.roblox.com/hc/articles/46804865425300")

local function _(p0) --[[ line: 17 | named "decodeLuauUnicodeEscapes" ]]
	return p0:gsub("\\u{(%x+)}", function(p1) --[[ line: 19 ]]
		local var8 = tonumber(p1, 16)
		
		return if var8 == nil or var8 < 0 or var8 > 1114111 then "" else utf8.char(var8)
	end)
end

local function decodeInlineRichTextEntities(p2) --[[ line: 31 ]]
	return p2:gsub("&amp;lt;", "<"):gsub("&amp;gt;", ">"):gsub("&amp;quot;", "\""):gsub("&amp;apos;", "'"):gsub("&amp;amp;", "&"):gsub("&lt;", "<"):gsub("&gt;", ">"):gsub("&quot;", "\""):gsub("&apos;", "'"):gsub("&amp;", "&")
end

local function replaceQuotesOutsideTags(p3) --[[ line: 47 ]]
	local var12
	local t = {}
	local var10 = false
	local var11 = true
	
	for i = 1, #p3 do
		var12 = p3:sub(i, i)
		
		if var12 == "<" then
			var10 = true
			table.insert(t, var12)
			continue
		end
		if var12 == ">" then
			var10 = false
			table.insert(t, var12)
		elseif var12 == "\"" and not var10 then
			table.insert(t, if var11 then utf8.char(8220) else utf8.char(8221))
			var11 = not var11
		else
			table.insert(t, var12)
		end
	end
	return table.concat(t)
end

local _ = function(p4) --[[ line: 69 | named "prepareTermsAgreementRichText" ]]
	-- upvalues: fFlagSupportFreeTrialModule (ref), replaceQuotesOutsideTags (ref), decodeInlineRichTextEntities (ref)
	return if fFlagSupportFreeTrialModule then replaceQuotesOutsideTags(decodeInlineRichTextEntities(p4:gsub("\\u{(%x+)}", function(p6) --[[ line: 19 ]]
		local var8 = tonumber(p6, 16)
		
		return if var8 == nil or var8 < 0 or var8 > 1114111 then "" else utf8.char(var8)
	end))) else decodeInlineRichTextEntities(p4:gsub("\\u{(%x+)}", function(p5) --[[ line: 19 ]]
		local var8 = tonumber(p5, 16)
		
		return if var8 == nil or var8 < 0 or var8 > 1114111 then "" else utf8.char(var8)
	end))
end

return function(p7) --[[ line: 83 | named "LegalDisclosure" ]]
	-- upvalues: foundationModule (ref), useLocalization (ref), robloxSubscriptionTermsOfUseLink (ref), fFlagSupportFreeTrialModule (ref), reactModule (ref), linkBehavior (ref), renderer (ref), replaceQuotesOutsideTags (ref), decodeInlineRichTextEntities (ref)
	local var13 = foundationModule.Hooks.useTokens()
	local var14 = useLocalization({
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
		} else nil
	})
	local var15 = if fFlagSupportFreeTrialModule and p7.isFreeTrial then var14.freeTrialTermsAgreement else var14.termsAgreement
	
	return reactModule.createElement(renderer, {
		text = if fFlagSupportFreeTrialModule then replaceQuotesOutsideTags(decodeInlineRichTextEntities(var15:gsub("\\u{(%x+)}", function(p9) --[[ line: 19 ]]
			local var8 = tonumber(p9, 16)
			
			return if var8 == nil or var8 < 0 or var8 > 1114111 then "" else utf8.char(var8)
		end))) else decodeInlineRichTextEntities(var15:gsub("\\u{(%x+)}", function(p8) --[[ line: 19 ]]
			local var8 = tonumber(p8, 16)
			
			return if var8 == nil or var8 < 0 or var8 > 1114111 then "" else utf8.char(var8)
		end)),
		textStyle = var13.Color.Content.Default,
		fontStyle = var13.Typography.BodySmall,
		linkerOptions = reactModule.useMemo(function() --[[ line: 105 ]]
			-- upvalues: linkBehavior (copy)
			return {
				evaluateLinkBehavior = function(_, _) --[[ line: 107 ]]
					-- upvalues: linkBehavior (copy)
					return linkBehavior.Webview
				end
			}
		end, {}),
		wrapperProps = { tag = "size-full-0 auto-y", LayoutOrder = p7.layoutOrder },
		nodeProps = { LINK = { showUnderline = true } }
	})
end