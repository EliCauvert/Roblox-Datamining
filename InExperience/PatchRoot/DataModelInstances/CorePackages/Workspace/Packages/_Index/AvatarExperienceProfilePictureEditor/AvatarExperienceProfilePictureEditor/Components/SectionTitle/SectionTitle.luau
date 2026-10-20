local Parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local SectionTitleLabelModule = require(script.Parent.SectionTitleLabel)

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), SectionTitleLabelModule (copy)
	return ReactModule.createElement(View, { tag = "auto-xy", LayoutOrder = p1.layoutOrder }, {
		TitleRow = ReactModule.createElement(View, { tag = "auto-xy padding-y-xsmall" }, {
			Label = ReactModule.createElement(SectionTitleLabelModule, { title = p1.title, leadingIconName = p1.leadingIconName })
		})
	})
end