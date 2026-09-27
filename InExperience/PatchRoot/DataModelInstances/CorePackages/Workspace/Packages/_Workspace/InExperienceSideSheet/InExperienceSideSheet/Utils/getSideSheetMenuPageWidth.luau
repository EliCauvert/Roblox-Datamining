local constantsModule = require(script:FindFirstAncestor("InExperienceSideSheet").Common.Constants)

return function(p1, p2, p3)
	-- upvalues: constantsModule (ref)
	return p1 - p2 - constantsModule.MenuScreenMargin * 2 - p3
end