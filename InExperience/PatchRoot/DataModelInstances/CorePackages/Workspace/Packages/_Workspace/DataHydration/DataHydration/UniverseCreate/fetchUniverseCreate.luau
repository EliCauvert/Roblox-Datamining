local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.UniverseCreateStoreTypes)

local function _(p0) --[[ line: 15 | named "tryJsonDecode" ]]
	-- upvalues: httpService (ref)
	if p0 == nil or p0 == "" then
		return nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, if typeof(p0) == "buffer" then buffer.tostring(p0) else p0)
	
	return if ok then status else nil
end

local function decode(p1) --[[ line: 25 ]]
	-- upvalues: httpService (ref)
	local var5
	local responseBody = p1.responseBody
	
	if responseBody == nil or responseBody == "" then
		var5 = nil
	else
		local ok, status = pcall(httpService.JSONDecode, httpService, if typeof(responseBody) == "buffer" then buffer.tostring(responseBody) else responseBody)
		var5 = if ok then status else nil
	end
	if typeof(var5) == "table" and typeof(var5.code) == "string" and typeof(var5.message) == "string" then
		return nil, ("%s: %s"):format(var5.code, var5.message), p1.statusCode
	elseif p1.statusCode < 200 or p1.statusCode >= 300 then
		return nil, ("http %d: %s"):format(p1.statusCode, if typeof(p1.responseBody) == "buffer" then buffer.tostring(p1.responseBody) else p1.responseBody or ""), p1.statusCode
	end
	return var5, nil, nil
end

return function(p2, p3) --[[ line: 43 | named "fetchUniverseCreate" ]]
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref), urlBase (ref), decode (ref)
	p3 = p3 or {}
	
	return httpClientModule.asPromise(httpClientModule.createRequest({
		method = "POST",
		analyticsKey = "universes-create.create",
		networkImpl = p3.network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
		url = (p3.baseUrl or urlBase.APIS) .. "/universes/v1/universes/create",
		body = p2,
		decode = decode
	}))
end