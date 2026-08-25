local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local _ = require(script.Parent.UniverseActivationStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p0, p1)
	return ("%s/v1/universes/%d/activation-eligibility"):format(p0, p1)
end

local _ = function(p2, p3)
	return ("%s/v1/universes/%d/activate"):format(p2, p3)
end

local _ = function(p4, p5)
	return ("%s/v1/universes/%d/deactivate"):format(p4, p5)
end

local _ = function(p6, p7)
	return ("%s/v2/universes/%d/configuration"):format(p6, p7)
end

local _ = function(p8)
	-- upvalues: urlBase (ref)
	p8 = p8 or {}
	
	return p8.network, p8.baseUrl or urlBase.new("develop")
end

local _ = function(p9)
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref)
	return (p9 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
end

return {
	fetchEligibility = function(p10, p11)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p11 = p11 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "universe-activation.get-eligibility",
			legacy = true,
			network = p11.network,
			url = ("%s/v1/universes/%d/activation-eligibility"):format(p11.baseUrl or urlBase.new("develop"), p10),
			decode = function(p12)
				return p12
			end
		}))
	end,
	activate = function(p13, p14, p15)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		p15 = p15 or {}
		local _ = p15.network
		local baseUrl = p15.baseUrl or urlBase.new("develop")
		local t = {}
		
		if p14 and p14.versionId ~= nil then
			t.versionId = p14.versionId
		end
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "universe-activation.activate",
			legacy = true,
			network = (p15 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/activate"):format(baseUrl, p13),
			body = t,
			decode = function(_)
				return { isActive = true }
			end
		}))
	end,
	deactivate = function(p16, p17)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		p17 = p17 or {}
		local _ = p17.network
		
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "universe-activation.deactivate",
			legacy = true,
			network = (p17 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/deactivate"):format(p17.baseUrl or urlBase.new("develop"), p16),
			body = {},
			decode = function(_)
				return { isActive = false }
			end
		}))
	end,
	fetchAudiences = function(p18, p19)
		-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
		p19 = p19 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "universe-activation.get-audiences",
			legacy = true,
			network = p19.network,
			url = ("%s/v2/universes/%d/configuration"):format(p19.baseUrl or urlBase.new("develop"), p18),
			decode = function(p20)
				return p20
			end
		}))
	end,
	setAudiences = function(value, p21, p22)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), asPromise (ref)
		p22 = p22 or {}
		local _ = p22.network
		
		return asPromise(fetch({
			method = "PATCH",
			analyticsKey = "universe-activation.set-audiences",
			legacy = true,
			network = (p22 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/v2/universes/%d/configuration"):format(p22.baseUrl or urlBase.new("develop"), value),
			body = { audiences = p21 },
			decode = function(p23)
				-- upvalues: value (ref), p21 (ref)
				return if p23 and typeof(p23) == "table" and p23.audiences ~= nil then p23 else { id = value, audiences = p21 }
			end
		}))
	end
}