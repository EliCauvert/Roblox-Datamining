local ConstantsModule = require(script:FindFirstAncestor("InExperienceSideSheet").Common.Constants)

return function(p1, p2) --[[ Line: 9 ]]
	-- upvalues: ConstantsModule (copy)
	return p1 - ConstantsModule.MenuScreenMargin * 2 - p2
end