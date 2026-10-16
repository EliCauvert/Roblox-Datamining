local Parent = script.Parent.Parent
local Src = Parent.src
local HttpService = game:GetService("HttpService")
local UrlModule = require(Parent.lib.url)
local PromiseModule = require(Parent.Parent.Promise)
local JsonModule = require(Src.json)
local ResponseModule = require(Src.response)
local CookiesModule = require(Src.cookies)
local RatelimitModule = require(Src.ratelimit)
local UtilModule = require(Src.util)
local CacheModule = require(Src.cache)
local RequestModule = {}
RequestModule.__index = RequestModule

function RequestModule.new(Text: string, Input_url, Elapsed) --[[ Line: 26 ]]
	-- upvalues: RequestModule (copy), UrlModule (copy), RatelimitModule (copy), CookiesModule (copy)
	local self = setmetatable({}, RequestModule)
	local Elapsed1 = Elapsed or {}
	local ParseResult = UrlModule.parse(Input_url)
	local Headers = Elapsed1.headers or {}
	self.method = Text:upper()
	self.url = ParseResult
	self.input_url = Input_url
	self.headers = Headers
	self.query = {}
	self.data = nil
	self._ratelimits = { RatelimitModule.get("http", 250, 30) }
	self.ignore_ratelimit = Elapsed1.ignore_ratelimit or false
	
	if Elapsed1.data then
		self:set_data(Elapsed1.data)
	end
	self:set_query(Elapsed1.query or {})
	local Cookies = Elapsed1.cookies or {}
	
	if not Cookies.__cookiejar then
		local NewCookies = CookiesModule.new()
		
		if Cookies then
			for i, cooky in pairs(Cookies) do
				NewCookies:insert(i, cooky)
			end
		end
		Cookies = NewCookies
	end
	self.cookies = Cookies
	self.headers.Cookie = Cookies:string(Input_url)
	self._callback = nil
	self._log = Elapsed1.log == nil or Elapsed1.log
	
	return self
end

function RequestModule:set_headers(List) --[[ Line: 87 ]]
	for i, value in pairs(List) do
		self.headers[i] = value
	end
	return self
end

RequestModule.update_headers = UtilModule.deprecate(RequestModule.set_headers, "0.5", "update_headers")

function RequestModule:set_query(Query) --[[ Line: 98 ]]
	for i, value in pairs(Query) do
		self.query[i] = value
	end
	self.url:setQuery(self.query)
	
	return self
end

RequestModule.update_query = UtilModule.deprecate(RequestModule.set_headers, "0.5", "update_query")

function RequestModule:set_data(EncResult) --[[ Line: 111 ]]
	-- upvalues: JsonModule (copy)
	if type(EncResult) == "table" then
		if EncResult.__FormData then
			self.headers["Content-Type"] = EncResult.content_type
			EncResult = EncResult:build()
		else
			EncResult = JsonModule.enc(EncResult)
			self.headers["Content-Type"] = "application/json"
		end
	end
	self.data = EncResult
	
	return self
end

function RequestModule._ratelimit(p1): boolean --[[ Line: 129 ]]
	for _, ratelimit in ipairs(p1._ratelimits) do
		if not ratelimit:request() then
			return false
		end
	end
	return true
end

function RequestModule:_send() --[[ Line: 141 ]]
	-- upvalues: CacheModule (copy), ResponseModule (copy), HttpService (copy)
	local config = {
		Url = self.url:build(),
		Method = self.method,
		Headers = self.headers
	}
	
	if self.data ~= nil then
		config.Body = self.data
	end
	local RequestName: string = ("Request_%s_%s_%s"):format(self.method, config.Url:sub(-1, -1) == "/" and config.Url:sub(1, -2) or config.Url, config.Body or "")
	
	if self.method:upper() == "GET" and CacheModule.is_cached(config.Url, RequestName) then
		local CurrentTime = tick()
		local Cached, Cached2 = CacheModule.get_cached(config.Url, RequestName)
		
		if CurrentTime - Cached.timestamp <= CacheModule.get_expire(config.Url) then
			local NewResponse = ResponseModule.new(self, Cached, tick() - CurrentTime)
			NewResponse.from_cache = true
			print("[http]", Cached2:upper(), "CACHE |", NewResponse.method, NewResponse.url)
			
			return NewResponse
		end
	end
	local Count = 0
	local Flag = false
	local NewResult = nil
	local Input_url = nil
	while Count < 5 do
		if not self.ignore_ratelimit and not self:_ratelimit() then
			warn("[http] Rate limit exceeded. Retrying in 5 seconds")
			Count += 1
			wait(5)
			continue
		end
		local CurrentTime = tick()
		Input_url = HttpService:RequestAsync(config)
		NewResult = ResponseModule.new(self, Input_url, tick() - CurrentTime)
		self.timestamp = CurrentTime
		Flag = true
		break
	end
	if not Flag then
		error("[http] Rate limit still exceeded after 5 attempts")
	end
	if self._log then
		print("[http]", NewResult.code, NewResult.message, "|", NewResult.method, NewResult.url, "(", tostring(math.floor(self._ratelimits[#self._ratelimits]:consumption() * 1000) * 0.1) .. "%", "ratelimit )")
	end
	if self._callback then
		self._callback(NewResult)
	end
	if self.method:upper() == "GET" and NewResult.ok and CacheModule.should_cache(config.Url) then
		CacheModule.update_cache(config.Url, RequestName, Input_url)
	end
	return NewResult
end

function RequestModule.send(p2, p3) --[[ Line: 212 ]]
	-- upvalues: PromiseModule (copy)
	return if p3 then PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ()) --[[ Line: 218 ]]
		-- upvalues: p2 (copy)
		local Success, Result = pcall(p2._send, p2)
		
		if Success and Result.ok then
			Callback(Result)
			
			return
		end
		if Success then
			Callback1({ request_sent = true, response = Result })
			
			return
		else
			Callback1({ request_sent = false, error = Result })
		end
	end) else p2:_send()
end

function RequestModule:promise() --[[ Line: 238 ]]
	return self:send(true)
end

return RequestModule