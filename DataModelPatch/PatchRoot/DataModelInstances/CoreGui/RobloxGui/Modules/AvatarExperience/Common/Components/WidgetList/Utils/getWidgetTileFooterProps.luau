local UtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Utils)
local _ = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceCatalog)

return function(p1, p2)
	-- upvalues: UtilsModule (copy)
	local CreatorNameFooterEnabled: boolean? = nil
	local PriceFooterEnabled: boolean? = nil
	local ItemFooters = p1.template and p1.template.itemFooters or {}
	for _, itemFooter in ItemFooters do
		if itemFooter.contentType == "AgentName" then
			CreatorNameFooterEnabled = true
		end
		if itemFooter.contentType == "Price" then
			PriceFooterEnabled = true
		end
	end
	return {
		creatorNameFooterEnabled = CreatorNameFooterEnabled,
		priceFooterEnabled = PriceFooterEnabled,
		creatorNameTileFooterEnabled = UtilsModule.getCreatorNameTileFooterEnabled(p2)
	}
end