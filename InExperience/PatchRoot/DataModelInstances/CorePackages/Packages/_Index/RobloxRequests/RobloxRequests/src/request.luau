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

function t.new(p1, p2, p3)
	-- upvalues: t (ref), urlModule (ref), ratelimitModule (ref), cookiesModule (ref)
	local tbl = setmetatable({}, t)
	p3 = p3 or {}
	local var1 = urlModule.parse(p2)
	local headers = p3.headers or {}
	tbl.method = p1:upper()
	tbl.url = var1
	tbl.input_url = p2
	tbl.headers = headers
	tbl.query = {}
	tbl.data = nil
	tbl._ratelimits = { ratelimitModule.get("http", 250, 30) }
	tbl.ignore_ratelimit = p3.ignore_ratelimit or false
	
	if p3.data then
		tbl:set_data(p3.data)
	end
	tbl:set_query(p3.query or {})
	local var2 = p3.cookies or {}
	
	if not var2.__cookiejar then
		local var3 = cookiesModule.new()
		
		if var2 then
			for i, v in pairs(var2) do
				var3:insert(i, v)
			end
		end
		var2 = var3
	end
	tbl.cookies = var2
	tbl.headers.Cookie = var2:string(p2)
	tbl._callback = nil
	tbl._log = p3.log == nil or p3.log
	
	return tbl
end

function t:set_headers(p4)
	for i, v in pairs(p4) do
		self.headers[i] = v
	end
	return self
end

t.update_headers = utilModule.deprecate(t.set_headers, "0.5", "update_headers")

function t:set_query(p5)
	for i, v in pairs(p5) do
		self.query[i] = v
	end
	self.url:setQuery(self.query)
	
	return self
end

t.update_query = utilModule.deprecate(t.set_headers, "0.5", "update_query")

function t:set_data(p6)
	-- upvalues: jsonModule (ref)
	if type(p6) == "table" then
		if p6.__FormData then
			self.headers["Content-Type"] = p6.content_type
			p6 = p6:build()
		else
			p6 = jsonModule.enc(p6)
			self.headers["Content-Type"] = "application/json"
		end
	end
	self.data = p6
	
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
			local var4 = responseModule.new(self, cached, tick() - currentTime)
			var4.from_cache = true
			print("[http]", cached_1:upper(), "CACHE |", var4.method, var4.url)
			
			return var4
		end
	end
	local var5 = 0
	local var6 = false
	local var7 = nil
	local var8 = nil
	while var5 < 5 do
		if not self.ignore_ratelimit and not self:_ratelimit() then
			warn("[http] Rate limit exceeded. Retrying in 5 seconds")
			var5 += 1
			wait(5)
			continue
		end
		local currentTime = tick()
		var8 = httpService:RequestAsync(t)
		var7 = responseModule.new(self, var8, tick() - currentTime)
		self.timestamp = currentTime
		var6 = true
		break
	end
	if not var6 then
		error("[http] Rate limit still exceeded after 5 attempts")
	end
	if self._log then
		print("[http]", var7.code, var7.message, "|", var7.method, var7.url, "(", tostring(math.floor(self._ratelimits[#self._ratelimits]:consumption() * 1000) * 0.1) .. "%", "ratelimit )")
	end
	if self._callback then
		self._callback(var7)
	end
	if self.method:upper() == "GET" and var7.ok and cacheModule.should_cache(t.Url) then
		cacheModule.update_cache(t.Url, method, var8)
	end
	return var7
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