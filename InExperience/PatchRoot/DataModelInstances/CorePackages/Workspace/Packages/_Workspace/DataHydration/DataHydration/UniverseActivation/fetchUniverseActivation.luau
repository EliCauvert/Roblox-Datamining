local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)
local _ = require(script.Parent.UniverseActivationStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function _(p1, p2): string --[[ Line: 18 | Named "eligibilityUrl" ]]
	return ("%s/v1/universes/%d/activation-eligibility"):format(p1, p2)
end

local _ = function(p1, p2): string --[[ Line: 22 | Named "activateUrl" ]]
	return ("%s/v1/universes/%d/activate"):format(p1, p2)
end

local _ = function(p1, p2): string --[[ Line: 26 | Named "deactivateUrl" ]]
	return ("%s/v1/universes/%d/deactivate"):format(p1, p2)
end

local _ = function(p1, p2): string --[[ Line: 30 | Named "v2ConfigurationUrl" ]]
	return ("%s/v2/universes/%d/configuration"):format(p1, p2)
end

local _ = function(p1) --[[ Line: 34 | Named "resolveBase" ]]
	-- upvalues: UrlBase (copy)
	local P8 = p1 or {}
	
	return P8.network, P8.baseUrl or UrlBase.new("develop")
end

local _ = function(p1) --[[ Line: 39 | Named "resolveMutatingNetwork" ]]
	-- upvalues: WithCsrfRetryModule (copy), HttpClientModule (copy)
	return (p1 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork())
end

return {
	fetchEligibility = function(p1, p2) --[[ Line: 46 ]]
		-- upvalues: UrlBase (copy), FetchFunction (copy), AsPromiseFunction (copy)
		local P11 = p2 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "universe-activation.get-eligibility",
			legacy = true,
			network = P11.network,
			url = ("%s/v1/universes/%d/activation-eligibility"):format(P11.baseUrl or UrlBase.new("develop"), p1),
			decode = function(p3) --[[ Line: 57 ]]
				return p3
			end
		})))
	end,
	activate = function(p1, p2, p3) --[[ Line: 64 ]]
		-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), AsPromiseFunction (copy)
		local P15 = p3 or {}
		local _ = P15.network
		local BaseUrl = P15.baseUrl or UrlBase.new("develop")
		local Body = {}
		
		if p2 and p2.versionId ~= nil then
			Body.versionId = p2.versionId
		end
		return AsPromiseFunction((FetchFunction({
			method = "POST",
			analyticsKey = "universe-activation.activate",
			legacy = true,
			network = (p3 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/activate"):format(BaseUrl, p1),
			body = Body,
			decode = function(_) --[[ Line: 82 ]]
				return { isActive = true }
			end
		})))
	end,
	deactivate = function(p1, p2) --[[ Line: 89 ]]
		-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), AsPromiseFunction (copy)
		local P18 = p2 or {}
		local _ = P18.network
		
		return AsPromiseFunction((FetchFunction({
			method = "POST",
			analyticsKey = "universe-activation.deactivate",
			legacy = true,
			network = (p2 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/deactivate"):format(P18.baseUrl or UrlBase.new("develop"), p1),
			body = {},
			decode = function(_) --[[ Line: 98 ]]
				return { isActive = false }
			end
		})))
	end,
	fetchAudiences = function(p1, p2) --[[ Line: 105 ]]
		-- upvalues: UrlBase (copy), FetchFunction (copy), AsPromiseFunction (copy)
		local P21 = p2 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "universe-activation.get-audiences",
			legacy = true,
			network = P21.network,
			url = ("%s/v2/universes/%d/configuration"):format(P21.baseUrl or UrlBase.new("develop"), p1),
			decode = function(p3) --[[ Line: 116 ]]
				return p3
			end
		})))
	end,
	setAudiences = function(Id, Audiences, p1) --[[ Line: 123 ]]
		-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), AsPromiseFunction (copy)
		local P25 = p1 or {}
		local _ = P25.network
		
		return AsPromiseFunction((FetchFunction({
			method = "PATCH",
			analyticsKey = "universe-activation.set-audiences",
			legacy = true,
			network = (p1 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = ("%s/v2/universes/%d/configuration"):format(P25.baseUrl or UrlBase.new("develop"), Id),
			body = { audiences = Audiences },
			decode = function(p2) --[[ Line: 136 ]]
				-- upvalues: Id (copy), Audiences (copy)
				return if p2 and typeof(p2) == "table" and p2.audiences ~= nil then p2 else { id = Id, audiences = Audiences }
			end
		})))
	end
}