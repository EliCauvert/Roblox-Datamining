local t = {}
local t_1 = {}

for i = 1, 64 do
	local var1 = i - 1
	local byteValue = string.byte("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", i)
	t[var1] = byteValue
	t_1[byteValue] = var1
end
t_1[61] = 0

local function buildStringFromCodes(p1)
	local t = {}
	
	for i = 1, #p1, 4096 do
		table.insert(t, string.char(unpack(p1, i, math.min(i + 4096 - 1, #p1))))
	end
	return table.concat(t, "")
end

return {
	encode = function(p2)
		-- upvalues: t (ref), buildStringFromCodes (ref)
		local p1Count = #p2
		local var2 = math.ceil(p1Count / 3) * 4
		local var3 = p1Count % 3
		
		if var3 == 0 then
			p2 ..= "\0"
		end
		local list = table.create(var2, 0)
		
		for i = 0, var2 / 4 - (if var3 == 0 then 1 else 2) do
			local var4 = i * 4 + 1
			local shifted = bit32.rshift(string.unpack(">J", p2, i * 3 + 1), 8)
			list[var4] = t[bit32.rshift(shifted, 18)]
			list[var4 + 1] = t[bit32.band(bit32.rshift(shifted, 12), 63)]
			list[var4 + 2] = t[bit32.band(bit32.rshift(shifted, 6), 63)]
			list[var4 + 3] = t[bit32.band(shifted, 63)]
		end
		if var3 == 1 then
			local byteValue = string.byte(p2, p1Count)
			list[var2 - 3] = t[bit32.rshift(byteValue, 2)]
			list[var2 - 2] = t[bit32.band(bit32.lshift(byteValue, 4), 63)]
			list[var2 - 1] = 61
			list[var2] = 61
		elseif var3 == 2 then
			local unpacked = string.unpack(">H", p2, p1Count - 1)
			list[var2 - 3] = t[bit32.rshift(unpacked, 10)]
			list[var2 - 2] = t[bit32.band(bit32.rshift(unpacked, 4), 63)]
			list[var2 - 1] = t[bit32.band(bit32.lshift(unpacked, 2), 63)]
			list[var2] = 61
		end
		return buildStringFromCodes(list)
	end,
	decode = function(p3)
		-- upvalues: t_1 (ref), buildStringFromCodes (ref)
		local p2Count = #p3
		local var5 = math.ceil(p2Count / 4) * 3
		local var6 = 0
		
		if string.byte(p3, p2Count - 1) == 61 then
			var6 = 2
		elseif string.byte(p3, p2Count) == 61 then
			var6 = 1
		end
		local list = table.create(var5 - var6, 0)
		
		for i = 0, var5 / 3 - 1 do
			local var7 = i * 4 + 1
			local var8 = i * 3 + 1
			local byteValue, byteValue_1, byteValue_2, byteValue_3 = string.byte(p3, var7, var7 + 3)
			local bits = bit32.bor(bit32.lshift(t_1[byteValue], 18), bit32.lshift(t_1[byteValue_1], 12), bit32.lshift(t_1[byteValue_2], 6), t_1[byteValue_3])
			list[var8] = bit32.rshift(bits, 16)
			list[var8 + 1] = bit32.band(bit32.rshift(bits, 8), 255)
			list[var8 + 2] = bit32.band(bits, 255)
		end
		if var6 >= 1 then
			list[var5] = nil
			
			if var6 >= 2 then
				list[var5 - 1] = nil
			end
		end
		return buildStringFromCodes(list)
	end
}