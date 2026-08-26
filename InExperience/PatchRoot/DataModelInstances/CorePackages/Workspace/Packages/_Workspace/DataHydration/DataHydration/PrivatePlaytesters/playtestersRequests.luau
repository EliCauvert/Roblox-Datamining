local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p1, p2)
	return ("%s/v1/universes/%d/configuration/playtesters"):format(p1, p2)
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

local function decodePlaytesterIds(p1)
	local t = {}
	local var1 = if type(p1) == "table" then p1.playtesters else nil
	
	if type(var1) == "table" then
		for i, v in var1 do
			if type(v) == "number" then
				table.insert(t, v)
			elseif type(v) == "table" then
				local userId = v.userId or v.id
				
				if type(userId) == "number" then
					table.insert(t, userId)
				end
			end
		end
	end
	return t
end

return {
	fetchPlaytesters = function(p2, p3)
		-- upvalues: urlBase (ref), fetch (ref), decodePlaytesterIds (ref), asPromise (ref)
		p3 = p3 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "private-playtesters.fetch",
			legacy = true,
			network = p3.network,
			url = ("%s/v1/universes/%d/configuration/playtesters"):format(p3.baseUrl or urlBase.new("develop"), p2),
			decode = decodePlaytesterIds
		}))
	end,
	addPlaytester = function(p2, p3, p4)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), decodePlaytesterIds (ref), asPromise (ref)
		p4 = p4 or {}
		local _ = p4.network
		
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "private-playtesters.add",
			legacy = true,
			network = (p4 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/configuration/playtesters"):format(p4.baseUrl or urlBase.new("develop"), p2),
			body = { playtesters = p3 },
			decode = decodePlaytesterIds
		}))
	end,
	removePlaytester = function(p2, p3, p4)
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), decodePlaytesterIds (ref), asPromise (ref)
		p4 = p4 or {}
		local _ = p4.network
		
		return asPromise(fetch({
			method = "DELETE",
			analyticsKey = "private-playtesters.remove",
			legacy = true,
			network = (p4 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/configuration/playtesters"):format(p4.baseUrl or urlBase.new("develop"), p2),
			body = { playtesters = { p3 } },
			decode = decodePlaytesterIds
		}))
	end
}