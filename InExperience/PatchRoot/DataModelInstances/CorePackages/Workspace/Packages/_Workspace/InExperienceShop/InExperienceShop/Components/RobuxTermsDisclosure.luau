local parent = script:FindFirstAncestor("InExperienceShop").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local inlineLayoutModule = require(parent.InlineLayout)
local inlineLayout = inlineLayoutModule.Components.InlineLayout
local linkElement = inlineLayoutModule.Components.InlineLayoutElements.LinkElement
local textElement = inlineLayoutModule.Components.InlineLayoutElements.TextElement
local t = {
	disclosure = {
		"Feature.InExperienceShop.Description.RobuxPurchaseLegalDisclosure",
		termsLinkStart = "<a>",
		termsLinkEnd = "</a>"
	}
}

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useOpenWebView (ref), useLocalization (ref), t (ref), reactModule (ref), urlBuilder (ref), textElement (ref), linkElement (ref), view (ref), inlineLayout (ref)
	local var1 = useTokens()
	local var2 = useOpenWebView()
	local disclosure = useLocalization(t).disclosure
	local var3 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), urlBuilder (copy)
		var2(urlBuilder.static.about.terms(), "")
	end, { var2 })
	local var4 = p1.isMobile == true
	local var5 = if var4 then var1.Typography.CaptionSmall else var1.Typography.BodySmall
	local var6 = if var4 then var1.Typography.CaptionSmall else var1.Typography.CaptionMedium
	local var7 = if var4 then var1.Color.System.Neutral else var1.Color.Content.Default
	local var8 = if var4 then var1.Color.Content.Emphasis else var7
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		testId = "RobuxTermsDisclosure",
		LayoutOrder = p1.LayoutOrder
	}, {
		Layout = reactModule.createElement(inlineLayout, {
			Elements = reactModule.useMemo(function()
				-- upvalues: disclosure (ref), textElement (copy), var5 (ref), var7 (ref), linkElement (copy), var6 (ref), var8 (ref), var3 (ref)
				local match, match_1, match_2 = string.match(disclosure, "^(.*)<a>(.*)</a>(.*)$")
				
				return if match_1 == nil then {
					textElement.new({ Text = disclosure, fontStyle = var5, textStyle = var7 })
				} else {
					textElement.new({
						testId = "RobuxTermsDisclosure-LeadingText",
						Text = match,
						fontStyle = var5,
						textStyle = var7
					}),
					linkElement.new({
						textElement.new({
							testId = "RobuxTermsDisclosure-TermsLinkText",
							Text = match_1,
							fontStyle = var6,
							textStyle = var8
						})
					}, {
						key = "RobuxTermsDisclosure-TermsLink",
						onActivated = var3
					}),
					textElement.new({ Text = match_2, fontStyle = var5, textStyle = var7 })
				}
			end, {
				disclosure, var5, var6, var7, var8, var3
			})
		})
	})
end)