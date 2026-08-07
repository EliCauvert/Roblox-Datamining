local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local VRService = require(corePackagesService.Workspace.Packages.MockableProxyServices).VRService
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent
local controlsModule = require(parent.Resources.Controls)
local keyboardControlsModule = require(script.ControlLayouts.KeyboardControls)
local gamepadControlsModule = require(script.ControlLayouts.GamepadControls)
local VRGamepadControlsWrapperModule = require(script.ControlLayouts.VRGamepadControlsWrapper)
local VRUtil = require(corePackagesService.Workspace.Packages.VrCommon).VRUtil
local focusHandlerModule = require(parent.Components.Connection.FocusHandler)
local controlsPage = roact.PureComponent:extend("ControlsPage")
controlsPage.validateProps = t.strictInterface({
	pageTitle = t.string,
	controlLayout = t.optional(t.string),
	canCaptureFocus = t.optional(t.boolean)
})

function controlsPage.init(p0) --[[ line: 33 ]]
	-- upvalues: roact (ref)
	p0.closeButtonRef = roact.createRef()
end

function controlsPage.render(p1) --[[ line: 37 ]]
	-- upvalues: controlsModule (ref), roact (ref), keyboardControlsModule (ref), VRService (ref), VRUtil (ref), VRGamepadControlsWrapperModule (ref), gamepadControlsModule (ref), focusHandlerModule (ref), guiService (ref)
	local controlLayout = p1.props.controlLayout
	
	return if controlLayout == controlsModule.ControlLayouts.KEYBOARD then roact.createElement(keyboardControlsModule) elseif controlLayout == controlsModule.ControlLayouts.GAMEPAD then if VRService.VREnabled and VRUtil.getCurrentControllerType() == "Touch" then roact.createElement(VRGamepadControlsWrapperModule) else roact.createFragment({
		GamepadControls = roact.createElement(gamepadControlsModule, { closeButtonRef = p1.closeButtonRef }),
		FocusHandler = roact.createElement(focusHandlerModule, {
			isFocused = p1.props.canCaptureFocus,
			didFocus = function() --[[ line: 52 ]]
				-- upvalues: p1 (ref), guiService (copy)
				local value = p1.closeButtonRef:getValue()
				guiService:AddSelectionParent("IGMControlsPage_CloseButtonSelectionGroup", value)
				guiService.SelectedCoreObject = value
			end,
			didBlur = function() --[[ line: 57 ]]
				-- upvalues: guiService (copy)
				guiService:RemoveSelectionGroup("IGMControlsPage_CloseButtonSelectionGroup")
			end
		})
	}) else nil
end

return roactRodux.UNSTABLE_connect2(function(p2) --[[ line: 69 ]]
	return {
		controlLayout = p2.controlLayout,
		canCaptureFocus = p2.menuPage == "Controls"
	}
end)(controlsPage)