local function readVarint(Buf, Offset: number)
	local NewBits = 0
	local v1 = 1
	
	for _ = 1, 10 do
		if buffer.len(Buf) <= Offset then
			error("MomentScene protobuf ended inside a varint")
		end
		local ByteValue = buffer.readu8(Buf, Offset)
		Offset += 1
		NewBits += bit32.band(ByteValue, 127) * v1
		
		if ByteValue < 128 then
			return NewBits, Offset
		end
		v1 *= 128
	end
	error("MomentScene protobuf contains an invalid varint")
end

local function readLengthDelimited(Buf, Count)
	-- upvalues: readVarint (copy)
	local Varint, Varint2 = readVarint(Buf, Count)
	local NewVarint = Varint2 + Varint
	
	if Varint < 0 or buffer.len(Buf) < NewVarint then
		error("MomentScene protobuf contains an invalid byte field")
	end
	return buffer.readstring(Buf, Varint2, Varint), NewVarint
end

local function skipField(Buf, Count: number, p1): number
	-- upvalues: readVarint (copy), readLengthDelimited (copy)
	if p1 == 0 then
		local _
		_, Count = readVarint(Buf, Count)
		
		return Count
	end
	if p1 == 1 then
		Count += 8
	else
		if p1 == 2 then
			local _
			_, Count = readLengthDelimited(Buf, Count)
			
			return Count
		end
		if p1 == 5 then
			Count += 4
		else
			error(`MomentScene protobuf uses unsupported wire type {p1}`)
		end
	end
	if buffer.len(Buf) < Count then
		error("MomentScene protobuf ended inside a fixed-width field")
	end
	return Count
end

return function(Buf)
	-- upvalues: readVarint (copy), readLengthDelimited (copy), skipField (copy)
	local t = {}
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Varint, Varint2 = readVarint(Buf, v2)
		local Floored = math.floor(Varint / 8)
		local VarintRemainder = Varint % 8
		
		if Floored == 0 then
			error("MomentScene protobuf contains field number zero")
		end
		if Floored == 1 or Floored == 5 then
			if VarintRemainder ~= 2 then
				error(`MomentScene protobuf field {Floored} has the wrong wire type`)
			end
			local LengthDelimited
			LengthDelimited, v12 = readLengthDelimited(Buf, Varint2)
			
			if Floored == 1 then
				t.camera_metadata = LengthDelimited
			else
				t.emote_name = LengthDelimited
			end
		elseif Floored >= 2 and Floored <= 4 then
			if VarintRemainder ~= 0 then
				error(`MomentScene protobuf field {Floored} has the wrong wire type`)
			end
			local Varint1
			Varint1, v12 = readVarint(Buf, Varint2)
			
			if Floored == 2 then
				t.outfit_id = Varint1
			elseif Floored == 3 then
				t.emote_asset_id = Varint1
			else
				t.background_asset_id = Varint1
			end
		else
			v2 = skipField(Buf, Varint2, VarintRemainder)
		end
	end
	return t
end