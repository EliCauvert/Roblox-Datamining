local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpService = game:GetService("HttpService")
local HttpClientModule = require(Parent.HttpClient)
local UrlBuilderModule = require(Parent.UrlBuilder)
local UrlBase = UrlBuilderModule.UrlBase
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)
local CreatorApiHttpModule = {
	baseUrl = function(p1)
		-- upvalues: UrlBase (copy)
		return (p1 or {}).baseUrl or UrlBase.APIS
	end,
	withoutRestrictedAcceptHeader = function(MutatingNetwork)
		return {
			request = function(Tbl, p1)
				-- upvalues: MutatingNetwork (copy)
				local Headers = nil
				
				if Tbl.headers ~= nil then
					local t = {}
					
					for i, header in Tbl.headers do
						if string.lower(i) ~= "accept" then
							t[i] = header
						end
					end
					Headers = t
				end
				local Copy = table.clone(Tbl)
				Copy.headers = Headers
				
				return MutatingNetwork.request(Copy, p1)
			end
		}
	end
}

function CreatorApiHttpModule.readNetwork(p1)
	-- upvalues: CreatorApiHttpModule (copy), HttpClientModule (copy)
	local P3 = p1 or {}
	local ReadNetwork = P3.readNetwork or P3.network
	
	if ReadNetwork == nil then
		local RequestInternalNetwork = HttpClientModule.createRequestInternalNetwork()
		
		return CreatorApiHttpModule.withoutRestrictedAcceptHeader(if P3.retryReads == false then RequestInternalNetwork else HttpClientModule.withRetry(RequestInternalNetwork))
	else
		return CreatorApiHttpModule.withoutRestrictedAcceptHeader(ReadNetwork)
	end
end

function CreatorApiHttpModule.mutatingNetwork(p1)
	-- upvalues: CreatorApiHttpModule (copy), WithCsrfRetryModule (copy), HttpClientModule (copy)
	local P4 = p1 or {}
	
	return CreatorApiHttpModule.withoutRestrictedAcceptHeader(P4.mutatingNetwork or (P4.network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork())))
end

function CreatorApiHttpModule.imagePart(p1)
	return {
		name = "imageFile",
		value = p1.content,
		fileName = p1.fileName,
		contentType = p1.contentType
	}
end

function CreatorApiHttpModule.buildMultipartBody(List): string
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, "--" .. "-------CreatorMonetizationFormBoundary" .. "\r\n" .. (if value.fileName == nil then ("Content-Disposition: form-data; name=\"%s\""):format(value.name) else ("Content-Disposition: form-data; name=\"%s\"; filename=\"%s\""):format(value.name, value.fileName)) .. "\r\n" .. (if value.contentType == nil then "" else "Content-Type: " .. value.contentType .. "\r\n") .. "\r\n" .. value.value .. "\r\n")
	end
	table.insert(List1, "---------CreatorMonetizationFormBoundary--\r\n")
	
	return table.concat(List1)
end

local function _(Buf)
	-- upvalues: HttpService (copy)
	if Buf == nil or Buf == "" then
		return nil
	else
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, if typeof(Buf) == "buffer" then buffer.tostring(Buf) else Buf)
		
		return if Success then Result else nil
	end
end

local _ = function(p1: number): boolean
	return p1 >= 200 and p1 < 300
end

function CreatorApiHttpModule.errorFrom(p1)
	-- upvalues: HttpService (copy)
	local ResponseBody = p1.responseBody
	local v1 = nil
	
	if ResponseBody == nil or ResponseBody == "" then
		v1 = nil
	else
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, if typeof(ResponseBody) == "buffer" then buffer.tostring(ResponseBody) else ResponseBody)
		v1 = if Success then Result else nil
	end
	if typeof(v1) == "table" then
		local ErrorMessage = v1.errorMessage or v1.message
		
		if typeof(ErrorMessage) == "string" then
			return if typeof(v1.errorCode) == "string" then `{v1.errorCode}: {ErrorMessage}` else ErrorMessage, p1.statusCode
		end
	end
	return ("http %d: %s"):format(p1.statusCode, if typeof(p1.responseBody) == "buffer" then buffer.tostring(p1.responseBody) else p1.responseBody or ""), p1.statusCode
