local Base64Module = require(script.base64)
local _ = require(script.message)
local _ = require(script.typeRegistry)

local function readVarIntBytes(Buf, Offset: number) --[[ Line: 21 ]]
	local Value = 0
	local Value1 = 0
	local Shift = 0
	repeat
		local ByteValue = buffer.readu8(Buf, Offset)
		local Bits = bit32.band(ByteValue, 127)
		Value = bit32.bor(Value, (bit32.lshift(Bits, Shift)))
		Value1 = bit32.bor(Value1, (bit32.lshift(Bits, Shift - 32)))
		Shift += 7
		Offset += 1
	until not bit32.btest(ByteValue, 128)
	return Value, Value1, Offset
end

local ProtoModule = {
	readVarIntU64 = function(p1, p2) --[[ Line: 38 ]]
		-- upvalues: readVarIntBytes (copy)
		local VarIntBytes, VarIntBytes2, VarIntBytes3 = readVarIntBytes(p1, p2)
		
		return VarIntBytes2 * 4294967296 + VarIntBytes, VarIntBytes3
	end,
	readVarIntU32 = function(p1, p2) --[[ Line: 45 ]]
		-- upvalues: readVarIntBytes (copy)
		local VarIntBytes, _, VarIntBytes3 = readVarIntBytes(p1, p2)
		
		return VarIntBytes, VarIntBytes3
	end,
	readVarIntI64 = function(p1, p2) --[[ Line: 52 ]]
		-- upvalues: readVarIntBytes (copy)
		local VarIntBytes, VarIntBytes2, VarIntBytes3 = readVarIntBytes(p1, p2)
		
		if VarIntBytes2 < 2147483648 then
			return VarIntBytes2 * 4294967296 + VarIntBytes, VarIntBytes3
		end
		local NewBits = bit32.bnot(VarIntBytes) + 1
		local Bits = bit32.bnot(VarIntBytes2)
		
		if NewBits > 4294967295 then
			NewBits = 0
			Bits += 1
		end
		return -(Bits * 4294967296 + NewBits), VarIntBytes3
	end,
	readVarIntI32 = function(p1, p2) --[[ Line: 71 ]]
		-- upvalues: readVarIntBytes (copy)
		local VarIntBytes, _, VarIntBytes3 = readVarIntBytes(p1, p2)
		
		if VarIntBytes < 2147483648 then
			return VarIntBytes, VarIntBytes3
		else
			return VarIntBytes - 4294967296, VarIntBytes3
		end
	end,
	readVarIntS64 = function(p1, p2) --[[ Line: 82 ]]
		-- upvalues: readVarIntBytes (copy)
		local Value, Value1, VarIntBytes3 = readVarIntBytes(p1, p2)
		local BtestResult = bit32.btest(Value, 1)
		
		if BtestResult then
			Value += 1
			
			if Value > 4294967295 then
				Value = 0
				Value1 += 1
			end
		end
		if Value1 > 4294967295 then
			return -9223372036854775808, VarIntBytes3
		end
		local Bits = bit32.bor(bit32.rshift(Value, 1), (bit32.lshift(bit32.band(Value1, 1), 31)))
		local Shifted = bit32.rshift(Value1, 1)
		
		if BtestResult then
			return -(Shifted * 4294967296 + Bits), VarIntBytes3
		else
			return Shifted * 4294967296 + Bits, VarIntBytes3
		end
	end,
	readVarIntS32 = function(p1, p2) --[[ Line: 113 ]]
		-- upvalues: readVarIntBytes (copy)
		local VarIntBytes, _, VarIntBytes3 = readVarIntBytes(p1, p2)
		
		if bit32.btest(VarIntBytes, 1) then
			return -(VarIntBytes + 1) / 2, VarIntBytes3
		else
			return VarIntBytes / 2, VarIntBytes3
		end
	end
}
ProtoModule.readVarInt = ProtoModule.readVarIntI64

function ProtoModule.readFloat(Buf, Offset: number) --[[ Line: 126 ]]
	return buffer.readf32(Buf, Offset), Offset + 4
end

function ProtoModule.readDouble(Buf, Offset: number) --[[ Line: 130 ]]
	return buffer.readf64(Buf, Offset), Offset + 8
end

function ProtoModule.readFixed32(Buf, Offset: number) --[[ Line: 134 ]]
	return buffer.readu32(Buf, Offset), Offset + 4
end

function ProtoModule.readSignedFixed32(Buf, Offset: number) --[[ Line: 138 ]]
	return buffer.readi32(Buf, Offset), Offset + 4
end

function ProtoModule.readFixed64(Buf, Offset: number) --[[ Line: 143 ]]
	return assert(tonumber(string.format("%08x", (buffer.readu32(Buf, Offset + 4))) .. string.format("%08x", (buffer.readu32(Buf, Offset))), 16), "Couldn't parse created hex"), Offset + 8
