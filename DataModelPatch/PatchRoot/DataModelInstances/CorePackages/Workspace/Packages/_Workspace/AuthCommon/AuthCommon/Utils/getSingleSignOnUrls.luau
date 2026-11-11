local Parent = script:FindFirstAncestor("AuthCommon").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies

return function(p1)
	-- upvalues: GetAppFeaturePoliciesFunction (copy), UrlBuilder (copy)
	local AppFeaturePolicies = if p1 then p1 else GetAppFeaturePoliciesFunction()
	local UrlAuthRoutes = AppFeaturePolicies.getUrlAuthRoutes()
	local t = {}
	local LinkedAuthEndpointsEnabled = AppFeaturePolicies.getLinkedAuthEndpointsEnabled()
	
	if UrlAuthRoutes.account then
		t.account = UrlBuilder.fromString("auth" .. ":" .. UrlAuthRoutes.account)
	end
	if LinkedAuthEndpointsEnabled and UrlAuthRoutes.linkedLogin then
		t.connect = UrlBuilder.fromString("auth" .. ":" .. UrlAuthRoutes.linkedLogin)
	elseif UrlAuthRoutes.connect then
		t.connect = UrlBuilder.fromString("auth" .. ":" .. UrlAuthRoutes.connect)
	end
	if UrlAuthRoutes.disconnect then
		t.disconnect = UrlBuilder.fromString("auth" .. ":" .. UrlAuthRoutes.disconnect)
	end
	if LinkedAuthEndpointsEnabled and UrlAuthRoutes.externalLogin then
		t.login = UrlBuilder.fromString("auth" .. ":" .. UrlAuthRoutes.externalLogin)
	elseif UrlAuthRoutes.login then
		t.login = UrlBuilder.fromString("auth" .. ":" .. UrlAuthRoutes.login)
	end
	if LinkedAuthEndpointsEnabled and UrlAuthRoutes.linkedSignup then
		t.signup = UrlBuilder.fromString("auth" .. ":" .. UrlAuthRoutes.linkedSignup)
	elseif UrlAuthRoutes.signup then
		t.signup = UrlBuilder.fromString("auth" .. ":" .. UrlAuthRoutes.signup)
	end
	if LinkedAuthEndpointsEnabled then
		t.linkingPlatform = AppFeaturePolicies.getLinkingPlatform()
	end
	return t
end