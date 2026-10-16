return function(p1, p2, UserId) --[[ Line: 3 ]]
	local TextSource = p1.TextSource
	
	if not TextSource then
		return false
	elseif UserId and TextSource.UserId == UserId then
		return false
	else
		local Lowered = string.lower(TextSource.Username or "")
		local Lowered1 = string.lower(TextSource.DisplayName or "")
		
		return if Lowered == "" then if Lowered1 == "" then p2.isUserIdMuted(TextSource.UserId) else p2.isDisplayNameMuted(Lowered1) or p2.isUserIdMuted(TextSource.UserId) else p2.isUsernameMuted(Lowered) or (if Lowered1 == "" then p2.isUserIdMuted(TextSource.UserId) else p2.isDisplayNameMuted(Lowered1) or p2.isUserIdMuted(TextSource.UserId))
	end
end