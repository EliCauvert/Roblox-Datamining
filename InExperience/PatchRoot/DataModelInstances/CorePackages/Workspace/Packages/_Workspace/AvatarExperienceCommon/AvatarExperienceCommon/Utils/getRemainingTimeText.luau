local _ = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceUIKit)

return function(p1, p2)
	local Unit = p1.unit
	local IsValueMatch = p1.value == 1
	
	if Unit == "days" then
		return if IsValueMatch then p2.daySingular else p2.dayPlural
	elseif Unit == "hours" then
		return if IsValueMatch then p2.hourSingular else p2.hourPlural
	elseif Unit == "minutes" then
		return if IsValueMatch then p2.minuteSingular else p2.minutePlural
	elseif Unit == "seconds" then
		return if IsValueMatch then p2.secondSingular else p2.secondPlural
	else
		warn(`getRemainingTimeText: unexpected TimeUnit "{Unit}"`)
		
		return nil
	end
end