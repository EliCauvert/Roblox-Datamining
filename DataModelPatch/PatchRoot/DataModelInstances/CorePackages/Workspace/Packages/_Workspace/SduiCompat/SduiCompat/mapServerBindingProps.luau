local t = {}

local function _(Text: string): boolean
	-- upvalues: t (copy)
	if t[Text] then
		return true
	end
	if typeof(Text) ~= "string" then
		return false
	end
	local Segment: string = Text:sub(1, 1)
	local IsSegmentMatch = Segment == Segment:upper()
	
	if IsSegmentMatch then
		t[Text] = true
	end
	return IsSegmentMatch
end

return function(List1, p1)
	-- upvalues: t (copy)
	local v1 = nil
	local List = nil
	
	for Text, value in List1 do
		local v2 = p1[Text]
		
		if v2 ~= nil then
			v1 = v1 or {}
			v1[v2] = value
			continue
		end
		local Flag = nil
		if t[Text] then
			Flag = true
		elseif typeof(Text) == "string" then
			local Segment: string = Text:sub(1, 1)
			local IsSegmentMatch = Segment == Segment:upper()
			
			if IsSegmentMatch then
				t[Text] = true
			end
			Flag = IsSegmentMatch
		else
			Flag = false
		end
		if Flag then
			List = List or {}
			table.insert(List, Text)
		end
	end
	return v1, List
end