local list = {
	{ 9, 13 },
	{ 32, 32 },
	{ 133, 133 },
	{ 160, 160 },
	{ 5760, 5760 },
	{ 8192, 8202 },
	{ 8232, 8233 },
	{ 8239, 8239 },
	{ 8287, 8287 },
	{ 12288, 12288 }
}
local list1 = {
	{ 65, 90, 32 },
	{ 192, 214, 32 },
	{ 216, 222, 32 },
	{ 902, 902, 38 },
	{ 904, 906, 37 },
	{ 908, 908, 64 },
	{ 910, 911, 63 },
	{ 913, 929, 32 },
	{ 931, 939, 32 },
	{ 962, 962, 1 },
	{ 1024, 1039, 80 },
	{ 1040, 1071, 32 },
	{ 1168, 1168, 1 }
}
local list2 = {
	{ 34, 34 },
	{ 39, 41 },
	{ 42, 42 },
	{ 60, 60 },
	{ 62, 62 },
	{ 91, 91 },
	{ 93, 93 },
	{ 95, 95 },
	{ 96, 96 },
	{ 123, 123 },
	{ 124, 124 },
	{ 125, 125 },
	{ 126, 126 },
	{ 8216, 8217 },
	{ 8220, 8221 }
}
local list3 = {
	{ 0, 8 },
	{ 14, 31 },
	{ 127, 132 },
	{ 134, 159 },
	{ 173, 173 },
	{ 1536, 1541 },
	{ 1564, 1564 },
	{ 1757, 1757 },
	{ 1807, 1807 },
	{ 6158, 6158 },
	{ 8203, 8207 },
	{ 8234, 8238 },
	{ 8288, 8292 },
	{ 8294, 8303 },
	{ 65279, 65279 },
	{ 65529, 65531 }
}
local list4 = {
	{ 48, 57 },
	{ 97, 122 },
	{ 192, 214 },
	{ 216, 246 },
	{ 248, 591 },
	{ 880, 884 },
	{ 886, 887 },
	{ 890, 893 },
	{ 895, 895 },
	{ 902, 902 },
	{ 904, 906 },
	{ 908, 908 },
	{ 910, 929 },
	{ 931, 1013 },
	{ 1015, 1023 },
	{ 1024, 1153 },
	{ 1162, 1327 },
	{ 1568, 1610 },
	{ 1632, 1641 },
	{ 1646, 1647 },
	{ 1649, 1747 },
	{ 1749, 1749 },
	{ 1765, 1766 },
	{ 1774, 1788 },
	{ 1791, 1791 },
	{ 1872, 1919 },
	{ 2208, 2249 },
	{ 3585, 3632 },
	{ 3634, 3635 },
	{ 3648, 3654 },
	{ 3664, 3673 },
	{ 4352, 4607 },
	{ 7680, 7935 },
	{ 12353, 12438 },
	{ 12445, 12447 },
	{ 12449, 12538 },
	{ 12540, 12543 },
	{ 12593, 12686 },
	{ 12784, 12799 },
	{ 13312, 19903 },
	{ 19968, 40959 },
	{ 44032, 55203 },
	{ 63744, 64109 },
	{ 64112, 64217 },
	{ 65382, 65470 },
	{ 65474, 65479 },
	{ 65482, 65487 },
	{ 65490, 65495 },
	{ 65498, 65500 },
	{ 1328, 1423 },
	{ 1488, 1522 },
	{ 2304, 3455 },
	{ 3712, 3839 },
	{ 4096, 4255 },
	{ 4256, 4351 },
	{ 4608, 4991 },
	{ 6016, 6143 },
	{ 131072, 173791 },
	{ 173824, 177983 },
	{ 177984, 178207 },
	{ 178208, 183983 },
	{ 183984, 191471 },
	{ 196608, 201551 },
	{ 201552, 205743 }
}

local function _(p1, List): boolean
	for _, value in List do
		if value[1] <= p1 and p1 <= value[2] then
			return true
		end
	end
	return false
end

local function fold(p2: number): number
	-- upvalues: list1 (copy)
	if p2 >= 65281 and p2 <= 65374 then
		p2 -= 65248
	end
	for _, value in list1 do
		if value[1] <= p2 and p2 <= value[2] then
			return p2 + value[3]
		end
	end
	return p2
end

