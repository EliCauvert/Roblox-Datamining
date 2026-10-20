local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)
local _ = require(script.Parent.ServerManagementStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function _(p1)
	-- upvalues: UrlBase (copy)
	local P0 = p1 or {}
	
	return P0.network, P0.baseUrl or UrlBase.APIS
end

local _ = function(p1)
	-- upvalues: WithCsrfRetryModule (copy), HttpClientModule (copy)
	return (p1 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork())
end

return {
	fetchListRestartStatuses = function(p1, p2)
		-- upvalues: UrlBase (copy), FetchFunction (copy), AsPromiseFunction (copy)
		local P3 = p2 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "server-management.list-restart-statuses",
			network = P3.network,
			url = ("%s%s/universes/%d/restarts"):format(P3.baseUrl or UrlBase.APIS, "/server-management/v1", p1),
			decode = function(p3)
				return p3
			end
		})))
	end,
	fetchForecastRestart = function(p1, p2)
		-- upvalues: UrlBase (copy), FetchFunction (copy), AsPromiseFunction (copy)
		local P6 = p2 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "server-management.forecast-restart",
			network = P6.network,
			url = ("%s%s/universes/%d/restarts:forecast"):format(P6.baseUrl or UrlBase.APIS, "/server-management/v1", p1),
			decode = function(p3)
				return p3
			end
		})))
	end,
	launchRestart = function(p1, p2, p3)
		-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), AsPromiseFunction (copy)
		local P10 = p3 or {}
		local _ = P10.network
		
		return AsPromiseFunction((FetchFunction({
			method = "POST",
			analyticsKey = "server-management.launch-restart",
			network = (p3 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = ("%s%s/universes/%d/restarts"):format(P10.baseUrl or UrlBase.APIS, "/server-management/v1", p1),
			body = p2 or {},
			decode = function(p4)
				return p4
			end
		})))
	end
}