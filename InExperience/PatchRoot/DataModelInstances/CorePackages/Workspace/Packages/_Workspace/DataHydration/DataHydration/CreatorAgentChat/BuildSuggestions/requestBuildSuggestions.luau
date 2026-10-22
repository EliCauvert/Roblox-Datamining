local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local DecodeBuildSuggestionsResponseModule = require(script.Parent.decodeBuildSuggestionsResponse)
local GetDefaultAuthHeadersModule = require(script.Parent.Parent.Acp.getDefaultAuthHeaders)
local ResolveAcpUrlModule = require(script.Parent.Parent.Env.resolveAcpUrl)
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)

local function _(): string
	-- upvalues: ResolveAcpUrlModule (copy), UrlBase (copy)
	local SitetestNumber = ResolveAcpUrlModule.resolveCreatorAgentAcp().sitetestNumber
	
	return if SitetestNumber == nil then UrlBase.APIS .. "/creator-agents-service/v1/build/suggestions" else `https://apis.sitetest{SitetestNumber}.robloxlabs.com/creator-agents-service/v1/build/suggestions`
end

return function(p1)
	-- upvalues: GetDefaultAuthHeadersModule (copy), ResolveAcpUrlModule (copy), UrlBase (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), DecodeBuildSuggestionsResponseModule (copy)
	local GetAuthHeaders = p1.getAuthHeaders or GetDefaultAuthHeadersModule
	local Config = if p1.selectedChip == nil then nil else { value = p1.selectedChip }
	local config = { method = "POST", analyticsKey = "cas.build-suggestions" }
	local Url = p1.url
	
	if not Url then
		local SitetestNumber = ResolveAcpUrlModule.resolveCreatorAgentAcp().sitetestNumber
		Url = if SitetestNumber == nil then UrlBase.APIS .. "/creator-agents-service/v1/build/suggestions" else `https://apis.sitetest{SitetestNumber}.robloxlabs.com/creator-agents-service/v1/build/suggestions`
	end
	config.url = Url
	config.headers = GetAuthHeaders()
	config.body = { prompt = p1.prompt, selected_chip = Config }
	config.network = p1.network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork())
	config.decode = DecodeBuildSuggestionsResponseModule
	
	return HttpClientModule.fetch(config)
end