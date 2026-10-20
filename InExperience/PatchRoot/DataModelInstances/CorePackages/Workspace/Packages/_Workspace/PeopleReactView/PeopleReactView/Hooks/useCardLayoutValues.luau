local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local CalculateCardLayoutModule = require(PeopleReactView.Utils.calculateCardLayout)

return function()
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), CalculateCardLayoutModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(0)
	
	return UseBindingResult, UseBindingResult1, UseBindingResult3, (ReactModule.useCallback(function(p1, p2, p3)
		-- upvalues: CalculateCardLayoutModule (upval), UseBindingResult2_2 (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy), UseTokensResult (copy)
		local CardLayoutModule, CardLayoutModule2 = CalculateCardLayoutModule(p1, p2, p3)
		UseBindingResult2_2(CardLayoutModule2)
		UseBindingResult2(CardLayoutModule)
		UseBindingResult2_1(CardLayoutModule + UseTokensResult.Size.Size_1400)
		
		return CardLayoutModule
	end, { UseTokensResult.Size.Size_1400 }))
end