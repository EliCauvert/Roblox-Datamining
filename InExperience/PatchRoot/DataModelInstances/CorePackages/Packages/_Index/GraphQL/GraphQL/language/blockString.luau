local LuauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local String1 = LuauPolyfillModule.String
local Callback = nil

local function dedentBlockStringValue(p1) --[[ Line: 22 ]]
	-- upvalues: String1 (copy), Callback (ref), Array (copy)
	local SplitResult = String1.split(p1, { "\r\n", "\n", "\r" })
	local CallbackResult: number = Callback(p1)
	
	if CallbackResult ~= 0 then
		for i = 2, #SplitResult do
			SplitResult[i] = String1.slice(SplitResult[i], CallbackResult + 1)
		end
	end
	local Count = 0
	while Count < #SplitResult and isBlank(SplitResult[Count + 1]) do
		Count += 1
	end
	local CountSplitResult = #SplitResult
	while Count < CountSplitResult and isBlank(SplitResult[CountSplitResult - 1 + 1]) do
		CountSplitResult -= 1
	end
	return Array.join(Array.slice(SplitResult, Count + 1, CountSplitResult + 1), "\n")
end

function isBlank(Text: string): boolean --[[ Line: 51 ]]
	for i = 1, #Text do
		local Segment = string.sub(Text, i, i)
		
		if Segment ~= " " and Segment ~= "\t" then
			return false
		end
	end
	return true
end

Callback = function(Text: string): number --[[ Line: 62 | Named "getBlockStringIndentation" ]]
	-- upvalues: String1 (copy)
	local Enabled = true
	local Flag = true
	local Count = 0
	local v1: number? = nil
	local Count1 = 1
	local Length = string.len(Text)
	while Count1 <= Length do
		local CharCodeAtResult = String1.charCodeAt(Text, Count1)
		
		if CharCodeAtResult == 13 and String1.charCodeAt(Text, Count1 + 1) == 10 then
			Count1 += 1
		end
		if CharCodeAtResult == 10 then
			Enabled = false
			Flag = true
			Count = 0
		elseif CharCodeAtResult == 9 or CharCodeAtResult == 32 then
			Count += 1
		else
			if Flag and Enabled ~= true and (v1 == nil or Count < v1) then
				v1 = Count
			end
			Flag = false
		end
		Count1 += 1
	end
	return v1 and v1 or 0
end

return {
	getBlockStringIndentation = Callback,
	dedentBlockStringValue = dedentBlockStringValue,
	printBlockString = function(Text: string, p2, p3): string --[[ Line: 102 ]]
		local P1 = p2 or ""
		local NoFoundAt = string.find(Text, "\n") == nil
		local IsSegmentMatch: boolean = string.sub(Text, 1, 1) == " " or string.sub(Text, 1, 1) == "\t"
		local IsSegmentMatch1 = string.sub(Text, #Text, #Text) == "\""
		local IsSegmentMatch2 = string.sub(Text, #Text, #Text) == "\\"
		local IsNotNoFoundAt = NoFoundAt ~= true or (IsSegmentMatch1 or (IsSegmentMatch2 or p3 ~= nil and p3))
		local Text1 = ""
		
		if IsNotNoFoundAt and (NoFoundAt and IsSegmentMatch) ~= true then
			Text1 ..= "\n" .. P1
		end
		local Text2 = Text1 .. (if P1 == "" then Text else string.gsub(Text, "\n", "\n" .. P1) or Text)
		
		if IsNotNoFoundAt then
			Text2 ..= "\n"
		end
		return "\"\"\"" .. string.gsub(Text2, "\"\"\"", "\\\"\"\"") .. "\"\"\""
	end
}