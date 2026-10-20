return function(Text): number
	if utf8.len(Text) == nil then
		return #Text
	end
	local Total = 0
	
	for _, value in utf8.codes(Text) do
		Total += if value > 65535 then 2 else 1
	end
	return Total
end