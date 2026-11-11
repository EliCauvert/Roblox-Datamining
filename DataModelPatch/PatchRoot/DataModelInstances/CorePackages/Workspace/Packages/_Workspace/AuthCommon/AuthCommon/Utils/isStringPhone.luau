return function(Text: string): boolean
	if Text and Text ~= "" then
		assert(Text, "")
		local v1 = #Text:gsub("[^%d]", "") >= 6
		
		return string.find(Text, "^%+*[%d%-%s%.%(%)]+$") ~= nil and v1
	else
		return false
	end
end