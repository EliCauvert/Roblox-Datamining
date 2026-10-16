local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local InlineRichTextModule = require(Parent.InlineRichText)
local Renderer = InlineRichTextModule.Renderer
local LinkBehavior = InlineRichTextModule.Enums.LinkBehavior
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetPeriodTypeDisplayLabelModule = require(RobloxSubscriptionPurchaseApp.Utils.getPeriodTypeDisplayLabel)
local IsSupportedTrialPeriodTypeModule = require(RobloxSubscriptionPurchaseApp.Utils.isSupportedTrialPeriodType)
local FFlagSupportFreeTrialModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagSupportFreeTrial)
local FFlagRobloxPlusDynamicFreeTrialLengthModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagRobloxPlusDynamicFreeTrialLength)
local FFlagEnablePlusReferralLegalDisclosureModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagEnablePlusReferralLegalDisclosure)
local RobloxSubscriptionTermsOfUseLink = game:DefineFastString("RobloxSubscriptionTermsOfUseLink", "https://en.help.roblox.com/hc/articles/46804865425300")
local PlusReferralProgramTermsURL2 = game:DefineFastString("PlusReferralProgramTermsURL2", "https://en.help.roblox.com/hc/en-us/articles/52737229124628")

local function _(Text: string): string --[[ Line: 23 | Named "decodeLuauUnicodeEscapes" ]]
	return (Text:gsub("\\u{(%x+)}", function(p1): string --[[ Line: 25 ]]
		local Number: number? = tonumber(p1, 16)
		
		return if Number == nil or Number < 0 or Number > 1114111 then "" else utf8.char(Number)
	end))
end

local function decodeInlineRichTextEntities(UX: string) --[[ Line: 37 ]]
	return UX:gsub("&amp;lt;", "<"):gsub("&amp;gt;", ">"):gsub("&amp;quot;", "\""):gsub("&amp;apos;", "'"):gsub("&amp;amp;", "&"):gsub("&lt;", "<"):gsub("&gt;", ">"):gsub("&quot;", "\""):gsub("&apos;", "'"):gsub("&amp;", "&")
end

local function replaceQuotesOutsideTags(Text: string): string --[[ Line: 53 ]]
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

local _ = function(Text: string) --[[ Line: 75 | Named "prepareTermsAgreementRichText" ]]
	-- upvalues: FFlagSupportFreeTrialModule (copy), replaceQuotesOutsideTags (copy), decodeInlineRichTextEntities (copy)
	return if FFlagSupportFreeTrialModule then replaceQuotesOutsideTags(decodeInlineRichTextEntities((Text:gsub("\\u{(%x+)}", function(p1): string --[[ Line: 25 ]]
		local Number: number? = tonumber(p1, 16)
		
		return if Number == nil or Number < 0 or Number > 1114111 then "" else utf8.char(Number)
	end)))) else decodeInlineRichTextEntities((Text:gsub("\\u{(%x+)}", function(p1): string --[[ Line: 25 ]]
		local Number: number? = tonumber(p1, 16)
		
		return if Number == nil or Number < 0 or Number > 1114111 then "" else utf8.char(Number)
	end)))
end

