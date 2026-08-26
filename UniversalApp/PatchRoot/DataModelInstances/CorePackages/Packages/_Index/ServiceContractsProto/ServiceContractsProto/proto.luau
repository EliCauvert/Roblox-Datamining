local base64Module = require(script.base64)
local _ = require(script.message)
local _ = require(script.typeRegistry)
local t = {}

local function readVarIntBytes(p1, p2)
	local var1 = 0
	local var2 = 0
	local var3 = 0
	repeat
		local value = buffer.readu8(p1, p2)
		local bits = bit32.band(value, 127)
		var1 = bit32.bor(var1, bit32.lshift(bits, var3))
		var2 = bit32.bor(var2, bit32.lshift(bits, var3 - 32))
		var3 += 7
		p2 += 1
	until not bit32.btest(value, 128)
	return var1, var2, p2
end

function t.readVarIntU64(p1, p2)
	-- upvalues: readVarIntBytes (ref)
	local _ = nil
	local _ = nil
	local var1, var2, var3 = readVarIntBytes(p1, p2)
	
	return var2 * 4294967296 + var1, var3
end

function t.readVarIntU32(p1, p2)
	-- upvalues: readVarIntBytes (ref)
	local _ = nil
	local _ = nil
	local var1, _, var2 = readVarIntBytes(p1, p2)
	
	return var1, var2
end

function t.readVarIntI64(p1, p2)
	-- upvalues: readVarIntBytes (ref)
	local _ = nil
	local _ = nil
	local var1, var2, var3 = readVarIntBytes(p1, p2)
	
	if var2 < 2147483648 then
		return var2 * 4294967296 + var1, var3
	end
	local var4 = bit32.bnot(var1) + 1
	local bits = bit32.bnot(var2)
	
	if var4 > 4294967295 then
		var4 = 0
		bits += 1
	end
	return -(bits * 4294967296 + var4), var3
end

function t.readVarIntI32(p1, p2)
	-- upvalues: readVarIntBytes (ref)
	local _ = nil
	local _ = nil
	local var1, _, var2 = readVarIntBytes(p1, p2)
	
	if var1 < 2147483648 then
		return var1, var2
	end
	return var1 - 4294967296, var2
end

function t.readVarIntS64(p1, p2)
	-- upvalues: readVarIntBytes (ref)
	local _ = nil
	local _ = nil
	local var1, var2, var3 = readVarIntBytes(p1, p2)
	local var4 = var1
	local var5 = var2
	local var6 = bit32.btest(var4, 1)
	
	if var6 then
		var4 += 1
		
		if var4 > 4294967295 then
			var4 = 0
			var5 += 1
		end
	end
	if var5 > 4294967295 then
		return -9223372036854775808, var3
	end
	local bits = bit32.bor(bit32.rshift(var4, 1), bit32.lshift(bit32.band(var5, 1), 31))
	local shifted = bit32.rshift(var5, 1)
	
	if var6 then
		return -(shifted * 4294967296 + bits), var3
	end
	return shifted * 4294967296 + bits, var3
end

function t.readVarIntS32(p1, p2)
	-- upvalues: readVarIntBytes (ref)
	local _ = nil
	local _ = nil
	local var1, _, var2 = readVarIntBytes(p1, p2)
	
	if bit32.btest(var1, 1) then
		return -(var1 + 1) / 2, var2
	end
	return var1 / 2, var2
end

t.readVarInt = t.readVarIntI64

function t.readFloat(p1, p2)
	return buffer.readf32(p1, p2), p2 + 4
end

function t.readDouble(p1, p2)
	return buffer.readf64(p1, p2), p2 + 8
end

function t.readFixed32(p1, p2)
	return buffer.readu32(p1, p2), p2 + 4
end

function t.readSignedFixed32(value, p1)
	return buffer.readi32(value, p1), p1 + 4
end

function t.readFixed64(p1, p2)
	return assert(tonumber(string.format("%08x", buffer.readu32(p1, p2 + 4)) .. string.format("%08x", buffer.readu32(p1, p2)), 16), "Couldn't parse created hex"), p2 + 8
end

function t.readSignedFixed64(_, _)
	error("TODO: Read sfixed64")
end

function t.readTag(p1, p2)
	-- upvalues: t (ref)
	local var1, var2 = t.readVarInt(p1, p2)
	
	return bit32.rshift(var1, 3), bit32.band(var1, 7), var2
end

function t.readBuffer(p1, p2)
	-- upvalues: t (ref)
	local var1, var2 = t.readVarInt(p1, p2)
	local buff = buffer.create(var1)
	buffer.copy(buff, 0, p1, var2, var1)
	
	return buff, var2 + var1
end

local function reserveBuffer(p1, p2, p3)
	if buffer.len(p1) - p2 < p3 then
		local buff = buffer.create(3 ^ math.ceil(math.log(buffer.len(p1) + p3, 3)))
		buffer.copy(buff, 0, p1, 0, p2)
		
		return buff
	end
	return p1
end

t.wireTypes = {
	varint = 0,
	i64 = 1,
	lengthDelimited = 2,
	sgroup = 3,
	egroup = 4,
	i32 = 5
}

