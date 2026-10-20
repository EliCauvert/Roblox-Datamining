local Callback = tostring
local config = {
	_VERSION = "inspect.lua 3.1.0",
	_URL = "http://github.com/kikito/inspect.lua",
	_DESCRIPTION = "human-readable representations of tables",
	_LICENSE = "\t  MIT LICENSE\n\n\t  Copyright (c) 2013 Enrique García Cota\n\n\t  Permission is hereby granted, free of charge, to any person obtaining a\n\t  copy of this software and associated documentation files (the\n\t  \"Software\"), to deal in the Software without restriction, including\n\t  without limitation the rights to use, copy, modify, merge, publish,\n\t  distribute, sublicense, and/or sell copies of the Software, and to\n\t  permit persons to whom the Software is furnished to do so, subject to\n\t  the following conditions:\n\n\t  The above copyright notice and this permission notice shall be included\n\t  in all copies or substantial portions of the Software.\n\n\t  THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS\n\t  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF\n\t  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.\n\t  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY\n\t  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,\n\t  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE\n\t  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.\n\t",
	KEY = setmetatable({}, {
		__tostring = function(): string
			return "inspect.KEY"
		end
	}),
	METATABLE = setmetatable({}, {
		__tostring = function(): string
			return "inspect.METATABLE"
		end
	})
}

local function _(p1)
	return next, p1, nil
end

local _ = function(Text: string): string
	return if Text:match("\"") and not Text:match("'") then "'" .. Text .. "'" else "\"" .. Text:gsub("\"", "\\\"") .. "\""
end

local config1 = {
	["\a"] = "\\a",
	["\b"] = "\\b",
	["\f"] = "\\f",
	["\n"] = "\\n",
	["\r"] = "\\r",
	["\t"] = "\\t",
	["\11"] = "\\v"
}
local t = {}

for i = 0, 31 do
	local Character = string.char(i)
	
	if not config1[Character] then
		config1[Character] = "\\" .. i
		t[Character] = string.format("\\%03d", i)
	end
end
local _ = function(Text: string)
	-- upvalues: t (copy), config1 (copy)
	return (Text:gsub("\\", "\\\\"):gsub("(%c)%f[0-9]", t):gsub("%c", config1))
end

local _ = function(p1)
	return type(p1) == "string" and p1:match("^[_%a][_%a%d]*$")
end

local _ = function(Value: number, p1): boolean
	return type(Value) == "number" and (Value >= 1 and Value <= p1) and math.floor(Value) == Value
end

local config2 = {
	number = 1,
	boolean = 2,
	string = 3,
	table = 4,
	["function"] = 5,
	userdata = 6,
	thread = 7
}

local function sortKeys(A, B): boolean
	-- upvalues: config2 (copy)
	local ValueType = type(A)
	local ValueType1 = type(B)
	
	if ValueType == ValueType1 and (ValueType == "string" or ValueType == "number") then
		return A < B
	else
		local Entry = config2[ValueType]
		local Entry1 = config2[ValueType1]
		
		return if Entry and Entry1 then config2[ValueType] < config2[ValueType1] elseif Entry then true else not Entry1 and ValueType < ValueType1
	end
end

local _ = function(p1): number
	local Count = 1
	local RawValue = rawget(p1, Count)
	while RawValue ~= nil do
		Count += 1
		RawValue = rawget(p1, Count)
	end
	return Count - 1
end

local function getNonSequentialKeys(KEY)
	-- upvalues: sortKeys (copy)
	local List = {}
	local Count = 0
	local Count1 = 1
	local RawValue = rawget(KEY, Count1)
	while RawValue ~= nil do
		Count1 += 1
		RawValue = rawget(KEY, Count1)
	end
	local CountDelta = Count1 - 1
	
	for i, _ in next, KEY do
		if type(i) ~= "number" or (i < 1 or (i > CountDelta or math.floor(i) ~= i)) then
			Count += 1
			List[Count] = i
		end
	end
	table.sort(List, sortKeys)
	
	return List, Count, CountDelta
end

local function countTableAppearances(Key, p2)
	-- upvalues: countTableAppearances (copy)
	local P10 = p2 or {}
	
	if type(Key) == "table" then
		if P10[Key] then
			P10[Key] += 1
		else
			P10[Key] = 1
			
			for i, value in next, Key do
				countTableAppearances(i, P10)
				countTableAppearances(value, P10)
			end
			countTableAppearances(getmetatable(Key), P10)
			
			return P10
		end
	end
	return P10
end

local _ = function(p3)
	local t = {}
	local CountP11 = #p3
	
	for i = 1, CountP11 do
		t[i] = p3[i]
	end
	return t, CountP11
end

local function makePath(p4, ...)
	local list = { ... }
	local t = {}
	local CountP12 = #p4
	
	for i = 1, CountP12 do
		t[i] = p4[i]
	end
	for i1 = 1, #list do
		t[CountP12 + i1] = list[i1]
	end
	return t
end

local function processRecursive(Callback, Key, p5, p6)
	-- upvalues: processRecursive (copy), makePath (copy), config (copy)
	if Key == nil then
		return nil
	end
	if p6[Key] then
		return p6[Key]
	end
	local CallbackResult = Callback(Key, p5)
	
	if type(CallbackResult) == "table" then
		local t = {}
		p6[Key] = t
		
		for i, value in next, CallbackResult do
			local ProcessRecursiveResult = processRecursive(Callback, i, makePath(p5, i, config.KEY), p6)
			
			if ProcessRecursiveResult ~= nil then
				t[ProcessRecursiveResult] = processRecursive(Callback, value, makePath(p5, ProcessRecursiveResult), p6)
			end
		end
		local ProcessRecursiveResult = processRecursive(Callback, getmetatable(CallbackResult), makePath(p5, config.METATABLE), p6)
		
		if type(ProcessRecursiveResult) ~= "table" then
			ProcessRecursiveResult = nil
		end
		setmetatable(t, ProcessRecursiveResult)
		CallbackResult = t
	end
	return CallbackResult
