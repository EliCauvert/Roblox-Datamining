local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local InlineRichTextModule = require(Parent.InlineRichText)
local Renderer = InlineRichTextModule.Renderer
local LinkBehavior = InlineRichTextModule.Enums.LinkBehavior
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagSupportFreeTrialModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagSupportFreeTrial)
local FFlagRobloxPlusFAEFreeTrialModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusFAEFreeTrial)
local RobloxSubscriptionTermsOfUseLink = game:DefineFastString("RobloxSubscriptionTermsOfUseLink", "https://en.help.roblox.com/hc/articles/46804865425300")

local function _(Text: string): string
	return (Text:gsub("\\u{(%x+)}", function(p1): string
		local Number: number? = tonumber(p1, 16)
		
		return if Number == nil or Number < 0 or Number > 1114111 then "" else utf8.char(Number)
	end))
end

local function decodeInlineRichTextEntities(UX: string)
	return UX:gsub("&amp;lt;", "<"):gsub("&amp;gt;", ">"):gsub("&amp;quot;", "\""):gsub("&amp;apos;", "'"):gsub("&amp;amp;", "&"):gsub("&lt;", "<"):gsub("&gt;", ">"):gsub("&quot;", "\""):gsub("&apos;", "'"):gsub("&amp;", "&")
end

local function replaceQuotesOutsideTags(Text: string): string
	local List = {}
	local Flag = false
	local v1 = true
	
	for i = 1, #Text do
		local Segment = Text:sub(i, i)
		
		if Segment == "<" then
			Flag = true
			table.insert(List, Segment)
		elseif Segment == ">" then
			Flag = false
			table.insert(List, Segment)
		elseif Segment == "\"" and not Flag then
			table.insert(List, if v1 then utf8.char(8220) else utf8.char(8221))
			v1 = not v1
		else
			table.insert(List, Segment)
		end
	end
	return table.concat(List)
end

local _ = function(Text: string)
	-- upvalues: FFlagSupportFreeTrialModule (copy), replaceQuotesOutsideTags (copy), decodeInlineRichTextEntities (copy)
	return if FFlagSupportFreeTrialModule then replaceQuotesOutsideTags(decodeInlineRichTextEntities((Text:gsub("\\u{(%x+)}", function(p1): string
		local Number: number? = tonumber(p1, 16)
		
		return if Number == nil or Number < 0 or Number > 1114111 then "" else utf8.char(Number)
	end)))) else decodeInlineRichTextEntities((Text:gsub("\\u{(%x+)}", function(p1): string
		local Number: number? = tonumber(p1, 16)
		
		return if Number == nil or Number < 0 or Number > 1114111 then "" else utf8.char(Number)
	end)))
end

return function(p1)
	-- upvalues: FoundationModule (copy), UseLocalizationFunction (copy), RobloxSubscriptionTermsOfUseLink (copy), FFlagSupportFreeTrialModule (copy), FFlagRobloxPlusFAEFreeTrialModule (copy), ReactModule (copy), LinkBehavior (copy), Renderer (copy), replaceQuotesOutsideTags (copy), decodeInlineRichTextEntities (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseLocalizationResult = UseLocalizationFunction({
		subscribe = "Feature.RobloxSubscription.Action.Subscribe"
	})
	local UseLocalizationResult1 = UseLocalizationFunction({
		termsAgreement = {
			"Feature.RobloxSubscription.Disclosure.BlackbirdTermsAgreement",
			termsUrl = RobloxSubscriptionTermsOfUseLink,
			ctaText = if p1.ctaText and p1.ctaText ~= "" then p1.ctaText else UseLocalizationResult.subscribe
		},
		freeTrialTermsAgreement = if FFlagSupportFreeTrialModule then {
			"Feature.RobloxSubscription.Label.FreeTrialDisclosureV2",
			linkStart = "<a href=\"" .. RobloxSubscriptionTermsOfUseLink .. "\">",
			linkEnd = "</a>"
		} else nil,
		shortFreeTrialTermsAgreement = if FFlagRobloxPlusFAEFreeTrialModule then {
			"Feature.RobloxSubscription.Label.FreeTrialDisclosureShort",
			linkStart = "<a href=\"" .. RobloxSubscriptionTermsOfUseLink .. "\">",
			linkEnd = "</a>"
		} else nil
	})
	local ShortFreeTrialTermsAgreement = if FFlagRobloxPlusFAEFreeTrialModule and p1.shortenFreeTrialTerms then UseLocalizationResult1.shortFreeTrialTermsAgreement elseif FFlagSupportFreeTrialModule and p1.isFreeTrial then UseLocalizationResult1.freeTrialTermsAgreement else UseLocalizationResult1.termsAgreement
	
	return ReactModule.createElement(Renderer, {
		text = if FFlagSupportFreeTrialModule then replaceQuotesOutsideTags(decodeInlineRichTextEntities((ShortFreeTrialTermsAgreement:gsub("\\u{(%x+)}", function(p2): string
			local Number: number? = tonumber(p2, 16)
			
			return if Number == nil or Number < 0 or Number > 1114111 then "" else utf8.char(Number)
		end)))) else decodeInlineRichTextEntities((ShortFreeTrialTermsAgreement:gsub("\\u{(%x+)}", function(p2): string
			local Number: number? = tonumber(p2, 16)
			
			return if Number == nil or Number < 0 or Number > 1114111 then "" else utf8.char(Number)
		end))),
		textStyle = UseTokensResult.Color.Content.Default,
		fontStyle = UseTokensResult.Typography.BodySmall,
		linkerOptions = ReactModule.useMemo(function()
			-- upvalues: LinkBehavior (upval)
			return {
				evaluateLinkBehavior = function(_, _)
					-- upvalues: LinkBehavior (upval)
					return LinkBehavior.Webview
				end
			}
		end, {}),
		wrapperProps = { tag = "size-full-0 auto-y", LayoutOrder = p1.layoutOrder },
		nodeProps = { LINK = { showUnderline = true } }
	})
end