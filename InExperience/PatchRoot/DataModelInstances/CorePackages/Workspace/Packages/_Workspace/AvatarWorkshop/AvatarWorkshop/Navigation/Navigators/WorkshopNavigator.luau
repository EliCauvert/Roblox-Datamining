local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local ScreensModule = require(AvatarWorkshop.Navigation.Screens)

return require(script.Parent.createPagesNavigator)(require(AvatarWorkshop.Navigation.NavigatorViews.WorkshopNavigatorView), {
	{
		[ScreensModule.Workshop.YourAvatars] = {
			screen = require(AvatarWorkshop.Components.Inventory.InventoryGrid.InventoryGridContainer),
			params = {
				pageData = require(AvatarWorkshop.Constants.InventoryPagesData)[ScreensModule.Inventory.Avatars]
			},
			navigationOptions = {
				actionBar = require(AvatarWorkshop.Components.ActionBars.YourAvatarsActionBar)
			}
		}
	},
	{
		[ScreensModule.Workshop.Customize] = {
			screen = require(script.Parent.InventoryNavigator),
			navigationOptions = {
				actionBar = require(AvatarWorkshop.Components.ActionBars.CustomizeActionBar)
			}
		}
	}
})