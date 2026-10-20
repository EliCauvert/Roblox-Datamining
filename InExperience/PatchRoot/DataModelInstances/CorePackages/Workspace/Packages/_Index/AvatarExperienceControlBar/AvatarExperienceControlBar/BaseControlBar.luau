local AvatarExperienceControlBar = script:FindFirstAncestor("AvatarExperienceControlBar")
local UserInputService = game:GetService("UserInputService")
local Parent = AvatarExperienceControlBar.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local IconOnlyMenuModule = require(AvatarExperienceControlBar.Components.IconOnlyMenu)
local IconTextMenuModule = require(AvatarExperienceControlBar.Components.IconTextMenu)
local ExternalEventConnection = require(Parent.RoactUtils).ExternalEventConnection
local _ = require(AvatarExperienceControlBar.ControlBarTypes)

return ReactModule.memo(function(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy), IconOnlyMenuModule (copy), IconTextMenuModule (copy), ExternalEventConnection (copy), UserInputService (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.new(0, 0, 0, 0))
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "no-clip",
		Size = UseBindingResult,
		ref = Frame.containerRef,
		LayoutOrder = Frame.LayoutOrder
	}, {
		MainMenu = ReactModule.createElement(IconOnlyMenuModule, {
			items = Frame.menus,
			activeItemId = Frame.activeMenuItemId,
			onItemActivated = Frame.onMenuItemActivated,
			ref = Frame.iconMenuRef,
			onAbsoluteSizeChanged = function(Frame: Frame)
				-- upvalues: UseBindingResult2 (copy)
				UseBindingResult2(UDim2.fromOffset(Frame.AbsoluteSize.X, Frame.AbsoluteSize.Y))
			end
		}),
		Submenu = if Frame.submenuItems then ReactModule.createElement(IconTextMenuModule, {
			key = Frame.activeMenuItemId,
			items = Frame.submenuItems,
			onItemActivated = Frame.onSubmenuItemActivated,
			Position = Frame.submenuPosition
		}) else nil,
		OnInputEnded = ReactModule.createElement(ExternalEventConnection, {
			event = UserInputService.InputEnded,
			callback = Frame.onInputEnded
		})
	})
end)