local HttpService = game:GetService("HttpService")
local AffiliateLinks = script:FindFirstAncestor("AffiliateLinks")
local Parent = AffiliateLinks.Parent
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local _ = require(Parent.Http)
local Default = require(Parent.LoggingProtocol).default
local AffiliateJoinLinkResolverModule = require(AffiliateLinks.AffiliateJoinLinkResolver)
local TelemetryConfigsModule = require(AffiliateLinks.TelemetryConfigs)
local GetFFlagEnableAffiliateLinksQualifiedSignUpTrackingFunction = require(Parent.SharedFlags).GetFFlagEnableAffiliateLinksQualifiedSignUpTracking
local QualifiedSignUpAttributionModule = {
	attribute = function(Callback, LinkId, ReferralUrl, LinkType)
		-- upvalues: GetFFlagEnableAffiliateLinksQualifiedSignUpTrackingFunction (copy), PromiseModule (copy), HttpService (copy), Url (copy)
		return if GetFFlagEnableAffiliateLinksQualifiedSignUpTrackingFunction() then PromiseModule.new(function(Callback1: () -> ())
			-- upvalues: HttpService (upval), LinkId (copy), ReferralUrl (copy), LinkType (copy), Url (upval), Callback (copy)
			Callback(string.format("%saffiliate-links/v1/events/qualified-signup", Url.APIS_URL), "POST", {
				postBody = HttpService:JSONEncode({
					linkId = LinkId,
					referralUrl = ReferralUrl,
					linkType = LinkType
				})
			}):await()
			Callback1()
		end) else PromiseModule.resolve()
	end
}

function QualifiedSignUpAttributionModule.attributeJoinLink(p1, ReferralUrl, p2)
	-- upvalues: PromiseModule (copy), AffiliateJoinLinkResolverModule (copy), QualifiedSignUpAttributionModule (copy), Default (copy), TelemetryConfigsModule (copy)
	return PromiseModule.new(function(Callback: () -> ())
		-- upvalues: AffiliateJoinLinkResolverModule (upval), p1 (copy), p2 (copy), QualifiedSignUpAttributionModule (upval), ReferralUrl (copy), Default (upval), TelemetryConfigsModule (upval)
		local v1, v2 = AffiliateJoinLinkResolverModule.resolveReferralCode(p1, p2):await()
		
		if v1 then
			QualifiedSignUpAttributionModule.attribute(p1, v2.responseBody.linkId, ReferralUrl, v2.responseBody.linkType):await()
		else
			Default:logRobloxTelemetryCounter(TelemetryConfigsModule.AttributeJoinLinkFailureCounter)
		end
		Callback()
	end)
end

return QualifiedSignUpAttributionModule