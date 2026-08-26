return function(p1, p2, p3)
	local textSource = p1.TextSource
	
	if not textSource then
		return false
	elseif p3 and textSource.UserId == p3 then
		return false
	end
	local lowerText = string.lower(textSource.Username or "")
	local lowerText_1 = string.lower(textSource.DisplayName or "")
	
	return lowerText ~= "" and p2.isUsernameMuted(lowerText) or (lowerText_1 ~= "" and p2.isDisplayNameMuted(lowerText_1) or p2.isUserIdMuted(textSource.UserId))
end