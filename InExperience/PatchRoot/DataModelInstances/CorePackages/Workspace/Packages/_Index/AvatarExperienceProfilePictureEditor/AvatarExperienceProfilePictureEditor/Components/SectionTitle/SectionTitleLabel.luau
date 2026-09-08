local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize

return function(p1)
	-- upvalues: reactModule (ref), text (ref), icon (ref), iconSize (ref), view (ref)
	local t = {
		Title = reactModule.createElement(text, {
			tag = "auto-xy text-heading-small content-emphasis",
			Text = p1.title,
			LayoutOrder = if p1.leadingIconName then 2 else 1
		})
	}
	
	if p1.leadingIconName then
		t.LeadingIcon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = p1.leadingIconName,
			size = iconSize.Medium
		})
	end
	return reactModule.createElement(view, {
		tag = if p1.leadingIconName then "row align-y-center gap-xsmall auto-xy" else "auto-xy",
		LayoutOrder = p1.layoutOrder
	}, t)
end