end

function ProtoModule:readSignedFixed64(_) --[[ Line: 151 ]]
	error("TODO: Read sfixed64")
end

function ProtoModule.readTag(p1, p2) --[[ Line: 155 ]]
	-- upvalues: ProtoModule (copy)
	local VarInt, VarInt2 = ProtoModule.readVarInt(p1, p2)
	
	return bit32.rshift(VarInt, 3), bit32.band(VarInt, 7), VarInt2
end

function ProtoModule.readBuffer(Source, p1) --[[ Line: 160 ]]
	-- upvalues: ProtoModule (copy)
	local VarInt, VarInt2 = ProtoModule.readVarInt(Source, p1)
	local Buf = buffer.create(VarInt)
	buffer.copy(Buf, 0, Source, VarInt2, VarInt)
	
	return Buf, VarInt2 + VarInt
end

local function reserveBuffer(Buf, Count, Count1) --[[ Line: 167 ]]
	if buffer.len(Buf) - Count < Count1 then
		local Buf1 = buffer.create(3 ^ math.ceil((math.log(buffer.len(Buf) + Count1, 3))))
		buffer.copy(Buf1, 0, Buf, 0, Count)
		
		return Buf1
	else
		return Buf
	end
end

ProtoModule.wireTypes = {
	varint = 0,
	i64 = 1,
	lengthDelimited = 2,
	sgroup = 3,
	egroup = 4,
	i32 = 5
}

