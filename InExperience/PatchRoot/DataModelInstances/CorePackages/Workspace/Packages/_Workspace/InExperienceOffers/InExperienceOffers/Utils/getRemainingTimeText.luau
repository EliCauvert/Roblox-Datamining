local _ = require(script:FindFirstAncestor("InExperienceOffers").Parent.AvatarExperienceUIKit)

return function(p1, p2)
	local unit = p1.unit
	local var1 = p1.value == 1
	
	if unit == "days" then
		return if var1 then p2.daySingular else p2.dayPlural
	elseif unit == "hours" then
		return if var1 then p2.hourSingular else p2.hourPlural
	elseif unit == "minutes" then
		return if var1 then p2.minuteSingular else p2.minutePlural
	elseif unit ~= "seconds" then
		warn(`getRemainingTimeText: unexpected TimeUnit "{unit}"`)
		
		return nil
	end
	return if var1 then p2.secondSingular else p2.secondPlural
end