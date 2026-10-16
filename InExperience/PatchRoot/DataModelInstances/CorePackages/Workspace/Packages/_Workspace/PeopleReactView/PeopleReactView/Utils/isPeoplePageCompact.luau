local ConstantsModule = require(script:FindFirstAncestor("PeopleReactView").Constants)

return function(Value: number): boolean --[[ Line: 7 ]]
	-- upvalues: ConstantsModule (copy)
	return Value > 0 and math.round(Value) < ConstantsModule.PEOPLEPAGE.STACKED_ROW_MAX_WINDOW_WIDTH
end