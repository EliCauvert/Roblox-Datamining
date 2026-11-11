return function(List): boolean
	local Flag = false
	local Flag1 = false
	local Flag2 = true
	local Count = 1
	
	for i, _ in pairs(List) do
		if type(i) == "string" then
			Flag1 = true
		else
			if type(i) ~= "number" then
				return false
			end
			if Count ~= i then
				Flag2 = false
			end
			Flag = true
		end
		if Flag1 and Flag then
			return false
		end
		Count += 1
	end
	return not Flag or Flag2
end