local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local HorizontalLayoutModule = require(AvatarWorkshop.Components.HorizontalLayout)
local VerticalLayoutModule = require(AvatarWorkshop.Components.VerticalLayout)
local TopBarModule = require(AvatarWorkshop.Components.TopBar)
local AppContainer = require(Parent.RoactNavigation).createAppContainer((require(AvatarWorkshop.Navigation.Navigators.InventoryNavigator)))

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), TopBarModule (copy), AppContainer (copy), VerticalLayoutModule (copy), FoundationModule (copy), HorizontalLayoutModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Element = ReactModule.createElement(TopBarModule, { onClose = p1.onClose })
	local Element1 = ReactModule.createElement(AppContainer)
	
	return ReactModule.createElement("Frame", {
		Active = true,
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = UseTokensResult.Color.Surface.Surface_100.Color3,
		BackgroundTransparency = UseTokensResult.Color.Surface.Surface_100.Transparency
	}, {
		Corner = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
		}),
		Layout = if p1.verticalLayout then ReactModule.createElement(VerticalLayoutModule, {
			headerSlot = Element,
			bottomItemSlot = ReactModule.createElement(FoundationModule.View, { tag = "size-full-full padding-top-xlarge" }, { Inventory = Element1 })
		}) else ReactModule.createElement(HorizontalLayoutModule, {
			headerSlot = Element,
			leftItemSlot = ReactModule.createElement(FoundationModule.View, { tag = "size-full-full" }, { Inventory = Element1 })
		})
	})
end