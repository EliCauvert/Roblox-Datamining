local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.Parent.Config.FlyoutContentSettings)
local primaryNavigationItemModule = require(script.Parent.PrimaryNavigationItem)
local useFlyoutItemNavigationModule = require(script.Parent.Parent.Hooks.useFlyoutItemNavigation)

return function(p0) --[[ line: 19 | named "FlyoutNavigationItem" ]]
	-- upvalues: useFlyoutItemNavigationModule (ref), useLocalization (ref), reactModule (ref), primaryNavigationItemModule (ref)
	return reactModule.createElement(primaryNavigationItemModule, {
		layoutOrder = p0.layoutOrder,
		onActivated = useFlyoutItemNavigationModule(p0.item, p0.closeDrawer, p0.buildCreatorWebNavUrl),
		icon = p0.item.icon,
		text = useLocalization({ text = p0.item.textKey }).text,
		notificationCount = p0.item.notificationCount
	})
end