local FStringAXBackendDrivenCatalogLayersNamesFunction = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.AvatarExperienceFlags).FStringAXBackendDrivenCatalogLayersNames

return function()
	-- upvalues: FStringAXBackendDrivenCatalogLayersNamesFunction (copy)
	local FStringAXBackendDrivenCatalogLayersNamesResult: string = FStringAXBackendDrivenCatalogLayersNamesFunction()
	
	if not FStringAXBackendDrivenCatalogLayersNamesResult or FStringAXBackendDrivenCatalogLayersNamesResult == "" then
		return nil
	end
	local List = {}
	
	for _, value in string.split(FStringAXBackendDrivenCatalogLayersNamesResult, ",") do
		local Replaced = string.gsub(value, "^%s*(.-)%s*$", "%1")
		
		if Replaced ~= "" and string.len(Replaced) <= 200 then
			table.insert(List, Replaced)
		end
	end
	return #List > 0 and List or nil
end