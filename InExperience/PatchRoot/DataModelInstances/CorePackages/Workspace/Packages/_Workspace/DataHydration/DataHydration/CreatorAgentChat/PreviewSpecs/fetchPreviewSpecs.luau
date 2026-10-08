local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local resolveAcpUrlModule = require(script.Parent.Parent.Env.resolveAcpUrl)
local decodePreviewSpecsModule = require(script.Parent.decodePreviewSpecs)
local _ = require(script.Parent.PreviewSpecsTypes)

local function _()
	-- upvalues: resolveAcpUrlModule (ref), urlBase (ref)
	local sitetestNumber = resolveAcpUrlModule.resolveCreatorAgentAcp().sitetestNumber
	
	return if sitetestNumber == nil then urlBase.APIS else `https://apis.sitetest{sitetestNumber}.robloxlabs.com`
end

return function(p1)
	-- upvalues: httpClientModule (ref), resolveAcpUrlModule (ref), urlBase (ref), decodePreviewSpecsModule (ref)
	p1 = p1 or {}
	local fetch = httpClientModule.fetch
	local t = {
		method = "GET",
		analyticsKey = "build-preview-specs.get",
		retry = false,
		network = p1.network
	}
	local baseUrl = p1.baseUrl
	
	if not baseUrl then
		local sitetestNumber = resolveAcpUrlModule.resolveCreatorAgentAcp().sitetestNumber
		baseUrl = if sitetestNumber ~= nil then urlBase.APIS else `https://apis.sitetest{sitetestNumber}.robloxlabs.com`
	end
	t.url = baseUrl .. "/build-internal-dashboard-api/v1/preview-specs"
	t.decode = decodePreviewSpecsModule
	
	return httpClientModule.asPromise(fetch(t))
end