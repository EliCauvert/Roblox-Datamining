local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.Parent.Config.FlyoutContentSettings)
local PrimaryNavigationItemModule = require(script.Parent.PrimaryNavigationItem)
local UseFlyoutItemNavigationModule = require(script.Parent.Parent.Hooks.useFlyoutItemNavigation)

return function(p1) --[[ Line: 19 | Named "FlyoutNavigationItem" ]]
	-- upvalues: UseFlyoutItemNavigationModule (copy), UseLocalizationFunction (copy), ReactModule (copy), PrimaryNavigationItemModule (copy)
	return ReactModule.createElement(PrimaryNavigationItemModule, {
		layoutOrder = p1.layoutOrder,
		onActivated = UseFlyoutItemNavigationModule(p1.item, p1.closeDrawer, p1.buildCreatorWebNavUrl),
		icon = p1.item.icon,
		text = UseLocalizationFunction({ text = p1.item.textKey }).text,
		notificationCount = p1.item.notificationCount,
		testId = p1.item.itemType
	})
end