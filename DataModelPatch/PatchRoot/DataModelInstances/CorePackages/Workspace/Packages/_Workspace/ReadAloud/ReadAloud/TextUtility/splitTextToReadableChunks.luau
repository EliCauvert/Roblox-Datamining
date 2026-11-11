local PropertiesModule = require(script.Parent.Parent.Properties)

return function(Text: string, p1, p2, p3)
	-- upvalues: PropertiesModule (copy)
	local Count = p1 or PropertiesModule.PunctuationPauseDuration
	local P1 = p2 or PropertiesModule.TTSModelCharacterLimit
	local Text1 = string.rep(".", Count) .. " "
	local List = {}
	local List1 = {}
	local Total = 0
	local Total1 = 1
	
	local function v7(Count1: number)
		-- upvalues: Text (copy), Total1 (ref), Text1 (copy), Total (ref), P1 (copy), List1 (copy), List (copy), Count (copy)
		local Segment = Text:sub(Total1, Count1)
		local Amount = #Segment + #Text1
		local Amount1 = nil
		
		if P1 < Total + Amount and Total > 0 then
			table.insert(List, (table.concat(List1, Text1)))
			table.clear(List1)
			Total = 0
		end
		while P1 < Amount do
			Amount1 = -1
			
			for i = P1, 1, -1 do
				if not string.sub(Segment, i, i):match("%s") then
					continue
				end
				Amount1 = i
				break
			end
			if Amount1 < 1 then
				table.insert(List, Segment:sub(1, P1))
				Total1 += P1
			else
				table.insert(List, Segment:sub(1, Amount1))
				Total1 += Amount1
			end
			Segment = Text:sub(Total1, Count1)
			Amount = #Segment + Count
		end
		Total += Amount
		table.insert(List1, Segment)
		local StartIndex, _ = Text:find("%S", Count1 + 1)
		
		if not StartIndex then
			StartIndex = Count1 + 1
		end
		Total1 = StartIndex
	end
	
	for i, value in string.gmatch(Text, "()(" .. (p3 or PropertiesModule.ValidTextTerminators) .. ")") do
		if i >= Total1 then
			local NewI = i + 1
			
			if value == "\n" or Text:match("^%s+%a", NewI) or Text:match("^%s*\n", NewI) then
				v7(i)
			end
		end
	end
	if Total1 <= #Text then
		v7(#Text)
		
		if #List1 > 0 then
			table.insert(List, (table.concat(List1, Text1)))
		end
	end
	return List
end