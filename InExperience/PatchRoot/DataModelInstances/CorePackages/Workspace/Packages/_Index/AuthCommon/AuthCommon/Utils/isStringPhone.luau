return function(p1)
	if p1 and p1 ~= "" then
		assert(p1, "")
		
		return string.find(p1, "^%+*[%d%-%s%.%(%)]+$") ~= nil and #p1:gsub("[^%d]", "") >= 6
	end
	return false
end