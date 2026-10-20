local Parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant
local _ = require(script.Parent.SectionTitle)
local SectionTitleLabelModule = require(script.Parent.SectionTitleLabel)

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), SectionTitleLabelModule (copy), Icon (copy), IconName (copy), IconSize (copy), IconVariant (copy)
	local IsBack = p1.variant == "back"
	
	return ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = p1.layoutOrder }, {
		TitleRow = ReactModule.createElement(View, {
			tag = "row align-y-center gap-xsmall auto-xy padding-y-xsmall",
			onActivated = p1.onActivated
		}, {
			Label = ReactModule.createElement(SectionTitleLabelModule, {
				title = p1.title,
				leadingIconName = p1.leadingIconName,
				layoutOrder = if IsBack then 2 else 1
			}),
			Chevron = ReactModule.createElement(Icon, {
				name = if IsBack then IconName.ChevronLargeLeft else IconName.ChevronLargeRight,
				size = IconSize.Medium,
				variant = IconVariant.Filled,
				LayoutOrder = if IsBack then 1 else 2
			})
		})
	})
end