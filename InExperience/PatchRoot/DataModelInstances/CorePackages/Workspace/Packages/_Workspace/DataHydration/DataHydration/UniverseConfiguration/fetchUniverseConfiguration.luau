local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.UniverseConfigurationStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p1, p2)
	return ("%s/v1/universes/%d"):format(p1, p2)
end

local _ = function(p1, p2)
	return ("%s/v1/universes/%d/configuration"):format(p1, p2)
end

local _ = function(p1, p2)
	return ("%s/v2/universes/%d/configuration"):format(p1, p2)
end

local _ = function(p1, p2)
	return ("%s/v1/universes/%d/teamcreate"):format(p1, p2)
end

local _ = function(p1)
	-- upvalues: urlBase (ref)
	p1 = p1 or {}
	
	return p1.network, p1.baseUrl or urlBase.new("develop")
end

local _ = function(p1)
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref)
	return (p1 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
end

return {
	fetchSummary = function(p1, p2)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p2 = p2 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "universe-configuration.get-summary",
			legacy = true,
			network = p2.network,
			url = ("%s/v1/universes/%d"):format(p2.baseUrl or urlBase.new("develop"), p1),
			decode = function(p3)
				return p3
			end
		}))
	end,
	fetchConfiguration = function(p1, p2)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p2 = p2 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "universe-configuration.get-configuration",
			legacy = true,
			network = p2.network,
			url = ("%s/v1/universes/%d/configuration"):format(p2.baseUrl or urlBase.new("develop"), p1),
			decode = function(p3)
				return p3
			end
		}))
	end,
	patchConfiguration = function(p1, p2, p3)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		p3 = p3 or {}
		local _ = p3.network
		
		return asPromise(fetch({
			method = "PATCH",
			analyticsKey = "universe-configuration.patch-configuration",
			legacy = true,
			network = (p3 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/v2/universes/%d/configuration"):format(p3.baseUrl or urlBase.new("develop"), p1),
			body = p2,
			decode = function(p4)
				if p4.studioAccessToApisAllowed ~= nil then
					p4.isStudioAccessToApisAllowed = p4.studioAccessToApisAllowed
				end
				return p4
			end
		}))
	end,
	fetchTeamCreate = function(p1, p2)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p2 = p2 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "universe-configuration.get-team-create",
			legacy = true,
			network = p2.network,
			url = ("%s/v1/universes/%d/teamcreate"):format(p2.baseUrl or urlBase.new("develop"), p1),
			decode = function(p3)
				return p3
			end
		}))
	end,
	setTeamCreate = function(value, p1, p2)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		p2 = p2 or {}
		local _ = p2.network
		
		return asPromise(fetch({
			method = "PATCH",
			analyticsKey = "universe-configuration.set-team-create",
			legacy = true,
			network = (p2 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/teamcreate"):format(p2.baseUrl or urlBase.new("develop"), value),
			body = { isEnabled = p1 },
			decode = function(_)
				-- upvalues: p1 (ref)
				return { isEnabled = p1 }
			end
		}))
	end
}