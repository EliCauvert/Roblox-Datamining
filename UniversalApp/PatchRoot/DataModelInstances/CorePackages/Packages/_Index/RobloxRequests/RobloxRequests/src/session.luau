local parent = script.Parent.Parent
local _ = parent.lib
local src = parent.src
local requestModule = require(src.request)
local cookiesModule = require(src.cookies)
local ratelimitModule = require(src.ratelimit)
local utilModule = require(src.util)

local function randomString(p1)
	local var1 = ""
	
	for _ = 1, p1 do
		var1 ..= string.char(math.random(97, 122))
	end
	return var1
end

local t = {}
t.__index = t

function t.new(p2)
	-- upvalues: t (ref), cookiesModule (ref)
	local tbl = setmetatable({}, t)
	tbl.headers = {}
	tbl.cookies = cookiesModule.new()
	tbl.base_url = p2 or ""
	tbl._ratelimit = nil
	tbl.ignore_ratelimit = false
	tbl.before_request = nil
	tbl.after_request = nil
	tbl.no_stats = false
	tbl.log = true
	
	return tbl
end

function t:set_ratelimit(p2, p3)
	-- upvalues: ratelimitModule (ref), randomString (ref)
	if not p2 then
		self:disable_ratelimit()
	end
	p3 = p3 or 60
	
	if self._ratelimit then
		ratelimitModule.ratelimit[self._ratelimit.id] = nil
	end
	self._ratelimit = ratelimitModule.get("http.session-" .. randomString(12), p2, p3)
end

function t:disable_ratelimit()
	-- upvalues: ratelimitModule (ref)
	if self._ratelimit then
		ratelimitModule.ratelimit[self._ratelimit.id] = nil
		self._ratelimit = nil
	end
end

function t:set_headers(p2)
	for i, v in pairs(p2) do
		self.headers[i] = v
	end
	return self
end

function t:Request(p3, p4, p5)
	-- upvalues: requestModule (ref)
	p5 = p5 or {}
	
	if p4:sub(1, 7) ~= "http://" and p4:sub(1, 8) ~= "https://" then
		p4 = self.base_url .. p6
	end
	p5 = self.log
	
	if p5.log ~= nil then
		p5 = p5.log
	end
	local var2 = requestModule.new(p3, p4, {
		headers = self.headers,
		query = p5.query,
		data = p5.data,
		log = p5,
		cookies = p5.cookies or self.cookies,
		ignore_ratelimit = p5.ignore_ratelimit or self.ignore_ratelimit,
		no_stats = self.no_stats or false
	})
	
	if self._ratelimit then
		table.insert(var2._ratelimits, self._ratelimit)
	end
	var2:set_headers(p5.headers or {})
	
	function var9._callback(p6)
		-- upvalues: self (ref)
		for i, v in ipairs(p6.cookies.cookies) do
			table.insert(self.cookies.cookies, v)
		end
	end
	
	return var2
end

function t:request(p6, p7, p8)
	return self:Request(p6, p7, p8 or {}):send()
end

t.send = utilModule.deprecate(t.request, "0.5", "Session:send")

function t:promise_request(p6, p7, p8)
	return self:Request(p6, p7, p8 or {}):send(true)
end

t.promise_send = utilModule.deprecate(t.promise_request, "0.5", "Session:promise_send")

for i, v in pairs({
	"GET", "POST", "HEAD", "OPTIONS", "PUT", "DELETE", "PATCH"
}) do
	t[v:lower()] = function(p6, p7, p8)
		-- upvalues: v (ref)
		return p6:send(v, p7, p8)
	end
	
	t["promise_" .. v:lower()] = function(p6, p7, p8)
		-- upvalues: v (ref)
		return p6:promise_send(v, p7, p8)
	end
end
return t