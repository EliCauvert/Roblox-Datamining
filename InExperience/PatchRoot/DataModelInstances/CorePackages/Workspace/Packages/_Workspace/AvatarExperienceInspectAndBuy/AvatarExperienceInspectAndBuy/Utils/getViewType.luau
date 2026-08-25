local viewTypeModule = require(script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Enums.ViewType)
local mobileBreakpointInspectAndBuy = game:DefineFastInt("MobileBreakpointInspectAndBuy", 850)

return function(p0)
	-- upvalues: viewTypeModule (ref), mobileBreakpointInspectAndBuy (ref)
	local wide = viewTypeModule.Wide
	
	if p0.Y < p0.X and p0.X < mobileBreakpointInspectAndBuy then
		wide = viewTypeModule.WideLandscape
		
		return wide
	elseif p0.X < mobileBreakpointInspectAndBuy then
		wide = viewTypeModule.Compact
	end
	return wide
end