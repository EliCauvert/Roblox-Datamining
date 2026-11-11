local HttpService = game:GetService("HttpService")
local AffiliateLinks = script:FindFirstAncestor("AffiliateLinks")
local Parent = AffiliateLinks.Parent
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local _ = require(Parent.Http)
local Default = require(Parent.LoggingProtocol).default
local AffiliateJoinLinkResolverModule = require(AffiliateLinks.AffiliateJoinLinkResolver)
local TelemetryConfigsModule = require(AffiliateLinks.TelemetryConfigs)
local AuthenticatedVisitAttributionModule = {
	attribute = function(Callback, LinkId, ReferralUrl, LinkType, UserDidLogIn)
		-- upvalues: PromiseModule (copy), HttpService (copy), Url (copy)
		return PromiseModule.new(function(Callback1: () -> ())
			-- upvalues: HttpService (upval), LinkId (copy), ReferralUrl (copy), LinkType (copy), UserDidLogIn (copy), Url (upval), Callback (copy)
			Callback(string.format("%saffiliate-links/v1/events/authenticated-visit", Url.APIS_URL), "POST", {
				postBody = HttpService:JSONEncode({
					linkId = LinkId,
					referralUrl = ReferralUrl,
					linkType = LinkType,
					userDidLogIn = UserDidLogIn
				})
			}):await()
			Callback1()
		end)
	end
}

function AuthenticatedVisitAttributionModule.attributeJoinLink(p1, ReferralUrl, p2, UserDidLogIn)
	-- upvalues: PromiseModule (copy), AffiliateJoinLinkResolverModule (copy), AuthenticatedVisitAttributionModule (copy), Default (copy), TelemetryConfigsModule (copy)
	return PromiseModule.new(function(Callback: () -> ())
		-- upvalues: AffiliateJoinLinkResolverModule (upval), p1 (copy), p2 (copy), AuthenticatedVisitAttributionModule (upval), ReferralUrl (copy), UserDidLogIn (copy), Default (upval), TelemetryConfigsModule (upval)
		local v1, v2 = AffiliateJoinLinkResolverModule.resolveReferralCode(p1, p2):await()
		
		if v1 then
			AuthenticatedVisitAttributionModule.attribute(p1, v2.responseBody.linkId, ReferralUrl, v2.responseBody.linkType, UserDidLogIn):await()
		else
			Default:logRobloxTelemetryCounter(TelemetryConfigsModule.AttributeJoinLinkFailureCounter)
		end
		Callback()
	end)
end

return AuthenticatedVisitAttributionModule