local _ = function(p3)
	local List = {}
	
	for _, value in utf8.codes(p3) do
		table.insert(List, value)
	end
	return List
end

local function fromCodepoints(Codepoints): string
	local Buffer = table.create(#Codepoints)
	
	for i, codepoint in Codepoints do
		Buffer[i] = utf8.char(codepoint)
	end
	return table.concat(Buffer)
end

local function collapseWhitespace(MoveResult)
	-- upvalues: list (copy)
	local List = {}
	local Flag = false
	local Flag1 = nil
	
	for _, value in MoveResult do
		Flag1 = false
		
		for _, value1 in list do
			if value1[1] <= value and value <= value1[2] then
				Flag1 = true
				break
			end
		end
		if Flag1 then
			Flag = #List > 0
		else
			if Flag then
				table.insert(List, 32)
				Flag = false
			end
			table.insert(List, value)
		end
	end
	return List
end

local _ = function(List, p4): boolean
	if #List ~= #p4 then
		return false
	end
	for i, value in List do
		if value ~= p4[i] then
			return false
		end
	end
	return true
end

local function trimDecorativeBoundaries(p5)
	-- upvalues: list2 (copy), collapseWhitespace (copy)
	local Count = 1
	local CountP8 = #p5
	local Flag = nil
	local Flag1 = nil
	while Count <= CountP8 do
		local v1 = p5[Count]
		Flag1 = false
		
		for _, value in list2 do
			if value[1] <= v1 and v1 <= value[2] then
				Flag1 = true
				break
			end
		end
		if not Flag1 then break end
		Count += 1
	end
	while Count <= CountP8 do
		local v2 = p5[CountP8]
		Flag = false
		
		for _, value1 in list2 do
			if value1[1] <= v2 and v2 <= value1[2] then
				Flag = true
				break
			end
		end
		if not Flag then break end
		CountP8 -= 1
	end
	return (collapseWhitespace(table.move(p5, Count, CountP8, 1, {})))
end

return {
	specVersion = "marketplace-query-v2",
	normalizeQueryWhitespace = function(Text)
		-- upvalues: fromCodepoints (copy), collapseWhitespace (copy)
		if Text == nil or utf8.len(Text) == nil then
			return nil
		end
		local List = {}
		
		for _, value in utf8.codes(Text) do
			table.insert(List, value)
		end
		return fromCodepoints((collapseWhitespace(List)))
	end,
	canonicalizeMarketplaceQuery = function(Text)
		-- upvalues: fold (copy), list (copy), list3 (copy), trimDecorativeBoundaries (copy), list4 (copy), fromCodepoints (copy)
		if Text == nil or utf8.len(Text) == nil then
			return nil
		end
		local List = {}
		local Flag = false
		local Flag1 = nil
		local Flag2 = nil
		
		for _, value in utf8.codes(Text) do
			local FoldResult = fold(value)
			Flag1 = false
			
			for _, value1 in list do
				if value1[1] <= FoldResult and FoldResult <= value1[2] then
					Flag1 = true
					break
				end
			end
			if Flag1 then
				Flag = #List > 0
			else
				Flag2 = false
				
				for _, value2 in list3 do
					if value2[1] <= FoldResult and FoldResult <= value2[2] then
						Flag2 = true
						break
					end
				end
				if not Flag2 then
					if Flag then
						table.insert(List, 32)
						Flag = false
					end
					table.insert(List, FoldResult)
				end
			end
		end
		local TrimDecorativeBoundariesResult = trimDecorativeBoundaries(List)
		local Flag3 = nil
		while true do
			if #TrimDecorativeBoundariesResult == #List then
				Flag3 = true
				
				for i, value3 in TrimDecorativeBoundariesResult do
					if value3 ~= List[i] then
						Flag3 = false
						break
					end
				end
			else
				Flag3 = false
			end
			if Flag3 then break end
			List = TrimDecorativeBoundariesResult
			TrimDecorativeBoundariesResult = trimDecorativeBoundaries(List)
		end
		local Flag4 = nil
		for _, value4 in List do
			Flag4 = false
			
			for _, value5 in list4 do
				if value5[1] <= value4 and value4 <= value5[2] then
					Flag4 = true
					break
				end
			end
			if Flag4 then
				return fromCodepoints(List)
			end
		end
		return nil
	end
}