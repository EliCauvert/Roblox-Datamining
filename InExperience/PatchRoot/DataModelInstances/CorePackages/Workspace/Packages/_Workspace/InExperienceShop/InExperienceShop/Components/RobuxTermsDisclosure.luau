local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseOpenWebViewFunction = require(Parent.WebViewUtils).useOpenWebView
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local InlineLayoutModule = require(Parent.InlineLayout)
local InlineLayout = InlineLayoutModule.Components.InlineLayout
local LinkElement = InlineLayoutModule.Components.InlineLayoutElements.LinkElement
local TextElement = InlineLayoutModule.Components.InlineLayoutElements.TextElement
local config = {
	disclosure = {
		"Feature.InExperienceShop.Description.RobuxPurchaseLegalDisclosure",
		termsLinkStart = "<a>",
		termsLinkEnd = "</a>"
	}
}

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), UseOpenWebViewFunction (copy), UseLocalizationFunction (copy), config (copy), ReactModule (copy), UrlBuilder (copy), TextElement (copy), LinkElement (copy), View (copy), InlineLayout (copy)
	local UseTokensResult = UseTokensFunction()
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local Disclosure = UseLocalizationFunction(config).disclosure
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseOpenWebViewResult (copy), UrlBuilder (upval)
		UseOpenWebViewResult(UrlBuilder.static.about.terms(), "")
	end, { UseOpenWebViewResult })
	local IsIsMobile = Frame.isMobile == true
	local CaptionSmall = if IsIsMobile then UseTokensResult.Typography.CaptionSmall else UseTokensResult.Typography.BodySmall
	local CaptionSmall1 = if IsIsMobile then UseTokensResult.Typography.CaptionSmall else UseTokensResult.Typography.CaptionMedium
	local Neutral = if IsIsMobile then UseTokensResult.Color.System.Neutral else UseTokensResult.Color.Content.Default
	local Emphasis = if IsIsMobile then UseTokensResult.Color.Content.Emphasis else Neutral
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		testId = "RobuxTermsDisclosure",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Layout = ReactModule.createElement(InlineLayout, {
			Elements = ReactModule.useMemo(function()
				-- upvalues: Disclosure (copy), TextElement (upval), CaptionSmall (copy), Neutral (copy), LinkElement (upval), CaptionSmall1 (copy), Emphasis (copy), UseResult (copy)
				local Match, Match2, Match3 = string.match(Disclosure, "^(.*)<a>(.*)</a>(.*)$")
				
				return if Match2 == nil then {
					TextElement.new({
						Text = Disclosure,
						fontStyle = CaptionSmall,
						textStyle = Neutral
					})
				} else {
					TextElement.new({
						testId = "RobuxTermsDisclosure-LeadingText",
						Text = Match,
						fontStyle = CaptionSmall,
						textStyle = Neutral
					}),
					LinkElement.new({
						TextElement.new({
							testId = "RobuxTermsDisclosure-TermsLinkText",
							Text = Match2,
							fontStyle = CaptionSmall1,
							textStyle = Emphasis
						})
					}, {
						key = "RobuxTermsDisclosure-TermsLink",
						onActivated = UseResult
					}),
					TextElement.new({
						Text = Match3,
						fontStyle = CaptionSmall,
						textStyle = Neutral
					})
				}
			end, {
				Disclosure, CaptionSmall, CaptionSmall1, Neutral, Emphasis, UseResult
			})
		})
	})
end)