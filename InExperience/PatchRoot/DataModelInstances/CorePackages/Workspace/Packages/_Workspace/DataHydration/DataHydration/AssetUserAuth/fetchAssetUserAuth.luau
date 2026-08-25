local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpService = game:GetService("HttpService")
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.AssetUserAuthStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p0)
	-- upvalues: urlBase (ref)
	p0 = p0 or {}
	
	return p0.network, p0.baseUrl or urlBase.APIS
end

local _ = function(p1)
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref)
	return (p1 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
end

local _ = function(p2, p3, p4)
	local text = (((("" .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"request\"" .. "\r\n") .. "Content-Type: application/json" .. "\r\n") .. "\r\n") .. p2 .. "\r\n"
	
	if p3 then
		text = ((((text .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"fileContent\"; filename=\"contentToUpload\"" .. "\r\n") .. "Content-Type: " .. (p4 or "application/octet-stream") .. "\r\n") .. "\r\n") .. p3 .. "\r\n"
	end
	return text .. "--" .. "-------PublishServiceCreateAsset" .. "--" .. "\r\n"
end

local createRequest = httpClientModule.createRequest
local encodeRaw = httpClientModule.encodeRaw
local decodeJson = httpClientModule.decodeJson

local function multipartRequest(p5, p6, p7, p8, p9)
	-- upvalues: createRequest (ref), encodeRaw (ref), decodeJson (ref), asPromise (ref)
	return asPromise(createRequest({
		networkImpl = p5,
		method = p6,
		url = p7,
		body = p8,
		headers = {},
		encode = encodeRaw("multipart/form-data; boundary=-------PublishServiceCreateAsset"),
		decode = decodeJson(function(p10)
			return p10
		end),
		analyticsKey = p9
	}))
end

return {
	patchAssetIcon = function(value, p11, p12)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		p12 = p12 or {}
		local _ = p12.network
		
		return asPromise(fetch({
			method = "PATCH",
			analyticsKey = "asset-user-auth.patch-icon",
			network = (p12 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/assets/user-auth/v1/assets/%s?updateMask=icon"):format(p12.baseUrl or urlBase.APIS, value),
			body = p11,
			decode = function(p13)
				return p13
			end
		}))
	end,
	updateIcon = function(p14, p15, p16)
		-- upvalues: urlBase (ref), httpService (ref), multipartRequest (ref), withCsrfRetryModule (ref), httpClientModule (ref)
		p16 = p16 or {}
		local _ = p16.network
		
		return multipartRequest((p16 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()), "PATCH", ("%s/assets/user-auth/v1/assets/%s?updateMask=icon"):format(p16.baseUrl or urlBase.APIS, p14), ((((("" .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"request\"" .. "\r\n") .. "Content-Type: application/json" .. "\r\n") .. "\r\n") .. httpService:JSONEncode({ assetId = tonumber(p14), icon = `assets/{p15}` }) .. "\r\n") .. "--" .. "-------PublishServiceCreateAsset" .. "--" .. "\r\n", "asset-user-auth.update-icon")
	end,
	getPreviews = function(p17, p18)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p18 = p18 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "asset-user-auth.get-previews",
			network = p18.network,
			url = ("%s/assets/user-auth/v1/assets/%s?readMask=previews"):format(p18.baseUrl or urlBase.APIS, p17),
			decode = function(p19)
				return p19.previews or {}
			end
		}))
	end,
	updatePreviews = function(p20, p21, p22)
		-- upvalues: urlBase (ref), httpService (ref), multipartRequest (ref), withCsrfRetryModule (ref), httpClientModule (ref)
		p22 = p22 or {}
		local _ = p22.network
		
		return multipartRequest((p22 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()), "PATCH", ("%s/assets/user-auth/v1/assets/%s?updateMask=previews"):format(p22.baseUrl or urlBase.APIS, p20), ((((("" .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"request\"" .. "\r\n") .. "Content-Type: application/json" .. "\r\n") .. "\r\n") .. httpService:JSONEncode({ assetId = tonumber(p20), previews = p21 }) .. "\r\n") .. "--" .. "-------PublishServiceCreateAsset" .. "--" .. "\r\n", "asset-user-auth.update-previews")
	end,
	createImageAsset = function(value, p23, p24, p25)
		-- upvalues: urlBase (ref), httpService (ref), multipartRequest (ref), withCsrfRetryModule (ref), httpClientModule (ref)
		p25 = p25 or {}
		local _ = p25.network
		p25 = ("%s/assets/user-auth/v1/assets"):format(p25.baseUrl or urlBase.APIS)
		local text = (((("" .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"request\"" .. "\r\n") .. "Content-Type: application/json" .. "\r\n") .. "\r\n") .. httpService:JSONEncode({
			assetType = "Image",
			displayName = p24.displayName or "Game Thumbnail",
			description = p24.description or "Game thumbnail from capture",
			creationContext = {
				creator = if p24.groupId then { groupId = p24.groupId } else { userId = p24.userId or "" }
			}
		}) .. "\r\n"
		
		if value then
			text = ((((text .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"fileContent\"; filename=\"contentToUpload\"" .. "\r\n") .. "Content-Type: " .. (p23 or "application/octet-stream") .. "\r\n") .. "\r\n") .. value .. "\r\n"
		end
		return multipartRequest((p25 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()), "POST", p25, text .. "--" .. "-------PublishServiceCreateAsset" .. "--" .. "\r\n", "asset-user-auth.create-image-asset")
	end,
	fetchOperation = function(p26, p27)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p27 = p27 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "asset-user-auth.get-operation",
			network = p27.network,
			url = ("%s/assets/user-auth/v1/operations/%s"):format(p27.baseUrl or urlBase.APIS, p26),
			decode = function(p28)
				return p28
			end
		}))
	end
}