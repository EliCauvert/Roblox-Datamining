local Parent = script.Parent
local LuauPolyfillModule = require(Parent.Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local String1 = LuauPolyfillModule.String
local GetLocationFunction = require(Parent.location).getLocation
local Callback1 = nil
local Callback3 = nil
local Callback = nil
local Callback2 = nil

local function printLocation(p1) --[[ Line: 27 ]]
	-- upvalues: Callback (ref), GetLocationFunction (copy)
	return Callback(p1.source, GetLocationFunction(p1.source, p1.start))
end

Callback = function(Source, p1): string --[[ Line: 34 | Named "printSourceLocation" ]]
	-- upvalues: Callback1 (ref), String1 (copy), Callback2 (ref), Array (copy)
	local ColumnDelta = Source.locationOffset.column - 1
	local NewLine = p1.line - 1 + 1
	local NewLine1 = p1.line + (Source.locationOffset.line - 1)
	local NewColumn = p1.column + (p1.line == 1 and ColumnDelta or 0)
	local Text1 = Source.name .. ":" .. NewLine1 .. ":" .. NewColumn .. "\n"
	local SplitResult = String1.split(Callback1(ColumnDelta) .. Source.body, { "\r\n", "\n", "\r" })
	local Text: string = SplitResult[NewLine]
	
	if string.len(Text) <= 120 then
		return Text1 .. Callback2({
			{ NewLine1 - 1, SplitResult[NewLine - 1] },
			{ NewLine1, Text },
			{ "", Callback1(NewColumn - 1) .. "^" },
			{ NewLine1 + 1, SplitResult[NewLine + 1] }
		})
	end
	local NewFloored = math.floor(NewColumn / 80) + 1
	local NewColumnRemainder = NewColumn % 80
	local List = {}
	
	for i = 1, string.len(Text), 80 do
		table.insert(List, String1.slice(Text, i, i + 80))
	end
	return Text1 .. Callback2(Array.concat({ { tostring(NewLine1), List[1] } }, Array.map(Array.slice(List, 2, NewFloored + 1), function(p2) --[[ Line: 61 ]]
		return { "", p2 }
	end), { { " ", Callback1(NewColumnRemainder - 1) .. "^" } }, { { "", List[NewFloored + 1] } }))
end

Callback2 = function(ConcatResult) --[[ Line: 83 | Named "printPrefixedLines" ]]
	-- upvalues: Array (copy), Callback3 (ref)
	local FilterResult = Array.filter(ConcatResult, function(Entry): boolean --[[ Line: 84 ]]
		return Entry[2] ~= nil
	end)
	local Largest = math.max(table.unpack(Array.map(FilterResult, function(Entry): number --[[ Line: 89 ]]
		return (string.len(Entry[1]))
	end)))
	
	return Array.join(Array.map(FilterResult, function(Entry): string --[[ Line: 94 ]]
		-- upvalues: Callback3 (upval), Largest (copy)
		local Entry1 = Entry[2]
		
		return Callback3(Largest, Entry[1]) .. (Entry1 and Entry1 ~= "" and " | " .. Entry1 or " |")
	end), "\n")
end

Callback1 = function(Count: number): string --[[ Line: 103 | Named "whitespace" ]]
	return string.rep(" ", Count)
end

Callback3 = function(Largest, Text: string): string --[[ Line: 107 | Named "leftPad" ]]
	-- upvalues: Callback1 (ref)
	return Callback1(Largest - string.len(Text)) .. Text
end

return {
	printSourceLocation = Callback,
	printLocation = printLocation
}