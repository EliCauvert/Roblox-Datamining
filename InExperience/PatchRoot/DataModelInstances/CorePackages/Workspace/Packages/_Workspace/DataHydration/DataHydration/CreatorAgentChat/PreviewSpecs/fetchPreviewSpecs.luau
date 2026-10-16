local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local ResolveAcpUrlModule = require(script.Parent.Parent.Env.resolveAcpUrl)
local DecodePreviewSpecsModule = require(script.Parent.decodePreviewSpecs)
local _ = require(script.Parent.PreviewSpecsTypes)

local function _() --[[ Line: 21 | Named "getDefaultBaseUrl" ]]
	-- upvalues: ResolveAcpUrlModule (copy), UrlBase (copy)
	local SitetestNumber = ResolveAcpUrlModule.resolveCreatorAgentAcp().sitetestNumber
	
	return if SitetestNumber == nil then UrlBase.APIS else `https://apis.sitetest{SitetestNumber}.robloxlabs.com`
end

return function(p1) --[[ Line: 29 | Named "fetchPreviewSpecs" ]]
	-- upvalues: HttpClientModule (copy), ResolveAcpUrlModule (copy), UrlBase (copy), DecodePreviewSpecsModule (copy)
	local P0 = p1 or {}
	local FetchFunction = HttpClientModule.fetch
	local config = {
		method = "GET",
		analyticsKey = "build-preview-specs.get",
		retry = false,
		network = P0.network
	}
	local BaseUrl = P0.baseUrl
	
	if not BaseUrl then
		local SitetestNumber = ResolveAcpUrlModule.resolveCreatorAgentAcp().sitetestNumber
		BaseUrl = if SitetestNumber == nil then UrlBase.APIS else `https://apis.sitetest{SitetestNumber}.robloxlabs.com`
	end
	config.url = BaseUrl .. "/build-internal-dashboard-api/v1/preview-specs"
	config.decode = DecodePreviewSpecsModule
	
	return HttpClientModule.asPromise((FetchFunction(config)))
end