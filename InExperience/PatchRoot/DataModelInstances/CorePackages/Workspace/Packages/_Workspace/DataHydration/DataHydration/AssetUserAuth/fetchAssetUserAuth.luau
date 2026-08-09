local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.AssetUserAuthStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(value, p0) --[[ line: 19 | named "assetUrl" ]]
	return ("%s/assets/user-auth/v1/assets/%s?updateMask=icon"):format(value, p0)
end

local _ = function(p1, p2) --[[ line: 23 | named "operationUrl" ]]
	return ("%s/assets/user-auth/v1/operations/%s"):format(p1, p2)
end

local _ = function(p3) --[[ line: 27 | named "resolveBase" ]]
	-- upvalues: urlBase (ref)
	p3 = p3 or {}
	
	return p3.network, p3.baseUrl or urlBase.APIS
end

local _ = function(p4) --[[ line: 32 | named "resolveMutatingNetwork" ]]
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref)
	return (p4 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
end

return {
	patchAssetIcon = function(value, p5, p6) --[[ line: 39 ]]
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		p6 = p6 or {}
		local _ = p6.network
		
		return asPromise(fetch({
			method = "PATCH",
			analyticsKey = "asset-user-auth.patch-icon",
			network = (p6 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/assets/user-auth/v1/assets/%s?updateMask=icon"):format(p6.baseUrl or urlBase.APIS, value),
			body = p5,
			decode = function(p7) --[[ line: 51 ]]
				return p7
			end
		}))
	end,
	fetchOperation = function(p8, p9) --[[ line: 58 ]]
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p9 = p9 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "asset-user-auth.get-operation",
			network = p9.network,
			url = ("%s/assets/user-auth/v1/operations/%s"):format(p9.baseUrl or urlBase.APIS, p8),
			decode = function(p10) --[[ line: 65 ]]
				return p10
			end
		}))
	end
}