local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local twoPanelLabelWithDividerModule = require(avatarExperienceInspectAndBuy.Components.Common.TwoPanelLabelWithDivider)

return function(a)
	-- upvalues: reactModule (ref), twoPanelLabelWithDividerModule (ref), foundationModule (ref)
	local t = {}
	
	for i, v in a.itemInfoLabels do
		if v.isVisible then
			t[v.key] = reactModule.createElement(twoPanelLabelWithDividerModule, {
				showDivider = true,
				LayoutOrder = i,
				labelProps = v.labelProps
			})
		end
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-y size-full-0 padding-top-medium col align-x-left align-y-top gap-small",
		LayoutOrder = a.LayoutOrder or 4
	}, t)
end