function t.writeVarInt(p1, p2, p3)
	-- upvalues: reserveBuffer (ref)
	if p3 >= 0 then
		while true do
			p1 = reserveBuffer(p1, p2, 1)
			local var1 = p3 % 128
			p3 //= 128
			buffer.writeu8(p1, p2, if p3 == 0 then var1 else var1 + 128)
			p2 += 1
			if p3 == 0 then
				return p1, p2
			end
		end
		return p1, p2
	else
		local var2 = -p3
		local bits = bit32.bnot(var2 // 4294967296)
		local var3 = bit32.bnot(var2 % 4294967296) + 1
		
		if var3 == 4294967296 then
			var3 = 0
			bits += 1
		end
		p1 = reserveBuffer(p1, p2, 10)
		buffer.writeu8(p1, p2, bit32.bor(128, bit32.band(var3, 127)))
		buffer.writeu8(p1, p2 + 1, bit32.bor(128, bit32.band(bit32.rshift(var3, 7), 127)))
		buffer.writeu8(p1, p2 + 2, bit32.bor(128, bit32.band(bit32.rshift(var3, 14), 127)))
		buffer.writeu8(p1, p2 + 3, bit32.bor(128, bit32.band(bit32.rshift(var3, 21), 127)))
		buffer.writeu8(p1, p2 + 4, bit32.bor(128, bit32.lshift(bit32.band(bits, 7), 4), bit32.rshift(var3, 28)))
		buffer.writeu8(p1, p2 + 5, bit32.bor(128, bit32.band(bit32.rshift(bits, 3), 127)))
		buffer.writeu8(p1, p2 + 6, bit32.bor(128, bit32.band(bit32.rshift(bits, 10), 127)))
		buffer.writeu8(p1, p2 + 7, bit32.bor(128, bit32.band(bit32.rshift(bits, 17), 127)))
		buffer.writeu8(p1, p2 + 8, bit32.bor(128, bit32.band(bit32.rshift(bits, 24), 127)))
		buffer.writeu8(p1, p2 + 9, bit32.rshift(bits, 31))
		p2 += 10
	end
end

function t.writeVarIntZigZag(p4, p5, p6)
	-- upvalues: reserveBuffer (ref)
	local var4 = p6 < 0
	local absValue = math.abs(p6)
	absValue //= 4294967296
	local var5 = absValue % 4294967296
	local extracted = bit32.extract(var5, 31)
	var5 = bit32.lshift(var5, 1)
	absValue = bit32.bor(bit32.lshift(absValue, 1), extracted)
	
	if var4 then
		var5 -= 1
		
		if var5 < 0 then
			var5 = 4294967295
			absValue -= 1
		end
	end
	repeat
		p4 = reserveBuffer(p4, p5, 1)
		local var6 = var5 % 128
		var5 = bit32.bor(bit32.rshift(var5, 7), bit32.lshift(bit32.band(absValue, 127), 25))
		absValue = bit32.rshift(absValue, 7)
		local var7 = var5 == 0 and absValue == 0
		buffer.writeu8(p4, p5, if var7 then var6 else var6 + 128)
		p5 += 1
	until var7
	return p4, p5
end

function t.writeFloat(p4, p5, p6)
	-- upvalues: reserveBuffer (ref)
	local var4 = reserveBuffer(p4, p5, 4)
	buffer.writef32(var4, p5, p6)
	
	return var4, p5 + 4
end

function t.writeDouble(p4, p5, p6)
	-- upvalues: reserveBuffer (ref)
	local var4 = reserveBuffer(p4, p5, 8)
	buffer.writef64(var4, p5, p6)
	
	return var4, p5 + 8
end

function t.writeFixed32(p4, p5, p6)
	-- upvalues: reserveBuffer (ref)
	local var4 = reserveBuffer(p4, p5, 4)
	buffer.writeu32(var4, p5, p6)
	
	return var4, p5 + 4
end

function t.writeSignedFixed32(value, p4, p5)
	-- upvalues: reserveBuffer (ref)
	local var4 = reserveBuffer(value, p4, 4)
	buffer.writei32(var4, p4, p5)
	
	return var4, p4 + 4
end

function t.writeFixed64(p4, p5, p6)
	-- upvalues: reserveBuffer (ref)
	local var4 = reserveBuffer(p4, p5, 8)
	local formattedText = string.format("%016x", p6)
	buffer.writeu32(var4, p5, assert(tonumber(formattedText:sub(9, 16), 16), "Couldn't parse created hex"))
	buffer.writeu32(var4, p5 + 4, assert(tonumber(formattedText:sub(1, 8), 16), "Couldn't parse created hex"))
	
	return var4, p5 + 8
end

function t.writeSignedFixed64(_, _, _)
	error("TODO: Write sfixed64")
end

function t.writeTag(p4, p5, p6, p7)
	-- upvalues: t (ref)
	return t.writeVarInt(p4, p5, bit32.lshift(p6, 3) + p7)
end

function t.writeBuffer(p4, p5, p6, p7)
	-- upvalues: t (ref), reserveBuffer (ref)
	local var4, var5 = t.writeVarInt(p4, p5, p7)
	var4 = reserveBuffer(var4, var5, p7)
	buffer.copy(var4, var5, p6, 0, p7)
	
	return var4, var5 + p7
end

function t.writeString(p4, p5, p6)
	-- upvalues: t (ref)
	return t.writeBuffer(p4, p5, buffer.fromstring(p6), #p6)
end

t.json = {}

function t.json.serializeNumber(p4)
	return if p4 == 1e999 then "Infinity" elseif p4 == -1e999 then "-Infinity" elseif p4 == p4 then p4 else "NaN"
end

function t.json.deserializeNumber(p4)
	if p4 == "Infinity" then
		return 1e999
	elseif p4 == "-Infinity" then
		return -1e999
	elseif p4 == "NaN" then
		return -9223372036854775808
	elseif typeof(p4) == "string" then
		local var4 = tonumber(p4)
		assert(var4 ~= nil, "Number given that could not be parsed")
		
		return var4
	end
	return p4
end

function t.json.serializeBuffer(p4)
	-- upvalues: base64Module (ref)
	return base64Module.encode(buffer.tostring(p4))
end

function t.json.deserializeBuffer(p4)
	-- upvalues: base64Module (ref)
	return buffer.fromstring(base64Module.decode(p4))
end

return t