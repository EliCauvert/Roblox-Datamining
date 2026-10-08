local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local legalTextWithLinksModule = require(script.Parent.LegalTextWithLinks)
local useOpenDisclaimerLinksModule = require(authCommon.Hooks.useOpenDisclaimerLinks)
local registerAuditContentModule = require(authCommon.Components.RegisterAuditContent)
local registerAdditionalAuditContentModule = require(authCommon.Components.RegisterAdditionalAuditContent)
local t = {
	startTermsTag = "<a href=\"terms\">",
	endTermsTag = "</a>",
	startPrivacyTag = "<a href=\"privacy\">",
	endPrivacyTag = "</a>"
}

return function(p1)
	-- upvalues: t (ref), useLocalization (ref), useOpenDisclaimerLinksModule (ref), reactModule (ref), legalTextWithLinksModule (ref), registerAuditContentModule (ref), registerAdditionalAuditContentModule (ref), urlBuilder (ref)
	local var1 = p1.enableAuditContentCapture == true
	local cloned = table.clone(t)
	cloned[1] = p1.textKey
	local var2 = useLocalization({
		text = cloned,
		template = if var1 then p1.textKey else nil
	})
	local var3 = useOpenDisclaimerLinksModule()
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Text = reactModule.createElement(legalTextWithLinksModule, {
			text = var2.text,
			onLinkActivated = reactModule.useCallback(function(p2)
				-- upvalues: var3 (ref)
				if p2 == "terms" then
					var3.openTerms()
					
					return
				elseif p2 == "privacy" then
					var3.openPrivacy()
				end
			end, { var3 }),
			LayoutOrder = p1.LayoutOrder
		}),
		TextAuditContent = if var1 then reactModule.createElement(registerAuditContentModule, {
			translationKey = p1.textKey,
			translatedSourceString = var2.template,
			parameters = t
		}) else nil,
		TermsLinkAuditContent = if var1 then reactModule.createElement(registerAdditionalAuditContentModule, {
			contentKey = "termsLink",
			value = urlBuilder.static.about.terms()
		}) else nil,
		PrivacyLinkAuditContent = if var1 then reactModule.createElement(registerAdditionalAuditContentModule, {
			contentKey = "privacyLink",
			value = urlBuilder.static.about.privacy()
		}) else nil
	})
end