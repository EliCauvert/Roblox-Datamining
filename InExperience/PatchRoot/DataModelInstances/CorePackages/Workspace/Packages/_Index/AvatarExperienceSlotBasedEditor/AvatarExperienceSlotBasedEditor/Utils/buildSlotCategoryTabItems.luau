local _ = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.AvatarExperienceUIKit)
local _ = require(script.Parent.Parent.Types)
local _ = require(script.Parent.Parent.Enums.Categories)

return function(p0, p1)
	local t = {}
	
	for i, v in p0 do
		if not v.hide then
			table.insert(t, {
				id = i,
				text = p1[v.nameTranslationKey] or v.nameTranslationKey
			})
		end
	end
	table.sort(t, function(p2, p3)
		-- upvalues: p0 (ref)
		return p0[p2.id].index < p0[p3.id].index
	end)
	
	return t
end