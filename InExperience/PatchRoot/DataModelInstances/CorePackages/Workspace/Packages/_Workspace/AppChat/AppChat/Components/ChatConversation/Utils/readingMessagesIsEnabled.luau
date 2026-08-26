return function(p1)
	return if p1 then p1.getScreenProps("isVisible", false) or not p1.getScreenProps("wideMode", false) else false
end