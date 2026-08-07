local avatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local userInputService = game:GetService("UserInputService")
local parent = avatarExperienceControlBar.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local iconOnlyMenuModule = require(avatarExperienceControlBar.Components.IconOnlyMenu)
local iconTextMenuModule = require(avatarExperienceControlBar.Components.IconTextMenu)
local externalEventConnection = require(parent.RoactUtils).ExternalEventConnection
local _ = require(avatarExperienceControlBar.ControlBarTypes)

return reactModule.memo(function(p0) --[[ line: 14 | named "BaseControlBar" ]]
	-- upvalues: reactModule (ref), foundationModule (ref), iconOnlyMenuModule (ref), iconTextMenuModule (ref), externalEventConnection (ref), userInputService (ref)
	local var6, var7 = reactModule.useBinding(UDim2.new(0, 0, 0, 0))
	
	return reactModule.createElement(foundationModule.View, {
		tag = "no-clip",
		Size = var6,
		ref = p0.containerRef,
		LayoutOrder = p0.LayoutOrder
	}, {
		MainMenu = reactModule.createElement(iconOnlyMenuModule, {
			items = p0.menus,
			activeItemId = p0.activeMenuItemId,
			onItemActivated = p0.onMenuItemActivated,
			ref = p0.iconMenuRef,
			onAbsoluteSizeChanged = function(value) --[[ line: 27 ]]
				-- upvalues: var7 (ref)
				var7(UDim2.fromOffset(value.AbsoluteSize.X, value.AbsoluteSize.Y))
			end
		}),
		Submenu = if p0.submenuItems then reactModule.createElement(iconTextMenuModule, {
			key = p0.activeMenuItemId,
			items = p0.submenuItems,
			onItemActivated = p0.onSubmenuItemActivated,
			Position = p0.submenuPosition
		}) else nil,
		OnInputEnded = reactModule.createElement(externalEventConnection, {
			event = userInputService.InputEnded,
			callback = p0.onInputEnded
		})
	})
end)