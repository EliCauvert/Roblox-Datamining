return function(p1): boolean
	if p1 == nil or tostring(p1) == "" then
		return true
	else
		local Number: number? = tonumber(p1)
		
		return Number ~= nil and Number <= 0
	end
end