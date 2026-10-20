local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local WithCsrfRetryModule = require(DataHydration.withCsrfRetry)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function _(p1, p2): string
	return ("%s/v1/universes/%d/configuration/playtesters"):format(p1, p2)
end

local _ = function(p1)
	-- upvalues: UrlBase (copy)
	local P2 = p1 or {}
	
	return P2.network, P2.baseUrl or UrlBase.new("develop")
end

local _ = function(p1)
	-- upvalues: WithCsrfRetryModule (copy), HttpClientModule (copy)
	return (p1 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork())
end

local function decodePlaytesterIds(p1)
	local List = {}
	local Playtesters = if type(p1) == "table" then p1.playtesters else nil
	
	if type(Playtesters) == "table" then
		for _, playtester in Playtesters do
			if type(playtester) == "number" then
				table.insert(List, playtester)
			elseif type(playtester) == "table" then
				local UserId = playtester.userId or playtester.id
				
				if type(UserId) == "number" then
					table.insert(List, UserId)
				end
			end
		end
	end
	return List
end

return {
	fetchPlaytesters = function(p2, p3)
		-- upvalues: UrlBase (copy), FetchFunction (copy), decodePlaytesterIds (copy), AsPromiseFunction (copy)
		local P6 = p3 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "private-playtesters.fetch",
			legacy = true,
			network = P6.network,
			url = ("%s/v1/universes/%d/configuration/playtesters"):format(P6.baseUrl or UrlBase.new("develop"), p2),
			decode = decodePlaytesterIds
		})))
	end,
	addPlaytester = function(p2, Playtesters, p3)
		-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), decodePlaytesterIds (copy), AsPromiseFunction (copy)
		local P9 = p3 or {}
		local _ = P9.network
		
		return AsPromiseFunction((FetchFunction({
			method = "POST",
			analyticsKey = "private-playtesters.add",
			legacy = true,
			network = (p3 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/configuration/playtesters"):format(P9.baseUrl or UrlBase.new("develop"), p2),
			body = { playtesters = Playtesters },
			decode = decodePlaytesterIds
		})))
	end,
	removePlaytester = function(p2, p3, p4)
		-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), decodePlaytesterIds (copy), AsPromiseFunction (copy)
		local P12 = p4 or {}
		local _ = P12.network
		
		return AsPromiseFunction((FetchFunction({
			method = "DELETE",
			analyticsKey = "private-playtesters.remove",
			legacy = true,
			network = (p4 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/configuration/playtesters"):format(P12.baseUrl or UrlBase.new("develop"), p2),
			body = { playtesters = { p3 } },
			decode = decodePlaytesterIds
		})))
	end
}