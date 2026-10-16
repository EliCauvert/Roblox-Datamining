return function(Text: string): boolean --[[ Line: 2 ]]
	if Text and Text ~= "" then
		assert(Text, "")
		
		return string.find(Text, "^.+@.+%..+$") ~= nil
	else
		return false
	end
end