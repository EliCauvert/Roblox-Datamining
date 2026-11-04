local function _(p1: number): boolean
	return p1 == 32 or p1 ~= nil and (p1 >= 9 and p1 <= 13)
end

local _ = function(Text: string): boolean
	return string.find(Text, "%S") == nil
end

local _ = function(Text: string): string
	local ByteValue = string.byte(Text, 1)
	
	if ByteValue ~= 32 and (ByteValue == nil or (ByteValue < 9 or ByteValue > 13)) then
		local ByteValue1 = string.byte(Text, -1)
		
		if ByteValue1 ~= 32 and (ByteValue1 == nil or (ByteValue1 < 9 or ByteValue1 > 13)) then
			return Text
		end
	end
	return if string.find(Text, "%S") == nil then "" else string.match(Text, "^%s*(.*%S)") or ""
end

return function(Text1: string, Text: string): string
	local ByteValue = string.byte(Text, 1)
	local Match = nil
	repeat
		if ByteValue ~= 32 and (ByteValue == nil or (ByteValue < 9 or ByteValue > 13)) then
			local ByteValue1 = string.byte(Text, -1)
			
			if ByteValue1 ~= 32 and (ByteValue1 == nil or (ByteValue1 < 9 or ByteValue1 > 13)) then
				Match = Text
				break
			end
		end
		local NoFoundAt = string.find(Text, "%S") == nil
		Match = if NoFoundAt then "" else string.match(Text, "^%s*(.*%S)") or ""
	until true
	if Match == "" then
		return Text1
	end
	if Text1 ~= "" then
		local ByteValue2 = string.byte(Text1, -1)
		
		if ByteValue2 ~= 32 and (ByteValue2 == nil or (ByteValue2 < 9 or ByteValue2 > 13)) then
			return Text1 .. " " .. Match
		end
	end
	return Text1 .. Match
end