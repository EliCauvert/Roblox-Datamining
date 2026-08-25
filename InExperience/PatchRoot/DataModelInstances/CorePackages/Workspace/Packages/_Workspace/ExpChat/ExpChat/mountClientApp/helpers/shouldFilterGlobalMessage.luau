return function(p0, p1, p2)
	local textSource = p0.TextSource
	
	if not textSource then
		return false
	elseif p2 and textSource.UserId == p2 then
		return false
	end
	local lowerText = string.lower(textSource.Username or "")
	local lowerText_1 = string.lower(textSource.DisplayName or "")
	
	return lowerText ~= "" and p1.isUsernameMuted(lowerText) or (lowerText_1 ~= "" and p1.isDisplayNameMuted(lowerText_1) or p1.isUserIdMuted(textSource.UserId))
end