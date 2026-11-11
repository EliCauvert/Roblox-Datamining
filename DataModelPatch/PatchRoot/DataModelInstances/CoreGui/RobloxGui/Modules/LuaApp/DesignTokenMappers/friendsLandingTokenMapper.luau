local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local _ = require(CorePackages.Workspace.Packages.Style)
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode

return function(p1, p2)
	-- upvalues: UiMode (copy)
	local config = {
		AddFriendsPage = {},
		FriendsLandingPage = {},
		ShowMore = {}
	}
	
	if p1.uiMode == UiMode.TenFoot then
		config.AddFriendsPage.GridViewItemMetrics = { minimumItemsPerRow = 6, minimumItemWidth = 258 }
		config.AddFriendsPage.ItemMargin = p2.Size.Size_600
		config.AddFriendsPage.PagePaddingTop = p2.Size.Size_400
		config.ShowMore.ButtonWidth = 960
		config.ShowMore.ButtonHeight = p2.Size.Size_1200
		config.FriendsLandingPage.GridViewItemMetrics = { minimumItemsPerRow = 6, minimumItemWidth = 258 }
		config.FriendsLandingPage.GridHorizontalSpacing = p2.Size.Size_600
		config.FriendsLandingPage.GridVerticalSpacing = p2.Size.Size_600
	end
	return config
end