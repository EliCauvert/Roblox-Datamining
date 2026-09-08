local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local _ = require(avatarExperienceCatalog.Parent.AvatarExperienceRodux)
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)

return function(p1, p2)
	local t = {}
	
	for i, v in p1 do
		local type = v.type
		local var1 = tostring(v.id)
		
		if not t[type] then
			t[type] = {}
		end
		local cloned = table.clone(v)
		cloned.id = var1
		t[type][var1] = cloned
	end
	for i, v_1 in p2 do
		local type = v_1.type
		local var2 = tostring(v_1.id)
		
		if not t[type] then
			t[type] = {}
		end
		if not t[type][var2] then
			t[type][var2] = { failedToHydrate = true, id = var2, type = type }
		end
	end
	return t
end