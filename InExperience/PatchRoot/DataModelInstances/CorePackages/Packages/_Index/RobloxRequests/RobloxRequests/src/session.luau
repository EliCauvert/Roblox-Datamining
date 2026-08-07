local parent = script.Parent.Parent
local _ = parent.lib
local src = parent.src
local requestModule = require(src.request)
local cookiesModule = require(src.cookies)
local ratelimitModule = require(src.ratelimit)
local utilModule = require(src.util)

local function randomString(p0) --[[ line: 15 ]]
	local var6 = ""
	
	for _ = 1, p0 do
		var6 ..= string.char(math.random(97, 122))
	end
	return var6
end

local t = {}
t.__index = t

function t.new(p1) --[[ line: 28 ]]
	-- upvalues: t (ref), cookiesModule (ref)
	local tbl = setmetatable({}, t)
	tbl.headers = {}
	tbl.cookies = cookiesModule.new()
	tbl.base_url = p1 or ""
	tbl._ratelimit = nil
	tbl.ignore_ratelimit = false
	tbl.before_request = nil
	tbl.after_request = nil
	tbl.no_stats = false
	tbl.log = true
	
	return tbl
end

function t:set_ratelimit(p2, p3) --[[ line: 52 ]]
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

function t:disable_ratelimit() --[[ line: 70 ]]
	-- upvalues: ratelimitModule (ref)
	if self._ratelimit then
		ratelimitModule.ratelimit[self._ratelimit.id] = nil
		self._ratelimit = nil
	end
end

function t:set_headers(p4) --[[ line: 79 ]]
	for i, v in pairs(p4) do
		self.headers[i] = v
	end
	return self
end

function t:Request(p5, p6, p7) --[[ line: 89 ]]
	-- upvalues: requestModule (ref)
	p7 = p7 or {}
	
	if p6:sub(1, 7) ~= "http://" and p6:sub(1, 8) ~= "https://" then
		p6 = self.base_url .. p6
	end
	p7 = self.log
	
	if p7.log ~= nil then
		p7 = p7.log
	end
	local var9 = requestModule.new(p5, p6, {
		headers = self.headers,
		query = p7.query,
		data = p7.data,
		log = p7,
		cookies = p7.cookies or self.cookies,
		ignore_ratelimit = p7.ignore_ratelimit or self.ignore_ratelimit,
		no_stats = self.no_stats or false
	})
	
	if self._ratelimit then
		table.insert(var9._ratelimits, self._ratelimit)
	end
	var9:set_headers(p7.headers or {})
	
	function var9._callback(p8) --[[ line: 122 ]]
		-- upvalues: self (ref)
		for i, v in ipairs(p8.cookies.cookies) do
			table.insert(self.cookies.cookies, v)
		end
	end
	
	return var9
end

function t:request(p9, p10, p11) --[[ line: 131 ]]
	return self:Request(p9, p10, p11 or {}):send()
end

t.send = utilModule.deprecate(t.request, "0.5", "Session:send")

function t:promise_request(p12, p13, p14) --[[ line: 149 ]]
	return self:Request(p12, p13, p14 or {}):send(true)
end

t.promise_send = utilModule.deprecate(t.promise_request, "0.5", "Session:promise_send")

for i, v in pairs({
	"GET", "POST", "HEAD", "OPTIONS", "PUT", "DELETE", "PATCH"
}) do
	t[v:lower()] = function(p15, p16, p17) --[[ line: 161 ]]
		-- upvalues: v (ref)
		return p15:send(v, p16, p17)
	end
	
	t["promise_" .. v:lower()] = function(p18, p19, p20) --[[ line: 165 ]]
		-- upvalues: v (ref)
		return p18:promise_send(v, p19, p20)
	end
end
return t