local HttpService = game:GetService("HttpService")
local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local String1 = LuauPolyfillModule.String
local Number = LuauPolyfillModule.Number
local RegExpModule = require(Parent1.RegExp)

local function _(p1)
	return p1
end

local function encodeURIComponent(Input)
	-- upvalues: HttpService (copy)
	return HttpService:UrlEncode(Input)
end

local function strictUriEncode(Input)
	-- upvalues: HttpService (copy)
	return HttpService:UrlEncode(Input):gsub("[!'%(%)%*]", function(Text: string)
		return ("%%%x"):format(Text:byte()):upper()
	end)
end

local DecodeURIComponentModule = require(Parent.decodeURIComponent)
local SplitOnFirstModule = require(Parent.splitOnFirst)
local Callback = nil
local Callback1 = nil

local _ = function(p1): number
	return tonumber(p1) or -(0 / 0)
end

local function encoderForArrayFormat(AssignResult)
	-- upvalues: Array (copy), Callback (ref)
	local ArrayFormat = AssignResult.arrayFormat
	
	return if ArrayFormat == "index" then function(p1)
		-- upvalues: AssignResult (copy), Array (upval), Callback (upval)
		return function(p2, p3)
			-- upvalues: AssignResult (upval), Array (upval), Callback (upval), p1 (copy)
			local CountP7 = #p2
			
			return if AssignResult.skipNull and p3 == nil then p2 elseif p3 == nil then Array.concat(p2, {
				table.concat({ Callback(p1, AssignResult), "[", CountP7, "]" }, "")
			}) else Array.concat(p2, {
				table.concat({
					Callback(p1, AssignResult),
					"[",
					Callback(CountP7, AssignResult),
					"]=",
					Callback(p3, AssignResult)
				}, "")
			})
		end
	end elseif ArrayFormat == "bracket" then function(p1)
		-- upvalues: AssignResult (copy), Array (upval), Callback (upval)
		return function(p2, p3)
			-- upvalues: AssignResult (upval), Array (upval), Callback (upval), p1 (copy)
			return if AssignResult.skipNull and p3 == nil then p2 elseif p3 == nil then Array.concat(p2, { table.concat({ Callback(p1, AssignResult), "[]" }, "") }) else Array.concat(p2, {
				table.concat({
					Callback(p1, AssignResult),
					"[]=",
					Callback(p3, AssignResult)
				}, "")
			})
		end
	end elseif ArrayFormat == "comma" or ArrayFormat == "separator" then function(p1)
		-- upvalues: Callback (upval), AssignResult (copy)
		return function(p2, p3)
			-- upvalues: Callback (upval), p1 (copy), AssignResult (upval)
			return if p3 == nil or #p3 == 0 then p2 elseif #p2 == 0 then {
				table.concat({
					Callback(p1, AssignResult),
					"=",
					Callback(p1, AssignResult)
				}, "")
			} else {
				table.concat({ p2, Callback(p1, AssignResult) }, AssignResult.arrayFormatSeparator)
			}
		end
	end else function(p1)
		-- upvalues: AssignResult (copy), Array (upval), Callback (upval)
		return function(p2, p3)
			-- upvalues: AssignResult (upval), Array (upval), Callback (upval), p1 (copy)
			return if AssignResult.skipNull and p3 == nil then p2 elseif p3 == nil then Array.concat(p2, { Callback(p1, AssignResult) }) else Array.concat(p2, {
				table.concat({
					Callback(p1, AssignResult),
					"=",
					Callback(p3, AssignResult)
				}, "")
			})
		end
	end
end

