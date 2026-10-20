return function(Text: string, MaxValue: number): number
	local Value = 1
	
	if Text ~= "" then
		for _ in string.gmatch(Text, "\n") do
			Value += 1
		end
	end
	return (math.clamp(Value, 1, MaxValue))
end