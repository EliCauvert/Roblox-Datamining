return function(p0) --[[ line: 4 ]]
	return if string.sub(p0, 1, 7) ~= "Enabled" then p0 == "AllUsers" else true
end