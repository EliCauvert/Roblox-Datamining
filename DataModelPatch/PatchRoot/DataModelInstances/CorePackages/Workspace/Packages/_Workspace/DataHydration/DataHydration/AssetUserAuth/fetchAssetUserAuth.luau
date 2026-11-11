local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)
local _ = require(script.Parent.AssetUserAuthStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function _(p1, p2): string
	return ("%s/assets/user-auth/v1/assets/%s?updateMask=icon"):format(p1, p2)
end

local _ = function(p1, p2): string
	return ("%s/assets/user-auth/v1/operations/%s"):format(p1, p2)
end

local _ = function(p1)
	-- upvalues: UrlBase (copy)
	local P4 = p1 or {}
	
	return P4.network, P4.baseUrl or UrlBase.APIS
end

local _ = function(p1)
	-- upvalues: WithCsrfRetryModule (copy), HttpClientModule (copy)
	return (p1 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork())
end

return {
	patchAssetIcon = function(p1, Body, p2)
		-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), AsPromiseFunction (copy)
		local P8 = p2 or {}
		local _ = P8.network
		
		return AsPromiseFunction((FetchFunction({
			method = "PATCH",
			analyticsKey = "asset-user-auth.patch-icon",
			network = (p2 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = ("%s/assets/user-auth/v1/assets/%s?updateMask=icon"):format(P8.baseUrl or UrlBase.APIS, p1),
			body = Body,
			decode = function(p3)
				return p3
			end
		})))
	end,
	fetchOperation = function(p1, p2)
		-- upvalues: UrlBase (copy), FetchFunction (copy), AsPromiseFunction (copy)
		local P11 = p2 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "asset-user-auth.get-operation",
			network = P11.network,
			url = ("%s/assets/user-auth/v1/operations/%s"):format(P11.baseUrl or UrlBase.APIS, p1),
			decode = function(p3)
				return p3
			end
		})))
	end
}