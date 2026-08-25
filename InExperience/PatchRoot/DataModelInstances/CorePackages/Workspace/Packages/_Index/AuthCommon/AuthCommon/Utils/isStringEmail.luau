return function(p0)
	if p0 and p0 ~= "" then
		assert(p0, "")
		
		return string.find(p0, "^.+@.+%..+$") ~= nil
	end
	return false
end