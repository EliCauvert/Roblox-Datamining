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
		local StartIndex = 1
		while StartIndex <= #Text do
			local FrameLength, FrameLength2 = readFrameLength(Text, StartIndex)
			
			if FrameLength == nil then break end
			if FrameLength == 0 then
				error("Frame length of zero is not a valid protobuf message")
			end
			if FrameLength > 52428800 then
				error(`Frame length {FrameLength} exceeds maximum supported size`)
			end
			local NewStartIndex = StartIndex + FrameLength2
			local EndIndex = NewStartIndex + FrameLength - 1
			
			if #Text < EndIndex then break end
			table.insert(List, (string.sub(Text, NewStartIndex, EndIndex)))
			StartIndex = EndIndex + 1
		end
		return List, (string.sub(Text, StartIndex))
	end
}