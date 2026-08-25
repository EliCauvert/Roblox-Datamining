local function _(p0, p1)
	local shifted = bit32.rshift(p0, 16)
	local bits = bit32.band(p0, 65535)
	local shifted_1 = bit32.rshift(p1, 16)
	local bits_1 = bit32.band(p1, 65535)
	local var4 = bits * bits_1
	local var5 = shifted * bits_1 + bits * shifted_1
	local _ = shifted * shifted_1 + bit32.rshift(var5, 16)
	
	return bit32.band(var4 + bit32.lshift(bit32.band(var5, 65535), 16), 4294967295)
end

return {
	textEncode = function(p2)
		local t = {}
		
		for i = 1, #p2 do
			table.insert(t, string.byte(p2, i))
		end
		return t
	end,
	hashStringWithFnv1a32 = function(p3)
		local t = {}
		
		for i = 1, #p3 do
			table.insert(t, string.byte(p3, i))
		end
		local var8 = 2166136261
		
		for i_1, v in ipairs(t) do
			local bits = bit32.bxor(var8, v)
			local shifted = bit32.rshift(bits, 16)
			local bits_1 = bit32.band(bits, 65535)
			local var12 = bits_1 * 403
			local var13 = shifted * 403 + bits_1 * 256
			local _ = shifted * 256 + bit32.rshift(var13, 16)
			var8 = bit32.band(var12 + bit32.lshift(bit32.band(var13, 65535), 16), 4294967295)
		end
		return string.format("%08x", var8)
	end
}