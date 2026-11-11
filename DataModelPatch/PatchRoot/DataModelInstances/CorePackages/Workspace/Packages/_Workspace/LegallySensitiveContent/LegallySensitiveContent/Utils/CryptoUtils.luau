local function _(Value1: number, Value2: number): number
	local Shifted = bit32.rshift(Value1, 16)
	local Bits = bit32.band(Value1, 65535)
	local Shifted1 = bit32.rshift(Value2, 16)
	local Bits1 = bit32.band(Value2, 65535)
	local Value = Shifted * Bits1 + Bits * Shifted1
	local _ = Shifted * Shifted1 + bit32.rshift(Value, 16)
	
	return (bit32.band(Bits * Bits1 + bit32.lshift(bit32.band(Value, 65535), 16), 4294967295))
end

return {
	textEncode = function(Text: string)
		local List = {}
		
		for i = 1, #Text do
			table.insert(List, (string.byte(Text, i)))
		end
		return List
	end,
	hashStringWithFnv1a32 = function(Text: string): string
		local List = {}
		
		for i = 1, #Text do
			table.insert(List, (string.byte(Text, i)))
		end
		local Value = 2166136261
		
		for _, value in ipairs(List) do
			local Bits = bit32.bxor(Value, value)
			local Shifted = bit32.rshift(Bits, 16)
			local Bits1 = bit32.band(Bits, 65535)
			local Value1 = Shifted * 403 + Bits1 * 256
			local _ = Shifted * 256 + bit32.rshift(Value1, 16)
			Value = bit32.band(Bits1 * 403 + bit32.lshift(bit32.band(Value1, 65535), 16), 4294967295)
		end
		return (string.format("%08x", Value))
	end
}