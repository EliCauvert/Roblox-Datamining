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

return function(p0) --[[ line: 25 | named "SectionTitleWithAction" ]]
	-- upvalues: reactModule (ref), view (ref), sectionTitleLabelModule (ref), icon (ref), iconName (ref), iconSize (ref), iconVariant (ref)
	local isBack = p0.variant == "back"
	
	return reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = p0.layoutOrder }, {
		TitleRow = reactModule.createElement(view, {
			tag = "row align-y-center gap-xsmall auto-xy padding-y-xsmall",
			onActivated = p0.onActivated
		}, {
			Label = reactModule.createElement(sectionTitleLabelModule, {
				title = p0.title,
				leadingIconName = p0.leadingIconName,
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