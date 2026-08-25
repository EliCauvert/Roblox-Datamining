local parent = script.Parent.Parent
local lib = parent.lib
local src = parent.src
local parent_1 = parent.Parent
local httpService = game:GetService("HttpService")
local urlModule = require(lib.url)
local promiseModule = require(parent_1.Promise)
local jsonModule = require(src.json)
local responseModule = require(src.response)
local cookiesModule = require(src.cookies)
local ratelimitModule = require(src.ratelimit)
local utilModule = require(src.util)
local cacheModule = require(src.cache)
local t = {}
t.__index = t

function t.new(p0, p1, p2)
	-- upvalues: t (ref), urlModule (ref), ratelimitModule (ref), cookiesModule (ref)
	local tbl = setmetatable({}, t)
	p2 = p2 or {}
	local var12 = urlModule.parse(p1)
	local headers = p2.headers or {}
	tbl.method = p0:upper()
	tbl.url = var12
	tbl.input_url = p1
	tbl.headers = headers
	tbl.query = {}
	tbl.data = nil
	tbl._ratelimits = { ratelimitModule.get("http", 250, 30) }
	tbl.ignore_ratelimit = p2.ignore_ratelimit or false
	
	if p2.data then
		tbl:set_data(p2.data)
	end
	tbl:set_query(p2.query or {})
	local var14 = p2.cookies or {}
	
	if not var14.__cookiejar then
		local var15 = cookiesModule.new()
		
		if var14 then
			for i, v in pairs(var14) do
				var15:insert(i, v)
			end
		end
		var14 = var15
	end
	tbl.cookies = var14
	tbl.headers.Cookie = var14:string(p1)
	tbl._callback = nil
	tbl._log = p2.log == nil or p2.log
	
	return tbl
end

function t:set_headers(p3)
	for i, v in pairs(p3) do
		self.headers[i] = v
	end
	return self
end

t.update_headers = utilModule.deprecate(t.set_headers, "0.5", "update_headers")

function t:set_query(p4)
	for i, v in pairs(p4) do
		self.query[i] = v
	end
	self.url:setQuery(self.query)
	
	return self
end

t.update_query = utilModule.deprecate(t.set_headers, "0.5", "update_query")

function t:set_data(p5)
	-- upvalues: jsonModule (ref)
	if type(p5) == "table" then
		if p5.__FormData then
			self.headers["Content-Type"] = p5.content_type
			p5 = p5:build()
		else
			p5 = jsonModule.enc(p5)
			self.headers["Content-Type"] = "application/json"
		end
	end
	self.data = p5
	
	return self
end

function t:_ratelimit()
	for i, v in ipairs(self._ratelimits) do
		if not v:request() then
			return false
		end
	end
	return true
end

function t:_send()
	-- upvalues: cacheModule (ref), responseModule (ref), httpService (ref)
	local t = {
		Url = self.url:build(),
		Method = self.method,
		Headers = self.headers
	}
	
	if self.data ~= nil then
		t.Body = self.data
	end
	local method = ("Request_%s_%s_%s"):format(self.method, t.Url:sub(-1, -1) == "/" and t.Url:sub(1, -2) or t.Url, t.Body or "")
	
	if self.method:upper() == "GET" and cacheModule.is_cached(t.Url, method) then
		local currentTime = tick()
		local cached, cached_1 = cacheModule.get_cached(t.Url, method)
		
		if currentTime - cached.timestamp <= cacheModule.get_expire(t.Url) then
			local var21 = responseModule.new(self, cached, tick() - currentTime)
			var21.from_cache = true
			print("[http]", cached_1:upper(), "CACHE |", var21.method, var21.url)
			
			return var21
		end
	end
	local var22 = 0
	local var23 = false
	local var24 = nil
	local var25 = nil
	while var22 < 5 do
		if not self.ignore_ratelimit and not self:_ratelimit() then
			warn("[http] Rate limit exceeded. Retrying in 5 seconds")
			var22 += 1
			wait(5)
			continue
		end
		local currentTime = tick()
		var25 = httpService:RequestAsync(t)
		var24 = responseModule.new(self, var25, tick() - currentTime)
		self.timestamp = currentTime
		var23 = true
		break
	end
	if not var23 then
		error("[http] Rate limit still exceeded after 5 attempts")
	end
	if self._log then
		print("[http]", var24.code, var24.message, "|", var24.method, var24.url, "(", tostring(math.floor(self._ratelimits[#self._ratelimits]:consumption() * 1000) * 0.1) .. "%", "ratelimit )")
	end
	if self._callback then
		self._callback(var24)
	end
	if self.method:upper() == "GET" and var24.ok and cacheModule.should_cache(t.Url) then
		cacheModule.update_cache(t.Url, method, var25)
	end
	return var24
end

function t:send(p6)
	-- upvalues: promiseModule (ref)
	return if p6 then promiseModule.new(function(p7, p8)
		-- upvalues: self (ref)
		local ok, status = pcall(self._send, self)
		
		if ok and status.ok then
			p7(status)
			
			return
		elseif ok then
			p8({ request_sent = true, response = status })
			
			return
		end
		p8({ request_sent = false, error = status })
	end) else self:_send()
end

function t:promise()
	return self:send(true)
end

return t