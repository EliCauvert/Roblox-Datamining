local ConstantsModule = require(script:FindFirstAncestor("PeopleReactView").Constants)

return function(p1, p2, p3)
	-- upvalues: ConstantsModule (copy)
	local ClampedValue = math.clamp(math.floor(p2 / p1), ConstantsModule.PEOPLEPAGE.PEOPLE_CARDS.MIN_CARD_COLUMNS, ConstantsModule.PEOPLEPAGE.PEOPLE_CARDS.MAX_CARD_COLUMNS)
	
	return math.floor(p2 / ClampedValue) - math.ceil(p3 * (ClampedValue - 1) / ClampedValue), ClampedValue
end