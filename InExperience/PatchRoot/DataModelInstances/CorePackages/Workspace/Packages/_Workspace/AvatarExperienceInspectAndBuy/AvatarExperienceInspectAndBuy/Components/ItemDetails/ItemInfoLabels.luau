local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local TwoPanelLabelWithDividerModule = require(AvatarExperienceInspectAndBuy.Components.Common.TwoPanelLabelWithDivider)

return function(Frame)
	-- upvalues: ReactModule (copy), TwoPanelLabelWithDividerModule (copy), FoundationModule (copy)
	local Elements = {}
	
	for LayoutOrder, itemInfoLabel in Frame.itemInfoLabels do
		if itemInfoLabel.isVisible then
			Elements[itemInfoLabel.key] = ReactModule.createElement(TwoPanelLabelWithDividerModule, {
				showDivider = true,
				LayoutOrder = LayoutOrder,
				labelProps = itemInfoLabel.labelProps
			})
		end
	end
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-y size-full-0 padding-top-medium col align-x-left align-y-top gap-small",
		LayoutOrder = Frame.LayoutOrder or 4
	}, Elements)
end