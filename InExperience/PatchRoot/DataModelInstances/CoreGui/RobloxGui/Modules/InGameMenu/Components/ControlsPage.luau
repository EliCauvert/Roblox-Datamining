local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local VRService = require(CorePackages.Workspace.Packages.MockableProxyServices).VRService
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent
local ControlsModule = require(Parent.Resources.Controls)
local KeyboardControlsModule = require(script.ControlLayouts.KeyboardControls)
local GamepadControlsModule = require(script.ControlLayouts.GamepadControls)
local VRGamepadControlsWrapperModule = require(script.ControlLayouts.VRGamepadControlsWrapper)
local VRUtil = require(CorePackages.Workspace.Packages.VrCommon).VRUtil
local FocusHandlerModule = require(Parent.Components.Connection.FocusHandler)
local ControlsPage = Roact.PureComponent:extend("ControlsPage")
ControlsPage.validateProps = T.strictInterface({
	pageTitle = T.string,
	controlLayout = T.optional(T.string),
	canCaptureFocus = T.optional(T.boolean)
})

function ControlsPage.init(p1) --[[ Line: 33 ]]
	-- upvalues: Roact (copy)
	p1.closeButtonRef = Roact.createRef()
end

function ControlsPage.render(p1) --[[ Line: 37 ]]
	-- upvalues: ControlsModule (copy), Roact (copy), KeyboardControlsModule (copy), VRService (copy), VRUtil (copy), VRGamepadControlsWrapperModule (copy), GamepadControlsModule (copy), FocusHandlerModule (copy), GuiService (copy)
	local ControlLayout = p1.props.controlLayout
	
	return if ControlLayout == ControlsModule.ControlLayouts.KEYBOARD then Roact.createElement(KeyboardControlsModule) elseif ControlLayout == ControlsModule.ControlLayouts.GAMEPAD then if VRService.VREnabled and VRUtil.getCurrentControllerType() == "Touch" then Roact.createElement(VRGamepadControlsWrapperModule) else Roact.createFragment({
		GamepadControls = Roact.createElement(GamepadControlsModule, { closeButtonRef = p1.closeButtonRef }),
		FocusHandler = Roact.createElement(FocusHandlerModule, {
			isFocused = p1.props.canCaptureFocus,
			didFocus = function() --[[ Line: 52 ]]
				-- upvalues: p1 (copy), GuiService (upval)
				local Value = p1.closeButtonRef:getValue()
				GuiService:AddSelectionParent("IGMControlsPage_CloseButtonSelectionGroup", Value)
				GuiService.SelectedCoreObject = Value
			end,
			didBlur = function() --[[ Line: 57 ]]
				-- upvalues: GuiService (upval)
				GuiService:RemoveSelectionGroup("IGMControlsPage_CloseButtonSelectionGroup")
			end
		})
	}) else nil
end

return RoactRodux.UNSTABLE_connect2(function(p1) --[[ Line: 69 ]]
	return {
		controlLayout = p1.controlLayout,
		canCaptureFocus = p1.menuPage == "Controls"
	}
end)(ControlsPage)