local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local reactModule = require(peopleReactView.Parent.React)
local constantsModule = require(peopleReactView.Constants)

return function() --[[ line: 8 | named "useCardWidth" ]]
	-- upvalues: reactModule (ref), constantsModule (ref)
	local var3, var4 = reactModule.useBinding(0)
	
	return var3, reactModule.useCallback(function(p0, p1, p2) --[[ line: 11 ]]
		-- upvalues: constantsModule (copy), var4 (ref)
		local clampedValue = math.clamp(math.floor(p1 / p0), constantsModule.PEOPLEPAGE.PEOPLE_CARDS.MIN_CARD_COLUMNS, constantsModule.PEOPLEPAGE.PEOPLE_CARDS.MAX_CARD_COLUMNS)
		var4(math.floor(p1 / clampedValue) - math.ceil(p2 * (clampedValue - 1) / clampedValue))
	end, {})
end