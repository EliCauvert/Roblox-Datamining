local ByteFunction = string.byte

local function _(p1: number): boolean
	return p1 ~= nil and (p1 >= 128 and p1 <= 191)
end

local function decode(p1, Count: number)
	-- upvalues: ByteFunction (copy)
	local ByteResult: number = ByteFunction(p1, Count + 1)
	
	if ByteResult < 128 then
		return ByteResult, 1
	end
	local v1: number? = nil
	local v2: number? = nil
	local v3: number? = nil
	
	if ByteResult >= 194 and ByteResult <= 223 then
		v1 = 2
		v2 = ByteResult - 192
		v3 = 128
	elseif ByteResult >= 224 and ByteResult <= 239 then
		v1 = 3
		v2 = ByteResult - 224
		v3 = 2048
	else
		if ByteResult < 240 or ByteResult > 244 then
			return -1, 1
		end
		v1 = 4
		v2 = ByteResult - 240
		v3 = 65536
	end
	for i = 1, v1 - 1 do
		local ByteResult1: number = ByteFunction(p1, Count + 1 + i)
		
		if ByteResult1 == nil or (ByteResult1 < 128 or ByteResult1 > 191) then
			return -1, 1
		end
		v2 = v2 * 64 + (ByteResult1 - 128)
	end
	if v2 < v3 or v2 > 1114111 or v2 >= 55296 and v2 <= 57343 then
		return -1, 1
	else
		return v2, v1
	end
end

return {
	INVALID = -1,
	codePointAt = function(p2, p3)
		-- upvalues: decode (copy)
		return (decode(p2, p3))
	end,
	codePointBefore = function(p2, p3: number)
		-- upvalues: ByteFunction (copy), decode (copy)
		local Count = p3 - 1
		while Count > 0 and p3 - 4 < Count do
			local ByteResult: number = ByteFunction(p2, Count + 1)
			
			if ByteResult == nil or (ByteResult < 128 or ByteResult > 191) then break end
			Count -= 1
		end
		local DecodeResult, DecodeResult2 = decode(p2, Count)
		
		return if Count + DecodeResult2 == p3 then DecodeResult else -1
	end
}