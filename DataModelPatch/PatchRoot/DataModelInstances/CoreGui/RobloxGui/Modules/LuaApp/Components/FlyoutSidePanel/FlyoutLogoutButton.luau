local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local UseSetDrawerVisibleFunction = require(CorePackages.Workspace.Packages.Drawer).Hooks.useSetDrawerVisible
local MoreLogOutModule = require(Modules.LuaApp.Components.More.MoreLogOut)
local FFlagCTAChangeLogOutToSignOutModule = require(Modules.LuaApp.Flags.FFlagCTAChangeLogOutToSignOut)

return function(p1)
	-- upvalues: UseSetDrawerVisibleFunction (copy), ReactModule (copy), MoreLogOutModule (copy), AppPageModule (copy), FFlagCTAChangeLogOutToSignOutModule (copy), ButtonVariant (copy), ButtonSize (copy)
	local UseSetDrawerVisibleResult = UseSetDrawerVisibleFunction()
	
	return ReactModule.createElement(MoreLogOutModule, {
		item = {
			badgeCount = 0,
			itemType = "LogOut",
			context = { page = AppPageModule.LogoutConfirmation },
			textKey = if FFlagCTAChangeLogOutToSignOutModule then "Feature.AccountLock.Action.Signout" else "Application.Logout.Action.Logout"
		},
		willActivate = ReactModule.useCallback(function()
			-- upvalues: UseSetDrawerVisibleResult (copy)
			UseSetDrawerVisibleResult(false)
		end, {}),
		layoutOrder = p1.layoutOrder,
		foundationButtonType = ButtonVariant.Standard,
		foundationButtonSize = ButtonSize.Large
	})
end