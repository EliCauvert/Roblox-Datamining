local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local reactModule = require(profilePlatform.Parent.React)
local enumsModule = require(profilePlatform.Common.Enums)
local sectionsModule = require(script.Parent.Sections)
local _ = {
	Description = "description",
	SocialLinks = "socialLinks",
	NameHistory = "nameHistory",
	JoinDateTime = "joinDateTime"
}
local t = {
	description = sectionsModule.AboutDescription,
	socialLinks = sectionsModule.SocialLinks,
	nameHistory = sectionsModule.NameHistory,
	joinDateTime = sectionsModule.JoinYear
}
local list = {
	"description",
	"socialLinks",
	"nameHistory",
	"joinDateTime"
}
local list_1 = { "description" }

return function(p1, p2, p3)
	-- upvalues: enumsModule (ref), list_1 (ref), list (ref), t (ref), reactModule (ref)
	local t_1 = {}
	
	for i, v in ipairs(if p2 == enumsModule.ProfileTypes.Contact then list_1 else list) do
		local var1 = t[v]
		local var2 = p1[v]
		
		if var1 then
			table.insert(t_1, reactModule.createElement(var1, { layoutOrder = i, [v] = var2, name = p3 }))
		end
	end
	return t_1
end