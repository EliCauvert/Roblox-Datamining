return function(p1)
	return if string.sub(p1, 1, 7) ~= "Enabled" then p1 == "AllUsers" else true
end