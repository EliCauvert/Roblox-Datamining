local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local sectionTitleLabelModule = require(script.Parent.SectionTitleLabel)

return function(p0) --[[ line: 21 | named "SectionTitle" ]]
	-- upvalues: reactModule (ref), view (ref), sectionTitleLabelModule (ref)
	return reactModule.createElement(view, { tag = "auto-xy", LayoutOrder = p0.layoutOrder }, {
		TitleRow = reactModule.createElement(view, { tag = "auto-xy padding-y-xsmall" }, {
			Label = reactModule.createElement(sectionTitleLabelModule, { title = p0.title, leadingIconName = p0.leadingIconName })
		})
	})
end