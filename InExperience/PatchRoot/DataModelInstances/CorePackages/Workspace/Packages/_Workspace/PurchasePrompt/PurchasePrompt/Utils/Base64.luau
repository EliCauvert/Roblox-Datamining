local Base64Module = {
	MakeEncoder = function(p1, p2, p3) --[[ Line: 8 ]]
		local ByteValues = {}
		
		for i, Text in pairs({
			[0] = "A",
			"B",
			"C",
			"D",
			"E",
			"F",
			"G",
			"H",
			"I",
			"J",
			"K",
			"L",
			"M",
			"N",
			"O",
			"P",
			"Q",
			"R",
			"S",
			"T",
			"U",
			"V",
			"W",
			"X",
			"Y",
			"Z",
			"a",
			"b",
			"c",
			"d",
			"e",
			"f",
			"g",
			"h",
			"i",
			"j",
			"k",
			"l",
			"m",
			"n",
			"o",
			"p",
			"q",
			"r",
			"s",
			"t",
			"u",
			"v",
			"w",
			"x",
			"y",
			"z",
			"0",
			"1",
			"2",
			"3",
			"4",
			"5",
			"6",
			"7",
			"8",
			"9",
			p1 or "+",
			p2 or "/",
			p3 or "="
		}) do
			ByteValues[i] = Text:byte()
		end
		return ByteValues
	end
}
local Encoder = Base64Module.MakeEncoder()
local CharFunction = string.char
local ConcatFunction = table.concat
local ExtractFunction = bit32.extract

function Base64Module.Encode(Text: string, p4, p5) --[[ Line: 88 ]]
	-- upvalues: Encoder (copy), ExtractFunction (copy), CharFunction (copy), ConcatFunction (copy)
	local P4 = p4 or Encoder
	local t = {}
	local Count = 1
	local CountText = #Text
	local CountTextRemainder = CountText % 3
	local t1 = {}
	
	for i = 1, CountText - CountTextRemainder, 3 do
		local ByteValue, ByteValue2, ByteValue3 = Text:byte(i, i + 2)
		local NewByteValue = ByteValue * 65536 + ByteValue2 * 256 + ByteValue3
		local Entry = nil
		
		if p5 then
			Entry = t1[NewByteValue]
			
			if not Entry then
				Entry = CharFunction(P4[ExtractFunction(NewByteValue, 18, 6)], P4[ExtractFunction(NewByteValue, 12, 6)], P4[ExtractFunction(NewByteValue, 6, 6)], P4[ExtractFunction(NewByteValue, 0, 6)])
				t1[NewByteValue] = Entry
			end
		else
			Entry = CharFunction(P4[ExtractFunction(NewByteValue, 18, 6)], P4[ExtractFunction(NewByteValue, 12, 6)], P4[ExtractFunction(NewByteValue, 6, 6)], P4[ExtractFunction(NewByteValue, 0, 6)])
		end
		t[Count] = Entry
		Count += 1
	end
	if CountTextRemainder == 2 then
		local ByteValue1, ByteValue2_1 = Text:byte(CountText - 1, CountText)
		local NewByteValue = ByteValue1 * 65536 + ByteValue2_1 * 256
		t[Count] = CharFunction(P4[ExtractFunction(NewByteValue, 18, 6)], P4[ExtractFunction(NewByteValue, 12, 6)], P4[ExtractFunction(NewByteValue, 6, 6)], P4[64])
	elseif CountTextRemainder == 1 then
		local ScaledByteValue = Text:byte(CountText) * 65536
		t[Count] = CharFunction(P4[ExtractFunction(ScaledByteValue, 18, 6)], P4[ExtractFunction(ScaledByteValue, 12, 6)], P4[64], P4[64])
	end
	return ConcatFunction(t)
end

return Base64Module