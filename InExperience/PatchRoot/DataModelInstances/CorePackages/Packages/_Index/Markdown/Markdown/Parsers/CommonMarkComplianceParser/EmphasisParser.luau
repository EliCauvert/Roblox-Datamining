local _ = require(script:FindFirstAncestor("Markdown").Types)
local utilsModule = require(script.Parent.Utils)
local t = {
	collectDelimiterRun = function(p0, p1, p2) --[[ line: 19 ]]
		-- upvalues: utilsModule (ref)
		local length = p1.length
		local var2 = p2 + 1
		while var2 <= #p0 do
			local delimiterInfo = utilsModule.getDelimiterInfo(p0[var2].name)
			
			if not delimiterInfo or delimiterInfo.char ~= p1.char then break end
			length += delimiterInfo.length
			var2 += 1
		end
		local prevChar = nil
		local nextChar = nil
		local var4 = p0[p2]
		
		if var4 and var4.context then
			prevChar = var4.context.prevChar
		end
		local var5 = p0[var2 - 1]
		
		if var5 and var5.context then
			nextChar = var5.context.nextChar
		end
		return {
			char = p1.char,
			prevChar = prevChar,
			nextChar = nextChar,
			length = length,
			startIdx = p2,
			endIdx = var2 - 1
		}
	end
}

function t.processEmphasisRun(p3, p4, p5) --[[ line: 61 ]]
	-- upvalues: utilsModule (ref), t (ref)
	local t_1 = {}
	local var7 = p4
	local t_2 = {}
	local t_3 = {}
	local var10 = 1
	while var7 <= p5 do
		local var11 = p3[var7]
		local delimiterInfo = utilsModule.getDelimiterInfo(var11.name)
		
		if delimiterInfo then
			local var13 = t.collectDelimiterRun(p3, delimiterInfo, var7)
			table.insert(t_2, {
				char = var13.char,
				runLength = var13.length,
				origRunLength = var13.length,
				canOpen = utilsModule.canOpenEmphasis(var13),
				canClose = utilsModule.canCloseEmphasis(var13),
				startIdx = var10,
				tokenStart = var13.startIdx
			})
			t_1[var10] = {
				name = "DELIMITER_RUN",
				text = "",
				delimiterIndex = #t_2,
				offset = p3[var13.startIdx].offset
			}
			var10 += 1
			var7 = var13.endIdx + 1
		else
			t_1[var10] = var11
			
			if utilsModule.causesLineBreak(var11) then
				table.insert(t_3, var7)
			end
			var10 += 1
			var7 += 1
		end
	end
	local var14 = false
	
	for i = p5 + 1, #p3 do
		if not utilsModule.causesLineBreak(p3[i]) then
			continue
		end
		var14 = true
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
		local var17, i_3
		delimiterIndex = t_2[v_1.delimiterIndex]
		
		if delimiterIndex.char == "`" and delimiterIndex.runLength > 0 and (v_1.delimiterIndex == #t_2 and not var14) and v < #t_1 then
			matches = false
			
			for i_3 = #t_3, 1, -1 do
				var17 = t_3[i_3]
				
				if delimiterIndex.tokenStart < var17 then
					matches = true
					break
				elseif var17 > delimiterIndex.tokenStart then
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
						local var18 = 0
						
						for i_4, v_2 in matches do
							var18 += v_2.length
						end
						local var19 = delimiterIndex.origRunLength - var18
						
						if var19 > 0 then
							table.insert(t_5, {
								name = "TEXT",
								text = string.rep(delimiterIndex.char, var19),
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
					for var17 = #t_6, 1, -1 do
						table.insert(t_5, t_6[var17])
					end
					local var22 = 0
					
					for v_2, v_3 in matches do
						var22 += v_3.length
					end
					i_3 = delimiterIndex.origRunLength - var22
					
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
						offset = p3[delimiterIndex.tokenStart].offset
					})
				end
			end
			-- [0.007s] <RUNTIME-ERROR> : Error block 77 analysis at pc 1 (list.remove(x): x not in list)
		end
	end
	return t_5
end

return t