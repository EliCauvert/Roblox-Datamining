local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local ConstantsModule = require(PeopleReactView.Constants)

return function()
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ConstantsModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(0)
	
	return UseBindingResult, UseBindingResult1, UseBindingResult3, (ReactModule.useCallback(function(p1, p2, p3)
		-- upvalues: ConstantsModule (upval), UseBindingResult2_2 (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy), UseTokensResult (copy)
		local ClampedValue = math.clamp(math.floor(p2 / p1), ConstantsModule.PEOPLEPAGE.PEOPLE_CARDS.MIN_CARD_COLUMNS, ConstantsModule.PEOPLEPAGE.PEOPLE_CARDS.MAX_CARD_COLUMNS)
		local FlooredDelta = math.floor(p2 / ClampedValue) - math.ceil(p3 * (ClampedValue - 1) / ClampedValue)
		UseBindingResult2_2(ClampedValue)
		UseBindingResult2(FlooredDelta)
		UseBindingResult2_1(FlooredDelta + UseTokensResult.Size.Size_1400)
	end, { UseTokensResult.Size.Size_1400 }))
end