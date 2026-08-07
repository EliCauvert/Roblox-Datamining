local t = {
	_VERSION = "inspect.lua 3.1.0",
	_URL = "http://github.com/kikito/inspect.lua",
	_DESCRIPTION = "human-readable representations of tables",
	_LICENSE = "\t  MIT LICENSE\n\n\t  Copyright (c) 2013 Enrique Garc\195\173a Cota\n\n\t  Permission is hereby granted, free of charge, to any person obtaining a\n\t  copy of this software and associated documentation files (the\n\t  \"Software\"), to deal in the Software without restriction, including\n\t  without limitation the rights to use, copy, modify, merge, publish,\n\t  distribute, sublicense, and/or sell copies of the Software, and to\n\t  permit persons to whom the Software is furnished to do so, subject to\n\t  the following conditions:\n\n\t  The above copyright notice and this permission notice shall be included\n\t  in all copies or substantial portions of the Software.\n\n\t  THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS\n\t  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF\n\t  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.\n\t  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY\n\t  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,\n\t  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE\n\t  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n\t",
	KEY = setmetatable({}, {
		__tostring = function() --[[ line: 34 ]]
			return "inspect.KEY"
		end
	}),
	METATABLE = setmetatable({}, {
		__tostring = function() --[[ line: 39 ]]
			return "inspect.METATABLE"
		end
	})
}
local _tostring = tostring

local function _(p0) --[[ line: 44 | named "rawpairs" ]]
	return next, p0, nil
end

local _ = function(p1) --[[ line: 50 | named "smartQuote" ]]
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
local _ = function(p2) --[[ line: 76 | named "escape" ]]
	-- upvalues: t_2 (ref), t_1 (ref)
	return p2:gsub("\\", "\\\\"):gsub("(%c)%f[0-9]", t_2):gsub("%c", t_1)
end

local _ = function(p3) --[[ line: 80 | named "isIdentifier" ]]
	return type(p3) == "string" and p3:match("^[_%a][_%a%d]*$")
end

local _ = function(p4, p5) --[[ line: 84 | named "isSequenceKey" ]]
	return type(p4) == "number" and (p4 >= 1 and (p4 <= p5 and math.floor(p4) == p4))
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

local function sortKeys(p6, p7) --[[ line: 98 ]]
	-- upvalues: t_3 (ref)
	local var13 = type(p6)
	local var14 = type(p7)
	
	if var13 == var14 and (var13 == "string" or var13 == "number") then
		return p6 < p7
	end
	var13 = t_3[var13]
	local var15 = t_3[var14]
	
	return if var13 and var15 then t_3[var13] < t_3[var14] elseif var13 then true elseif var15 then false else var13 < var14
end

local _ = function(p8) --[[ line: 122 | named "getSequenceLength" ]]
	local var16 = 1
	local var17 = rawget(p8, var16)
	while var17 ~= nil do
		var16 += 1
		var17 = rawget(p8, var16)
	end
	return var16 - 1
end

local function getNonSequentialKeys(p9) --[[ line: 132 ]]
	-- upvalues: sortKeys (ref)
	local t = {}
	local var19 = 0
	local var20 = 1
	local var21 = rawget(p9, var20)
	while var21 ~= nil do
		var20 += 1
		var21 = rawget(p9, var20)
	end
	local var22 = var20 - 1
	
	for i, v in next, p9 do
		if not (type(i) == "number" and (i >= 1 and (i <= var22 and math.floor(i) == i))) then
			var19 += 1
			t[var19] = i
		end
	end
	table.sort(t, sortKeys)
	
	return t, var19, var22
end

local function countTableAppearances(p10, p11) --[[ line: 145 ]]
	-- upvalues: countTableAppearances (ref)
	p11 = p11 or {}
	
	if type(p10) == "table" then
		if p11[p10] then
			p11[p10] += 1
		else
			p11[p10] = 1
			
			for i, v in next, p10 do
				countTableAppearances(i, p11)
				countTableAppearances(v, p11)
			end
			countTableAppearances(getmetatable(p10), p11)
			
			return p11
		end
	end
	return p11
end

local _ = function(p12) --[[ line: 164 ]]
	local t = {}
	local p12Count = #p12
	
	for i = 1, p12Count do
		t[i] = p12[i]
	end
	return t, p12Count
end

local function makePath(p13, ...) --[[ line: 172 ]]
	local list = { ... }
	local t = {}
	local p13Count = #p13
	
	for i = 1, p13Count do
		t[i] = p13[i]
	end
	for i_1 = 1, #list do
		t[p13Count + i_1] = list[i_1]
	end
	return t
end

local function processRecursive(p14, p15, p16, p17) --[[ line: 181 ]]
	-- upvalues: processRecursive (ref), makePath (ref), t (ref)
	if p15 == nil then
		return nil
	elseif p17[p15] then
		return p17[p15]
	end
	local var29 = p14(p15, p16)
	
	if type(var29) == "table" then
		local t_1 = {}
		p17[p15] = t_1
		local _ = nil
		
		for i, v in next, var29 do
			local var32 = processRecursive(p14, i, makePath(p16, i, t.KEY), p17)
			
			if var32 ~= nil then
				t_1[var32] = processRecursive(p14, v, makePath(p16, var32), p17)
			end
		end
		local var31 = processRecursive(p14, getmetatable(var29), makePath(p16, t.METATABLE), p17)
		
		if type(var31) ~= "table" then
			var31 = nil
		end
		setmetatable(t_1, var31)
		var29 = t_1
	end
	return var29
