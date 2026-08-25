local base64Module = require(script.base64)
local _ = require(script.message)
local _ = require(script.typeRegistry)
local t = {}

local function readVarIntBytes(p0, p1)
	local var4 = 0
	local var5 = 0
	local var6 = 0
	repeat
		local value = buffer.readu8(p0, p1)
		local bits = bit32.band(value, 127)
		var4 = bit32.bor(var4, bit32.lshift(bits, var6))
		var5 = bit32.bor(var5, bit32.lshift(bits, var6 - 32))
		var6 += 7
		p1 += 1
	until not bit32.btest(value, 128)
	return var4, var5, p1
end

function t.readVarIntU64(p2, p3)
	-- upvalues: readVarIntBytes (ref)
	local _ = nil
	local _ = nil
	local var9, var10, var11 = readVarIntBytes(p2, p3)
	
	return var10 * 4294967296 + var9, var11
end

function t.readVarIntU32(p4, p5)
	-- upvalues: readVarIntBytes (ref)
	local _ = nil
	local _ = nil
	local var12, _, var13 = readVarIntBytes(p4, p5)
	
	return var12, var13
end

function t.readVarIntI64(p6, p7)
	-- upvalues: readVarIntBytes (ref)
	local _ = nil
	local _ = nil
	local var14, var15, var16 = readVarIntBytes(p6, p7)
	
	if var15 < 2147483648 then
		return var15 * 4294967296 + var14, var16
	end
	local var17 = bit32.bnot(var14) + 1
	local bits = bit32.bnot(var15)
	
	if var17 > 4294967295 then
		var17 = 0
		bits += 1
	end
	return -(bits * 4294967296 + var17), var16
end

function t.readVarIntI32(p8, p9)
	-- upvalues: readVarIntBytes (ref)
	local _ = nil
	local _ = nil
	local var19, _, var20 = readVarIntBytes(p8, p9)
	
	if var19 < 2147483648 then
		return var19, var20
	end
	return var19 - 4294967296, var20
end

function t.readVarIntS64(p10, p11)
	-- upvalues: readVarIntBytes (ref)
	local _ = nil
	local _ = nil
	local var21, var22, var23 = readVarIntBytes(p10, p11)
	local var24 = var21
	local var25 = var22
	local var26 = bit32.btest(var24, 1)
	
	if var26 then
		var24 += 1
		
		if var24 > 4294967295 then
			var24 = 0
			var25 += 1
		end
	end
	if var25 > 4294967295 then
		return -9223372036854775808, var23
	end
	local bits = bit32.bor(bit32.rshift(var24, 1), bit32.lshift(bit32.band(var25, 1), 31))
	local shifted = bit32.rshift(var25, 1)
	
	if var26 then
		return -(shifted * 4294967296 + bits), var23
	end
	return shifted * 4294967296 + bits, var23
end

function t.readVarIntS32(p12, p13)
	-- upvalues: readVarIntBytes (ref)
	local _ = nil
	local _ = nil
	local var29, _, var30 = readVarIntBytes(p12, p13)
	
	if bit32.btest(var29, 1) then
		return -(var29 + 1) / 2, var30
	end
	return var29 / 2, var30
end

t.readVarInt = t.readVarIntI64

function t.readFloat(p14, p15)
	return buffer.readf32(p14, p15), p15 + 4
end

function t.readDouble(p16, p17)
	return buffer.readf64(p16, p17), p17 + 8
end

function t.readFixed32(p18, p19)
	return buffer.readu32(p18, p19), p19 + 4
end

function t.readSignedFixed32(value, p20)
	return buffer.readi32(value, p20), p20 + 4
end

function t.readFixed64(p21, p22)
	return assert(tonumber(string.format("%08x", buffer.readu32(p21, p22 + 4)) .. string.format("%08x", buffer.readu32(p21, p22)), 16), "Couldn't parse created hex"), p22 + 8
end

function t.readSignedFixed64(_, _)
	error("TODO: Read sfixed64")
end

function t.readTag(p23, p24)
	-- upvalues: t (ref)
	local var31, var32 = t.readVarInt(p23, p24)
	
	return bit32.rshift(var31, 3), bit32.band(var31, 7), var32
end

function t.readBuffer(p25, p26)
	-- upvalues: t (ref)
	local var33, var34 = t.readVarInt(p25, p26)
	local buff = buffer.create(var33)
	buffer.copy(buff, 0, p25, var34, var33)
	
	return buff, var34 + var33
end

local function reserveBuffer(p27, p28, p29)
	if buffer.len(p27) - p28 < p29 then
		local buff = buffer.create(3 ^ math.ceil(math.log(buffer.len(p27) + p29, 3)))
		buffer.copy(buff, 0, p27, 0, p28)
		
		return buff
	end
	return p27
end

t.wireTypes = {
	varint = 0,
	i64 = 1,
	lengthDelimited = 2,
	sgroup = 3,
	egroup = 4,
	i32 = 5
}

