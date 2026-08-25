local instanceof = require(script.Parent.Parent.LuauPolyfill).instanceof
local headers = require(script.Parent.Headers).Headers
local body = require(script.Parent.Body).Body
local abortSignal = require(script.Parent.AbortSignal).AbortSignal
local tbl = setmetatable({}, { __index = body })
tbl.__index = tbl

function tbl.new(p0, p1)
	-- upvalues: instanceof (ref), tbl (ref), body (ref), headers (ref), abortSignal (ref)
	p1 = p1 or {}
	local url = nil
	local var2 = nil
	
	if type(p0) == "string" then
		url = p0
		var2 = {}
	elseif instanceof(p0, tbl) then
		url = p0.url
		var2 = p0
	else
		error("The first argument of Request.new() must be a string or Request object")
	end
	local var3 = if p1.body or not instanceof(p0, tbl) then nil else p0.body
	local tbl_1 = setmetatable(body.new(p1.body or var3), tbl)
	tbl_1.method = p1.method or (var2.method or "GET")
	
	if (p1.body or var3) and (tbl_1.method == "GET" or tbl_1.method == "HEAD") then
		error(string.format("'body' should not be provided as an option for request method %s", tbl_1.method))
	end
	tbl_1.url = url
	tbl_1.headers = if p1.headers then headers.new(p1.headers) else var2.headers or headers.new()
	tbl_1.cache = p1.cache or (var2.cache or Enum.HttpCachePolicy.None)
	tbl_1.signal = p1.signal or (var2.signal or abortSignal.abort("Request Cancelled"))
	tbl_1.destination = "document"
	tbl_1.referrer = "client"
	tbl_1.referrerPolicy = "no-referrer"
	tbl_1.mode = p1.mode or "cors"
	tbl_1.credentials = p1.credentials or (var2.credentials or "omit")
	tbl_1.redirect = p1.redirect or (var2.redirect or "error")
	tbl_1.integrity = p1.integrity or (var2.integrity or "")
	tbl_1.keepalive = p1.keepalive or (var2.keepalive or false)
	tbl_1.isReloadNavigation = false
	tbl_1.isHistoryNavigation = false
	tbl_1.duplex = p1.duplex or (var2.duplex or "half")
	
	return tbl_1
end

function tbl.clone(p2)
	-- upvalues: tbl (ref)
	return tbl.new(p2)
end

return { Request = tbl }