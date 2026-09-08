local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant
local _ = require(script.Parent.SectionTitle)
local sectionTitleLabelModule = require(script.Parent.SectionTitleLabel)

return function(p1)
	-- upvalues: reactModule (ref), view (ref), sectionTitleLabelModule (ref), icon (ref), iconName (ref), iconSize (ref), iconVariant (ref)
	local isBack = p1.variant == "back"
	
	return reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = p1.layoutOrder }, {
		TitleRow = reactModule.createElement(view, {
			tag = "row align-y-center gap-xsmall auto-xy padding-y-xsmall",
			onActivated = p1.onActivated
		}, {
			Label = reactModule.createElement(sectionTitleLabelModule, {
				title = p1.title,
				leadingIconName = p1.leadingIconName,
				layoutOrder = if isBack then 2 else 1
			}),
			Chevron = reactModule.createElement(icon, {
				name = if isBack then iconName.ChevronLargeLeft else iconName.ChevronLargeRight,
				size = iconSize.Medium,
				variant = iconVariant.Filled,
				LayoutOrder = if isBack then 1 else 2
			})
		})
	})
end