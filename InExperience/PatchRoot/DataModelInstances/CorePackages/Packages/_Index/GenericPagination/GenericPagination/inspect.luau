local t = {
	_VERSION = "inspect.lua 3.1.0",
	_URL = "http://github.com/kikito/inspect.lua",
	_DESCRIPTION = "human-readable representations of tables",
	_LICENSE = "\t  MIT LICENSE\n\n\t  Copyright (c) 2013 Enrique Garc\195\173a Cota\n\n\t  Permission is hereby granted, free of charge, to any person obtaining a\n\t  copy of this software and associated documentation files (the\n\t  \"Software\"), to deal in the Software without restriction, including\n\t  without limitation the rights to use, copy, modify, merge, publish,\n\t  distribute, sublicense, and/or sell copies of the Software, and to\n\t  permit persons to whom the Software is furnished to do so, subject to\n\t  the following conditions:\n\n\t  The above copyright notice and this permission notice shall be included\n\t  in all copies or substantial portions of the Software.\n\n\t  THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS\n\t  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF\n\t  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.\n\t  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY\n\t  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,\n\t  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE\n\t  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n\t",
	KEY = setmetatable({}, {
		__tostring = function()
			return "inspect.KEY"
		end
	}),
	METATABLE = setmetatable({}, {
		__tostring = function()
			return "inspect.METATABLE"
		end
	})
}
local _tostring = tostring

local function _(p1)
	return next, p1, nil
end

local _ = function(p1)
	return if p1:match("\"") and not p1:match("'") then "'" .. p1 .. "'" else "\"" .. p1:gsub("\"", "\\\"") .. "\""
end

local t_1 = {
	["\a"] = "\\a",
	["\b"] = "\\b",
	["\f"] = "\\f",
	["\n"] = "\\n",
	["\r"] = "\\r",
	["\t"] = "\\t",
	["\11"] = "\\v"
}
local t_2 = {}

for i = 0, 31 do
	local char = string.char(i)
	
	if not t_1[char] then
		t_1[char] = "\\" .. i
		t_2[char] = string.format("\\%03d", i)
	end
end
local _ = function(p1)
	-- upvalues: t_2 (ref), t_1 (ref)
	return p1:gsub("\\", "\\\\"):gsub("(%c)%f[0-9]", t_2):gsub("%c", t_1)
end

local _ = function(p1)
	return type(p1) == "string" and p1:match("^[_%a][_%a%d]*$")
end

local _ = function(p1, p2)
	return type(p1) == "number" and (p1 >= 1 and (p1 <= p2 and math.floor(p1) == p1))
end

local t_3 = {
	number = 1,
	boolean = 2,
	string = 3,
	table = 4,
	["function"] = 5,
	userdata = 6,
	thread = 7
}

local function sortKeys(p1, p2)
	-- upvalues: t_3 (ref)
	local var1 = type(p1)
	local var2 = type(p2)
	
	if var1 == var2 and (var1 == "string" or var1 == "number") then
		return p1 < p2
	end
	var1 = t_3[var1]
	local var3 = t_3[var2]
	
	return if var1 and var3 then t_3[var1] < t_3[var2] elseif var1 then true elseif var3 then false else var1 < var2
end

local _ = function(p1)
	local var1 = 1
	local var2 = rawget(p1, var1)
	while var2 ~= nil do
		var1 += 1
		var2 = rawget(p1, var1)
	end
	return var1 - 1
end

local function getNonSequentialKeys(p2)
	-- upvalues: sortKeys (ref)
	local t = {}
	local var3 = 0
	local var4 = 1
	local var5 = rawget(p2, var4)
	while var5 ~= nil do
		var4 += 1
		var5 = rawget(p2, var4)
	end
	local var6 = var4 - 1
	
	for i, v in next, p2 do
		if not (type(i) == "number" and (i >= 1 and (i <= var6 and math.floor(i) == i))) then
			var3 += 1
			t[var3] = i
		end
	end
	table.sort(t, sortKeys)
	
	return t, var3, var6
end

local function countTableAppearances(p3, p4)
	-- upvalues: countTableAppearances (ref)
	p4 = p4 or {}
	
	if type(p3) == "table" then
		if p4[p3] then
			p4[p3] += 1
		else
			p4[p3] = 1
			
			for i, v in next, p3 do
				countTableAppearances(i, p4)
				countTableAppearances(v, p4)
			end
			countTableAppearances(getmetatable(p3), p4)
			
			return p4
		end
	end
	return p4
end

local _ = function(p5)
	local t = {}
	local p12Count = #p5
	
	for i = 1, p12Count do
		t[i] = p5[i]
	end
	return t, p12Count
end

local function makePath(p6, ...)
	local list = { ... }
	local t = {}
	local p13Count = #p6
	
	for i = 1, p13Count do
		t[i] = p6[i]
	end
	for i_1 = 1, #list do
		t[p13Count + i_1] = list[i_1]
	end
	return t
end

