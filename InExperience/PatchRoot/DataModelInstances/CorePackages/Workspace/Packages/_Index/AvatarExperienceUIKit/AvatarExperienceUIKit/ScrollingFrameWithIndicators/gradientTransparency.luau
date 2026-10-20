local function fitKeypoints(List)
	local List1 = {}
	
	for _, value in List do
		local ClampedValue = math.clamp(value.Time, 0, 1)
		local Value = value.Value
		local Entry = List1[#List1]
		
		if Entry == nil then
			table.insert(List1, NumberSequenceKeypoint.new(0, Value))
		elseif Entry.Time < ClampedValue then
			table.insert(List1, NumberSequenceKeypoint.new(ClampedValue, Value))
		end
	end
	local Entry = List1[#List1]
	
	if Entry == nil then
		return {
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(1, 1)
		}
	end
	if Entry.Time < 1 then
		table.insert(List1, NumberSequenceKeypoint.new(1, Entry.Value))
	end
	return List1
end

return {
	fittedGradientTransparency = function(Entry, p1, p2: number): NumberSequence?
		-- upvalues: fitKeypoints (copy)
		local v1 = 1 - p2
		local ClampedValue = math.clamp(v1 * Entry[1], 0, 1)
		local ClampedValue1 = math.clamp(v1 * Entry[2], 0, 1)
		local Entry1: number = Entry[3]
		
		if Entry1 < 1 then
			return nil
		end
		local v2 = if Entry1 < p1 then 1 else p1 / Entry1
		local v3 = (if ClampedValue > 0 then v2 * (ClampedValue + 1) else 0) + (if ClampedValue1 > 0 then v2 * (ClampedValue1 + 1) else 0)
		
		if v3 > 1 then
			v2 /= v3
		end
		local List = {}
		
		if ClampedValue > 0 then
			table.insert(List, NumberSequenceKeypoint.new(0, 1 - ClampedValue))
			table.insert(List, NumberSequenceKeypoint.new(v2, 1 - ClampedValue))
			table.insert(List, NumberSequenceKeypoint.new(v2 + v2 * ClampedValue, 1))
		else
			table.insert(List, NumberSequenceKeypoint.new(0, 1))
		end
		if ClampedValue1 > 0 then
			table.insert(List, NumberSequenceKeypoint.new(1 - v2 * ClampedValue1 - v2, 1))
			table.insert(List, NumberSequenceKeypoint.new(1 - v2, 1 - ClampedValue1))
			table.insert(List, NumberSequenceKeypoint.new(1, 1 - ClampedValue1))
		else
			table.insert(List, NumberSequenceKeypoint.new(1, 1))
		end
		return NumberSequence.new((fitKeypoints(List)))
	end
}