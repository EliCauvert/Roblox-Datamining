local _ = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.AvatarExperienceUIKit)
local _ = require(script.Parent.Parent.Types)
local _ = require(script.Parent.Parent.Enums.Categories)

return function(p1, p2)
	local t = {}
	
	for i, v in p1 do
		if not v.hide then
			table.insert(t, {
				id = i,
				text = p2[v.nameTranslationKey] or v.nameTranslationKey
			})
		end
	end
	table.sort(t, function(p3, p4)
		-- upvalues: p1 (ref)
		return p1[p3.id].index < p1[p4.id].index
	end)
	
	return t
end