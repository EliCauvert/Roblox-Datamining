local HttpService = game:GetService("HttpService")
local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)
local _ = require(script.Parent.UniverseCreateStoreTypes)

local function _(Buf) --[[ Line: 15 | Named "tryJsonDecode" ]]
	-- upvalues: HttpService (copy)
	if Buf == nil or Buf == "" then
		return nil
	else
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, if typeof(Buf) == "buffer" then buffer.tostring(Buf) else Buf)
		
		return if Success then Result else nil
	end
end

local function decode(p1) --[[ Line: 25 ]]
	-- upvalues: HttpService (copy)
	local ResponseBody = p1.responseBody
	local v1 = nil
	
	if ResponseBody == nil or ResponseBody == "" then
		v1 = nil
	else
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, if typeof(ResponseBody) == "buffer" then buffer.tostring(ResponseBody) else ResponseBody)
		v1 = if Success then Result else nil
	end
	if typeof(v1) == "table" and typeof(v1.code) == "string" and typeof(v1.message) == "string" then
		return nil, ("%s: %s"):format(v1.code, v1.message), p1.statusCode
	elseif p1.statusCode < 200 or p1.statusCode >= 300 then
		return nil, ("http %d: %s"):format(p1.statusCode, if typeof(p1.responseBody) == "buffer" then buffer.tostring(p1.responseBody) else p1.responseBody or ""), p1.statusCode
	else
		return v1, nil, nil
	end
end

return function(Body, p1) --[[ Line: 43 | Named "fetchUniverseCreate" ]]
	-- upvalues: WithCsrfRetryModule (copy), HttpClientModule (copy), UrlBase (copy), decode (copy)
	local P2 = p1 or {}
	
	return HttpClientModule.asPromise((HttpClientModule.createRequest({
		method = "POST",
		analyticsKey = "universes-create.create",
		networkImpl = P2.network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
		url = (P2.baseUrl or UrlBase.APIS) .. "/universes/v1/universes/create",
		body = Body,
		decode = decode
	})))
end