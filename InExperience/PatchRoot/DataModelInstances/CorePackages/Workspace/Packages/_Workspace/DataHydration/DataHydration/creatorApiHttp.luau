local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpService = game:GetService("HttpService")
local httpClientModule = require(parent.HttpClient)
local urlBuilderModule = require(parent.UrlBuilder)
local urlBase = urlBuilderModule.UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local t = {
	baseUrl = function(p1)
		-- upvalues: urlBase (ref)
		return (p1 or {}).baseUrl or urlBase.APIS
	end,
	withoutRestrictedAcceptHeader = function(p1)
		return {
			request = function(p2, p3)
				-- upvalues: p1 (ref)
				local var1 = nil
				
				if p2.headers ~= nil then
					local t = {}
					
					for i, v in p2.headers do
						if string.lower(i) ~= "accept" then
							t[i] = v
						end
					end
					var1 = t
				end
				local cloned = table.clone(p2)
				cloned.headers = var1
				
				return p1.request(cloned, p3)
			end
		}
	end
}

function t.readNetwork(p2)
	-- upvalues: t (ref), httpClientModule (ref)
	p2 = p2 or {}
	local readNetwork = p2.readNetwork or p2.network
	
	if readNetwork == nil then
		local var1 = httpClientModule.createRequestInternalNetwork()
		
		return t.withoutRestrictedAcceptHeader(if p2.retryReads == false then var1 else httpClientModule.withRetry(var1))
	end
	return t.withoutRestrictedAcceptHeader(readNetwork)
end

function t.mutatingNetwork(p2)
	-- upvalues: t (ref), withCsrfRetryModule (ref), httpClientModule (ref)
	p2 = p2 or {}
	
	return t.withoutRestrictedAcceptHeader(p2.mutatingNetwork or (p2.network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())))
end

function t.imagePart(p2)
	return {
		name = "imageFile",
		value = p2.content,
		fileName = p2.fileName,
		contentType = p2.contentType
	}
end

function t.buildMultipartBody(p2)
	local t = {}
	
	for i, v in p2 do
		table.insert(t, "--" .. "-------CreatorMonetizationFormBoundary" .. "\r\n" .. (if v.fileName ~= nil then ("Content-Disposition: form-data; name=\"%s\""):format(v.name) else ("Content-Disposition: form-data; name=\"%s\"; filename=\"%s\""):format(v.name, v.fileName)) .. "\r\n" .. (if v.contentType ~= nil then "" else "Content-Type: " .. v.contentType .. "\r\n") .. "\r\n" .. v.value .. "\r\n")
	end
	table.insert(t, "---------CreatorMonetizationFormBoundary--\r\n")
	
	return table.concat(t)
end

local function _(p3)
	-- upvalues: httpService (ref)
	if p3 == nil or p3 == "" then
		return nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, if typeof(p3) == "buffer" then buffer.tostring(p3) else p3)
	
	return if ok then status else nil
end

local _ = function(p3)
	return p3 >= 200 and p3 < 300
end

function t.errorFrom(p3)
	-- upvalues: httpService (ref)
	local var1
	local responseBody = p3.responseBody
	
	if responseBody == nil or responseBody == "" then
		var1 = nil
	else
		local ok, status = pcall(httpService.JSONDecode, httpService, if typeof(responseBody) == "buffer" then buffer.tostring(responseBody) else responseBody)
		var1 = if ok then status else nil
	end
	if typeof(var1) == "table" then
		responseBody = var1.errorMessage or var1.message
		
		if typeof(responseBody) == "string" then
			return if typeof(var1.errorCode) == "string" then `{var1.errorCode}: {responseBody}` else responseBody, p3.statusCode
		end
	end
	return ("http %d: %s"):format(p3.statusCode, if typeof(p3.responseBody) == "buffer" then buffer.tostring(p3.responseBody) else p3.responseBody or ""), p3.statusCode
end

function t.jsonDecoder(p3)
	-- upvalues: t (ref), httpService (ref)
	return function(p4)
		-- upvalues: t (copy), p3 (ref), httpService (copy)
		local statusCode = p4.statusCode
		
		if not (statusCode >= 200 and statusCode < 300) then
			local var1, var2 = t.errorFrom(p4)
			
			return nil, var1, var2
		end
		local var3
		local responseBody = p4.responseBody
		
		if responseBody == nil or responseBody == "" then
			var3 = nil
		else
			local ok, status = pcall(httpService.JSONDecode, httpService, if typeof(responseBody) == "buffer" then buffer.tostring(responseBody) else responseBody)
			var3 = if ok then status else nil
		end
		return p3(var3), nil, nil
	end
end

function t.noContentDecoder(p3)
	-- upvalues: t (ref)
	return function(p4)
		-- upvalues: t (copy), p3 (ref)
		local statusCode = p4.statusCode
		
		if statusCode >= 200 and statusCode < 300 then
			return p3(), nil, nil
		end
		local var1, var2 = t.errorFrom(p4)
		
		return nil, var1, var2
	end
end

function t.multipart(p3, p4, p5, p6, p7, p8)
	-- upvalues: httpClientModule (ref), t (ref)
	return httpClientModule.asPromise(httpClientModule.createRequest({
		networkImpl = p3,
		method = p4,
		url = p5,
		body = t.buildMultipartBody(p6),
		headers = {},
		encode = httpClientModule.encodeRaw("multipart/form-data; boundary=-------CreatorMonetizationFormBoundary"),
		decode = p8,
		analyticsKey = p7
	}))
end

function t.json(p3, p4, p5, p6, p7, p8)
	-- upvalues: httpClientModule (ref)
	return httpClientModule.asPromise(httpClientModule.createRequest({
		networkImpl = p3,
		method = p4,
		url = p5,
		body = p6,
		headers = {},
		decode = p8,
		analyticsKey = p7
	}))
end

function t.get(p3, p4, p5, p6)
	-- upvalues: httpClientModule (ref), t (ref)
	return httpClientModule.asPromise(httpClientModule.createRequest({
		method = "GET",
		body = nil,
		networkImpl = t.readNetwork(p3),
		url = p4,
		headers = {},
		analyticsKey = p5,
		decode = t.jsonDecoder(p6)
	}))
end

function t.withQuery(p3, p4)
	-- upvalues: urlBuilderModule (ref)
	local t = {}
	
	for i, v in p4 do
		if v ~= nil and v ~= "" then
			t[i] = v
		end
	end
	return if next(t) == nil then p3 else urlBuilderModule.UrlBuilder.addQueryString(p3, t)
end

return t