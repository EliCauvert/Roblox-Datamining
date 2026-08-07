-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:12 2026 Pacific Standard Time.

local t = {}
local t_1 = {}

for i = 1, 64 do
	local var2 = i - 1
	local byteValue = string.byte("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", i)
	t[var2] = byteValue
	t_1[byteValue] = var2
end
t_1[61] = 0

local function buildStringFromCodes(p0) --[[ line: 46 ]]
	local t = {}
	
	for i = 1, #p0, 4096 do
		table.insert(t, string.char(unpack(p0, i, math.min(i + 4096 - 1, #p0))))
	end
	return table.concat(t, "")
end

return {
	encode = function(p1) --[[ line: 56 ]]
		-- upvalues: t (ref), buildStringFromCodes (ref)
		local p1Count = #p1
		local var7 = math.ceil(p1Count / 3) * 4
		local var8 = p1Count % 3
		
		if var8 == 0 then
			p1 ..= "\0"
		end
		local list = table.create(var7, 0)
		
		for i = 0, var7 / 4 - (if var8 == 0 then 1 else 2) do
			local var10 = i * 4 + 1
			local shifted = bit32.rshift(string.unpack(">J", p1, i * 3 + 1), 8)
			list[var10] = t[bit32.rshift(shifted, 18)]
			list[var10 + 1] = t[bit32.band(bit32.rshift(shifted, 12), 63)]
			list[var10 + 2] = t[bit32.band(bit32.rshift(shifted, 6), 63)]
			list[var10 + 3] = t[bit32.band(shifted, 63)]
		end
		if var8 == 1 then
			local byteValue = string.byte(p1, p1Count)
			list[var7 - 3] = t[bit32.rshift(byteValue, 2)]
			list[var7 - 2] = t[bit32.band(bit32.lshift(byteValue, 4), 63)]
			list[var7 - 1] = 61
			list[var7] = 61
		elseif var8 == 2 then
			local unpacked = string.unpack(">H", p1, p1Count - 1)
			list[var7 - 3] = t[bit32.rshift(unpacked, 10)]
			list[var7 - 2] = t[bit32.band(bit32.rshift(unpacked, 4), 63)]
			list[var7 - 1] = t[bit32.band(bit32.lshift(unpacked, 2), 63)]
			list[var7] = 61
		end
		return buildStringFromCodes(list)
	end,
	decode = function(p2) --[[ line: 102 ]]
		-- upvalues: t_1 (ref), buildStringFromCodes (ref)
		local p2Count = #p2
		local var15 = math.ceil(p2Count / 4) * 3
		local var16 = 0
		
		if string.byte(p2, p2Count - 1) == 61 then
			var16 = 2
		elseif string.byte(p2, p2Count) == 61 then
			var16 = 1
		end
		local list = table.create(var15 - var16, 0)
		
		for i = 0, var15 / 3 - 1 do
			local var18 = i * 4 + 1
			local var19 = i * 3 + 1
			local byteValue, byteValue_1, byteValue_2, byteValue_3 = string.byte(p2, var18, var18 + 3)
			local bits = bit32.bor(bit32.lshift(t_1[byteValue], 18), bit32.lshift(t_1[byteValue_1], 12), bit32.lshift(t_1[byteValue_2], 6), t_1[byteValue_3])
			list[var19] = bit32.rshift(bits, 16)
			list[var19 + 1] = bit32.band(bit32.rshift(bits, 8), 255)
			list[var19 + 2] = bit32.band(bits, 255)
		end
		if var16 >= 1 then
			list[var15] = nil
			
			if var16 >= 2 then
				list[var15 - 1] = nil
			end
		end
		return buildStringFromCodes(list)
	end
}