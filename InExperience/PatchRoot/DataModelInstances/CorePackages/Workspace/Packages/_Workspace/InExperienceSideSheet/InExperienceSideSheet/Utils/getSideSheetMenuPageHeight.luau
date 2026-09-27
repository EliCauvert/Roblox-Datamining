local constantsModule = require(script:FindFirstAncestor("InExperienceSideSheet").Common.Constants)

return function(p1, p2)
	-- upvalues: constantsModule (ref)
	return p1 - constantsModule.MenuScreenMargin * 2 - p2
end