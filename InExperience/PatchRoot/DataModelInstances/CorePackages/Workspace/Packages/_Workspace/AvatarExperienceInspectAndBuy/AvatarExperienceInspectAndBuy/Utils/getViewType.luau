local ViewTypeModule = require(script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Enums.ViewType)
local MobileBreakpointInspectAndBuy = game:DefineFastInt("MobileBreakpointInspectAndBuy", 850)

return function(Vector) --[[ Line: 13 | Named "getViewType" ]]
	-- upvalues: ViewTypeModule (copy), MobileBreakpointInspectAndBuy (copy)
	local Wide = ViewTypeModule.Wide
	
	if Vector.Y < Vector.X and Vector.X < MobileBreakpointInspectAndBuy then
		Wide = ViewTypeModule.WideLandscape
		
		return Wide
	end
	if Vector.X < MobileBreakpointInspectAndBuy then
		Wide = ViewTypeModule.Compact
	end
	return Wide
end