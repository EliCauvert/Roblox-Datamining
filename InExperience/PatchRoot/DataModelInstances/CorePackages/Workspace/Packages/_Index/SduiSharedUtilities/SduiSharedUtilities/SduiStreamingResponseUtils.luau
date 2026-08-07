local function readFrameLength(p0, p1) --[[ line: 27 ]]
	local var1 = 0
	local var2 = 1
	
	for i = p1, math.min(p1 + 5 - 1, #p0) do
		local byteValue = string.byte(p0, i)
		var1 += byteValue % 128 * var2
		
		if byteValue >= 128 then
			var2 *= 128
			continue
		end
		return var1, i - p1 + 1
	end
	if #p0 - p1 + 1 >= 5 then
		error("Frame length varint exceeds maximum size")
	end
	return nil, 0
end

return {
	isEmptyResponseBody = function(p2) --[[ line: 9 ]]
		return p2 == nil or (if typeof(p2) == "string" then p2 == "" else typeof(p2) == "buffer" and buffer.len(p2) == 0)
	end,
	extractFrames = function(p3) --[[ line: 51 ]]
		-- upvalues: readFrameLength (ref)
		local t = {}
		local var5 = 1
		while var5 <= #p3 do
			local var6, var7 = readFrameLength(p3, var5)
			
			if var6 == nil then break end
			if var6 == 0 then
				error("Frame length of zero is not a valid protobuf message")
			end
			if var6 > 52428800 then
				error(`Frame length {var6} exceeds maximum supported size`)
			end
			local var8 = var5 + var7
			local var9 = var8 + var6 - 1
			
			if #p3 < var9 then break end
			table.insert(t, string.sub(p3, var8, var9))
			var5 = var9 + 1
		end
		return t, string.sub(p3, var5)
	end
}