local function readFrameLength(Text: string, StartIndex: number)
	local Total = 0
	local v1 = 1
	
	for i = StartIndex, math.min(StartIndex + 5 - 1, #Text) do
		local ByteValue = string.byte(Text, i)
		Total += ByteValue % 128 * v1
		
		if ByteValue < 128 then
			return Total, i - StartIndex + 1
		end
		v1 *= 128
	end
	if #Text - StartIndex + 1 >= 5 then
		error("Frame length varint exceeds maximum size")
	end
	return nil, 0
end

return {
	isEmptyResponseBody = function(Buf): boolean
		return Buf == nil or (if typeof(Buf) == "string" then Buf == "" else typeof(Buf) == "buffer" and buffer.len(Buf) == 0)
	end,
	extractFrames = function(Text: string)
		-- upvalues: readFrameLength (copy)
		local List = {}
		local StartIndex1 = 1
		while StartIndex1 <= #Text do
			local FrameLength, FrameLength2 = readFrameLength(Text, StartIndex1)
			
			if FrameLength == nil then break end
			if FrameLength == 0 then
				error("Frame length of zero is not a valid frame")
			end
			if FrameLength > 52428800 then
				error(`Frame length {FrameLength} exceeds maximum supported size`)
			end
			local StartIndex = StartIndex1 + FrameLength2
			local StartIndexDelta = StartIndex + FrameLength - 1
			
			if #Text < StartIndexDelta then break end
			table.insert(List, (string.sub(Text, StartIndex, StartIndexDelta)))
			StartIndex1 = StartIndexDelta + 1
		end
		return List, (string.sub(Text, StartIndex1))
	end
}