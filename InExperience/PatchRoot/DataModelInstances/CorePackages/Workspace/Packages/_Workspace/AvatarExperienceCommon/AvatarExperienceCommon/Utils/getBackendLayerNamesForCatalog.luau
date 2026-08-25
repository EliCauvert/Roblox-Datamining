local fStringAXBackendDrivenCatalogLayersNames = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceFlags).FStringAXBackendDrivenCatalogLayersNames

return function()
	-- upvalues: fStringAXBackendDrivenCatalogLayersNames (ref)
	local var0 = fStringAXBackendDrivenCatalogLayersNames()
	
	if not var0 or var0 == "" then
		return nil
	end
	local t = {}
	
	for i, v in string.split(var0, ",") do
		local replaced = string.gsub(v, "^%s*(.-)%s*$", "%1")
		
		if replaced ~= "" and string.len(replaced) <= 200 then
			table.insert(t, replaced)
		end
	end
	return if #t > 0 then t else nil
end