function t.writeVarInt(p30, p31, p32)
	-- upvalues: reserveBuffer (ref)
	if p32 >= 0 then
		while true do
			p30 = reserveBuffer(p30, p31, 1)
			local var37 = p32 % 128
			p32 //= 128
			buffer.writeu8(p30, p31, if p32 == 0 then var37 else var37 + 128)
			p31 += 1
			if p32 == 0 then
				return p30, p31
			end
		end
		return p30, p31
	else
		local var38 = -p32
		local bits = bit32.bnot(var38 // 4294967296)
		local var40 = bit32.bnot(var38 % 4294967296) + 1
		
		if var40 == 4294967296 then
			var40 = 0
			bits += 1
		end
		p30 = reserveBuffer(p30, p31, 10)
		buffer.writeu8(p30, p31, bit32.bor(128, bit32.band(var40, 127)))
		buffer.writeu8(p30, p31 + 1, bit32.bor(128, bit32.band(bit32.rshift(var40, 7), 127)))
		buffer.writeu8(p30, p31 + 2, bit32.bor(128, bit32.band(bit32.rshift(var40, 14), 127)))
		buffer.writeu8(p30, p31 + 3, bit32.bor(128, bit32.band(bit32.rshift(var40, 21), 127)))
		buffer.writeu8(p30, p31 + 4, bit32.bor(128, bit32.lshift(bit32.band(bits, 7), 4), bit32.rshift(var40, 28)))
		buffer.writeu8(p30, p31 + 5, bit32.bor(128, bit32.band(bit32.rshift(bits, 3), 127)))
		buffer.writeu8(p30, p31 + 6, bit32.bor(128, bit32.band(bit32.rshift(bits, 10), 127)))
		buffer.writeu8(p30, p31 + 7, bit32.bor(128, bit32.band(bit32.rshift(bits, 17), 127)))
		buffer.writeu8(p30, p31 + 8, bit32.bor(128, bit32.band(bit32.rshift(bits, 24), 127)))
		buffer.writeu8(p30, p31 + 9, bit32.rshift(bits, 31))
		p31 += 10
	end
end

function t.writeVarIntZigZag(p33, p34, p35)
	-- upvalues: reserveBuffer (ref)
	local var41 = p35 < 0
	local absValue = math.abs(p35)
	absValue //= 4294967296
	local var43 = absValue % 4294967296
	local extracted = bit32.extract(var43, 31)
	var43 = bit32.lshift(var43, 1)
	absValue = bit32.bor(bit32.lshift(absValue, 1), extracted)
	
	if var41 then
		var43 -= 1
		
		if var43 < 0 then
			var43 = 4294967295
			absValue -= 1
		end
	end
	repeat
		p33 = reserveBuffer(p33, p34, 1)
		local var45 = var43 % 128
		var43 = bit32.bor(bit32.rshift(var43, 7), bit32.lshift(bit32.band(absValue, 127), 25))
		absValue = bit32.rshift(absValue, 7)
		local var46 = var43 == 0 and absValue == 0
		buffer.writeu8(p33, p34, if var46 then var45 else var45 + 128)
		p34 += 1
	until var46
	return p33, p34
end

function t.writeFloat(p36, p37, p38)
	-- upvalues: reserveBuffer (ref)
	local var47 = reserveBuffer(p36, p37, 4)
	buffer.writef32(var47, p37, p38)
	
	return var47, p37 + 4
end

function t.writeDouble(p39, p40, p41)
	-- upvalues: reserveBuffer (ref)
	local var48 = reserveBuffer(p39, p40, 8)
	buffer.writef64(var48, p40, p41)
	
	return var48, p40 + 8
end

function t.writeFixed32(p42, p43, p44)
	-- upvalues: reserveBuffer (ref)
	local var49 = reserveBuffer(p42, p43, 4)
	buffer.writeu32(var49, p43, p44)
	
	return var49, p43 + 4
end

function t.writeSignedFixed32(value, p45, p46)
	-- upvalues: reserveBuffer (ref)
	local var50 = reserveBuffer(value, p45, 4)
	buffer.writei32(var50, p45, p46)
	
	return var50, p45 + 4
end

function t.writeFixed64(p47, p48, p49)
	-- upvalues: reserveBuffer (ref)
	local var51 = reserveBuffer(p47, p48, 8)
	local formattedText = string.format("%016x", p49)
	buffer.writeu32(var51, p48, assert(tonumber(formattedText:sub(9, 16), 16), "Couldn't parse created hex"))
	buffer.writeu32(var51, p48 + 4, assert(tonumber(formattedText:sub(1, 8), 16), "Couldn't parse created hex"))
	
	return var51, p48 + 8
end

function t.writeSignedFixed64(_, _, _)
	error("TODO: Write sfixed64")
end

function t.writeTag(p50, p51, p52, p53)
	-- upvalues: t (ref)
	return t.writeVarInt(p50, p51, bit32.lshift(p52, 3) + p53)
end

function t.writeBuffer(p54, p55, p56, p57)
	-- upvalues: t (ref), reserveBuffer (ref)
	local var53, var54 = t.writeVarInt(p54, p55, p57)
	var53 = reserveBuffer(var53, var54, p57)
	buffer.copy(var53, var54, p56, 0, p57)
	
	return var53, var54 + p57
end

function t.writeString(p58, p59, p60)
	-- upvalues: t (ref)
	return t.writeBuffer(p58, p59, buffer.fromstring(p60), #p60)
end

t.json = {}

function t.json.serializeNumber(p61)
	return if p61 == 1e999 then "Infinity" elseif p61 == -1e999 then "-Infinity" elseif p61 == p61 then p61 else "NaN"
end

function t.json.deserializeNumber(p62)
	if p62 == "Infinity" then
		return 1e999
	elseif p62 == "-Infinity" then
		return -1e999
	elseif p62 == "NaN" then
		return -9223372036854775808
	elseif typeof(p62) == "string" then
		local var55 = tonumber(p62)
		assert(var55 ~= nil, "Number given that could not be parsed")
		
		return var55
	end
	return p62
end

function t.json.serializeBuffer(p63)
	-- upvalues: base64Module (ref)
	return base64Module.encode(buffer.tostring(p63))
end

function t.json.deserializeBuffer(p64)
	-- upvalues: base64Module (ref)
	return buffer.fromstring(base64Module.decode(p64))
end

return t