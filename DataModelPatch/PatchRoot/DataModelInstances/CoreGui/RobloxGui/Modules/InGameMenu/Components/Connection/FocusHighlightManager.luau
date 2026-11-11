local GuiService = game:GetService("GuiService")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent.Parent
local InputType = require(Parent.Resources.Constants).InputType
local GetFFlagIGMGamepadSelectionHistoryModule = require(Parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local FocusHandlerModule = require(script.Parent.FocusHandler)
local FocusHighlightManager = Roact.PureComponent:extend("FocusHighlightManager")
FocusHighlightManager.validateProps = T.strictInterface({ menuOpen = T.boolean, inputType = T.string })

function FocusHighlightManager.render(p1)
	-- upvalues: GetFFlagIGMGamepadSelectionHistoryModule (copy), Roact (copy), FocusHandlerModule (copy), InputType (copy), GuiService (copy)
	return if GetFFlagIGMGamepadSelectionHistoryModule() then Roact.createElement(FocusHandlerModule, {
		isFocused = not p1.props.menuOpen or p1.props.inputType ~= InputType.Gamepad,
		didFocus = function()
			-- upvalues: GuiService (upval)
			GuiService.SelectedCoreObject = nil
		end
	}) else Roact.createElement(FocusHandlerModule, {
		isFocused = p1.props.menuOpen and p1.props.inputType == InputType.Gamepad,
		didBlur = function()
			-- upvalues: GuiService (upval)
			GuiService.SelectedCoreObject = nil
		end
	})
end

return RoactRodux.UNSTABLE_connect2(function(p1)
	return {
		menuOpen = p1.isMenuOpen,
		inputType = p1.displayOptions.inputType
	}
end)(FocusHighlightManager)