return function(p1)
	if p1 and p1 ~= "" then
		assert(p1, "")
		
		return string.find(p1, "^.+@.+%..+$") ~= nil
	end
	return false
end