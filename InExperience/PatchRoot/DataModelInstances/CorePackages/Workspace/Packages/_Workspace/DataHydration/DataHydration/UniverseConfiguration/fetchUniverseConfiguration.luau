local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.UniverseConfigurationStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p0, p1) --[[ line: 17 | named "summaryUrl" ]]
	return ("%s/v1/universes/%d"):format(p0, p1)
end

local _ = function(p2, p3) --[[ line: 21 | named "configurationUrl" ]]
	return ("%s/v1/universes/%d/configuration"):format(p2, p3)
end

local _ = function(p4, p5) --[[ line: 25 | named "patchConfigurationUrl" ]]
	return ("%s/v2/universes/%d/configuration"):format(p4, p5)
end

local _ = function(p6, p7) --[[ line: 29 | named "teamCreateUrl" ]]
	return ("%s/v1/universes/%d/teamcreate"):format(p6, p7)
end

local _ = function(p8) --[[ line: 35 | named "resolveBase" ]]
	-- upvalues: urlBase (ref)
	p8 = p8 or {}
	
	return p8.network, p8.baseUrl or urlBase.new("develop")
end

local _ = function(p9) --[[ line: 41 | named "resolveMutatingNetwork" ]]
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref)
	return (p9 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
end

return {
	fetchSummary = function(p10, p11) --[[ line: 48 ]]
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p11 = p11 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "universe-configuration.get-summary",
			legacy = true,
			network = p11.network,
			url = ("%s/v1/universes/%d"):format(p11.baseUrl or urlBase.new("develop"), p10),
			decode = function(p12) --[[ line: 59 ]]
				return p12
			end
		}))
	end,
	fetchConfiguration = function(p13, p14) --[[ line: 66 ]]
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p14 = p14 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "universe-configuration.get-configuration",
			legacy = true,
			network = p14.network,
			url = ("%s/v1/universes/%d/configuration"):format(p14.baseUrl or urlBase.new("develop"), p13),
			decode = function(p15) --[[ line: 77 ]]
				return p15
			end
		}))
	end,
	patchConfiguration = function(p16, p17, p18) --[[ line: 84 ]]
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		p18 = p18 or {}
		local _ = p18.network
		
		return asPromise(fetch({
			method = "PATCH",
			analyticsKey = "universe-configuration.patch-configuration",
			legacy = true,
			network = (p18 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/v2/universes/%d/configuration"):format(p18.baseUrl or urlBase.new("develop"), p16),
			body = p17,
			decode = function(p19) --[[ line: 97 ]]
				if p19.studioAccessToApisAllowed ~= nil then
					p19.isStudioAccessToApisAllowed = p19.studioAccessToApisAllowed
				end
				return p19
			end
		}))
	end,
	fetchTeamCreate = function(p20, p21) --[[ line: 108 ]]
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p21 = p21 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "universe-configuration.get-team-create",
			legacy = true,
			network = p21.network,
			url = ("%s/v1/universes/%d/teamcreate"):format(p21.baseUrl or urlBase.new("develop"), p20),
			decode = function(p22) --[[ line: 119 ]]
				return p22
			end
		}))
	end,
	setTeamCreate = function(value, p23, p24) --[[ line: 126 ]]
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		p24 = p24 or {}
		local _ = p24.network
		
		return asPromise(fetch({
			method = "PATCH",
			analyticsKey = "universe-configuration.set-team-create",
			legacy = true,
			network = (p24 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/teamcreate"):format(p24.baseUrl or urlBase.new("develop"), value),
			body = { isEnabled = p23 },
			decode = function(_) --[[ line: 140 ]]
				-- upvalues: p23 (ref)
				return { isEnabled = p23 }
			end
		}))
	end
}