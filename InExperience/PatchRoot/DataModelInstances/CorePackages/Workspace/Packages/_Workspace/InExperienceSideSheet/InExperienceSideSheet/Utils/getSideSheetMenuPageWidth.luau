local ConstantsModule = require(script:FindFirstAncestor("InExperienceSideSheet").Common.Constants)

return function(p1, p2, p3) --[[ Line: 9 ]]
	-- upvalues: ConstantsModule (copy)
	return p1 - p2 - ConstantsModule.MenuScreenMargin * 2 - p3
end