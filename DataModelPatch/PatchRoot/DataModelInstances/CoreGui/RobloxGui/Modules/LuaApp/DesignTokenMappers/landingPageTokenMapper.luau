local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local _ = require(CorePackages.Workspace.Packages.Style)
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local FIntScaleBrazilContentRatingBadge = require(CorePackages.Workspace.Packages.SharedFlags).FIntScaleBrazilContentRatingBadge

return function(p1, p2)
	-- upvalues: FIntScaleBrazilContentRatingBadge (copy), UiMode (copy)
	local config = {
		buttonWidth = 360,
		buttonHeight = 48,
		contentPadding = 20,
		buttonTextSize = p2.FontSize.FontSize_500,
		brazilBadgeHeight = 1.3 * FIntScaleBrazilContentRatingBadge
	}
	
	if p1.uiMode == UiMode.TenFoot then
		config.buttonWidth = 846
		config.buttonHeight = p2.Size.Size_1200
		config.contentPadding = p2.Size.Size_800
	end
	return config
end