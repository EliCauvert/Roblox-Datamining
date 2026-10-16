local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)
local _ = require(script.Parent.UniverseConfigurationStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function _(p1, p2): string --[[ Line: 16 | Named "summaryUrl" ]]
	return ("%s/v1/universes/%d"):format(p1, p2)
end

local _ = function(p1, p2): string --[[ Line: 20 | Named "configurationUrl" ]]
	return ("%s/v1/universes/%d/configuration"):format(p1, p2)
end

local _ = function(p1, p2): string --[[ Line: 24 | Named "patchConfigurationUrl" ]]
	return ("%s/v2/universes/%d/configuration"):format(p1, p2)
end

local _ = function(p1, p2): string --[[ Line: 28 | Named "teamCreateUrl" ]]
	return ("%s/v1/universes/%d/teamcreate"):format(p1, p2)
end

local _ = function(p1) --[[ Line: 34 | Named "resolveBase" ]]
	-- upvalues: UrlBase (copy)
	local P8 = p1 or {}
	
	return P8.network, P8.baseUrl or UrlBase.new("develop")
end

local _ = function(p1) --[[ Line: 40 | Named "resolveMutatingNetwork" ]]
	-- upvalues: WithCsrfRetryModule (copy), HttpClientModule (copy)
	return (p1 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork())
end

return {
	fetchSummary = function(p1, p2) --[[ Line: 47 ]]
		-- upvalues: UrlBase (copy), FetchFunction (copy), AsPromiseFunction (copy)
		local P11 = p2 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "universe-configuration.get-summary",
			legacy = true,
			network = P11.network,
			url = ("%s/v1/universes/%d"):format(P11.baseUrl or UrlBase.new("develop"), p1),
			decode = function(p3) --[[ Line: 58 ]]
				return p3
			end
		})))
	end,
	fetchConfiguration = function(p1, p2) --[[ Line: 65 ]]
		-- upvalues: UrlBase (copy), FetchFunction (copy), AsPromiseFunction (copy)
		local P14 = p2 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "universe-configuration.get-configuration",
			legacy = true,
			network = P14.network,
			url = ("%s/v1/universes/%d/configuration"):format(P14.baseUrl or UrlBase.new("develop"), p1),
			decode = function(p3) --[[ Line: 76 ]]
				return p3
			end
		})))
	end,
	patchConfiguration = function(p1, Body, p2) --[[ Line: 83 ]]
		-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), AsPromiseFunction (copy)
		local P18 = p2 or {}
		local _ = P18.network
		
		return AsPromiseFunction((FetchFunction({
			method = "PATCH",
			analyticsKey = "universe-configuration.patch-configuration",
			legacy = true,
			network = (p2 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = ("%s/v2/universes/%d/configuration"):format(P18.baseUrl or UrlBase.new("develop"), p1),
			body = Body,
			decode = function(p3) --[[ Line: 96 ]]
				if p3.studioAccessToApisAllowed ~= nil then
					p3.isStudioAccessToApisAllowed = p3.studioAccessToApisAllowed
				end
				return p3
			end
		})))
	end,
	fetchTeamCreate = function(p1, p2) --[[ Line: 107 ]]
		-- upvalues: UrlBase (copy), FetchFunction (copy), AsPromiseFunction (copy)
		local P21 = p2 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "universe-configuration.get-team-create",
			legacy = true,
			network = P21.network,
			url = ("%s/v1/universes/%d/teamcreate"):format(P21.baseUrl or UrlBase.new("develop"), p1),
			decode = function(p3) --[[ Line: 118 ]]
				return p3
			end
		})))
	end,
	setTeamCreate = function(p1, IsEnabled, p2) --[[ Line: 125 ]]
		-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), AsPromiseFunction (copy)
		local P25 = p2 or {}
		local _ = P25.network
		
		return AsPromiseFunction((FetchFunction({
			method = "PATCH",
			analyticsKey = "universe-configuration.set-team-create",
			legacy = true,
			network = (p2 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/teamcreate"):format(P25.baseUrl or UrlBase.new("develop"), p1),
			body = { isEnabled = IsEnabled },
			decode = function(_) --[[ Line: 139 ]]
				-- upvalues: IsEnabled (copy)
				return { isEnabled = IsEnabled }
			end
		})))
	end
}