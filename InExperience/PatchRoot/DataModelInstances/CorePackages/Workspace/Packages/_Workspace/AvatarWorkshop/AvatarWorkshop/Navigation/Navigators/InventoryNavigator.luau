local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local TabsNavigatorViewModule = require(AvatarWorkshop.Navigation.NavigatorViews.TabsNavigatorView)
local InventoryGridContainerModule = require(AvatarWorkshop.Components.Inventory.InventoryGrid.InventoryGridContainer)
local CreateInventoryPageRouteModule = require(script.Parent.createInventoryPageRoute)
local CreatePageGroupRouteModule = require(script.Parent.createPageGroupRoute)
local Inventory = require(AvatarWorkshop.Navigation.Screens).Inventory

return require(script.Parent.createPagesNavigator)(TabsNavigatorViewModule, {
	CreateInventoryPageRouteModule(Inventory.Avatars, InventoryGridContainerModule),
	CreatePageGroupRouteModule(Inventory.Body.Root, TabsNavigatorViewModule, {
		CreateInventoryPageRouteModule(Inventory.Body.FullBody, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Body.Head, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Body.Hair, InventoryGridContainerModule)
	}),
	CreatePageGroupRouteModule(Inventory.Clothing.Root, TabsNavigatorViewModule, {
		CreateInventoryPageRouteModule(Inventory.Clothing.Top, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Clothing.Outterwear, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Clothing.Bottom, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Clothing.Shoes, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Clothing.ClassicShirt, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Clothing.ClassicPants, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Clothing.ClassicTShirt, InventoryGridContainerModule)
	}),
	CreatePageGroupRouteModule(Inventory.Accessories.Root, TabsNavigatorViewModule, {
		CreateInventoryPageRouteModule(Inventory.Accessories.Hat, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Accessories.Face, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Accessories.Neck, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Accessories.Back, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Accessories.Waist, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Accessories.Shoulder, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Accessories.Front, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Accessories.Gear, InventoryGridContainerModule)
	}),
	CreatePageGroupRouteModule(Inventory.Animations.Root, TabsNavigatorViewModule, {
		CreateInventoryPageRouteModule(Inventory.Animations.FullSet, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Animations.Idle, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Animations.Walk, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Animations.Run, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Animations.Jump, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Animations.Fall, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Animations.Climb, InventoryGridContainerModule),
		CreateInventoryPageRouteModule(Inventory.Animations.Swim, InventoryGridContainerModule)
	}),
	CreateInventoryPageRouteModule(Inventory.Emotes, InventoryGridContainerModule)
})