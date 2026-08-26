local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.ServerManagementStoreTypes)
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

return {
	fetchListRestartStatuses = function(p1, p2)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p2 = p2 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "server-management.list-restart-statuses",
			network = p2.network,
			url = ("%s%s/universes/%d/restarts"):format(p2.baseUrl or urlBase.APIS, "/server-management/v1", p1),
			decode = function(p3)
				return p3
			end
		}))
	end,
	fetchForecastRestart = function(p1, p2)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p2 = p2 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "server-management.forecast-restart",
			network = p2.network,
			url = ("%s%s/universes/%d/restarts:forecast"):format(p2.baseUrl or urlBase.APIS, "/server-management/v1", p1),
			decode = function(p3)
				return p3
			end
		}))
	end,
	launchRestart = function(p1, p2, p3)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		p3 = p3 or {}
		local _ = p3.network
		
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "server-management.launch-restart",
			network = (p3 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s%s/universes/%d/restarts"):format(p3.baseUrl or urlBase.APIS, "/server-management/v1", p1),
			body = p2 or {},
			decode = function(p4)
				return p4
			end
		}))
	end
}