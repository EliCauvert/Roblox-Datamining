local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local reactModule = require(peopleReactView.Parent.React)
local constantsModule = require(peopleReactView.Constants)

return function()
	-- upvalues: reactModule (ref), constantsModule (ref)
	local var1, var2 = reactModule.useBinding(0)
	
	return var1, reactModule.useCallback(function(p1, p2, p3)
		-- upvalues: constantsModule (copy), var2 (ref)
		local clampedValue = math.clamp(math.floor(p2 / p1), constantsModule.PEOPLEPAGE.PEOPLE_CARDS.MIN_CARD_COLUMNS, constantsModule.PEOPLEPAGE.PEOPLE_CARDS.MAX_CARD_COLUMNS)
		var2(math.floor(p2 / clampedValue) - math.ceil(p3 * (clampedValue - 1) / clampedValue))
	end, {})
end