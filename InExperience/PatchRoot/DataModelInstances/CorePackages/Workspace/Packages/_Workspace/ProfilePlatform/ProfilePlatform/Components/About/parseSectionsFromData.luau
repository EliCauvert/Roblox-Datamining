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

return function(p0, p1, p2)
	-- upvalues: enumsModule (ref), list_1 (ref), list (ref), t (ref), reactModule (ref)
	local t_1 = {}
	
	for i, v in ipairs(if p1 == enumsModule.ProfileTypes.Contact then list_1 else list) do
		local var8 = t[v]
		local var9 = p0[v]
		
		if var8 then
			table.insert(t_1, reactModule.createElement(var8, { layoutOrder = i, [v] = var9, name = p2 }))
		end
	end
	return t_1
end