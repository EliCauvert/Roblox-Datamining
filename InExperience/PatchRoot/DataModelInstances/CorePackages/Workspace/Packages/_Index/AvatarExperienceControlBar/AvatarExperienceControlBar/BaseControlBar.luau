local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local userInputService = game:GetService("UserInputService")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local iconOnlyMenuModule = require(avatarExperienceControlBar.Components.IconOnlyMenu)
local iconTextMenuModule = require(avatarExperienceControlBar.Components.IconTextMenu)
local externalEventConnection = require(parent.RoactUtils).ExternalEventConnection
local _ = require(avatarExperienceControlBar.ControlBarTypes)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), iconOnlyMenuModule (ref), iconTextMenuModule (ref), externalEventConnection (ref), userInputService (ref)
	local var1, var2 = reactModule.useBinding(UDim2.new(0, 0, 0, 0))
	
	return reactModule.createElement(foundationModule.View, {
		tag = "no-clip",
		Size = var1,
		ref = p1.containerRef,
		LayoutOrder = p1.LayoutOrder
	}, {
		MainMenu = reactModule.createElement(iconOnlyMenuModule, {
			items = p1.menus,
			activeItemId = p1.activeMenuItemId,
			onItemActivated = p1.onMenuItemActivated,
			ref = p1.iconMenuRef,
			onAbsoluteSizeChanged = function(value)
				-- upvalues: var2 (ref)
				var2(UDim2.fromOffset(value.AbsoluteSize.X, value.AbsoluteSize.Y))
			end
		}),
		Submenu = if p1.submenuItems then reactModule.createElement(iconTextMenuModule, {
			key = p1.activeMenuItemId,
			items = p1.submenuItems,
			onItemActivated = p1.onSubmenuItemActivated,
			Position = p1.submenuPosition
		}) else nil,
		OnInputEnded = reactModule.createElement(externalEventConnection, {
			event = userInputService.InputEnded,
			callback = p1.onInputEnded
		})
	})
end)