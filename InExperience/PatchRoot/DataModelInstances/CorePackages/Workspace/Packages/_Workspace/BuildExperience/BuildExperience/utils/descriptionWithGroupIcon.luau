local BuildExperience = script:FindFirstAncestor("BuildExperience")
local FoundationModule = require(BuildExperience.Parent.Foundation)
local EscapeRichTextModule = require(BuildExperience.utils.escapeRichText)
local IconRichText = FoundationModule.Utility.getIconRichText(FoundationModule.Enums.IconName.TwoPeople)

return function(p1, p2, p3)
	-- upvalues: EscapeRichTextModule (copy), IconRichText (copy)
	if p2 then
		local P0 = p1 or (if p3 == nil then nil else EscapeRichTextModule(p3))
		
		return if P0 == nil then IconRichText else `{IconRichText} {P0}`
	else
		return p1
	end
end