end

local t1 = {}
local config3 = { __index = t1 }

function t1.puts(p7, ...)
	local list = { ... }
	local Buffer = p7.buffer
	local CountBuffer = #Buffer
	
	for i = 1, #list do
		CountBuffer += 1
		Buffer[CountBuffer] = list[i]
	end
end

function t1.down(p8, Callback: () -> ())
	p8.level += 1
	Callback()
	p8.level -= 1
end

function t1.tabify(p8)
	p8:puts(p8.newline, string.rep(p8.indent, p8.level))
end

function t1.alreadyVisited(p8, KEY): boolean
	return p8.ids[KEY] ~= nil
end

function t1.getId(p8, KEY)
	-- upvalues: Callback (copy)
	local Id = p8.ids[KEY]
	
	if not Id then
		local ValueType = type(KEY)
		Id = (p8.maxIds[ValueType] or 0) + 1
		p8.maxIds[ValueType] = Id
		p8.ids[KEY] = Id
	end
	return (Callback(Id))
end

function t1.putKey(p8, p9)
	if type(p9) == "string" and p9:match("^[_%a][_%a%d]*$") then
		return p8:puts(p9)
	else
		p8:puts("[")
		p8:putValue(p9)
		p8:puts("]")
	end
end

function t1.putTable(p8, KEY)
	-- upvalues: config (copy), Callback (copy), getNonSequentialKeys (copy)
	if KEY == config.KEY or KEY == config.METATABLE then
		p8:puts((Callback(KEY)))
		
		return
	end
	if p8:alreadyVisited(KEY) then
		p8:puts("<table ", p8:getId(KEY), ">")
		
		return
	end
	if p8.depth <= p8.level then
		p8:puts("{...}")
		
		return
	end
	if p8.tableAppearances[KEY] > 1 then
		p8:puts("<", p8:getId(KEY), ">")
	end
	local NonSequentialKeys, NonSequentialKeys2, NonSequentialKeys3 = getNonSequentialKeys(KEY)
	local Meta = getmetatable(KEY)
	p8:puts("{")
	p8:down(function()
		-- upvalues: NonSequentialKeys3 (copy), p8 (copy), KEY (copy), NonSequentialKeys2 (copy), NonSequentialKeys (copy), Meta (copy)
		local Count = 0
		
		for i = 1, NonSequentialKeys3 do
			if Count > 0 then
				p8:puts(",")
			end
			p8:puts(" ")
			p8:putValue(KEY[i])
			Count += 1
		end
		for i1 = 1, NonSequentialKeys2 do
			local NonSequentialKey = NonSequentialKeys[i1]
			
			if Count > 0 then
				p8:puts(",")
			end
			p8:tabify()
			p8:putKey(NonSequentialKey)
			p8:puts(" = ")
			p8:putValue(KEY[NonSequentialKey])
			Count += 1
		end
		if type(Meta) == "table" then
			if Count > 0 then
				p8:puts(",")
			end
			p8:tabify()
			p8:puts("<metatable> = ")
			p8:putValue(Meta)
		end
	end)
	
	if NonSequentialKeys2 > 0 or type(Meta) == "table" then
		p8:tabify()
	elseif NonSequentialKeys3 > 0 then
		p8:puts(" ")
	end
	p8:puts("}")
end

function t1.putValue(p9, Text: string)
	-- upvalues: t (copy), config1 (copy), Callback (copy)
	local ValueType = type(Text)
	
	if ValueType == "string" then
		local C: string = Text:gsub("\\", "\\\\"):gsub("(%c)%f[0-9]", t):gsub("%c", config1)
		p9:puts(if C:match("\"") and not C:match("'") then "'" .. C .. "'" else "\"" .. C:gsub("\"", "\\\"") .. "\"")
		
		return
	end
	if ValueType == "number" or ValueType == "boolean" or ValueType == "nil" or ValueType == "cdata" or ValueType == "ctype" then
		p9:puts((Callback(Text)))
		
		return
	end
	if ValueType == "table" then
		p9:putTable(Text)
		
		return
	else
		p9:puts("<", ValueType, " ", p9:getId(Text), ">")
	end
end

function config.inspect(Key, p9): string
	-- upvalues: processRecursive (copy), countTableAppearances (copy), config3 (copy)
	local P30 = p9 or {}
	local Depth = P30.depth or 1e999
	local Newline = P30.newline or "\n"
	local Indent = P30.indent or "  "
	local Process = P30.process
	
	if Process then
		Key = processRecursive(Process, Key, {}, {})
	end
	local self = setmetatable({
		level = 0,
		depth = Depth,
		buffer = {},
		ids = {},
		maxIds = {},
		newline = Newline,
		indent = Indent,
		tableAppearances = countTableAppearances(Key)
	}, config3)
	self:putValue(Key)
	
	return table.concat(self.buffer)
end

setmetatable(config, {
	__call = function(_, ...)
		-- upvalues: config (copy)
		return config.inspect(...)
	end
})

return config