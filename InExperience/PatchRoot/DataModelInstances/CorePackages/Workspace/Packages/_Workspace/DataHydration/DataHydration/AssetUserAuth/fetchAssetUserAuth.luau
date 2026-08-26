local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpService = game:GetService("HttpService")
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.AssetUserAuthStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p1)
	-- upvalues: urlBase (ref)
	p1 = p1 or {}
	
	return p1.network, p1.baseUrl or urlBase.APIS
end

local _ = function(p1)
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref)
	return (p1 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
end

local _ = function(p1, p2, p3)
	local text = (((("" .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"request\"" .. "\r\n") .. "Content-Type: application/json" .. "\r\n") .. "\r\n") .. p2 .. "\r\n"
	
	if p2 then
		text = ((((text .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"fileContent\"; filename=\"contentToUpload\"" .. "\r\n") .. "Content-Type: " .. (p3 or "application/octet-stream") .. "\r\n") .. "\r\n") .. p3 .. "\r\n"
	end
	return text .. "--" .. "-------PublishServiceCreateAsset" .. "--" .. "\r\n"
end

local createRequest = httpClientModule.createRequest
local encodeRaw = httpClientModule.encodeRaw
local decodeJson = httpClientModule.decodeJson

local function multipartRequest(p1, p2, p3, p4, p5)
	-- upvalues: createRequest (ref), encodeRaw (ref), decodeJson (ref), asPromise (ref)
	return asPromise(createRequest({
		networkImpl = p1,
		method = p2,
		url = p3,
		body = p4,
		headers = {},
		encode = encodeRaw("multipart/form-data; boundary=-------PublishServiceCreateAsset"),
		decode = decodeJson(function(p6)
			return p6
		end),
		analyticsKey = p5
	}))
end

return {
	patchAssetIcon = function(value, p1, p2)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		p2 = p2 or {}
		local _ = p2.network
		
		return asPromise(fetch({
			method = "PATCH",
			analyticsKey = "asset-user-auth.patch-icon",
			network = (p2 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/assets/user-auth/v1/assets/%s?updateMask=icon"):format(p2.baseUrl or urlBase.APIS, value),
			body = p1,
			decode = function(p3)
				return p3
			end
		}))
	end,
	updateIcon = function(p1, p2, p3)
		-- upvalues: urlBase (ref), httpService (ref), multipartRequest (ref), withCsrfRetryModule (ref), httpClientModule (ref)
		p3 = p3 or {}
		local _ = p3.network
		
		return multipartRequest((p3 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()), "PATCH", ("%s/assets/user-auth/v1/assets/%s?updateMask=icon"):format(p3.baseUrl or urlBase.APIS, p1), ((((("" .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"request\"" .. "\r\n") .. "Content-Type: application/json" .. "\r\n") .. "\r\n") .. httpService:JSONEncode({ assetId = tonumber(p1), icon = `assets/{p2}` }) .. "\r\n") .. "--" .. "-------PublishServiceCreateAsset" .. "--" .. "\r\n", "asset-user-auth.update-icon")
	end,
	getPreviews = function(p1, p2)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p2 = p2 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "asset-user-auth.get-previews",
			network = p2.network,
			url = ("%s/assets/user-auth/v1/assets/%s?readMask=previews"):format(p2.baseUrl or urlBase.APIS, p1),
			decode = function(p3)
				return p3.previews or {}
			end
		}))
	end,
	updatePreviews = function(p1, p2, p3)
		-- upvalues: urlBase (ref), httpService (ref), multipartRequest (ref), withCsrfRetryModule (ref), httpClientModule (ref)
		p3 = p3 or {}
		local _ = p3.network
		
		return multipartRequest((p3 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()), "PATCH", ("%s/assets/user-auth/v1/assets/%s?updateMask=previews"):format(p3.baseUrl or urlBase.APIS, p1), ((((("" .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"request\"" .. "\r\n") .. "Content-Type: application/json" .. "\r\n") .. "\r\n") .. httpService:JSONEncode({ assetId = tonumber(p1), previews = p2 }) .. "\r\n") .. "--" .. "-------PublishServiceCreateAsset" .. "--" .. "\r\n", "asset-user-auth.update-previews")
	end,
	createImageAsset = function(value, p1, p2, p3)
		-- upvalues: urlBase (ref), httpService (ref), multipartRequest (ref), withCsrfRetryModule (ref), httpClientModule (ref)
		p3 = p3 or {}
		local _ = p3.network
		p3 = ("%s/assets/user-auth/v1/assets"):format(p3.baseUrl or urlBase.APIS)
		local text = (((("" .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"request\"" .. "\r\n") .. "Content-Type: application/json" .. "\r\n") .. "\r\n") .. httpService:JSONEncode({
			assetType = "Image",
			displayName = p2.displayName or "Game Thumbnail",
			description = p2.description or "Game thumbnail from capture",
			creationContext = {
				creator = if p2.groupId then { groupId = p2.groupId } else { userId = p2.userId or "" }
			}
		}) .. "\r\n"
		
		if value then
			text = ((((text .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"fileContent\"; filename=\"contentToUpload\"" .. "\r\n") .. "Content-Type: " .. (p1 or "application/octet-stream") .. "\r\n") .. "\r\n") .. value .. "\r\n"
		end
		return multipartRequest((p3 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()), "POST", p3, text .. "--" .. "-------PublishServiceCreateAsset" .. "--" .. "\r\n", "asset-user-auth.create-image-asset")
	end,
	fetchOperation = function(p1, p2)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p2 = p2 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "asset-user-auth.get-operation",
			network = p2.network,
			url = ("%s/assets/user-auth/v1/operations/%s"):format(p2.baseUrl or urlBase.APIS, p1),
			decode = function(p3)
				return p3
			end
		}))
	end
}