local Base64Module = {
	MakeEncoder = function(p1, p2, p3)
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

function Base64Module.MakeDecoder(p4, p5, p6)
	-- upvalues: Base64Module (copy)
	local t = {}
	
	for i, value in pairs(Base64Module.MakeEncoder(p4, p5, p6)) do
		t[value] = i
	end
	return t
end

local Encoder = Base64Module.MakeEncoder()
local Decoder = Base64Module.MakeDecoder()
local CharFunction = string.char
local ConcatFunction = table.concat
local ExtractFunction = bit32.extract

function Base64Module.Encode(Text: string, p7, p8)
	-- upvalues: Encoder (copy), ExtractFunction (copy), CharFunction (copy), ConcatFunction (copy)
	local P7 = p7 or Encoder
	local t = {}
	local Count = 1
	local CountText = #Text
	local CountTextRemainder = CountText % 3
	local t1 = {}
	
	for i = 1, CountText - CountTextRemainder, 3 do
		local ByteValue, ByteValue2, ByteValue3 = Text:byte(i, i + 2)
		local NewByteValue = ByteValue * 65536 + ByteValue2 * 256 + ByteValue3
		local Entry = nil
		
		if p8 then
			Entry = t1[NewByteValue]
			
			if not Entry then
				Entry = CharFunction(P7[ExtractFunction(NewByteValue, 18, 6)], P7[ExtractFunction(NewByteValue, 12, 6)], P7[ExtractFunction(NewByteValue, 6, 6)], P7[ExtractFunction(NewByteValue, 0, 6)])
				t1[NewByteValue] = Entry
			end
		else
			Entry = CharFunction(P7[ExtractFunction(NewByteValue, 18, 6)], P7[ExtractFunction(NewByteValue, 12, 6)], P7[ExtractFunction(NewByteValue, 6, 6)], P7[ExtractFunction(NewByteValue, 0, 6)])
		end
		t[Count] = Entry
		Count += 1
	end
	if CountTextRemainder == 2 then
		local ByteValue1, ByteValue2_1 = Text:byte(CountText - 1, CountText)
		local NewByteValue = ByteValue1 * 65536 + ByteValue2_1 * 256
		t[Count] = CharFunction(P7[ExtractFunction(NewByteValue, 18, 6)], P7[ExtractFunction(NewByteValue, 12, 6)], P7[ExtractFunction(NewByteValue, 6, 6)], P7[64])
	elseif CountTextRemainder == 1 then
		local ScaledByteValue = Text:byte(CountText) * 65536
		t[Count] = CharFunction(P7[ExtractFunction(ScaledByteValue, 18, 6)], P7[ExtractFunction(ScaledByteValue, 12, 6)], P7[64], P7[64])
	end
	return ConcatFunction(t)
end

function Base64Module.EncodeUrl(p9, p10)
	-- upvalues: Base64Module (copy)
	return Base64Module.ToUrlSafeBase64((Base64Module.Encode(p9, nil, p10)))
end

function Base64Module.Decode(Text: string, p9, p10)
	-- upvalues: Decoder (copy), CharFunction (copy), ExtractFunction (copy), ConcatFunction (copy)
	local P12 = p9 or Decoder
	local v1 = nil
	local v2 = nil
	
	for i, value in pairs(P12) do
		if value == 62 then
			v1 = i
		elseif value == 63 then
			v2 = i
		end
	end
	local Replaced: string = Text:gsub(("[^%%w%%%s%%%s%%=]"):format(CharFunction(v1), (CharFunction(v2))), "")
	local t = {}
	local t2 = {}
	local Count = 1
	local CountReplaced = #Replaced
	local v3: number = if Replaced:sub(-2) == "==" then 2 elseif Replaced:sub(-1) == "=" then 1 else 0
	local v4 = 1
	local CountReplacedDelta: number = if v3 > 0 then CountReplaced - 4 else CountReplaced
	for i1 = v4, CountReplacedDelta, 4 do
		local ByteValue, ByteValue2, ByteValue3, ByteValue4 = Replaced:byte(i1, i1 + 3)
		local Entry = nil
		
		if p10 then
			local NewByteValue = ByteValue * 16777216 + ByteValue2 * 65536 + ByteValue3 * 256 + ByteValue4
			Entry = t[NewByteValue]
			
			if not Entry then
				local NewEntry = P12[ByteValue] * 262144 + P12[ByteValue2] * 4096 + P12[ByteValue3] * 64 + P12[ByteValue4]
				Entry = CharFunction(ExtractFunction(NewEntry, 16, 8), ExtractFunction(NewEntry, 8, 8), (ExtractFunction(NewEntry, 0, 8)))
				t[NewByteValue] = Entry
			end
		else
			local NewEntry = P12[ByteValue] * 262144 + P12[ByteValue2] * 4096 + P12[ByteValue3] * 64 + P12[ByteValue4]
			Entry = CharFunction(ExtractFunction(NewEntry, 16, 8), ExtractFunction(NewEntry, 8, 8), (ExtractFunction(NewEntry, 0, 8)))
		end
		t2[Count] = Entry
		Count += 1
	end
	if v3 == 1 then
		local ByteValue1, ByteValue2_1, ByteValue3_1 = Replaced:byte(CountReplaced - 3, CountReplaced - 1)
		local NewEntry = P12[ByteValue1] * 262144 + P12[ByteValue2_1] * 4096 + P12[ByteValue3_1] * 64
		t2[Count] = CharFunction(ExtractFunction(NewEntry, 16, 8), (ExtractFunction(NewEntry, 8, 8)))
	elseif v3 == 2 then
		local ByteValue5, ByteValue2_2 = Replaced:byte(CountReplaced - 3, CountReplaced - 2)
		t2[Count] = CharFunction((ExtractFunction(P12[ByteValue5] * 262144 + P12[ByteValue2_2] * 4096, 16, 8)))
	end
	return ConcatFunction(t2)
end

function Base64Module.DecodeUrl(p11, p12)
	-- upvalues: Base64Module (copy)
	return Base64Module.Decode(Base64Module.FromUrlSafeBase64(p11), nil, p12)
end

function Base64Module.ToUrlSafeBase64(Text: string): string
	return (string.gsub(string.gsub(string.gsub(Text, "+", "-"), "/", "_"), "=", ""))
end

function Base64Module.FromUrlSafeBase64(Text: string): string
	local W = Text:gsub("[^%w%-_]", "")
	
	return (string.gsub(string.gsub(W .. string.rep("=", (4 - #W % 4) % 4), "_", "/"), "-", "+"))
end

return Base64Module