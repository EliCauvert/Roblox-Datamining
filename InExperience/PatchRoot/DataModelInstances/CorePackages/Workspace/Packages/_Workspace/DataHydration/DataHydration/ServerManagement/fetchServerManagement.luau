local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.ServerManagementStoreTypes)
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

return {
	fetchListRestartStatuses = function(p2, p3)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p3 = p3 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "server-management.list-restart-statuses",
			network = p3.network,
			url = ("%s%s/universes/%d/restarts"):format(p3.baseUrl or urlBase.APIS, "/server-management/v1", p2),
			decode = function(p4)
				return p4
			end
		}))
	end,
	fetchForecastRestart = function(p5, p6)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p6 = p6 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "server-management.forecast-restart",
			network = p6.network,
			url = ("%s%s/universes/%d/restarts:forecast"):format(p6.baseUrl or urlBase.APIS, "/server-management/v1", p5),
			decode = function(p7)
				return p7
			end
		}))
	end,
	launchRestart = function(p8, p9, p10)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		p10 = p10 or {}
		local _ = p10.network
		
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "server-management.launch-restart",
			network = (p10 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s%s/universes/%d/restarts"):format(p10.baseUrl or urlBase.APIS, "/server-management/v1", p8),
			body = p9 or {},
			decode = function(p11)
				return p11
			end
		}))
	end
}