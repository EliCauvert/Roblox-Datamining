local function slice(Text: string, p1: number, p2: number): string?
	local Length = utf8.len(Text)
	
	if Length == nil then
		return nil
	elseif p2 < p1 then
		return ""
	elseif p1 < 1 or Length < p2 then
		return nil
	else
		local OffsetResult = utf8.offset(Text, p1)
		
		if OffsetResult == nil then
			return nil
		else
			local OffsetResult1 = utf8.offset(Text, p2 + 1)
			
			return if OffsetResult1 == nil then string.sub(Text, OffsetResult) else string.sub(Text, OffsetResult, OffsetResult1 - 1)
		end
	end
end

return {
	splice = function(Text: string, p1: number, p2: number, Text1)
		local Length = utf8.len(Text)
		local Length1 = utf8.len(Text1)
		
		if Length == nil or Length1 == nil then
			return nil, nil
		elseif p1 < 1 or p2 < p1 or Length < p2 then
			return nil, nil
		else
			local OffsetResult = utf8.offset(Text, p1)
			
			if OffsetResult == nil then
				return nil, nil
			else
				local OffsetResult1 = utf8.offset(Text, p2 + 1)
				
				return string.sub(Text, 1, OffsetResult - 1) .. Text1 .. (if OffsetResult1 == nil then "" else string.sub(Text, OffsetResult1)), p1 + Length1
			end
		end
	end,
	slice = slice,
	charAt = function(p1, p2)
		-- upvalues: slice (copy)
		return (slice(p1, p2, p2))
	end
}