end

function CreatorApiHttpModule.jsonDecoder(Callback)
	-- upvalues: CreatorApiHttpModule (copy), HttpService (copy)
	return function(p1)
		-- upvalues: CreatorApiHttpModule (upval), Callback (copy), HttpService (upval)
		local StatusCode: number = p1.statusCode
		
		if StatusCode < 200 or StatusCode >= 300 then
			local ErrorFromResult, ErrorFromResult2 = CreatorApiHttpModule.errorFrom(p1)
			
			return nil, ErrorFromResult, ErrorFromResult2
		end
		local ResponseBody = p1.responseBody
		local v1 = nil
		
		if ResponseBody == nil or ResponseBody == "" then
			v1 = nil
		else
			local Success, Result = pcall(HttpService.JSONDecode, HttpService, if typeof(ResponseBody) == "buffer" then buffer.tostring(ResponseBody) else ResponseBody)
			v1 = if Success then Result else nil
		end
		return Callback(v1), nil, nil
	end
end

function CreatorApiHttpModule.noContentDecoder(Callback)
	-- upvalues: CreatorApiHttpModule (copy)
	return function(p1)
		-- upvalues: CreatorApiHttpModule (upval), Callback (copy)
		local StatusCode: number = p1.statusCode
		
		if StatusCode >= 200 and StatusCode < 300 then
			return Callback(), nil, nil
		else
			local ErrorFromResult, ErrorFromResult2 = CreatorApiHttpModule.errorFrom(p1)
			
			return nil, ErrorFromResult, ErrorFromResult2
		end
	end
end

function CreatorApiHttpModule.multipart(NetworkImpl, Method, Url, p1, AnalyticsKey, Decode)
	-- upvalues: HttpClientModule (copy), CreatorApiHttpModule (copy)
	return HttpClientModule.asPromise(HttpClientModule.createRequest({
		networkImpl = NetworkImpl,
		method = Method,
		url = Url,
		body = CreatorApiHttpModule.buildMultipartBody(p1),
		headers = {},
		encode = HttpClientModule.encodeRaw("multipart/form-data; boundary=-------CreatorMonetizationFormBoundary"),
		decode = Decode,
		analyticsKey = AnalyticsKey
	}))
end

function CreatorApiHttpModule.json(NetworkImpl, Method, Url, Body, AnalyticsKey, Decode)
	-- upvalues: HttpClientModule (copy)
	return HttpClientModule.asPromise(HttpClientModule.createRequest({
		networkImpl = NetworkImpl,
		method = Method,
		url = Url,
		body = Body,
		headers = {},
		decode = Decode,
		analyticsKey = AnalyticsKey
	}))
end

function CreatorApiHttpModule.get(p1, Url, AnalyticsKey, p2)
	-- upvalues: HttpClientModule (copy), CreatorApiHttpModule (copy)
	return HttpClientModule.asPromise(HttpClientModule.createRequest({
		method = "GET",
		body = nil,
		networkImpl = CreatorApiHttpModule.readNetwork(p1),
		url = Url,
		headers = {},
		analyticsKey = AnalyticsKey,
		decode = CreatorApiHttpModule.jsonDecoder(p2)
	}))
end

function CreatorApiHttpModule.withQuery(p1, List)
	-- upvalues: UrlBuilderModule (copy)
	local t = {}
	
	for i, value in List do
		if value ~= nil and value ~= "" then
			t[i] = value
		end
	end
	return if next(t) == nil then p1 else UrlBuilderModule.UrlBuilder.addQueryString(p1, t)
end

return CreatorApiHttpModule