local Parent = script.Parent.Parent.Parent
local Array = require(Parent.LuauPolyfill).Array
local RegExpModule = require(Parent.RegExp)

local function stringMatch(Joined, AFAF) --[[ Line: 11 ]]
	local ExecResult = AFAF:exec(Joined)
	local List = {}
	while ExecResult do
		local ExecResultEntry = ExecResult[1]
		table.insert(List, ExecResultEntry)
		ExecResult = AFAF:exec((ExecResult.input:sub(ExecResult.index + ExecResultEntry:len())))
	end
	return List
end

local function _(p1) --[[ Line: 25 | Named "TypeError" ]]
	return p1
end

local AFAF092 = RegExpModule("(%[a-fA-F0-9]{2})+", "i")

local function decodeURIComponent(Character): string --[[ Line: 33 ]]
	-- upvalues: AFAF092 (copy)
	local ExecResult = AFAF092:exec(Character)
	local Character1: string = Character
	
	if ExecResult then
		local List = {}
		
		for i in ExecResult[1]:gmatch("%%(%x%x)") do
			local Number: number? = tonumber(i, 16)
			
			if Number >= 128 then
				error("malformed URI sequence")
			end
			table.insert(List, Number)
		end
		Character1 = utf8.char(unpack(List))
	end
	return Character1
end

local AFAF092_1 = RegExpModule("%[a-fA-F0-9]{2}", "i")
local AFAF092_2 = RegExpModule("(%[a-fA-F0-9]{2})+", "i")

local function decodeComponents(List, Count) --[[ Line: 61 ]]
	-- upvalues: decodeURIComponent (copy), Array (copy), decodeComponents (copy)
	local Success, Result = pcall(decodeURIComponent, table.concat(List, ""))
	
	if Success then
		return Result
	elseif #List == 1 then
		return List
	else
		local Count1 = Count or 1
		
		return Array.concat(decodeComponents((Array.slice(List, 1, Count1 + 1))), decodeComponents((Array.slice(List, Count1 + 1))))
	end
end

local function decode(p1: string) --[[ Line: 83 ]]
	-- upvalues: decodeURIComponent (copy), stringMatch (copy), AFAF092_1 (copy), decodeComponents (copy)
	local Success, Result = pcall(decodeURIComponent, p1)
	
	if Success then
		return Result
	end
	local StringMatchResult = stringMatch(p1, AFAF092_1)
	local Count = 2
	while StringMatchResult[Count] do
		p1 = table.concat(decodeComponents(StringMatchResult, Count), "")
		StringMatchResult = stringMatch(p1, AFAF092_1)
		Count += 1
	end
	return p1
end

local _ = function(Text: string): string --[[ Line: 107 | Named "escapePercent" ]]
	return (Text:gsub("%%", "%%%%"))
end

local function customDecodeURIComponent(Text: string): string --[[ Line: 112 ]]
	-- upvalues: AFAF092_2 (copy), decodeURIComponent (copy), decode (copy)
	local Character = utf8.char(65533)
	local config = {
		["%FE%FF"] = Character .. Character,
		["%FF%FE"] = Character .. Character
	}
	local List = { "%FE%FF", "%FF%FE" }
	local ExecResult = AFAF092_2:exec(Text)
	while ExecResult do
		local ExecResultEntry = ExecResult[1]
		local Success, Result = xpcall(decodeURIComponent, function(_) --[[ Line: 130 ]]
			-- upvalues: decode (upval), ExecResultEntry (copy), config (copy), List (copy)
			local DecodeResult = decode(ExecResultEntry)
			
			if DecodeResult ~= ExecResultEntry then
				if config[ExecResultEntry] == nil then
					table.insert(List, ExecResultEntry)
				end
				config[ExecResultEntry] = DecodeResult
			end
		end, ExecResultEntry)
		
		if Success then
			if config[ExecResultEntry] == nil then
				table.insert(List, ExecResultEntry)
			end
			config[ExecResultEntry] = Result
		end
		ExecResult = AFAF092_2:exec((ExecResult.input:sub(ExecResult.index + ExecResultEntry:len())))
	end
	config["%C2"] = Character
	table.insert(List, "%C2")
	
	for _, Text1 in List do
		Text = string.gsub(Text, Text1:gsub("%%", "%%%%"), (config[Text1]:gsub("%%", "%%%%")))
	end
	return Text
end

return function(Text: string) --[[ Line: 172 | Named "decodeComponent" ]]
	-- upvalues: customDecodeURIComponent (copy)
	if type(Text) ~= "string" then
		error("Expected `encodedURI` to be of type `string`, got `" .. typeof(Text) .. "`")
	end
	return (customDecodeURIComponent((Text:gsub("%+", " "))))
end