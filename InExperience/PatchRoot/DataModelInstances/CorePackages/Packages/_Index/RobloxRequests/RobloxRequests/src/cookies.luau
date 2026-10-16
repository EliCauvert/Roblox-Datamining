local Parent = script.Parent.Parent
local JsonModule = require(Parent.src.json)
local UrlModule = require(Parent.lib.url)

local function _(p1): number --[[ Line: 12 | Named "maybe_number" ]]
	return tonumber(p1) or p1
end

local function trim(p1) --[[ Line: 20 ]]
	local P1 = p1 or ""
	while P1:sub(1, 1) == " " do
		P1 = P1:sub(2)
	end
	while P1:sub(-1, -1) == " " do
		P1 = P1:sub(1, -2)
	end
	return P1
end

local Module = {}
Module.__index = Module

function Module.new(Name, Value, p2) --[[ Line: 38 ]]
	-- upvalues: Module (copy)
	local self = setmetatable({}, Module)
	local P4 = p2 or {}
	self.name = Name
	self.value = Value
	self.domain = P4.domain or ""
	self.path = P4.path or ""
	
	return self
end

function Module:fromSet() --[[ Line: 52 ]]
	-- upvalues: trim (copy), Module (copy)
	local t = {}
	local v1 = self:split(";")
	local v2 = v1[1]:split("=")
	local TrimResult = trim(v2[1])
	local TrimResult1 = trim(v2[2])
	
	for i = 2, #v1 do
		local v3 = v1[i]:split("=")
		t[trim(v3[1]):lower()] = trim(v3[2])
	end
	return Module.new(TrimResult, TrimResult1, t)
end

function Module:matches(p2): boolean --[[ Line: 72 ]]
	-- upvalues: UrlModule (copy)
	if not self.domain then
		return true
	end
	local ParseResult = UrlModule.parse(p2)
	
	if self.domain:sub(1, 1) == "." then
		if ParseResult.host:sub(-#self.domain, -1) ~= self.domain and ParseResult.host ~= self.domain:sub(2) then
			return false
		end
	elseif ParseResult.host ~= self.domain then
		return false
	end
	return not self.path or not ParseResult.path:sub(1, #self.path) ~= self.path
end

local CookiesModule = {}
CookiesModule.__index = CookiesModule

function CookiesModule.new() --[[ Line: 104 ]]
	-- upvalues: CookiesModule (copy)
	local self = setmetatable({}, CookiesModule)
	self.__cookiejar = true
	self.cookies = {}
	
	return self
end

function CookiesModule:insert(Name, p2, p3) --[[ Line: 114 ]]
	-- upvalues: Module (copy)
	self.cookies[Name] = Module.new(Name, p2, p3)
	
	return self
end

function CookiesModule:SetCookie(p2) --[[ Line: 122 ]]
	-- upvalues: Module (copy)
	local FromSetResult = Module.fromSet(p2)
	self.cookies[FromSetResult.name] = FromSetResult
end

function CookiesModule:delete(p2) --[[ Line: 130 ]]
	self.cookies[p2] = nil
end

function CookiesModule.string(p2, _): string --[[ Line: 134 ]]
	local Text = ""
	
	for _, cooky in pairs(p2.cookies) do
		if Text then
			Text ..= "; "
		end
		Text ..= ("%s=%s"):format(cooky.name, cooky.value)
	end
	return Text
end

function CookiesModule:__tostring() --[[ Line: 149 ]]
	-- upvalues: JsonModule (copy)
	return JsonModule.enc(self.domains)
end

return CookiesModule