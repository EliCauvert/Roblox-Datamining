return function(Text: string): boolean
	if Text and Text ~= "" then
		assert(Text, "")
		
		return string.find(Text, "^.+@.+%..+$") ~= nil
	else
		return false
	end
end