local InstanceofFunction = require(script.Parent.Parent.LuauPolyfill).instanceof
local Headers = require(script.Parent.Headers).Headers
local Body = require(script.Parent.Body).Body
local AbortSignal = require(script.Parent.AbortSignal).AbortSignal
local self = setmetatable({}, { __index = Body })
self.__index = self

function self.new(Body1, p1)
	-- upvalues: InstanceofFunction (copy), self (copy), Body (copy), Headers (copy), AbortSignal (copy)
	local P1 = p1 or {}
	local Url = nil
	local v1 = nil
	
	if type(Body1) == "string" then
		Url = Body1
		v1 = {}
	elseif InstanceofFunction(Body1, self) then
		Url = Body1.url
		v1 = Body1
	else
		error("The first argument of Request.new() must be a string or Request object")
	end
	local Body2 = if P1.body or not InstanceofFunction(Body1, self) then nil else Body1.body
	local self1 = setmetatable(Body.new(P1.body or Body2), self)
	self1.method = P1.method or (v1.method or "GET")
	
	if (P1.body or Body2) and (self1.method == "GET" or self1.method == "HEAD") then
		error(string.format("'body' should not be provided as an option for request method %s", self1.method))
	end
	self1.url = Url
	local Headers1 = v1.headers or Headers.new()
	self1.headers = if P1.headers then Headers.new(P1.headers) else Headers1
	self1.cache = P1.cache or (v1.cache or Enum.HttpCachePolicy.None)
	self1.signal = P1.signal or (v1.signal or AbortSignal.abort("Request Cancelled"))
	self1.destination = "document"
	self1.referrer = "client"
	self1.referrerPolicy = "no-referrer"
	self1.mode = P1.mode or "cors"
	self1.credentials = P1.credentials or (v1.credentials or "omit")
	self1.redirect = P1.redirect or (v1.redirect or "error")
	self1.integrity = P1.integrity or (v1.integrity or "")
	self1.keepalive = P1.keepalive or (v1.keepalive or false)
	self1.isReloadNavigation = false
	self1.isHistoryNavigation = false
	self1.duplex = P1.duplex or (v1.duplex or "half")
	
	return self1
end

function self.clone(p1)
	-- upvalues: self (copy)
	return self.new(p1)
end

return { Request = self }