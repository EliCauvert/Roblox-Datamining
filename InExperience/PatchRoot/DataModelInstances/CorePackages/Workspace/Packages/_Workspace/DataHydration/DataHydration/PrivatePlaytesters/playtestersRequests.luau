local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local withCsrfRetryModule = require(dataHydration.withCsrfRetry)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p0, p1) --[[ line: 29 | named "playtestersUrl" ]]
	return ("%s/v1/universes/%d/configuration/playtesters"):format(p0, p1)
end

local _ = function(p2) --[[ line: 33 | named "resolveBase" ]]
	-- upvalues: urlBase (ref)
	p2 = p2 or {}
	
	return p2.network, p2.baseUrl or urlBase.new("develop")
end

local _ = function(p3) --[[ line: 39 | named "resolveMutatingNetwork" ]]
	-- upvalues: withCsrfRetryModule (ref), httpClientModule (ref)
	return (p3 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork())
end

local function decodePlaytesterIds(p4) --[[ line: 46 ]]
	local t = {}
	local var6 = if type(p4) == "table" then p4.playtesters else nil
	
	if type(var6) == "table" then
		for i, v in var6 do
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
	fetchPlaytesters = function(p5, p6) --[[ line: 66 ]]
		-- upvalues: urlBase (ref), fetch (ref), decodePlaytesterIds (ref), asPromise (ref)
		p6 = p6 or {}
		
		return asPromise(fetch({
			method = "GET",
			analyticsKey = "private-playtesters.fetch",
			legacy = true,
			network = p6.network,
			url = ("%s/v1/universes/%d/configuration/playtesters"):format(p6.baseUrl or urlBase.new("develop"), p5),
			decode = decodePlaytesterIds
		}))
	end,
	addPlaytester = function(p7, p8, p9) --[[ line: 79 ]]
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), decodePlaytesterIds (ref), asPromise (ref)
		p9 = p9 or {}
		local _ = p9.network
		
		return asPromise(fetch({
			method = "POST",
			analyticsKey = "private-playtesters.add",
			legacy = true,
			network = (p9 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/configuration/playtesters"):format(p9.baseUrl or urlBase.new("develop"), p7),
			body = { playtesters = p8 },
			decode = decodePlaytesterIds
		}))
	end,
	removePlaytester = function(p10, p11, p12) --[[ line: 97 ]]
		-- upvalues: urlBase (ref), fetch (ref), withCsrfRetryModule (ref), httpClientModule (ref), decodePlaytesterIds (ref), asPromise (ref)
		p12 = p12 or {}
		local _ = p12.network
		
		return asPromise(fetch({
			method = "DELETE",
			analyticsKey = "private-playtesters.remove",
			legacy = true,
			network = (p12 or {}).network or withCsrfRetryModule(httpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/configuration/playtesters"):format(p12.baseUrl or urlBase.new("develop"), p10),
			body = { playtesters = { p11 } },
			decode = decodePlaytesterIds
		}))
	end
}