local viewTypeModule = require(script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Enums.ViewType)
local mobileBreakpointInspectAndBuy = game:DefineFastInt("MobileBreakpointInspectAndBuy", 850)

return function(p1)
	-- upvalues: viewTypeModule (ref), mobileBreakpointInspectAndBuy (ref)
	local wide = viewTypeModule.Wide
	
	if p1.Y < p1.X and p1.X < mobileBreakpointInspectAndBuy then
		wide = viewTypeModule.WideLandscape
		
		return wide
	elseif p1.X < mobileBreakpointInspectAndBuy then
		wide = viewTypeModule.Compact
	end
	return wide
end