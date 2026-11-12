local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local FoundationModule = require(Parent.Foundation)
local RoactNavigationModule = require(Parent.RoactNavigation)
local ReactModule = require(Parent.React)
local _ = require(AvatarWorkshop.Navigation.NavigationTypes)
local WorkshopWindowContextModule = require(AvatarWorkshop.Contexts.WorkshopWindowContext)
local HorizontalLayoutModule = require(AvatarWorkshop.Components.HorizontalLayout)
local VerticalLayoutModule = require(AvatarWorkshop.Components.VerticalLayout)
local TopBarModule = require(AvatarWorkshop.Components.TopBar)
local AvatarPreviewModule = require(AvatarWorkshop.Components.AvatarPreview.AvatarPreview)
local ScreenTitlesModule = require(AvatarWorkshop.Constants.ScreenTitles)
local GetActiveRouteModule = require(AvatarWorkshop.Navigation.getActiveRoute)

return function(p1)
	-- upvalues: ReactModule (copy), WorkshopWindowContextModule (copy), GetActiveRouteModule (copy), TopBarModule (copy), ScreenTitlesModule (copy), RoactNavigationModule (copy), VerticalLayoutModule (copy), AvatarPreviewModule (copy), FoundationModule (copy), HorizontalLayoutModule (copy)
	local UseContextResult = ReactModule.useContext(WorkshopWindowContextModule)
	local Navigation = p1.navigation
	local ActiveRouteModule = GetActiveRouteModule(Navigation)
	local RouteName = ActiveRouteModule.routeName
	local RouteName1 = Navigation.state.routes[1].routeName
	local Element = ReactModule.createElement(TopBarModule, {
		titleKey = ScreenTitlesModule[RouteName],
		onClose = UseContextResult.onClose,
		onBack = if RouteName == RouteName1 then nil else function()
			-- upvalues: Navigation (copy), RouteName1 (copy)
			Navigation.navigate(RouteName1)
		end
	})
	local Element1 = ReactModule.createElement(RoactNavigationModule.RobloxSwitchView, p1)
	local Descriptor = p1.descriptors[ActiveRouteModule.key]
	local Options = if Descriptor then Descriptor.options else nil
	local ActionBar = if Options then Options.actionBar else nil
	local Element2 = if ActionBar then ReactModule.createElement(ActionBar) else nil
	
	return if UseContextResult.verticalLayout then ReactModule.createElement(VerticalLayoutModule, {
		headerSlot = Element,
		topItemSlot = ReactModule.createElement(AvatarPreviewModule),
		bottomItemSlot = ReactModule.createElement(FoundationModule.View, { tag = "size-full-full padding-top-xlarge" }, { Content = Element1 }),
		footerSlot = if Element2 then ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y padding-top-medium padding-x-xlarge padding-bottom-large"
		}, { ActionBar = Element2 }) else nil
	}) else ReactModule.createElement(HorizontalLayoutModule, {
		headerSlot = Element,
		leftItemSlot = ReactModule.createElement(FoundationModule.View, { tag = "size-full-full" }, { Content = Element1 }),
		rightItemSlot = ReactModule.createElement(FoundationModule.View, { tag = "col size-full-full" }, {
			Preview = ReactModule.createElement(FoundationModule.View, { tag = "fill size-full-0", LayoutOrder = 1 }, {
				AvatarPreview = ReactModule.createElement(AvatarPreviewModule)
			}),
			ActionBar = if Element2 then ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y padding-medium",
				LayoutOrder = 2
			}, { ActionBar = Element2 }) else nil
		})
	})
end