local Parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local SectionTitleModule = require(script.Parent.SectionTitle)
local SectionTitleWithActionModule = require(script.Parent.SectionTitleWithAction)

return function(p1) --[[ Line: 16 | Named "SectionHeader" ]]
	-- upvalues: ReactModule (copy), SectionTitleWithActionModule (copy), SectionTitleModule (copy)
	return if p1.onBack then ReactModule.createElement(SectionTitleWithActionModule, {
		variant = "back",
		title = p1.title,
		leadingIconName = p1.leadingIconName,
		onActivated = p1.onBack
	}) else ReactModule.createElement(SectionTitleModule, { title = p1.title, leadingIconName = p1.leadingIconName })
end