return function(p1) --[[ Line: 95 | Named "LegalDisclosure" ]]
	-- upvalues: FoundationModule (copy), FFlagSupportFreeTrialModule (copy), FFlagRobloxPlusDynamicFreeTrialLengthModule (copy), IsSupportedTrialPeriodTypeModule (copy), GetPeriodTypeDisplayLabelModule (copy), UseLocalizationFunction (copy), RobloxSubscriptionTermsOfUseLink (copy), FFlagEnablePlusReferralLegalDisclosureModule (copy), PlusReferralProgramTermsURL2 (copy), ReactModule (copy), LinkBehavior (copy), Renderer (copy), replaceQuotesOutsideTags (copy), decodeInlineRichTextEntities (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local TrialDuration = p1.trialDuration or 1
	local IsSupportedTrialPeriodTypeModule1 = FFlagSupportFreeTrialModule and (FFlagRobloxPlusDynamicFreeTrialLengthModule and (p1.isFreeTrial == true and (p1.trialDuration ~= nil and IsSupportedTrialPeriodTypeModule(p1.trialPeriodType))))
	local config = {
		subscribe = "Feature.RobloxSubscription.Action.Subscribe"
	}
	
	if IsSupportedTrialPeriodTypeModule1 then
		config.trialPeriodLabel = GetPeriodTypeDisplayLabelModule(p1.trialPeriodType or "", TrialDuration > 1)
		config.billingPeriodLabel = GetPeriodTypeDisplayLabelModule(p1.billingPeriodType or "", false)
	end
	local UseLocalizationResult = UseLocalizationFunction(config)
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
		freeTrialTermsAgreementV3 = if IsSupportedTrialPeriodTypeModule1 then {
			"Feature.RobloxSubscription.Label.FreeTrialDisclosureV3",
			linkStart = "<a href=\"" .. RobloxSubscriptionTermsOfUseLink .. "\">",
			linkEnd = "</a>",
			trialDuration = TrialDuration,
			trialPeriodLabel = UseLocalizationResult.trialPeriodLabel,
			billingPeriodLabel = UseLocalizationResult.billingPeriodLabel
		} else nil,
		shortFreeTrialTermsAgreement = {
			"Feature.RobloxSubscription.Label.FreeTrialDisclosureShort",
			linkStart = "<a href=\"" .. RobloxSubscriptionTermsOfUseLink .. "\">",
			linkEnd = "</a>"
		},
		referralTermsAgreement = if FFlagEnablePlusReferralLegalDisclosureModule then {
			"Feature.RobloxSubscription.Description.ReferralRecipientLegalDisclosurePurchase",
			referralTermsUrl = PlusReferralProgramTermsURL2,
			termsUrl = RobloxSubscriptionTermsOfUseLink,
			ctaText = if p1.ctaText and p1.ctaText ~= "" then p1.ctaText else UseLocalizationResult.subscribe
		} else nil
	})
	local ReferralTermsAgreement = if FFlagEnablePlusReferralLegalDisclosureModule and p1.isReferral then UseLocalizationResult1.referralTermsAgreement elseif p1.shortenFreeTrialTerms then UseLocalizationResult1.shortFreeTrialTermsAgreement elseif IsSupportedTrialPeriodTypeModule1 then UseLocalizationResult1.freeTrialTermsAgreementV3 elseif FFlagSupportFreeTrialModule and p1.isFreeTrial then UseLocalizationResult1.freeTrialTermsAgreement else UseLocalizationResult1.termsAgreement
	
	return ReactModule.createElement(Renderer, {
		text = if FFlagSupportFreeTrialModule then replaceQuotesOutsideTags(decodeInlineRichTextEntities((ReferralTermsAgreement:gsub("\\u{(%x+)}", function(p2): string --[[ Line: 25 ]]
			local Number: number? = tonumber(p2, 16)
			
			return if Number == nil or Number < 0 or Number > 1114111 then "" else utf8.char(Number)
		end)))) else decodeInlineRichTextEntities((ReferralTermsAgreement:gsub("\\u{(%x+)}", function(p2): string --[[ Line: 25 ]]
			local Number: number? = tonumber(p2, 16)
			
			return if Number == nil or Number < 0 or Number > 1114111 then "" else utf8.char(Number)
		end))),
		textStyle = UseTokensResult.Color.Content.Default,
		fontStyle = UseTokensResult.Typography.BodySmall,
		linkerOptions = ReactModule.useMemo(function() --[[ Line: 154 ]]
			-- upvalues: LinkBehavior (upval)
			return {
				evaluateLinkBehavior = function(_, _) --[[ Line: 156 ]]
					-- upvalues: LinkBehavior (upval)
					return LinkBehavior.Webview
				end
			}
		end, {}),
		wrapperProps = { tag = "size-full-0 auto-y", LayoutOrder = p1.layoutOrder },
		nodeProps = { LINK = { showUnderline = true } }
	})
end