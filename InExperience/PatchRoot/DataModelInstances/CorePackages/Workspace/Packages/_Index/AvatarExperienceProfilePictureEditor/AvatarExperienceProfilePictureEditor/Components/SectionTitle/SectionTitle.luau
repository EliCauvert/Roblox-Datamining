local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local sectionTitleLabelModule = require(script.Parent.SectionTitleLabel)

return function(p1)
	-- upvalues: reactModule (ref), view (ref), sectionTitleLabelModule (ref)
	return reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = p1.layoutOrder }, {
		TitleRow = reactModule.createElement(view, { tag = "auto-xy padding-y-xsmall" }, {
			Label = reactModule.createElement(sectionTitleLabelModule, { title = p1.title, leadingIconName = p1.leadingIconName })
		})
	})
end