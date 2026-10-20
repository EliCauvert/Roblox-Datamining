local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local ReactModule = require(PeopleReactView.Parent.React)
local ConstantsModule = require(PeopleReactView.Constants)

return function()
	-- upvalues: ReactModule (copy), ConstantsModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	
	return UseBindingResult, (ReactModule.useCallback(function(p1, p2, p3)
		-- upvalues: ConstantsModule (upval), UseBindingResult2 (copy)
		local ClampedValue = math.clamp(math.floor(p2 / p1), ConstantsModule.PEOPLEPAGE.PEOPLE_CARDS.MIN_CARD_COLUMNS, ConstantsModule.PEOPLEPAGE.PEOPLE_CARDS.MAX_CARD_COLUMNS)
		UseBindingResult2(math.floor(p2 / ClampedValue) - math.ceil(p3 * (ClampedValue - 1) / ClampedValue))
	end, {}))
end