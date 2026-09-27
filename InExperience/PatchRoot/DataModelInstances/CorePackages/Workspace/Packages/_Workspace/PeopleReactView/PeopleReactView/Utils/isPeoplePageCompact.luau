local constantsModule = require(script:FindFirstAncestor("PeopleReactView").Constants)

return function(p1)
	-- upvalues: constantsModule (ref)
	return p1 > 0 and math.round(p1) < constantsModule.PEOPLEPAGE.STACKED_ROW_MAX_WINDOW_WIDTH
end