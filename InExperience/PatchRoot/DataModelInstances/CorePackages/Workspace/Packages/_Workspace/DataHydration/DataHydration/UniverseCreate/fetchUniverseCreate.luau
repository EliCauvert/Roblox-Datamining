local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.UniverseCreateStoreTypes)

local function _(p1)
	-- upvalues: httpService (ref)
	if p1 == nil or p1 == "" then
		return nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, if typeof(p1) == "buffer" then buffer.tostring(p1) else p1)
	
	return if ok then status else nil
end

local function decode(p1)
	-- upvalues: httpService (ref)
	local var1
	local responseBody = p1.responseBody
	
	if responseBody == nil or responseBody == "" then
		var1 = nil
	else
		local ok, status = pcall(httpService.JSONDecode, httpService, if typeof(responseBody) == "buffer" then buffer.tostring(responseBody) else responseBody)
		var1 = if ok then status else nil
	end
	if typeof(var1) == "table" and typeof(var1.code) == "string" and typeof(var1.message) == "string" then
		return nil, ("%s: %s"):format(var1.code, var1.message), p1.statusCode
	elseif p1.statusCode < 200 or p1.statusCode >= 300 then
		return nil, ("http %d: %s"):format(p1.statusCode, if typeof(p1.responseBody) == "buffer" then buffer.tostring(p1.responseBody) else p1.responseBody or ""), p1.statusCode
	end
	return var1, nil, nil
end

return function(p1, p2)
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref), urlBase (ref), decode (ref)
	p2 = p2 or {}
	
	return httpClientModule.asPromise(httpClientModule.createRequest({
		method = "POST",
		analyticsKey = "universes-create.create",
		networkImpl = p2.network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
		url = (p2.baseUrl or urlBase.APIS) .. "/universes/v1/universes/create",
		body = p1,
		decode = decode
	}))
end