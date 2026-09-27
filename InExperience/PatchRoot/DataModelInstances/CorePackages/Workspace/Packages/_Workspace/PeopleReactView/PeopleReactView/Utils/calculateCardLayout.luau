local constantsModule = require(script:FindFirstAncestor("PeopleReactView").Constants)

return function(p1, p2, p3)
	-- upvalues: constantsModule (ref)
	local clampedValue = math.clamp(math.floor(p2 / p1), constantsModule.PEOPLEPAGE.PEOPLE_CARDS.MIN_CARD_COLUMNS, constantsModule.PEOPLEPAGE.PEOPLE_CARDS.MAX_CARD_COLUMNS)
	
	return math.floor(p2 / clampedValue) - math.ceil(p3 * (clampedValue - 1) / clampedValue), clampedValue
end