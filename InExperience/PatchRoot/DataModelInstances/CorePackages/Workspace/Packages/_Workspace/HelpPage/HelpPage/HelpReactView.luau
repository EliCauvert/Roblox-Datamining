local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local CoreGuiCommonModule = require(Parent1.CoreGuiCommon)
local HelpPageContainerModule = require(Parent.Components.HelpPageContainer)
local KeybindContextProviderModule = require(Parent.Context.KeybindContextProvider)
local FFlagHelpPageGamepadScrollModule = require(Parent.Flags.FFlagHelpPageGamepadScroll)
local UseGamepadStickScrollFunction = CoreGuiCommonModule.Hooks.useGamepadStickScroll

return function(p1)
	-- upvalues: FFlagHelpPageGamepadScrollModule (copy), ReactModule (copy), UseGamepadStickScrollFunction (copy), KeybindContextProviderModule (copy), HelpPageContainerModule (copy)
	if FFlagHelpPageGamepadScrollModule then
		UseGamepadStickScrollFunction({
			actionName = "RbxHelpPageGamepadStickScroll",
			enabled = true,
			scrollingFrameRef = ReactModule.useRef(p1.scrollingFrame)
		})
	end
	return ReactModule.createElement(KeybindContextProviderModule, nil, {
		HelpPageContainer = ReactModule.createElement(HelpPageContainerModule)
	})
end