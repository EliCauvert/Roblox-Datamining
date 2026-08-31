local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local sectionTitleModule = require(script.Parent.SectionTitle)
local sectionTitleWithActionModule = require(script.Parent.SectionTitleWithAction)

return function(p1)
	-- upvalues: reactModule (ref), sectionTitleWithActionModule (ref), sectionTitleModule (ref)
	return if p1.onBack then reactModule.createElement(sectionTitleWithActionModule, {
		variant = "back",
		title = p1.title,
		leadingIconName = p1.leadingIconName,
		onActivated = p1.onBack
	}) else reactModule.createElement(sectionTitleModule, { title = p1.title, leadingIconName = p1.leadingIconName })
end