local instanceof = require(script.Parent.Parent.LuauPolyfill).instanceof
local headers = require(script.Parent.Headers).Headers
local body = require(script.Parent.Body).Body
local abortSignal = require(script.Parent.AbortSignal).AbortSignal
local tbl = setmetatable({}, { __index = body })
tbl.__index = tbl

function tbl.new(p1, p2)
	-- upvalues: instanceof (ref), tbl (ref), body (ref), headers (ref), abortSignal (ref)
	p2 = p2 or {}
	local url = nil
	local var1 = nil
	
	if type(p1) == "string" then
		url = p1
		var1 = {}
	elseif instanceof(p1, tbl) then
		url = p1.url
		var1 = p1
	else
		error("The first argument of Request.new() must be a string or Request object")
	end
	local var2 = if p2.body or not instanceof(p1, tbl) then nil else p1.body
	local tbl_1 = setmetatable(body.new(p2.body or var2), tbl)
	tbl_1.method = p2.method or (var1.method or "GET")
	
	if (p2.body or var2) and (tbl_1.method == "GET" or tbl_1.method == "HEAD") then
		error(string.format("'body' should not be provided as an option for request method %s", tbl_1.method))
	end
	tbl_1.url = url
	tbl_1.headers = if p2.headers then headers.new(p2.headers) else var1.headers or headers.new()
	tbl_1.cache = p2.cache or (var1.cache or Enum.HttpCachePolicy.None)
	tbl_1.signal = p2.signal or (var1.signal or abortSignal.abort("Request Cancelled"))
	tbl_1.destination = "document"
	tbl_1.referrer = "client"
	tbl_1.referrerPolicy = "no-referrer"
	tbl_1.mode = p2.mode or "cors"
	tbl_1.credentials = p2.credentials or (var1.credentials or "omit")
	tbl_1.redirect = p2.redirect or (var1.redirect or "error")
	tbl_1.integrity = p2.integrity or (var1.integrity or "")
	tbl_1.keepalive = p2.keepalive or (var1.keepalive or false)
	tbl_1.isReloadNavigation = false
	tbl_1.isHistoryNavigation = false
	tbl_1.duplex = p2.duplex or (var1.duplex or "half")
	
	return tbl_1
end

function tbl.clone(p1)
	-- upvalues: tbl (ref)
	return tbl.new(p1)
end

return { Request = tbl }