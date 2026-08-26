local _ = require(script:FindFirstAncestor("Markdown").Types)
local utilsModule = require(script.Parent.Utils)
local t = {
	collectDelimiterRun = function(p1, p2, p3)
		-- upvalues: utilsModule (ref)
		local length = p2.length
		local var1 = p3 + 1
		while var1 <= #p1 do
			local delimiterInfo = utilsModule.getDelimiterInfo(p1[var1].name)
			
			if not delimiterInfo or delimiterInfo.char ~= p2.char then break end
			length += delimiterInfo.length
			var1 += 1
		end
		local prevChar = nil
		local nextChar = nil
		local var2 = p1[p3]
		
		if var2 and var2.context then
			prevChar = var2.context.prevChar
		end
		local var3 = p1[var1 - 1]
		
		if var3 and var3.context then
			nextChar = var3.context.nextChar
		end
		return {
			char = p2.char,
			prevChar = prevChar,
			nextChar = nextChar,
			length = length,
			startIdx = p3,
			endIdx = var1 - 1
		}
	end
}

function t.processEmphasisRun(p4, p5, p6)
	-- upvalues: utilsModule (ref), t (ref)
	local t_1 = {}
	local var4 = p5
	local t_2 = {}
	local t_3 = {}
	local var5 = 1
	while var4 <= p6 do
		local var6 = p4[var4]
		local delimiterInfo = utilsModule.getDelimiterInfo(var6.name)
		
		if delimiterInfo then
			local var7 = t.collectDelimiterRun(p4, delimiterInfo, var4)
			table.insert(t_2, {
				char = var7.char,
				runLength = var7.length,
				origRunLength = var7.length,
				canOpen = utilsModule.canOpenEmphasis(var7),
				canClose = utilsModule.canCloseEmphasis(var7),
				startIdx = var5,
				tokenStart = var7.startIdx
			})
			t_1[var5] = {
				name = "DELIMITER_RUN",
				text = "",
				delimiterIndex = #t_2,
				offset = p4[var7.startIdx].offset
			}
			var5 += 1
			var4 = var7.endIdx + 1
		else
			t_1[var5] = var6
			
			if utilsModule.causesLineBreak(var6) then
				table.insert(t_3, var4)
			end
			var5 += 1
			var4 += 1
		end
	end
	local var8 = false
	
	for i = p6 + 1, #p4 do
		if not utilsModule.causesLineBreak(p4[i]) then
			continue
		end
		var8 = true
		break
	end
	local t_4Count, delimiterIndex
	local t_4 = {}
	
	for i_1, v in t_2 do
		if v.canClose and v.runLength > 0 then
			t_4Count = #t_4
			while t_4Count >= 1 do
				delimiterIndex = t_2[t_4[t_4Count]]
				
				if delimiterIndex.char == "`" and v.char ~= "`" and delimiterIndex.canOpen then break end
				if delimiterIndex.char == v.char and delimiterIndex.canOpen and delimiterIndex.runLength > 0 then
					if not utilsModule.canDelimitersMatch(delimiterIndex, v) then
						t_4Count -= 1
						continue
					end
					local minValue = math.min(2, delimiterIndex.runLength, v.runLength)
					utilsModule.addDelimiterMatch(delimiterIndex, { isOpener = true, with = v, length = minValue })
					utilsModule.addDelimiterMatch(v, {
						isOpener = false,
						with = delimiterIndex,
						length = minValue
					})
					delimiterIndex.runLength -= minValue
					v.runLength -= minValue
					
					for _ = #t_4, t_4Count + 1, -1 do
						table.remove(t_4)
					end
					if delimiterIndex.runLength == 0 then
						table.remove(t_4, t_4Count)
					end
					if v.runLength == 0 then break end
					t_4Count = #t_4
				else
					t_4Count -= 1
				end
			end
		end
		if v.canOpen and v.runLength > 0 then
			table.insert(t_4, i_1)
		end
	end
	local matches
	local t_5 = {}
	
	for v, v_1 in t_1 do
		if v_1.name ~= "DELIMITER_RUN" then
			table.insert(t_5, v_1)
			continue
		end
		local var9, i_3
		delimiterIndex = t_2[v_1.delimiterIndex]
		
		if delimiterIndex.char == "`" and delimiterIndex.runLength > 0 and (v_1.delimiterIndex == #t_2 and not var8) and v < #t_1 then
			matches = false
			
			for i_3 = #t_3, 1, -1 do
				var9 = t_3[i_3]
				
				if delimiterIndex.tokenStart < var9 then
					matches = true
					break
				elseif var9 > delimiterIndex.tokenStart then
					continue
				else
					break
				end
				elseif matches then
					local v_3
					matches = delimiterIndex.matches
					
					if not matches or #matches == 0 then
						table.insert(t_5, {
							name = "TEXT",
							text = string.rep(delimiterIndex.char, delimiterIndex.origRunLength),
							offset = v_1.offset
						})
						continue
					end
					if matches[1].isOpener then
						local var10 = 0
						
						for i_4, v_2 in matches do
							var10 += v_2.length
						end
						local var11 = delimiterIndex.origRunLength - var10
						
						if var11 > 0 then
							table.insert(t_5, {
								name = "TEXT",
								text = string.rep(delimiterIndex.char, var11),
								offset = v_1.offset
							})
						end
						for v_2, v_3 in matches do
							local length = v_3.length
						end
					end
					local t_6 = {}
					
					for i_4, v_2 in matches do
						v_3 = v_2.length
					end
					for var9 = #t_6, 1, -1 do
						table.insert(t_5, t_6[var9])
					end
					local var12 = 0
					
					for v_2, v_3 in matches do
						var12 += v_3.length
					end
					i_3 = delimiterIndex.origRunLength - var12
					
					if i_3 > 0 then
						table.insert(t_5, {
							name = "TEXT",
							text = string.rep(delimiterIndex.char, i_3),
							offset = v_1.offset
						})
					end
				else
					table.insert(t_5, {
						name = "EMPHASIS_START",
						text = "INLINE_CODE",
						offset = p4[delimiterIndex.tokenStart].offset
					})
				end
			end
			-- [0.001s] <RUNTIME-ERROR> : Error block 77 analysis at pc 1 (list.remove(x): x not in list)
		end
	end
	return t_5
end

return t