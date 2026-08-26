local function readFrameLength(p1, p2)
	local var1 = 0
	local var2 = 1
	
	for i = p2, math.min(p2 + 5 - 1, #p1) do
		local byteValue = string.byte(p1, i)
		var1 += byteValue % 128 * var2
		
		if byteValue >= 128 then
			var2 *= 128
			continue
		end
		return var1, i - p2 + 1
	end
	if #p1 - p2 + 1 >= 5 then
		error("Frame length varint exceeds maximum size")
	end
	return nil, 0
end

return {
	isEmptyResponseBody = function(p3)
		return p3 == nil or (if typeof(p3) == "string" then p3 == "" else typeof(p3) == "buffer" and buffer.len(p3) == 0)
	end,
	extractFrames = function(p3)
		-- upvalues: readFrameLength (ref)
		local t = {}
		local var3 = 1
		while var3 <= #p3 do
			local var4, var5 = readFrameLength(p3, var3)
			
			if var4 == nil then break end
			if var4 == 0 then
				error("Frame length of zero is not a valid frame")
			end
			if var4 > 52428800 then
				error(`Frame length {var4} exceeds maximum supported size`)
			end
			local var6 = var3 + var5
			local var7 = var6 + var4 - 1
			
			if #p3 < var7 then break end
			table.insert(t, string.sub(p3, var6, var7))
			var3 = var7 + 1
		end
		return t, string.sub(p3, var3)
	end
}