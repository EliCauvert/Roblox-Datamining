local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local inputType = require(parent.Resources.Constants).InputType
local getFFlagIGMGamepadSelectionHistoryModule = require(parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local focusHandlerModule = require(script.Parent.FocusHandler)
local focusHighlightManager = roact.PureComponent:extend("FocusHighlightManager")
focusHighlightManager.validateProps = t.strictInterface({ menuOpen = t.boolean, inputType = t.string })

function focusHighlightManager.render(p0) --[[ line: 22 ]]
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), roact (ref), focusHandlerModule (ref), inputType (ref), guiService (ref)
	return if getFFlagIGMGamepadSelectionHistoryModule() then roact.createElement(focusHandlerModule, {
		isFocused = not p0.props.menuOpen or p0.props.inputType ~= inputType.Gamepad,
		didFocus = function() --[[ line: 26 ]]
			-- upvalues: guiService (copy)
			guiService.SelectedCoreObject = nil
		end
	}) else roact.createElement(focusHandlerModule, {
		isFocused = p0.props.menuOpen and p0.props.inputType == inputType.Gamepad,
		didBlur = function() --[[ line: 33 ]]
			-- upvalues: guiService (copy)
			guiService.SelectedCoreObject = nil
		end
	})
end

return roactRodux.UNSTABLE_connect2(function(p1) --[[ line: 40 ]]
	return {
		menuOpen = p1.isMenuOpen,
		inputType = p1.displayOptions.inputType
	}
end)(focusHighlightManager)