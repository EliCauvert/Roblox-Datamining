local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.Parent.Config.FlyoutContentSettings)
local primaryNavigationItemModule = require(script.Parent.PrimaryNavigationItem)
local useFlyoutItemNavigationModule = require(script.Parent.Parent.Hooks.useFlyoutItemNavigation)

return function(p1)
	-- upvalues: useFlyoutItemNavigationModule (ref), useLocalization (ref), reactModule (ref), primaryNavigationItemModule (ref)
	return reactModule.createElement(primaryNavigationItemModule, {
		layoutOrder = p1.layoutOrder,
		onActivated = useFlyoutItemNavigationModule(p1.item, p1.closeDrawer, p1.buildCreatorWebNavUrl),
		icon = p1.item.icon,
		text = useLocalization({ text = p1.item.textKey }).text,
		notificationCount = p1.item.notificationCount
	})
end