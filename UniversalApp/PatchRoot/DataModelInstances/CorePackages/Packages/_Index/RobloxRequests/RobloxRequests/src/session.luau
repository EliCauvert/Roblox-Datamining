local Parent = script.Parent.Parent
local _ = Parent.lib
local Src = Parent.src
local RequestModule = require(Src.request)
local CookiesModule = require(Src.cookies)
local RatelimitModule = require(Src.ratelimit)
local UtilModule = require(Src.util)

local function randomString(p1): string --[[ Line: 15 ]]
	local Text = ""
	
	for _ = 1, p1 do
		Text ..= string.char(math.random(97, 122))
	end
	return Text
end

local SessionModule = {}
SessionModule.__index = SessionModule

function SessionModule.new(p2) --[[ Line: 28 ]]
	-- upvalues: SessionModule (copy), CookiesModule (copy)
	local self = setmetatable({}, SessionModule)
	self.headers = {}
	self.cookies = CookiesModule.new()
	self.base_url = p2 or ""
	self._ratelimit = nil
	self.ignore_ratelimit = false
	self.before_request = nil
	self.after_request = nil
	self.no_stats = false
	self.log = true
	
	return self
end

function SessionModule:set_ratelimit(p2, p3) --[[ Line: 52 ]]
	-- upvalues: RatelimitModule (copy), randomString (copy)
	if not p2 then
		self:disable_ratelimit()
	end
	local P4 = p3 or 60
	
	if self._ratelimit then
		RatelimitModule.ratelimit[self._ratelimit.id] = nil
	end
	self._ratelimit = RatelimitModule.get("http.session-" .. randomString(12), p2, P4)
end

function SessionModule:disable_ratelimit() --[[ Line: 70 ]]
	-- upvalues: RatelimitModule (copy)
	if self._ratelimit then
		RatelimitModule.ratelimit[self._ratelimit.id] = nil
		self._ratelimit = nil
	end
end

function SessionModule:set_headers(Headers) --[[ Line: 79 ]]
	for i, header in pairs(Headers) do
		self.headers[i] = header
	end
	return self
end

function SessionModule:Request(p2, Text: string, p3) --[[ Line: 89 ]]
	-- upvalues: RequestModule (copy)
	local P11 = p3 or {}
	
	if Text:sub(1, 7) ~= "http://" and Text:sub(1, 8) ~= "https://" then
		Text = self.base_url .. Text
	end
	local NewRequest = RequestModule.new(p2, Text, {
		headers = self.headers,
		query = P11.query,
		data = P11.data,
		log = if P11.log == nil then self.log else P11.log,
		cookies = P11.cookies or self.cookies,
		ignore_ratelimit = P11.ignore_ratelimit or self.ignore_ratelimit,
		no_stats = self.no_stats or false
	})
	
	if self._ratelimit then
		table.insert(NewRequest._ratelimits, self._ratelimit)
	end
	NewRequest:set_headers(P11.headers or {})
	
	function NewRequest._callback(p4) --[[ Line: 122 ]]
		-- upvalues: self (copy)
		for _, cooky in ipairs(p4.cookies.cookies) do
			table.insert(self.cookies.cookies, cooky)
		end
	end
	
	return NewRequest
end

function SessionModule:request(p4, p5, p6) --[[ Line: 131 ]]
	return self:Request(p4, p5, p6 or {}):send()
end

SessionModule.send = UtilModule.deprecate(SessionModule.request, "0.5", "Session:send")

function SessionModule:promise_request(p4, p5, p6) --[[ Line: 149 ]]
	return self:Request(p4, p5, p6 or {}):send(true)
end

SessionModule.promise_send = UtilModule.deprecate(SessionModule.promise_request, "0.5", "Session:promise_send")

for _, Text in pairs({
	"GET", "POST", "HEAD", "OPTIONS", "PUT", "DELETE", "PATCH"
}) do
	SessionModule[Text:lower()] = function(p4, p5, p6) --[[ Line: 161 ]]
		-- upvalues: Text (copy)
		return p4:send(Text, p5, p6)
	end
	
	SessionModule["promise_" .. Text:lower()] = function(p4, p5, p6) --[[ Line: 165 ]]
		-- upvalues: Text (copy)
		return p4:promise_send(Text, p5, p6)
	end
end
return SessionModule