end

local t_4 = {}
local t_5 = { __index = t_4 }

function t_4.puts(p18, ...) --[[ line: 217 ]]
	local list = { ... }
	local buffer = p18.buffer
	local bufferCount = #buffer
	
	for i = 1, #list do
		bufferCount += 1
		buffer[bufferCount] = list[i]
	end
end

function t_4.down(p19, p20) --[[ line: 227 ]]
	p19.level += 1
	p20()
	p19.level -= 1
end

function t_4.tabify(p21) --[[ line: 233 ]]
	p21:puts(p21.newline, string.rep(p21.indent, p21.level))
end

function t_4.alreadyVisited(p22, p23) --[[ line: 237 ]]
	return p22.ids[p23] ~= nil
end

function t_4.getId(p24, p25) --[[ line: 241 ]]
	-- upvalues: _tostring (ref)
	local var35 = p24.ids[p25]
	
	if not var35 then
		local var36 = type(p25)
		var35 = (p24.maxIds[var36] or 0) + 1
		p24.maxIds[var36] = var35
		p24.ids[p25] = var35
	end
	return _tostring(var35)
end

function t_4.putKey(p26, p27) --[[ line: 252 ]]
	if type(p27) == "string" and p27:match("^[_%a][_%a%d]*$") then
		return p26:puts(p27)
	end
	p26:puts("[")
	p26:putValue(p27)
	p26:puts("]")
end

function t_4.putTable(p28, p29) --[[ line: 261 ]]
	-- upvalues: t (ref), _tostring (ref), getNonSequentialKeys (ref)
	if p29 == t.KEY or p29 == t.METATABLE then
		p28:puts(_tostring(p29))
		
		return
	elseif p28:alreadyVisited(p29) then
		p28:puts("<table ", p28:getId(p29), ">")
		
		return
	elseif p28.depth <= p28.level then
		p28:puts("{...}")
		
		return
	elseif p28.tableAppearances[p29] > 1 then
		p28:puts("<", p28:getId(p29), ">")
	end
	local var37, var38, var39 = getNonSequentialKeys(p29)
	local var40 = getmetatable(p29)
	p28:puts("{")
	p28:down(function() --[[ line: 277 ]]
		-- upvalues: var39 (ref), p28 (ref), p29 (ref), var38 (ref), var37 (ref), var40 (ref)
		local var41 = 0
		
		for i = 1, var39 do
			if var41 > 0 then
				p28:puts(",")
			end
			p28:puts(" ")
			p28:putValue(p29[i])
			var41 += 1
		end
		for i_1 = 1, var38 do
			local var42 = var37[i_1]
			
			if var41 > 0 then
				p28:puts(",")
			end
			p28:tabify()
			p28:putKey(var42)
			p28:puts(" = ")
			p28:putValue(p29[var42])
			var41 += 1
		end
		if type(var40) == "table" then
			if var41 > 0 then
				p28:puts(",")
			end
			p28:tabify()
			p28:puts("<metatable> = ")
			p28:putValue(var40)
		end
	end)
	
	if var38 > 0 or type(var40) == "table" then
		p28:tabify()
	elseif var39 > 0 then
		p28:puts(" ")
	end
	p28:puts("}")
end

function t_4.putValue(p30, p31) --[[ line: 320 ]]
	-- upvalues: t_2 (ref), t_1 (ref), _tostring (ref)
	local var43 = type(p31)
	
	if var43 == "string" then
		local var44 = p31:gsub("\\", "\\\\"):gsub("(%c)%f[0-9]", t_2):gsub("%c", t_1)
		p30:puts(if var44:match("\"") and not var44:match("'") then "'" .. var44 .. "'" else "\"" .. var44:gsub("\"", "\\\"") .. "\"")
		
		return
	elseif var43 == "number" or var43 == "boolean" or (var43 == "nil" or var43 == "cdata") or var43 == "ctype" then
		p30:puts(_tostring(p31))
		
		return
	elseif var43 == "table" then
		p30:putTable(p31)
		
		return
	end
	p30:puts("<", var43, " ", p30:getId(p31), ">")
end

function t.inspect(p32, p33) --[[ line: 336 ]]
	-- upvalues: processRecursive (ref), countTableAppearances (ref), t_5 (ref)
	p33 = p33 or {}
	p33 = p33.depth or 1e999
	local newline = p33.newline or "\n"
	local indent = p33.indent or "  "
	local process = p33.process
	
	if process then
		p32 = processRecursive(process, p32, {}, {})
	end
	local tbl = setmetatable({
		level = 0,
		depth = p33,
		buffer = {},
		ids = {},
		maxIds = {},
		newline = newline,
		indent = indent,
		tableAppearances = countTableAppearances(p32)
	}, t_5)
	tbl:putValue(p32)
	
	return table.concat(tbl.buffer)
end

setmetatable(t, {
	__call = function(_, ...) --[[ line: 365 ]]
		-- upvalues: t (ref)
		return t.inspect(...)
	end
})

return t