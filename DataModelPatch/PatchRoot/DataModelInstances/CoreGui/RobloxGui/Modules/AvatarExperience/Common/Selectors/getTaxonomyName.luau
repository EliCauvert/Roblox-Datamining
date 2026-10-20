local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)

return function(Entry)
	if Entry and #Entry > 0 then
		local TaxonomyName = Entry[1].taxonomyName
		
		if TaxonomyName and TaxonomyName ~= "" then
			return TaxonomyName
		end
	end
	return nil
end