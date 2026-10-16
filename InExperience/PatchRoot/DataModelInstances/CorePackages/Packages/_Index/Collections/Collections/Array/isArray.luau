return function(Amounts): boolean --[[ Line: 16 ]]
	if typeof(Amounts) ~= "table" then
		return false
	end
	if next(Amounts) == nil then
		return true
	end
	if #Amounts == 0 then
		return false
	end
	local Count = 0
	local Total = 0
	
	for amount in pairs(Amounts) do
		if typeof(amount) ~= "number" then
			return false
		end
		if amount % 1 ~= 0 or amount < 1 then
			return false
		end
		Count += 1
		Total += amount
	end
	return Total == Count * (Count + 1) / 2
end