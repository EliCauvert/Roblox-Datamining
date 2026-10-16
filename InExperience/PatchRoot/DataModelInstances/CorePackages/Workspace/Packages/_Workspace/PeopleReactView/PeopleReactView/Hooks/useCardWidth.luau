local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local ReactModule = require(PeopleReactView.Parent.React)
local CalculateCardLayoutModule = require(PeopleReactView.Utils.calculateCardLayout)

return function() --[[ Line: 8 | Named "useCardWidth" ]]
	-- upvalues: ReactModule (copy), CalculateCardLayoutModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	
	return UseBindingResult, (ReactModule.useCallback(function(p1, p2, p3) --[[ Line: 12 ]]
		-- upvalues: CalculateCardLayoutModule (upval), UseBindingResult2 (copy)
		local CardLayoutModule = CalculateCardLayoutModule(p1, p2, p3)
		UseBindingResult2(CardLayoutModule)
		
		return CardLayoutModule
	end, {}))
end