local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ReactModule = require(ProfilePlatform.Parent.React)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local SectionsModule = require(script.Parent.Sections)
local config = {
	description = SectionsModule.AboutDescription,
	socialLinks = SectionsModule.SocialLinks,
	nameHistory = SectionsModule.NameHistory,
	joinDateTime = SectionsModule.JoinYear
}
local list = {
	"description",
	"socialLinks",
	"nameHistory",
	"joinDateTime"
}
local list1 = { "description" }

return function(p1, Contact, Name)
	-- upvalues: EnumsModule (copy), list1 (copy), list (copy), config (copy), ReactModule (copy)
	local Elements = {}
	
	for LayoutOrder, value in ipairs(if Contact == EnumsModule.ProfileTypes.Contact then list1 else list) do
		local Entry = config[value]
		local v1 = p1[value]
		
		if Entry then
			table.insert(Elements, ReactModule.createElement(Entry, { layoutOrder = LayoutOrder, [value] = v1, name = Name }))
		end
	end
	return Elements
end