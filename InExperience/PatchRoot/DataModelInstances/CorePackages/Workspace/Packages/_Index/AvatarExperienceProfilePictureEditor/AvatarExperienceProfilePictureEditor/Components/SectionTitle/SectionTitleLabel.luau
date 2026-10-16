local Parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize

return function(p1) --[[ Line: 19 | Named "SectionTitleLabel" ]]
	-- upvalues: ReactModule (copy), Text (copy), Icon (copy), IconSize (copy), View (copy)
	local config = {
		Title = ReactModule.createElement(Text, {
			tag = "auto-xy text-heading-small content-emphasis",
			Text = p1.title,
			LayoutOrder = if p1.leadingIconName then 2 else 1
		})
	}
	
	if p1.leadingIconName then
		config.LeadingIcon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = p1.leadingIconName,
			size = IconSize.Medium
		})
	end
	return ReactModule.createElement(View, {
		tag = if p1.leadingIconName then "row align-y-center gap-xsmall auto-xy" else "auto-xy",
		LayoutOrder = p1.layoutOrder
	}, config)
end