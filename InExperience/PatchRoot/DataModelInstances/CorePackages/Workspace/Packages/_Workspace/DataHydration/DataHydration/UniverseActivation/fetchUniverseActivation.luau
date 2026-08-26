local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.UniverseActivationStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p1, p2)
	return ("%s/v1/universes/%d/activation-eligibility"):format(p1, p2)
end

local _ = function(p1, p2)
	return ("%s/v1/universes/%d/activate"):format(p1, p2)
end

local _ = function(p1, p2)
	return ("%s/v1/universes/%d/deactivate"):format(p1, p2)
end

local _ = function(p1, p2)
	return ("%s/v2/universes/%d/configuration"):format(p1, p2)
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
	fetchEligibility = function(p1, p2)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p2 = p2 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "universe-activation.get-eligibility",
			legacy = true,
			network = p2.network,
			url = ("%s/v1/universes/%d/activation-eligibility"):format(p2.baseUrl or urlBase.new("develop"), p1),
			decode = function(p3)
				return p3
			end
		}))
	end,
	activate = function(p1, p2, p3)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		p3 = p3 or {}
		local _ = p3.network
		local baseUrl = p3.baseUrl or urlBase.new("develop")
		local t = {}
		
		if p2 and p2.versionId ~= nil then
			t.versionId = p2.versionId
		end
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "universe-activation.activate",
			legacy = true,
			network = (p3 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/activate"):format(baseUrl, p1),
			body = t,
			decode = function(_)
				return { isActive = true }
			end
		}))
	end,
	deactivate = function(p1, p2)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		p2 = p2 or {}
		local _ = p2.network
		
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "universe-activation.deactivate",
			legacy = true,
			network = (p2 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/deactivate"):format(p2.baseUrl or urlBase.new("develop"), p1),
			body = {},
			decode = function(_)
				return { isActive = false }
			end
		}))
	end,
	fetchAudiences = function(p1, p2)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p2 = p2 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "universe-activation.get-audiences",
			legacy = true,
			network = p2.network,
			url = ("%s/v2/universes/%d/configuration"):format(p2.baseUrl or urlBase.new("develop"), p1),
			decode = function(p3)
				return p3
			end
		}))
	end,
	setAudiences = function(value, p1, p2)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		p2 = p2 or {}
		local _ = p2.network
		
		return asPromise(fetch({
			method = "PATCH",
			analyticsKey = "universe-activation.set-audiences",
			legacy = true,
			network = (p2 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/v2/universes/%d/configuration"):format(p2.baseUrl or urlBase.new("develop"), value),
			body = { audiences = p1 },
			decode = function(p3)
				-- upvalues: value (ref), p1 (ref)
				return if p3 and typeof(p3) == "table" and p3.audiences ~= nil then p3 else { id = value, audiences = p1 }
			end
		}))
	end
}