function ProtoModule.writeVarInt(Buf, Offset: number, Count: number) --[[ Line: 186 ]]
	-- upvalues: reserveBuffer (copy)
	if Count >= 0 then
		while true do
			Buf = reserveBuffer(Buf, Offset, 1)
			local CountRemainder = Count % 128
			Count //= 128
			buffer.writeu8(Buf, Offset, if Count == 0 then CountRemainder else CountRemainder + 128)
			Offset += 1
			if Count == 0 then
				break
			end
		end
	else
		local Negated = -Count
		local Bits = bit32.bnot(Negated // 4294967296)
		local NewBits = bit32.bnot(Negated % 4294967296) + 1
		
		if NewBits == 4294967296 then
			NewBits = 0
			Bits += 1
		end
		Buf = reserveBuffer(Buf, Offset, 10)
		buffer.writeu8(Buf, Offset, (bit32.bor(128, (bit32.band(NewBits, 127)))))
		buffer.writeu8(Buf, Offset + 1, (bit32.bor(128, (bit32.band(bit32.rshift(NewBits, 7), 127)))))
		buffer.writeu8(Buf, Offset + 2, (bit32.bor(128, (bit32.band(bit32.rshift(NewBits, 14), 127)))))
		buffer.writeu8(Buf, Offset + 3, (bit32.bor(128, (bit32.band(bit32.rshift(NewBits, 21), 127)))))
		buffer.writeu8(Buf, Offset + 4, (bit32.bor(128, bit32.lshift(bit32.band(Bits, 7), 4), (bit32.rshift(NewBits, 28)))))
		buffer.writeu8(Buf, Offset + 5, (bit32.bor(128, (bit32.band(bit32.rshift(Bits, 3), 127)))))
		buffer.writeu8(Buf, Offset + 6, (bit32.bor(128, (bit32.band(bit32.rshift(Bits, 10), 127)))))
		buffer.writeu8(Buf, Offset + 7, (bit32.bor(128, (bit32.band(bit32.rshift(Bits, 17), 127)))))
		buffer.writeu8(Buf, Offset + 8, (bit32.bor(128, (bit32.band(bit32.rshift(Bits, 24), 127)))))
		buffer.writeu8(Buf, Offset + 9, (bit32.rshift(Bits, 31)))
		Offset += 10
	end
	return Buf, Offset
end

function ProtoModule.writeVarIntZigZag(Buf, Offset: number, Value: number) --[[ Line: 225 ]]
	-- upvalues: reserveBuffer (copy)
	local IsValueBelow = Value < 0
	local Magnitude = math.abs(Value)
	local Value1 = Magnitude % 4294967296
	local Extracted = bit32.extract(Value1, 31)
	local Shifted = bit32.lshift(Value1, 1)
	local Bits = bit32.bor(bit32.lshift(Magnitude // 4294967296, 1), Extracted)
	
	if IsValueBelow then
		Shifted -= 1
		
		if Shifted < 0 then
			Shifted = 4294967295
			Bits -= 1
		end
	end
	repeat
		Buf = reserveBuffer(Buf, Offset, 1)
		local ShiftedRemainder = Shifted % 128
		Shifted = bit32.bor(bit32.rshift(Shifted, 7), (bit32.lshift(bit32.band(Bits, 127), 25)))
		Bits = bit32.rshift(Bits, 7)
		local IsBitsMatch: boolean = Shifted == 0 and Bits == 0
		buffer.writeu8(Buf, Offset, if IsBitsMatch then ShiftedRemainder else ShiftedRemainder + 128)
		Offset += 1
	until IsBitsMatch
	return Buf, Offset
end

function ProtoModule.writeFloat(Buf, Offset: number, Value) --[[ Line: 259 ]]
	-- upvalues: reserveBuffer (copy)
	local ReserveBufferResult = reserveBuffer(Buf, Offset, 4)
	buffer.writef32(ReserveBufferResult, Offset, Value)
	
	return ReserveBufferResult, Offset + 4
end

function ProtoModule.writeDouble(Buf, Offset: number, Value) --[[ Line: 265 ]]
	-- upvalues: reserveBuffer (copy)
	local ReserveBufferResult = reserveBuffer(Buf, Offset, 8)
	buffer.writef64(ReserveBufferResult, Offset, Value)
	
	return ReserveBufferResult, Offset + 8
end

function ProtoModule.writeFixed32(Buf, Offset: number, Value) --[[ Line: 271 ]]
	-- upvalues: reserveBuffer (copy)
	local ReserveBufferResult = reserveBuffer(Buf, Offset, 4)
	buffer.writeu32(ReserveBufferResult, Offset, Value)
	
	return ReserveBufferResult, Offset + 4
end

function ProtoModule.writeSignedFixed32(Buf, Offset: number, Value) --[[ Line: 277 ]]
	-- upvalues: reserveBuffer (copy)
	local ReserveBufferResult = reserveBuffer(Buf, Offset, 4)
	buffer.writei32(ReserveBufferResult, Offset, Value)
	
	return ReserveBufferResult, Offset + 4
end

function ProtoModule.writeFixed64(Buf, Offset: number, p1) --[[ Line: 283 ]]
	-- upvalues: reserveBuffer (copy)
	local ReserveBufferResult = reserveBuffer(Buf, Offset, 8)
	local Formatted = string.format("%016x", p1)
	buffer.writeu32(ReserveBufferResult, Offset, (assert(tonumber(Formatted:sub(9, 16), 16), "Couldn't parse created hex")))
	buffer.writeu32(ReserveBufferResult, Offset + 4, (assert(tonumber(Formatted:sub(1, 8), 16), "Couldn't parse created hex")))
	
	return ReserveBufferResult, Offset + 8
end

function ProtoModule:writeSignedFixed64(_, _) --[[ Line: 294 ]]
	error("TODO: Write sfixed64")
end

function ProtoModule.writeTag(Buf, Offset, Value: number, p1) --[[ Line: 298 ]]
	-- upvalues: ProtoModule (copy)
	return ProtoModule.writeVarInt(Buf, Offset, bit32.lshift(Value, 3) + p1)
end

function ProtoModule.writeBuffer(Buf, Offset, Source, Count) --[[ Line: 302 ]]
	-- upvalues: ProtoModule (copy), reserveBuffer (copy)
	local WriteVarIntResult, WriteVarIntResult2 = ProtoModule.writeVarInt(Buf, Offset, Count)
	local ReserveBufferResult = reserveBuffer(WriteVarIntResult, WriteVarIntResult2, Count)
	buffer.copy(ReserveBufferResult, WriteVarIntResult2, Source, 0, Count)
	
	return ReserveBufferResult, WriteVarIntResult2 + Count
end

function ProtoModule.writeString(p1, p2, p3) --[[ Line: 311 ]]
	-- upvalues: ProtoModule (copy)
	return ProtoModule.writeBuffer(p1, p2, buffer.fromstring(p3), #p3)
end

ProtoModule.json = {}

function ProtoModule.json.serializeNumber(p1) --[[ Line: 317 ]]
	return if p1 == 1e999 then "Infinity" elseif p1 == -1e999 then "-Infinity" elseif p1 == p1 then p1 else "NaN"
end

function ProtoModule.json.deserializeNumber(p1) --[[ Line: 325 ]]
	if p1 == "Infinity" then
		return 1e999
	elseif p1 == "-Infinity" then
		return -1e999
	elseif p1 == "NaN" then
		return -(0 / 0)
	elseif typeof(p1) == "string" then
		local Number: number? = tonumber(p1)
		assert(Number ~= nil, "Number given that could not be parsed")
		
		return Number
	else
		return p1
	end
end

function ProtoModule.json.serializeBuffer(Buf) --[[ Line: 341 ]]
	-- upvalues: Base64Module (copy)
	return Base64Module.encode(buffer.tostring(Buf))
end

function ProtoModule.json.deserializeBuffer(p1) --[[ Line: 345 ]]
	-- upvalues: Base64Module (copy)
	return buffer.fromstring(Base64Module.decode(p1))
end

return ProtoModule