local function processRecursive(p7, p8, p9, p10)
	-- upvalues: processRecursive (ref), makePath (ref), t (ref)
	if p8 == nil then
		return nil
	elseif p10[p8] then
		return p10[p8]
	end
	local var7 = p7(p8, p9)
	
	if type(var7) == "table" then
		local t_1 = {}
		p10[p8] = t_1
		local _ = nil
		
		for i, v in next, var7 do
			local var8 = processRecursive(p7, i, makePath(p9, i, t.KEY), p10)
			
			if var8 ~= nil then
				t_1[var8] = processRecursive(p7, v, makePath(p9, var8), p10)
			end
		end
		local var9 = processRecursive(p7, getmetatable(var7), makePath(p9, t.METATABLE), p10)
		
		if type(var9) ~= "table" then
			var9 = nil
		end
		setmetatable(t_1, var9)
		var7 = t_1
	end
	return var7
end

local t_4 = {}
local t_5 = { __index = t_4 }

function t_4.puts(p11, ...)
	local list = { ... }
	local buffer = p11.buffer
	local bufferCount = #buffer
	
	for i = 1, #list do
		bufferCount += 1
		buffer[bufferCount] = list[i]
	end
end

function t_4.down(p12, p13)
	p12.level += 1
	p13()
	p12.level -= 1
end

function t_4.tabify(p12)
	p12:puts(p12.newline, string.rep(p12.indent, p12.level))
end

function t_4.alreadyVisited(p12, p13)
	return p12.ids[p13] ~= nil
end

function t_4.getId(p12, p13)
	-- upvalues: _tostring (ref)
	local var10 = p12.ids[p13]
	
	if not var10 then
		local var11 = type(p13)
		var10 = (p12.maxIds[var11] or 0) + 1
		p12.maxIds[var11] = var10
		p12.ids[p13] = var10
	end
	return _tostring(var10)
end

function t_4.putKey(p12, p13)
	if type(p13) == "string" and p13:match("^[_%a][_%a%d]*$") then
		return p12:puts(p13)
	end
	p12:puts("[")
	p12:putValue(p13)
	p12:puts("]")
end

function t_4.putTable(p12, p13)
	-- upvalues: t (ref), _tostring (ref), getNonSequentialKeys (ref)
	if p13 == t.KEY or p13 == t.METATABLE then
		p12:puts(_tostring(p13))
		
		return
	elseif p12:alreadyVisited(p13) then
		p12:puts("<table ", p12:getId(p13), ">")
		
		return
	elseif p12.depth <= p12.level then
		p12:puts("{...}")
		
		return
	elseif p12.tableAppearances[p13] > 1 then
		p12:puts("<", p12:getId(p13), ">")
	end
	local var10, var11, var12 = getNonSequentialKeys(p13)
	local var13 = getmetatable(p13)
	p12:puts("{")
	p12:down(function()
		-- upvalues: var12 (ref), p12 (ref), p13 (ref), var11 (ref), var10 (ref), var13 (ref)
		local var14 = 0
		
		for i = 1, var12 do
			if var14 > 0 then
				p12:puts(",")
			end
			p12:puts(" ")
			p12:putValue(p13[i])
			var14 += 1
		end
		for i_1 = 1, var11 do
			local var15 = var10[i_1]
			
			if var14 > 0 then
				p12:puts(",")
			end
			p12:tabify()
			p12:putKey(var15)
			p12:puts(" = ")
			p12:putValue(p13[var15])
			var14 += 1
		end
		if type(var13) == "table" then
			if var14 > 0 then
				p12:puts(",")
			end
			p12:tabify()
			p12:puts("<metatable> = ")
			p12:putValue(var13)
		end
	end)
	
	if var11 > 0 or type(var13) == "table" then
		p12:tabify()
	elseif var12 > 0 then
		p12:puts(" ")
	end
	p12:puts("}")
end

function t_4.putValue(p14, p15)
	-- upvalues: t_2 (ref), t_1 (ref), _tostring (ref)
	local var16 = type(p15)
	
	if var16 == "string" then
		local var17 = p15:gsub("\\", "\\\\"):gsub("(%c)%f[0-9]", t_2):gsub("%c", t_1)
		p14:puts(if var17:match("\"") and not var17:match("'") then "'" .. var44 .. "'" else "\"" .. var44:gsub("\"", "\\\"") .. "\"")
		
		return
	elseif var16 == "number" or var16 == "boolean" or (var16 == "nil" or var16 == "cdata") or var16 == "ctype" then
		p14:puts(_tostring(p15))
		
		return
	elseif var16 == "table" then
		p14:putTable(p15)
		
		return
	end
	p14:puts("<", var16, " ", p14:getId(p15), ">")
end

function t.inspect(p14, p15)
	-- upvalues: processRecursive (ref), countTableAppearances (ref), t_5 (ref)
	p15 = p15 or {}
	p15 = p15.depth or 1e999
	local newline = p15.newline or "\n"
	local indent = p15.indent or "  "
	local process = p15.process
	
	if process then
		p14 = processRecursive(process, p14, {}, {})
	end
	local tbl = setmetatable({
		level = 0,
		depth = p15,
		buffer = {},
		ids = {},
		maxIds = {},
		newline = newline,
		indent = indent,
		tableAppearances = countTableAppearances(p14)
	}, t_5)
	tbl:putValue(p14)
	
	return table.concat(tbl.buffer)
end

setmetatable(t, {
	__call = function(_, ...)
		-- upvalues: t (ref)
		return t.inspect(...)
	end
})

return t