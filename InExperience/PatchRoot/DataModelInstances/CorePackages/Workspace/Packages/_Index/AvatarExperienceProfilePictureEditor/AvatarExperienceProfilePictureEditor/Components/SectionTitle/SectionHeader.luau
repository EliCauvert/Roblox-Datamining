local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local sectionTitleModule = require(script.Parent.SectionTitle)
local sectionTitleWithActionModule = require(script.Parent.SectionTitleWithAction)

return function(p0) --[[ line: 16 | named "SectionHeader" ]]
	-- upvalues: reactModule (ref), sectionTitleWithActionModule (ref), sectionTitleModule (ref)
	return if p0.onBack then reactModule.createElement(sectionTitleWithActionModule, {
		variant = "back",
		title = p0.title,
		leadingIconName = p0.leadingIconName,
		onActivated = p0.onBack
	}) else reactModule.createElement(sectionTitleModule, { title = p0.title, leadingIconName = p0.leadingIconName })
end