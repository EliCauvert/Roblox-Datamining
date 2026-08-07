return function(p0) --[[ line: 1 ]]
	if p0 and p0 ~= "" then
		assert(p0, "")
		
		return string.find(p0, "^%+*[%d%-%s%.%(%)]+$") ~= nil and #p0:gsub("[^%d]", "") >= 6
	end
	return false
end