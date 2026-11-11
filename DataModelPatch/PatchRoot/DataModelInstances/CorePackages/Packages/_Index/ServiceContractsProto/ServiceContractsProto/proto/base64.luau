--!native

local ByteValues = {}
local t = {}

for i = 1, 64 do
	local IDelta = i - 1
	local ByteValue = string.byte("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", i)
	ByteValues[IDelta] = ByteValue
	t[ByteValue] = IDelta
end
t[61] = 0

local function buildStringFromCodes(p1): string
	local List = {}
	
	for i = 1, #p1, 4096 do
		table.insert(List, (string.char(unpack(p1, i, (math.min(i + 4096 - 1, #p1))))))
	end
	return table.concat(List, "")
end

return {
	encode = function(Text: string)
		-- upvalues: ByteValues (copy), buildStringFromCodes (copy)
		local CountText = #Text
		local ScaledCeiled = math.ceil(CountText / 3) * 4
		local CountTextRemainder = CountText % 3
		
		if CountTextRemainder == 0 then
			Text ..= "\0"
		end
		local Buffer = table.create(ScaledCeiled, 0)
		local v1 = 0
		local ScaledCeiledRatio = ScaledCeiled / 4
		local v2: number = if CountTextRemainder == 0 then 1 else 2
		for i = v1, ScaledCeiledRatio - v2 do
			local NewI = i * 4 + 1
			local Shifted = bit32.rshift(string.unpack(">J", Text, i * 3 + 1), 8)
			Buffer[NewI] = ByteValues[bit32.rshift(Shifted, 18)]
			Buffer[NewI + 1] = ByteValues[bit32.band(bit32.rshift(Shifted, 12), 63)]
			Buffer[NewI + 2] = ByteValues[bit32.band(bit32.rshift(Shifted, 6), 63)]
			Buffer[NewI + 3] = ByteValues[bit32.band(Shifted, 63)]
		end
		if CountTextRemainder == 1 then
			local ByteValue = string.byte(Text, CountText)
			Buffer[ScaledCeiled - 3] = ByteValues[bit32.rshift(ByteValue, 2)]
			Buffer[ScaledCeiled - 2] = ByteValues[bit32.band(bit32.lshift(ByteValue, 4), 63)]
			Buffer[ScaledCeiled - 1] = 61
			Buffer[ScaledCeiled] = 61
		elseif CountTextRemainder == 2 then
			local Unpacked: number = string.unpack(">H", Text, CountText - 1)
			Buffer[ScaledCeiled - 3] = ByteValues[bit32.rshift(Unpacked, 10)]
			Buffer[ScaledCeiled - 2] = ByteValues[bit32.band(bit32.rshift(Unpacked, 4), 63)]
			Buffer[ScaledCeiled - 1] = ByteValues[bit32.band(bit32.lshift(Unpacked, 2), 63)]
			Buffer[ScaledCeiled] = 61
		end
		return buildStringFromCodes(Buffer)
	end,
	decode = function(Text: string)
		-- upvalues: t (copy), buildStringFromCodes (copy)
		local CountText = #Text
		local ScaledCeiled = math.ceil(CountText / 4) * 3
		local v3: number = if string.byte(Text, CountText - 1) == 61 then 2 elseif string.byte(Text, CountText) == 61 then 1 else 0
		local Buffer = table.create(ScaledCeiled - v3, 0)
		
		for i = 0, ScaledCeiled / 3 - 1 do
			local Index = i * 4 + 1
			local NewI = i * 3 + 1
			local ByteValue, ByteValue2, ByteValue3, ByteValue4 = string.byte(Text, Index, Index + 3)
			local Bits = bit32.bor(bit32.lshift(t[ByteValue], 18), bit32.lshift(t[ByteValue2], 12), bit32.lshift(t[ByteValue3], 6), t[ByteValue4])
			Buffer[NewI] = bit32.rshift(Bits, 16)
			Buffer[NewI + 1] = bit32.band(bit32.rshift(Bits, 8), 255)
			Buffer[NewI + 2] = bit32.band(Bits, 255)
		end
		if v3 >= 1 then
			Buffer[ScaledCeiled] = nil
			
			if v3 >= 2 then
				Buffer[ScaledCeiled - 1] = nil
			end
		end
		return buildStringFromCodes(Buffer)
	end
}