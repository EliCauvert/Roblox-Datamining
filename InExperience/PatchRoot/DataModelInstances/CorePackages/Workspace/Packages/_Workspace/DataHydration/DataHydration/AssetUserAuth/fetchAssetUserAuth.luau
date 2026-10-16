local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpService = game:GetService("HttpService")
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)
local _ = require(script.Parent.AssetUserAuthStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function _(p1) --[[ Line: 27 | Named "resolveBase" ]]
	-- upvalues: UrlBase (copy)
	local P0 = p1 or {}
	
	return P0.network, P0.baseUrl or UrlBase.APIS
end

local _ = function(p1) --[[ Line: 32 | Named "resolveMutatingNetwork" ]]
	-- upvalues: WithCsrfRetryModule (copy), HttpClientModule (copy)
	return (p1 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork())
end

local _ = function(Text, Text1, p1): string --[[ Line: 37 | Named "buildMultipartBody" ]]
	local Text2 = (((("" .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"request\"" .. "\r\n") .. "Content-Type: application/json" .. "\r\n") .. "\r\n") .. Text .. "\r\n"
	
	if Text1 then
		Text2 = ((((Text2 .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"fileContent\"; filename=\"contentToUpload\"" .. "\r\n") .. "Content-Type: " .. (p1 or "application/octet-stream") .. "\r\n") .. "\r\n") .. Text1 .. "\r\n"
	end
	return Text2 .. "--" .. "-------PublishServiceCreateAsset" .. "--" .. "\r\n"
end

local CreateRequestFunction = HttpClientModule.createRequest
local EncodeRawFunction = HttpClientModule.encodeRaw
local DecodeJsonFunction = HttpClientModule.decodeJson

local function multipartRequest(Network, Method, UpdateMaskName, Body, AnalyticsKey) --[[ Line: 59 ]]
	-- upvalues: CreateRequestFunction (copy), EncodeRawFunction (copy), DecodeJsonFunction (copy), AsPromiseFunction (copy)
	return AsPromiseFunction((CreateRequestFunction({
		networkImpl = Network,
		method = Method,
		url = UpdateMaskName,
		body = Body,
		headers = {},
		encode = EncodeRawFunction("multipart/form-data; boundary=-------PublishServiceCreateAsset"),
		decode = DecodeJsonFunction(function(p1) --[[ Line: 73 ]]
			return p1
		end),
		analyticsKey = AnalyticsKey
	})))
end

return {
	patchAssetIcon = function(p1, Body, p2) --[[ Line: 83 ]]
		-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), AsPromiseFunction (copy)
		local P13 = p2 or {}
		local _ = P13.network
		
		return AsPromiseFunction((FetchFunction({
			method = "PATCH",
			analyticsKey = "asset-user-auth.patch-icon",
			network = (p2 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = ("%s/assets/user-auth/v1/assets/%s?updateMask=icon"):format(P13.baseUrl or UrlBase.APIS, p1),
			body = Body,
			decode = function(p3) --[[ Line: 96 ]]
				return p3
			end
		})))
	end,
	updateIcon = function(p1, p2, p3) --[[ Line: 103 ]]
		-- upvalues: UrlBase (copy), HttpService (copy), multipartRequest (copy), WithCsrfRetryModule (copy), HttpClientModule (copy)
		local P17 = p3 or {}
		local _ = P17.network
		
		return multipartRequest((p3 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()), "PATCH", ("%s/assets/user-auth/v1/assets/%s?updateMask=icon"):format(P17.baseUrl or UrlBase.APIS, p1), ((((("" .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"request\"" .. "\r\n") .. "Content-Type: application/json" .. "\r\n") .. "\r\n") .. HttpService:JSONEncode({ assetId = tonumber(p1), icon = `assets/{p2}` }) .. "\r\n") .. "--" .. "-------PublishServiceCreateAsset" .. "--" .. "\r\n", "asset-user-auth.update-icon")
	end,
	getPreviews = function(p1, p2) --[[ Line: 118 ]]
		-- upvalues: UrlBase (copy), FetchFunction (copy), AsPromiseFunction (copy)
		local P19 = p2 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "asset-user-auth.get-previews",
			network = P19.network,
			url = ("%s/assets/user-auth/v1/assets/%s?readMask=previews"):format(P19.baseUrl or UrlBase.APIS, p1),
			decode = function(p3) --[[ Line: 126 ]]
				return p3.previews or {}
			end
		})))
	end,
	updatePreviews = function(p1, Previews, p2) --[[ Line: 133 ]]
		-- upvalues: UrlBase (copy), HttpService (copy), multipartRequest (copy), WithCsrfRetryModule (copy), HttpClientModule (copy)
		local P23 = p2 or {}
		local _ = P23.network
		
		return multipartRequest((p2 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()), "PATCH", ("%s/assets/user-auth/v1/assets/%s?updateMask=previews"):format(P23.baseUrl or UrlBase.APIS, p1), ((((("" .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"request\"" .. "\r\n") .. "Content-Type: application/json" .. "\r\n") .. "\r\n") .. HttpService:JSONEncode({ assetId = tonumber(p1), previews = Previews }) .. "\r\n") .. "--" .. "-------PublishServiceCreateAsset" .. "--" .. "\r\n", "asset-user-auth.update-previews")
	end,
	createImageAsset = function(Text, p1, p2, p3) --[[ Line: 148 ]]
		-- upvalues: UrlBase (copy), HttpService (copy), multipartRequest (copy), WithCsrfRetryModule (copy), HttpClientModule (copy)
		local P27 = p3 or {}
		local _ = P27.network
		local AssetsName: string = ("%s/assets/user-auth/v1/assets"):format(P27.baseUrl or UrlBase.APIS)
		local Text1 = (((("" .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"request\"" .. "\r\n") .. "Content-Type: application/json" .. "\r\n") .. "\r\n") .. HttpService:JSONEncode({
			assetType = "Image",
			displayName = p2.displayName or "Game Thumbnail",
			description = p2.description or "Game thumbnail from capture",
			creationContext = {
				creator = if p2.groupId then { groupId = p2.groupId } else { userId = p2.userId or "" }
			}
		}) .. "\r\n"
		
		if Text then
			Text1 = ((((Text1 .. "--" .. "-------PublishServiceCreateAsset" .. "\r\n") .. "Content-Disposition: form-data; name=\"fileContent\"; filename=\"contentToUpload\"" .. "\r\n") .. "Content-Type: " .. (p1 or "application/octet-stream") .. "\r\n") .. "\r\n") .. Text .. "\r\n"
		end
		return multipartRequest((p3 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()), "POST", AssetsName, Text1 .. "--" .. "-------PublishServiceCreateAsset" .. "--" .. "\r\n", "asset-user-auth.create-image-asset")
	end,
	fetchOperation = function(p1, p2) --[[ Line: 169 ]]
		-- upvalues: UrlBase (copy), FetchFunction (copy), AsPromiseFunction (copy)
		local P29 = p2 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "asset-user-auth.get-operation",
			network = P29.network,
			url = ("%s/assets/user-auth/v1/operations/%s"):format(P29.baseUrl or UrlBase.APIS, p1),
			decode = function(p3) --[[ Line: 177 ]]
				return p3
			end
		})))
	end
}