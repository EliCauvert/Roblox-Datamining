local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local AXTooltip = require(parent.AvatarExperienceUIKit).AXTooltipComponents.AXTooltip
local useAXTooltipViewModelModule = require(script.Parent.useAXTooltipViewModel)

return function(p0)
	-- upvalues: useAXTooltipViewModelModule (ref), reactModule (ref), AXTooltip (ref)
	return reactModule.createElement(AXTooltip, useAXTooltipViewModelModule(p0))
end