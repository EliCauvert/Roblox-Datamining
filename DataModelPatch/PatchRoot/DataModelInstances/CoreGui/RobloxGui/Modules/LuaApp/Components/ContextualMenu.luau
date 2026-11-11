local Modules = game:GetService("CoreGui").RobloxGui.Modules
local LuaApp = Modules.LuaApp
local RoactModule = require(Modules.Common.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local ContextualListMenuModule = require(LuaApp.Components.ContextualListMenu)
local FormFactor = require(game:GetService("CorePackages").Workspace.Packages.FormFactor).Enums.FormFactor
local ListPickerModule = require(Modules.LuaApp.Components.ListPicker)
local ContextualMenu = RoactModule.PureComponent:extend("ContextualMenu")
local DEFAULTWIDECONTEXTUALMENUWIDTH = require(LuaApp.Constants).DEFAULT_WIDE_CONTEXTUAL_MENU__WIDTH

function ContextualMenu.render(p1)
	-- upvalues: FormFactor (copy), DEFAULTWIDECONTEXTUALMENUWIDTH (copy), RoactModule (copy), ListPickerModule (copy), ContextualListMenuModule (copy)
	local CallbackCancel = p1.props.callbackCancel
	local CallbackSelectFunction = p1.props.callbackSelect
	local MenuItems = p1.props.menuItems or {}
	local ScreenShape = p1.props.screenShape
	local FormFactor1 = p1.props.formFactor
	local IsFormFactorMatch = FormFactor1 == FormFactor.WIDE
	for i, menuItem in ipairs(MenuItems) do
		MenuItems[i].onSelect = function()
			-- upvalues: CallbackSelectFunction (copy), menuItem (copy), i (copy)
			CallbackSelectFunction(menuItem, i)
		end
		
		MenuItems[i].text = menuItem.displayName
	end
	return RoactModule.createElement(ContextualListMenuModule, {
		callbackCancel = CallbackCancel,
		screenShape = ScreenShape
	}, {
		ListPicker = RoactModule.createElement(ListPickerModule, {
			layoutOrder = 2,
			items = MenuItems,
			formFactor = FormFactor1,
			width = IsFormFactorMatch and DEFAULTWIDECONTEXTUALMENUWIDTH or ScreenShape.parentWidth
		})
	})
end

return (RoactRoduxModule.connect(function(p2, _)
	return { formFactor = p2.FormFactor }
end)(ContextualMenu))