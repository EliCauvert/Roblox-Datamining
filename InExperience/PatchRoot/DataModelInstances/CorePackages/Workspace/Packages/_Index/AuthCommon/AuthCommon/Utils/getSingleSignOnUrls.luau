local parent = script:FindFirstAncestor("AuthCommon").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies

return function(value)
	-- upvalues: getAppFeaturePolicies (ref), urlBuilder (ref)
	local var1 = value or getAppFeaturePolicies()
	local urlAuthRoutes = var1.getUrlAuthRoutes()
	local t = {}
	local linkedAuthEndpointsEnabled = var1.getLinkedAuthEndpointsEnabled()
	
	if urlAuthRoutes.account then
		t.account = urlBuilder.fromString("auth" .. ":" .. urlAuthRoutes.account)
	end
	if linkedAuthEndpointsEnabled and urlAuthRoutes.linkedLogin then
		t.connect = urlBuilder.fromString("auth" .. ":" .. urlAuthRoutes.linkedLogin)
	elseif urlAuthRoutes.connect then
		t.connect = urlBuilder.fromString("auth" .. ":" .. urlAuthRoutes.connect)
	end
	if urlAuthRoutes.disconnect then
		t.disconnect = urlBuilder.fromString("auth" .. ":" .. urlAuthRoutes.disconnect)
	end
	if linkedAuthEndpointsEnabled and urlAuthRoutes.externalLogin then
		t.login = urlBuilder.fromString("auth" .. ":" .. urlAuthRoutes.externalLogin)
	elseif urlAuthRoutes.login then
		t.login = urlBuilder.fromString("auth" .. ":" .. urlAuthRoutes.login)
	end
	if linkedAuthEndpointsEnabled and urlAuthRoutes.linkedSignup then
		t.signup = urlBuilder.fromString("auth" .. ":" .. urlAuthRoutes.linkedSignup)
	elseif urlAuthRoutes.signup then
		t.signup = urlBuilder.fromString("auth" .. ":" .. urlAuthRoutes.signup)
	end
	if linkedAuthEndpointsEnabled then
		t.linkingPlatform = var1.getLinkingPlatform()
	end
	return t
end