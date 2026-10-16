local _ = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.AvatarExperienceUIKit)
local _ = require(script.Parent.Parent.Types)
local _ = require(script.Parent.Parent.Enums.Categories)

return function(List, p1) --[[ Line: 13 | Named "buildSlotCategoryTabItems" ]]
	local List1 = {}
	
	for Id, value in List do
		if not value.hide then
			table.insert(List1, {
				id = Id,
				text = p1[value.nameTranslationKey] or value.nameTranslationKey
			})
		end
	end
	table.sort(List1, function(A, B): boolean --[[ Line: 26 ]]
		-- upvalues: List (copy)
		return List[A.id].index < List[B.id].index
	end)
	
	return List1
end