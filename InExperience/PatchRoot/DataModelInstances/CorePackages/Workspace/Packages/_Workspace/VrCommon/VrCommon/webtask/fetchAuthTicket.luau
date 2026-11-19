local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("VrCommon").Parent
local HttpClientModule = require(Parent.HttpClient)
local _ = require(Parent.LuauPolyfill)
local Url = require(Parent.Http).Url

local function getClientAssertion(NetworkImpl)
	-- upvalues: HttpClientModule (copy), Url (copy)
	return HttpClientModule.asPromise(HttpClientModule.createRequest({
		method = "GET",
		analyticsKey = "auth.client-assertion",
		networkImpl = NetworkImpl,
		url = `{Url.AUTH_URL}v1/client-assertion/`,
		decode = HttpClientModule.decodeJson(function(p1)
			return if typeof(p1) == "table" then p1.clientAssertion else nil
		end),
		headers = {}
	}))
end

local function decodeTicket(p1)
	-- upvalues: HttpClientModule (copy)
	local _, v1, v2 = HttpClientModule.decodeJson(function(): boolean
		return true
	end)(p1)
	
	if v1 ~= nil then
		return nil, v1, v2
	end
	local RbxAuthenticationTicket = if p1.headers then p1.headers["rbx-authentication-ticket"] else nil
	
	if typeof(RbxAuthenticationTicket) == "string" and RbxAuthenticationTicket ~= "" then
		return RbxAuthenticationTicket, nil, nil
	else
		return nil, "missing authentication ticket", p1.statusCode
	end
end

return function(p1)
	-- upvalues: HttpClientModule (copy), getClientAssertion (copy), Url (copy), HttpService (copy), decodeTicket (copy)
	local P3 = p1 or HttpClientModule.createRequestInternalNetwork()
	
	return getClientAssertion(P3):catch(function()
		return nil
	end):andThen(function(Result)
		-- upvalues: HttpClientModule (upval), P3 (copy), Url (upval), HttpService (upval), decodeTicket (upval)
		return HttpClientModule.asPromise(HttpClientModule.createRequest({
			method = "POST",
			analyticsKey = "auth.authentication-ticket",
			networkImpl = P3,
			url = `{Url.AUTH_URL}v1/authentication-ticket/`,
			body = if Result then HttpService:JSONEncode({ clientAssertion = Result }) else "{}",
			encode = HttpClientModule.encodeRaw("application/json"),
			decode = decodeTicket,
			headers = {}
		}))
	end)
end