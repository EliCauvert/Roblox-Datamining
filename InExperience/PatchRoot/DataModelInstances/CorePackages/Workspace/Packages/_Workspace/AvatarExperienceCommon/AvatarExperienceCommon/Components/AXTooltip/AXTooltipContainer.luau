local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local AXTooltip = require(Parent.AvatarExperienceUIKit).AXTooltipComponents.AXTooltip
local UseAXTooltipViewModelModule = require(script.Parent.useAXTooltipViewModel)

return function(p1) --[[ Line: 12 ]]
	-- upvalues: UseAXTooltipViewModelModule (copy), ReactModule (copy), AXTooltip (copy)
	return ReactModule.createElement(AXTooltip, (UseAXTooltipViewModelModule(p1)))
end