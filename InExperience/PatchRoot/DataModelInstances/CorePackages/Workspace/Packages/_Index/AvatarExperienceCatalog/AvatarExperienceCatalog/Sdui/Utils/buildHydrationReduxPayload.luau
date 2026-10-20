local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local _ = require(AvatarExperienceCatalog.Parent.AvatarExperienceRodux)
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)

return function(List, List1)
	local t = {}
	
	for _, value in List do
		local Type = value.type
		local Text = tostring(value.id)
		
		if not t[Type] then
			t[Type] = {}
		end
		local Copy = table.clone(value)
		Copy.id = Text
		t[Type][Text] = Copy
	end
	for _, value1 in List1 do
		local Type = value1.type
		local Text = tostring(value1.id)
		
		if not t[Type] then
			t[Type] = {}
		end
		if not t[Type][Text] then
			t[Type][Text] = { failedToHydrate = true, id = Text, type = Type }
		end
	end
	return t
end