local _ = require(script:FindFirstAncestor("Markdown").Types)
local UtilsModule = require(script.Parent.Utils)
local EmphasisParserModule = {
	collectDelimiterRun = function(p1, DelimiterInfo, StartIdx: number) --[[ Line: 19 ]]
		-- upvalues: UtilsModule (copy)
		local Length = DelimiterInfo.length
		local NewStartIdx = StartIdx + 1
		while NewStartIdx <= #p1 do
			local DelimiterInfo1 = UtilsModule.getDelimiterInfo(p1[NewStartIdx].name)
			
			if not DelimiterInfo1 or DelimiterInfo1.char ~= DelimiterInfo.char then break end
			Length += DelimiterInfo1.length
			NewStartIdx += 1
		end
		local PrevChar = nil
		local NextChar = nil
		local v1 = p1[StartIdx]
		
		if v1 and v1.context then
			PrevChar = v1.context.prevChar
		end
		local v2 = p1[NewStartIdx - 1]
		
		if v2 and v2.context then
			NextChar = v2.context.nextChar
		end
		return {
			char = DelimiterInfo.char,
			prevChar = PrevChar,
			nextChar = NextChar,
			length = Length,
			startIdx = StartIdx,
			endIdx = NewStartIdx - 1
		}
	end
}

function EmphasisParserModule.processEmphasisRun(p2, NewEndIdx, p3: number) --[[ Line: 61 ]]
	-- upvalues: UtilsModule (copy), EmphasisParserModule (copy)
	local t = {}
	local NewEndIdx1: number = NewEndIdx
	local List = {}
	local List1 = {}
	local Count = 1
	while NewEndIdx1 <= p3 do
		local v3 = p2[NewEndIdx1]
		local DelimiterInfo = UtilsModule.getDelimiterInfo(v3.name)
		
		if DelimiterInfo then
			local CollectDelimiterRunResult = EmphasisParserModule.collectDelimiterRun(p2, DelimiterInfo, NewEndIdx1)
			table.insert(List, {
				char = CollectDelimiterRunResult.char,
				runLength = CollectDelimiterRunResult.length,
				origRunLength = CollectDelimiterRunResult.length,
				canOpen = UtilsModule.canOpenEmphasis(CollectDelimiterRunResult),
				canClose = UtilsModule.canCloseEmphasis(CollectDelimiterRunResult),
				startIdx = Count,
				tokenStart = CollectDelimiterRunResult.startIdx
			})
			t[Count] = {
				name = "DELIMITER_RUN",
				text = "",
				delimiterIndex = #List,
				offset = p2[CollectDelimiterRunResult.startIdx].offset
			}
			Count += 1
			NewEndIdx1 = CollectDelimiterRunResult.endIdx + 1
		else
			t[Count] = v3
			
			if UtilsModule.causesLineBreak(v3) then
				table.insert(List1, NewEndIdx1)
			end
			Count += 1
			NewEndIdx1 += 1
		end
	end
	local Flag = false
	
	for i = p3 + 1, #p2 do
		if not UtilsModule.causesLineBreak(p2[i]) then
			continue
		end
		Flag = true
		break
	end
	local List2 = {}
	
	for i1, With in List do
		if With.canClose and With.runLength > 0 then
			local CountList2 = #List2
			while CountList2 >= 1 do
				local Entry = List[List2[CountList2]]
				
				if Entry.char == "`" and With.char ~= "`" and Entry.canOpen then break end
				if Entry.char == With.char and Entry.canOpen and Entry.runLength > 0 then
					if not UtilsModule.canDelimitersMatch(Entry, With) then
						CountList2 -= 1
						continue
					end
					local Smallest = math.min(2, Entry.runLength, With.runLength)
					UtilsModule.addDelimiterMatch(Entry, { isOpener = true, with = With, length = Smallest })
					UtilsModule.addDelimiterMatch(With, { isOpener = false, with = Entry, length = Smallest })
					Entry.runLength -= Smallest
					With.runLength -= Smallest
					
					for _ = #List2, CountList2 + 1, -1 do
						table.remove(List2)
					end
					if Entry.runLength == 0 then
						table.remove(List2, CountList2)
					end
					if With.runLength == 0 then break end
					CountList2 = #List2
				else
					CountList2 -= 1
				end
			end
		end
		if With.canOpen and With.runLength > 0 then
			table.insert(List2, i1)
		end
	end
	local List3 = {}
	local Flag1 = nil
	
	for i2, value1 in t do
		if value1.name ~= "DELIMITER_RUN" then
			table.insert(List3, value1)
			continue
		end
		local Entry1 = List[value1.delimiterIndex]
		
		if Entry1.char == "`" and Entry1.runLength > 0 and value1.delimiterIndex == #List and not Flag and i2 < #t then
			Flag1 = false
			
			for i3 = #List1, 1, -1 do
				local Entry = List1[i3]
				
				if Entry1.tokenStart < Entry then
					Flag1 = true
					break
				end
				if Entry <= Entry1.tokenStart then break end
			end
			if not Flag1 then
				table.insert(List3, {
					name = "EMPHASIS_START",
					text = "INLINE_CODE",
					offset = p2[Entry1.tokenStart].offset
				})
				continue
			end
		end
		local Matches = Entry1.matches
		
		if not Matches or #Matches == 0 then
			table.insert(List3, {
				name = "TEXT",
				text = string.rep(Entry1.char, Entry1.origRunLength),
				offset = value1.offset
			})
			continue
		end
		if Matches[1].isOpener then
			local NewLength = 0
			
			for _, match in Matches do
				NewLength += match.length
			end
			local OrigRunLengthDelta = Entry1.origRunLength - NewLength
			
			if OrigRunLengthDelta > 0 then
				table.insert(List3, {
					name = "TEXT",
					text = string.rep(Entry1.char, OrigRunLengthDelta),
					offset = value1.offset
				})
			end
			for _, value in Matches do
				local Length = value.length
				while Length > 0 do
					local Smallest = math.min(Length, 2)
					table.insert(List3, {
						name = "EMPHASIS_START",
						text = UtilsModule.getTokenNameFromCharAndLength(Entry1.char, Smallest),
						offset = value1.offset
					})
					Length -= Smallest
				end
			end
		else
			local List31 = {}
			
			for _, match1 in Matches do
				local Length = match1.length
				while Length > 0 do
					local Smallest = math.min(Length, 2)
					table.insert(List31, { name = "EMPHASIS_END", text = "", offset = value1.offset })
					Length -= Smallest
				end
			end
			for i4 = #List31, 1, -1 do
				table.insert(List3, List31[i4])
			end
			local NewLength = 0
			
			for _, match2 in Matches do
				NewLength += match2.length
			end
			local OrigRunLengthDelta = Entry1.origRunLength - NewLength
			
			if OrigRunLengthDelta > 0 then
				table.insert(List3, {
					name = "TEXT",
					text = string.rep(Entry1.char, OrigRunLengthDelta),
					offset = value1.offset
				})
			end
		end
	end
	return List3
end

return EmphasisParserModule