return function(p0)
	return if p0 then p0.getScreenProps("isVisible", false) or not p0.getScreenProps("wideMode", false) else false
end