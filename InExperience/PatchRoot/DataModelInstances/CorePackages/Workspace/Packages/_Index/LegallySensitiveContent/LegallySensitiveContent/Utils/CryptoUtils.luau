local function _(p1, p2)
	local shifted = bit32.rshift(p1, 16)
	local bits = bit32.band(p1, 65535)
	local shifted_1 = bit32.rshift(p2, 16)
	local bits_1 = bit32.band(p2, 65535)
	local var1 = bits * bits_1
	local var2 = shifted * bits_1 + bits * shifted_1
	local _ = shifted * shifted_1 + bit32.rshift(var2, 16)
	
	return bit32.band(var1 + bit32.lshift(bit32.band(var2, 65535), 16), 4294967295)
end

return {
	textEncode = function(p1)
		local t = {}
		
		for i = 1, #p1 do
			table.insert(t, string.byte(p1, i))
		end
		return t
	end,
	hashStringWithFnv1a32 = function(p2)
		local t = {}
		
		for i = 1, #p2 do
			table.insert(t, string.byte(p2, i))
		end
		local var1 = 2166136261
		
		for i_1, v in ipairs(t) do
			local bits = bit32.bxor(var1, v)
			local shifted = bit32.rshift(bits, 16)
			local bits_1 = bit32.band(bits, 65535)
			local var2 = bits_1 * 403
			local var3 = shifted * 403 + bits_1 * 256
			local _ = shifted * 256 + bit32.rshift(var3, 16)
			var1 = bit32.band(var2 + bit32.lshift(bit32.band(var3, 65535), 16), 4294967295)
		end
		return string.format("%08x", var1)
	end
}