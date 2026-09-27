return function(p1, p2, p3)
	return if p1 == "invite_friends" then not p2 or not p3 else true
end