local function parserForArrayFormat(AssignResult)
	-- upvalues: RegExpModule (copy), Array (copy), Callback1 (ref)
	local Entry = nil
	local ArrayFormat = AssignResult.arrayFormat
	
	return if ArrayFormat == "index" then function(Text: string, p1, p2)
		-- upvalues: Entry (ref), RegExpModule (upval)
		Entry = RegExpModule("\\[(\\d*)\\]$"):exec(Text)
		local D = Text:gsub("%[%d*%]$", "")
		
		if not Entry then
			p2[D] = p1
			
			return
		end
		if p2[D] == nil then
			p2[D] = {}
		end
		p2[D][Entry[2]] = p1
	end elseif ArrayFormat == "bracket" then function(Text: string, p1, ConcatResults)
		-- upvalues: Entry (ref), RegExpModule (upval), Array (upval)
		Entry = RegExpModule("(\\[\\])$"):exec(Text)
		local v1 = Text:gsub("%[%]$", "")
		
		if not Entry then
			ConcatResults[v1] = p1
			
			return
		end
		if ConcatResults[v1] == nil then
			ConcatResults[v1] = { p1 }
			
			return
		else
			ConcatResults[v1] = Array.concat({}, ConcatResults[v1], p1)
		end
	end elseif ArrayFormat == "comma" or ArrayFormat == "separator" then function(Key, Text: string, MapResults)
		-- upvalues: AssignResult (copy), Array (upval), Callback1 (upval)
		local HasFoundAt: boolean = type(Text) == "string" and string.find(Text, AssignResult.arrayFormatSeparator, 1, true) ~= nil
		MapResults[Key] = if HasFoundAt then Array.map(Text:split(AssignResult.arrayFormatSeparator), function(p1)
			-- upvalues: Callback1 (upval), AssignResult (upval)
			return Callback1(p1, AssignResult)
		end) elseif Text == nil then nil else Callback1(Text, AssignResult)
	end else function(Key, p1, ConcatResults)
		-- upvalues: Array (upval)
		if ConcatResults[Key] == nil then
			ConcatResults[Key] = p1
			
			return
		else
			ConcatResults[Key] = Array.concat({}, ConcatResults[Key], p1)
		end
	end
end

local _ = function(p1: string)
	if type(p1) ~= "string" or #p1 ~= 1 then
		error("arrayFormatSeparator must be single character string")
	end
end

Callback = function(Count, AssignResult)
	-- upvalues: strictUriEncode (copy), encodeURIComponent (copy)
	return if AssignResult.encode then if AssignResult.strict then strictUriEncode(Count) else encodeURIComponent(Count) else Count
end

Callback1 = function(p1, AssignResult)
	-- upvalues: DecodeURIComponentModule (copy)
	return if AssignResult.decode then DecodeURIComponentModule(p1) else p1
end

local function keysSorter(KeysResult)
	-- upvalues: Array (copy), keysSorter (copy), Object (copy)
	return if Array.isArray(KeysResult) then Array.sort(KeysResult) elseif type(KeysResult) == "table" then Array.map(Array.sort(keysSorter(Object.keys(KeysResult)), function(p1, p2): number
		return (tonumber(p1) or -(0 / 0)) - (tonumber(p2) or -(0 / 0))
	end), function(p1)
		-- upvalues: KeysResult (copy)
		return KeysResult[p1]
	end) else KeysResult
end

local _ = function(Text: string): string
	local v1: number = Text:find("#")
	
	if v1 ~= nil then
		Text = Text:sub(1, v1 - 1)
	end
	return Text
end

local _ = function(Text: string): string
	local Segment = ""
	local v1: number = Text:find("#")
	
	if v1 ~= nil then
		Segment = Text:sub(v1)
	end
	return Segment
end

local function parseValue(Text, AssignResult)
	-- upvalues: Number (copy), String1 (copy)
	if AssignResult.parseNumbers and not Number.isNaN(tonumber(Text) or -(0 / 0)) and type(Text) == "string" and String1.trim(Text) ~= "" then
		Text = tonumber(Text) or -(0 / 0)
		
		return Text
	end
	if AssignResult.parseBooleans and Text ~= nil and (string.lower(Text) == "true" or string.lower(Text) == "false") then
		Text = string.lower(Text) == "true"
	end
	return Text
end

local function parse(Segment, p1)
	-- upvalues: Object (copy), parserForArrayFormat (copy), String1 (copy), SplitOnFirstModule (copy), Callback1 (ref), parseValue (copy), Array (copy), Boolean (copy), keysSorter (copy)
	local AssignResult = Object.assign({
		decode = true,
		sort = true,
		arrayFormat = "none",
		arrayFormatSeparator = ",",
		parseNumbers = false,
		parseBooleans = false
	}, p1)
	local ArrayFormatSeparator = AssignResult.arrayFormatSeparator
	
	if type(ArrayFormatSeparator) ~= "string" or #ArrayFormatSeparator ~= 1 then
		error("arrayFormatSeparator must be single character string")
	end
	local ParserForArrayFormatResult: (any, any, any) -> () = parserForArrayFormat(AssignResult)
	local t = {}
	
	if type(Segment) ~= "string" then
		return t
	end
	local Replaced = string.gsub(String1.trim(Segment), "^[%?#&]", "")
	
	if Replaced == "" then
		return t
	end
	for i, value in Replaced:split("&") do
		local v1 = SplitOnFirstModule(if AssignResult.decode then string.gsub(value, "%+", " ") else value, "=")
		local v2 = v1[1]
		local v3 = v1[2]
		
		if v3 ~= nil and AssignResult.arrayFormat ~= "comma" then
			v3 = Callback1(v3, AssignResult)
		end
		ParserForArrayFormatResult(Callback1(v2, AssignResult), v3, t)
	end
	for i in t do
		local Entry = t[i]
		
		if type(Entry) ~= "table" then
			t[i] = parseValue(Entry, AssignResult)
			continue
		end
		for i1 in Entry do
			Entry[i1] = parseValue(Entry[i1], AssignResult)
		end
	end
	return if AssignResult.sort == false then t else Array.reduce(if AssignResult.sort == true then Array.sort(Object.keys(t)) else Array.sort(Object.keys(t), AssignResult.sort), function(p2, Key)
		-- upvalues: t (copy), Boolean (upval), Array (upval), keysSorter (upval)
		local Entry = t[Key]
		
		if Boolean.toJSBoolean(Entry) and type(Entry) == "table" and not Array.isArray(Entry) then
			p2[Key] = keysSorter(Entry)
			
			return p2
		else
			p2[Key] = Entry
			
			return p2
		end
	end, {})
