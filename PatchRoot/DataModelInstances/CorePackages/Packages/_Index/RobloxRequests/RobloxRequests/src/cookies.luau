-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:04 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local jsonModule = require(parent.src.json)
local urlModule = require(parent.lib.url)

local function _(p0) --[[ line: 12 | named "maybe_number" ]]
	return tonumber(p0) or p0
end

local function trim(p1) --[[ line: 20 ]]
	p1 = p1 or ""
	while p1:sub(1, 1) == " " do
		p1 = p1:sub(2)
	end
	while p1:sub(-1, -1) == " " do
		p1 = p1:sub(1, -2)
	end
	return p1
end

local t = {}
t.__index = t

function t.new(p2, p3, p4) --[[ line: 38 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	p4 = p4 or {}
	tbl.name = p2
	tbl.value = p3
	tbl.domain = p4.domain or ""
	tbl.path = p4.path or ""
	
	return tbl
end

function t:fromSet() --[[ line: 52 ]]
	-- upvalues: trim (ref), t (ref)
	local t_1 = {}
	local var8 = self:split(";")
	local var9 = var8[1]:split("=")
	local var10 = trim(var9[1])
	local var11 = trim(var9[2])
	
	for i = 2, #var8 do
		local var12 = var8[i]:split("=")
		t_1[trim(var12[1]):lower()] = trim(var12[2])
	end
	return t.new(var10, var11, t_1)
end

function t:matches(p5) --[[ line: 72 ]]
	-- upvalues: urlModule (ref)
	if not self.domain then
		return true
	end
	local var13 = urlModule.parse(p5)
	
	if self.domain:sub(1, 1) == "." then
		if var13.host:sub(-#self.domain, -1) ~= self.domain and var13.host ~= self.domain:sub(2) then
			return false
		end
	else
		return var13.host == self.domain and (self.path and not var13.path:sub(1, #self.path) == self.path)
	end
end

local t_1 = {}
t_1.__index = t_1

function t_1.new() --[[ line: 104 ]]
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.__cookiejar = true
	tbl.cookies = {}
	
	return tbl
end

function t_1:insert(p6, p7, p8) --[[ line: 114 ]]
	-- upvalues: t (ref)
	self.cookies[p6] = t.new(p6, p7, p8)
	
	return self
end

function t_1:SetCookie(p9) --[[ line: 122 ]]
	-- upvalues: t (ref)
	local var15 = t.fromSet(p9)
	self.cookies[var15.name] = var15
end

function t_1:delete(p10) --[[ line: 130 ]]
	self.cookies[p10] = nil
end

function t_1:string(_) --[[ line: 134 ]]
	local var16 = ""
	
	for i, v in pairs(self.cookies) do
		if var16 then
			var16 ..= "; "
		end
		var16 ..= ("%s=%s"):format(v.name, v.value)
	end
	return var16
end

function t_1:__tostring() --[[ line: 149 ]]
	-- upvalues: jsonModule (ref)
	return jsonModule.enc(self.domains)
end

return t_1