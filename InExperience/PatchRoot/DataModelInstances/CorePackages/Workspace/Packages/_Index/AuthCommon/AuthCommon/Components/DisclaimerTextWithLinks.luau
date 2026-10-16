local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local LegalTextWithLinksModule = require(script.Parent.LegalTextWithLinks)
local UseOpenDisclaimerLinksModule = require(AuthCommon.Hooks.useOpenDisclaimerLinks)
local RegisterAuditContentModule = require(AuthCommon.Components.RegisterAuditContent)
local RegisterAdditionalAuditContentModule = require(AuthCommon.Components.RegisterAdditionalAuditContent)
local Parameters = {
	startTermsTag = "<a href=\"terms\">",
	endTermsTag = "</a>",
	startPrivacyTag = "<a href=\"privacy\">",
	endPrivacyTag = "</a>"
}

return function(Frame) --[[ Line: 35 | Named "DisclaimerTextWithLinks" ]]
	-- upvalues: Parameters (copy), UseLocalizationFunction (copy), UseOpenDisclaimerLinksModule (copy), ReactModule (copy), LegalTextWithLinksModule (copy), RegisterAuditContentModule (copy), RegisterAdditionalAuditContentModule (copy), UrlBuilder (copy)
	local IsEnableAuditContentCapture = Frame.enableAuditContentCapture == true
	local Copy = table.clone(Parameters)
	Copy[1] = Frame.textKey
	local UseLocalizationResult = UseLocalizationFunction({
		text = Copy,
		template = if IsEnableAuditContentCapture then Frame.textKey else nil
	})
	local UseOpenDisclaimerLinksModuleResult = UseOpenDisclaimerLinksModule({
		ctx = Frame.ctx,
		state = Frame.state,
		origin = Frame.origin
	})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Text = ReactModule.createElement(LegalTextWithLinksModule, {
			text = UseLocalizationResult.text,
			onLinkActivated = ReactModule.useCallback(function(p1) --[[ Line: 51 ]]
				-- upvalues: UseOpenDisclaimerLinksModuleResult (copy)
				if p1 == "terms" then
					UseOpenDisclaimerLinksModuleResult.openTerms()
					
					return
				end
				if p1 == "privacy" then
					UseOpenDisclaimerLinksModuleResult.openPrivacy()
				end
			end, { UseOpenDisclaimerLinksModuleResult }),
			LayoutOrder = Frame.LayoutOrder
		}),
		TextAuditContent = if IsEnableAuditContentCapture then ReactModule.createElement(RegisterAuditContentModule, {
			translationKey = Frame.textKey,
			translatedSourceString = UseLocalizationResult.template,
			parameters = Parameters
		}) else nil,
		TermsLinkAuditContent = if IsEnableAuditContentCapture then ReactModule.createElement(RegisterAdditionalAuditContentModule, {
			contentKey = "termsLink",
			value = UrlBuilder.static.about.terms()
		}) else nil,
		PrivacyLinkAuditContent = if IsEnableAuditContentCapture then ReactModule.createElement(RegisterAdditionalAuditContentModule, {
			contentKey = "privacyLink",
			value = UrlBuilder.static.about.privacy()
		}) else nil
	})
end