end

local QueryStringModule = {
	extract = function(Url): string
		local Text: string = Url
		local v4: number = Text:find("#")
		
		if v4 ~= nil then
			Text = Text:sub(1, v4 - 1)
		end
		local v5: number? = Text:find("?", 1, true)
		
		return if v5 == nil then "" else Text:sub(v5 + 1)
	end,
	parse = parse,
	stringify = function(Tbl, p2): string
		-- upvalues: Object (copy), encoderForArrayFormat (copy), Array (copy), Callback (ref)
		if not Tbl then
			return ""
		end
		local AssignResult = Object.assign({
			encode = true,
			strict = true,
			arrayFormat = "none",
			arrayFormatSeparator = ","
		}, p2)
		local ArrayFormatSeparator = AssignResult.arrayFormatSeparator
		
		if type(ArrayFormatSeparator) ~= "string" or #ArrayFormatSeparator ~= 1 then
			error("arrayFormatSeparator must be single character string")
		end
		local EncoderForArrayFormatResult = encoderForArrayFormat(AssignResult)
		local KeysResult = Object.keys((table.clone(Tbl)))
		
		if AssignResult.sort ~= false then
			Array.sort(KeysResult, AssignResult.sort)
		end
		return table.concat(Array.filter(Array.map(KeysResult, function(p3)
			-- upvalues: Tbl (copy), Callback (upval), AssignResult (ref), Array (upval), EncoderForArrayFormatResult (copy)
			local Entry = Tbl[p3]
			
			return if Entry == nil then Callback(p3, AssignResult) elseif Array.isArray(Entry) then table.concat(Array.reduce(Entry, EncoderForArrayFormatResult(p3), {}), "&") else Callback(p3, AssignResult) + "=" + Callback(Entry, AssignResult)
		end), function(p3): boolean
			return p3.length > 0
		end), "&")
	end,
	parseUrl = function(p2, p3)
		-- upvalues: parse (copy)
		local t = {}
		local Text: string = p2
		local v4: number = Text:find("#")
		
		if v4 ~= nil then
			Text = Text:sub(1, v4 - 1)
		end
		t.url = Text:split("?")[1] or ""
		local Text1: string = p2
		local v5: number = Text1:find("#")
		
		if v5 ~= nil then
			Text1 = Text1:sub(1, v5 - 1)
		end
		local v6: number? = Text1:find("?", 1, true)
		t.query = parse(if v6 == nil then "" else Text1:sub(v6 + 1), p3)
		
		return t
	end
}

function QueryStringModule.stringifyUrl(p2, p3): string
	-- upvalues: QueryStringModule (copy), Object (copy)
	local Url = p2.url
	local v4: number = Url:find("#")
	
	if v4 ~= nil then
		Url = Url:sub(1, v4 - 1)
	end
	local v5 = Url:split("?")[1] or ""
	local ParseResult = QueryStringModule.parse((QueryStringModule.extract(p2.url)))
	local Url1: string = p2.url
	local Segment = ""
	local v6: number = Url1:find("#")
	
	if v6 ~= nil then
		Segment = Url1:sub(v6)
	end
	local Segment1: string = Segment
	local StringifyResult = QueryStringModule.stringify(Object.assign(ParseResult, p2.query), p3)
	
	if StringifyResult then
		StringifyResult = ("?%s"):format(StringifyResult)
	end
	return ("%s%s%s"):format(v5, StringifyResult, Segment1)
end

return QueryStringModule