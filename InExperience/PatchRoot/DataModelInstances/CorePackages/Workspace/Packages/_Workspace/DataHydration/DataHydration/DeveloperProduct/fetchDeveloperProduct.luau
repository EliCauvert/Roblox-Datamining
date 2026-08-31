local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpService = game:GetService("HttpService")
local httpClientModule = require(parent.HttpClient)
local urlBuilderModule = require(parent.UrlBuilder)
local urlBase = urlBuilderModule.UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.DeveloperProductStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise
local createRequest = httpClientModule.createRequest
local encodeRaw = httpClientModule.encodeRaw

local function _(p1)
	-- upvalues: urlBase (ref)
	p1 = p1 or {}
	
	return p1.network, p1.baseUrl or urlBase.APIS
end

local _ = function(p1)
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref)
	return (p1 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
end

local function collectionUrl(p1, p2)
	return ("%s/developer-products/v2/universes/%d/developer-products"):format(p1, p2)
end

local _ = function(p1, p2)
	-- upvalues: collectionUrl (ref)
	return ("%s/creator"):format(collectionUrl(p1, p2))
end

local _ = function(p1, p2, p3)
	return ("%s/%d/creator"):format(("%s/developer-products/v2/universes/%d/developer-products"):format(p1, p2), p3)
end

local _ = function(p1, p2, p3)
	return ("%s/%d"):format(("%s/developer-products/v2/universes/%d/developer-products"):format(p1, p2), p3)
end

local _ = function(p1, p2)
	return p1 .. "--" .. "-------DeveloperProductFormBoundary" .. "\r\n" .. ("Content-Disposition: form-data; name=\"%s\""):format(p2.name) .. "\r\n" .. "\r\n" .. p13.value .. "\r\n"
end

local _ = function(p1)
	local var1 = ""
	
	for i, v in p1 do
		var1 ..= "--" .. "-------DeveloperProductFormBoundary" .. "\r\n" .. ("Content-Disposition: form-data; name=\"%s\""):format(v.name) .. "\r\n" .. "\r\n" .. v.value .. "\r\n"
	end
	return var1 .. "--" .. "-------DeveloperProductFormBoundary" .. "--" .. "\r\n"
end

local function requestParts(p2)
	local t = {}
	
	if p2.name ~= nil then
		table.insert(t, { name = "name", value = p2.name })
	end
	if p2.description ~= nil then
		table.insert(t, { name = "description", value = p2.description })
	end
	if p2.priceInRobux ~= nil then
		table.insert(t, { name = "price", value = tostring(p2.priceInRobux) })
	end
	if p2.isForSale ~= nil then
		table.insert(t, { name = "isForSale", value = tostring(p2.isForSale) })
	end
	if p2.isManagedPricingEnabled ~= nil then
		table.insert(t, {
			name = "isManagedPricingEnabled",
			value = tostring(p2.isManagedPricingEnabled)
		})
	end
	return t
end

local _ = function(p2)
	-- upvalues: httpService (ref)
	if p2 == nil or p2 == "" then
		return nil
	end
	local ok, status = pcall(httpService.JSONDecode, httpService, if typeof(p2) == "buffer" then buffer.tostring(p2) else p2)
	
	return if ok then status else nil
end

local _ = function(p2)
	return p2 >= 200 and p2 < 300
end

local function errorFrom(p2)
	-- upvalues: httpService (ref)
	local var2
	local responseBody = p2.responseBody
	
	if responseBody == nil or responseBody == "" then
		var2 = nil
	else
		local ok, status = pcall(httpService.JSONDecode, httpService, if typeof(responseBody) == "buffer" then buffer.tostring(responseBody) else responseBody)
		var2 = if ok then status else nil
	end
	if typeof(var2) == "table" then
		responseBody = var2.errorMessage or var2.message
		
		if typeof(responseBody) == "string" then
			return responseBody, p2.statusCode
		end
	end
	return ("http %d: %s"):format(p2.statusCode, if typeof(p2.responseBody) == "buffer" then buffer.tostring(p2.responseBody) else p2.responseBody or ""), p2.statusCode
end

local function decodeConfig(p2)
	-- upvalues: errorFrom (ref), httpService (ref)
	local statusCode = p2.statusCode
	
	if not (statusCode >= 200 and statusCode < 300) then
		local var2, var3 = errorFrom(p2)
		
		return nil, var2, var3
	end
	local var4
	local responseBody = p2.responseBody
	
	if responseBody == nil or responseBody == "" then
		var4 = nil
	else
		local ok, status = pcall(httpService.JSONDecode, httpService, if typeof(responseBody) == "buffer" then buffer.tostring(responseBody) else responseBody)
		var4 = if ok then status else nil
	end
	return var4, nil, nil
end

local _ = function(p2)
	-- upvalues: errorFrom (ref)
	return function(p3)
		-- upvalues: errorFrom (copy), p2 (ref)
		local statusCode = p3.statusCode
		
		if statusCode >= 200 and statusCode < 300 then
			return p2(), nil, nil
		end
		local var2, var3 = errorFrom(p3)
		
		return nil, var2, var3
	end
end

local function multipartRequest(p2, p3, p4, p5, p6, p7)
	-- upvalues: createRequest (ref), encodeRaw (ref), asPromise (ref)
	local t = { networkImpl = p2, method = p3, url = p4 }
	local var2 = ""
	
	for i, v in p5 do
		var2 ..= "--" .. "-------DeveloperProductFormBoundary" .. "\r\n" .. ("Content-Disposition: form-data; name=\"%s\""):format(v.name) .. "\r\n" .. "\r\n" .. v.value .. "\r\n"
	end
	t.body = var2 .. "--" .. "-------DeveloperProductFormBoundary" .. "--" .. "\r\n"
	t.headers = {}
	t.encode = encodeRaw("multipart/form-data; boundary=-------DeveloperProductFormBoundary")
	t.decode = p7
	t.analyticsKey = p6
	
	return asPromise(createRequest(t))
end

local t = {}

local function listPage(p8, p9, p10)
	-- upvalues: urlBase (ref), collectionUrl (ref), urlBuilderModule (ref), fetch (ref), asPromise (ref)
	p10 = p10 or {}
	local network = p10.network
	p10 = ("%s/creator"):format(collectionUrl(p10.baseUrl or urlBase.APIS, p8))
	
	if p9 ~= nil and p9 ~= "" then
		p10 = urlBuilderModule.UrlBuilder.addQueryString(p10, { pageToken = p9 })
	end
	return asPromise(fetch({
		method = "GET",
		analyticsKey = "developer-product.list",
		network = network,
		url = p10,
		decode = function(p11)
			return p11
		end
	}))
end

function t.list(p8, p9)
	-- upvalues: listPage (ref)
	local t = {}
	
	local function fetchNext(p10, p11)
		-- upvalues: listPage (copy), p8 (ref), p9 (ref), t (ref), fetchNext (ref)
		return listPage(p8, p10, p9):andThen(function(p12)
			-- upvalues: t (copy), p11 (ref), fetchNext (copy)
			for i, v in p12.developerProducts do
				table.insert(t, v)
			end
			local nextPageToken = p12.nextPageToken
			
			return if nextPageToken == nil or nextPageToken == "" or p11 >= 50 then {
				developerProducts = t,
				nextPageToken = if p11 >= 50 then nextPageToken else nil
			} else fetchNext(nextPageToken, p11 + 1)
		end)
	end
	
	return fetchNext(nil, 1)
end

function t.get(p10, p11, p12)
	-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
	p12 = p12 or {}
	
	return asPromise(fetch({
		method = "GET",
		analyticsKey = "developer-product.get",
		network = p12.network,
		url = ("%s/%d/creator"):format(("%s/developer-products/v2/universes/%d/developer-products"):format(p12.baseUrl or urlBase.APIS, p10), p11),
		decode = function(p13)
			return p13
		end
	}))
end

function t.create(p10, p11, p12)
	-- upvalues: urlBase (ref), requestParts (ref), multipartRequest (ref), withCsrfRetryModule (ref), httpClientModule (ref), decodeConfig (ref)
	p12 = p12 or {}
	local _ = p12.network
	
	return multipartRequest((p12 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()), "POST", ("%s/developer-products/v2/universes/%d/developer-products"):format(p12.baseUrl or urlBase.APIS, p10), requestParts({
		name = p11.name,
		description = p11.description,
		priceInRobux = p11.priceInRobux,
		isForSale = if p11.isForSale ~= nil then false else p11.isForSale,
		isManagedPricingEnabled = p11.isManagedPricingEnabled
	}), "developer-product.create", decodeConfig)
end

function t.update(p10, p11, p12, p13)
	-- upvalues: urlBase (ref), requestParts (ref), multipartRequest (ref), withCsrfRetryModule (ref), httpClientModule (ref), errorFrom (ref)
	p13 = p13 or {}
	local _ = p13.network
	
	local var3 = function()
		-- upvalues: p11 (ref), p12 (ref)
		return {
			productId = p11,
			name = p12.name,
			description = p12.description,
			isForSale = p12.isForSale,
			isManagedPricingEnabled = p12.isManagedPricingEnabled,
			priceInformation = if p12.priceInRobux ~= nil then nil else { defaultPriceInRobux = p12.priceInRobux }
		}
	end
	
	return multipartRequest((p13 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()), "PATCH", ("%s/%d"):format(("%s/developer-products/v2/universes/%d/developer-products"):format(p13.baseUrl or urlBase.APIS, p10), p11), requestParts(p12), "developer-product.update", function(p14)
		-- upvalues: errorFrom (copy), var3 (ref)
		local statusCode = p14.statusCode
		
		if statusCode >= 200 and statusCode < 300 then
			return var3(), nil, nil
		end
		local var4, var5 = errorFrom(p14)
		
		return nil, var4, var5
	end)
end

function t.setForSale(value, p10, p11, p12)
	-- upvalues: urlBase (ref), multipartRequest (ref), withCsrfRetryModule (ref), httpClientModule (ref), errorFrom (ref)
	p12 = p12 or {}
	local _ = p12.network
	
	local var3 = function()
		-- upvalues: p10 (ref), p11 (ref)
		return { productId = p10, isForSale = p11 }
	end
	
	return multipartRequest((p12 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()), "PATCH", ("%s/%d"):format(("%s/developer-products/v2/universes/%d/developer-products"):format(p12.baseUrl or urlBase.APIS, value), p10), { { name = "isForSale", value = tostring(p11) } }, "developer-product.set-for-sale", function(p13)
		-- upvalues: errorFrom (copy), var3 (ref)
		local statusCode = p13.statusCode
		
		if statusCode >= 200 and statusCode < 300 then
			return var3(), nil, nil
		end
		local var4, var5 = errorFrom(p13)
		
		return nil, var4, var5
	end)
end

function t.activate(p10, p11, p12)
	-- upvalues: t (ref)
	return t.setForSale(p10, p11, true, p12)
end

function t.deactivate(p10, p11, p12)
	-- upvalues: t (ref)
	return t.setForSale(p10, p11, false, p12)
end

return t