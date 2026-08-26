local parent = script.Parent.Parent
local jsonModule = require(parent.src.json)
local urlModule = require(parent.lib.url)

local function _(p1)
	return tonumber(p1) or p1
end

local function trim(p1)
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

function t.new(p2, p3, p4)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	p4 = p4 or {}
	tbl.name = p2
	tbl.value = p3
	tbl.domain = p4.domain or ""
	tbl.path = p4.path or ""
	
	return tbl
end

function t:fromSet()
	-- upvalues: trim (ref), t (ref)
	local t_1 = {}
	local var1 = self:split(";")
	local var2 = var1[1]:split("=")
	local var3 = trim(var2[1])
	local var4 = trim(var2[2])
	
	for i = 2, #var1 do
		local var5 = var1[i]:split("=")
		t_1[trim(var5[1]):lower()] = trim(var5[2])
	end
	return t.new(var3, var4, t_1)
end

function t:matches(p2)
	-- upvalues: urlModule (ref)
	if not self.domain then
		return true
	end
	local var6 = urlModule.parse(p2)
	
	if self.domain:sub(1, 1) == "." then
		if var6.host:sub(-#self.domain, -1) ~= self.domain and var6.host ~= self.domain:sub(2) then
			return false
		end
	else
		return var6.host == self.domain and (self.path and not var6.path:sub(1, #self.path) == self.path)
	end
end

local t_1 = {}
t_1.__index = t_1

function t_1.new()
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.__cookiejar = true
	tbl.cookies = {}
	
	return tbl
end

function t_1:insert(p2, p3, p4)
	-- upvalues: t (ref)
	self.cookies[p2] = t.new(p2, p3, p4)
	
	return self
end

function t_1:SetCookie(p2)
	-- upvalues: t (ref)
	local var6 = t.fromSet(p2)
	self.cookies[var6.name] = var6
end

function t_1:delete(p2)
	self.cookies[p2] = nil
end

function t_1:string(_)
	local var6 = ""
	
	for i, v in pairs(self.cookies) do
		if var6 then
			var6 ..= "; "
		end
		var6 ..= ("%s=%s"):format(v.name, v.value)
	end
	return var6
end

function t_1:__tostring()
	-- upvalues: jsonModule (ref)
	return jsonModule.enc(self.domains)
end

return t_1