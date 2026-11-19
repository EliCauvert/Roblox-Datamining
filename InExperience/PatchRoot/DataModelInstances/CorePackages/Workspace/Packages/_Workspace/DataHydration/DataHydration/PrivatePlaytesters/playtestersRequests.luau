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

local function decodeEligibleIds(p2)
	local Playtesters = if type(p2) == "table" then p2.playtesters else nil
	
	if type(Playtesters) ~= "table" then
		error("playtesters eligibility response has no playtesters list")
	end
	local List = {}
	
	for _, playtester in Playtesters do
		if type(playtester) == "table" then
			local UserId = playtester.userId
			
			if playtester.isEligible == true and type(UserId) == "number" then
				table.insert(List, UserId)
			end
		end
	end
	return List
end

return {
	fetchPlaytesters = function(p3, p4)
		-- upvalues: UrlBase (copy), FetchFunction (copy), decodePlaytesterIds (copy), AsPromiseFunction (copy)
		local P7 = p4 or {}
		
		return AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "private-playtesters.fetch",
			legacy = true,
			network = P7.network,
			url = ("%s/v1/universes/%d/configuration/playtesters"):format(P7.baseUrl or UrlBase.new("develop"), p3),
			decode = decodePlaytesterIds
		})))
	end,
	addPlaytester = function(p3, Playtesters, p4)
		-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), decodePlaytesterIds (copy), AsPromiseFunction (copy)
		local P10 = p4 or {}
		local _ = P10.network
		
		return AsPromiseFunction((FetchFunction({
			method = "POST",
			analyticsKey = "private-playtesters.add",
			legacy = true,
			network = (p4 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/configuration/playtesters"):format(P10.baseUrl or UrlBase.new("develop"), p3),
			body = { playtesters = Playtesters },
			decode = decodePlaytesterIds
		})))
	end,
	fetchEligiblePlaytesters = function(p3, Playtesters, p4)
		-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), decodeEligibleIds (copy), AsPromiseFunction (copy)
		local P13 = p4 or {}
		local _ = P13.network
		
		return AsPromiseFunction((FetchFunction({
			method = "POST",
			analyticsKey = "private-playtesters.eligibility",
			legacy = true,
			network = (p4 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/configuration/playtesters"):format(P13.baseUrl or UrlBase.new("develop"), p3) .. "/eligibility",
			body = { playtesters = Playtesters },
			decode = decodeEligibleIds
		})))
	end,
	removePlaytester = function(p3, p4, p5)
		-- upvalues: UrlBase (copy), FetchFunction (copy), WithCsrfRetryModule (copy), HttpClientModule (copy), decodePlaytesterIds (copy), AsPromiseFunction (copy)
		local P16 = p5 or {}
		local _ = P16.network
		
		return AsPromiseFunction((FetchFunction({
			method = "DELETE",
			analyticsKey = "private-playtesters.remove",
			legacy = true,
			network = (p5 or {}).network or WithCsrfRetryModule(HttpClientModule.createRequestInternalNetwork()),
			url = ("%s/v1/universes/%d/configuration/playtesters"):format(P16.baseUrl or UrlBase.new("develop"), p3),
			body = { playtesters = { p4 } },
			decode = decodePlaytesterIds
		})))
	end
}