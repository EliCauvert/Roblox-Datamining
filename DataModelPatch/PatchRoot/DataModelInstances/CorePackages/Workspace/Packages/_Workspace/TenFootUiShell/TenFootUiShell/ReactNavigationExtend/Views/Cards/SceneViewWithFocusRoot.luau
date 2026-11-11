local TenFootUiShell = script:FindFirstAncestor("TenFootUiShell")
local Parent = TenFootUiShell.Parent
local _ = require(Parent.TenFootUiCommon)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local UseFocusNavigableSurfaceRegistryConnectionFunction = FocusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseRootFocusNavigationBindingsModule = require(TenFootUiShell.Hooks.useRootFocusNavigationBindings)
local SceneView = require(Parent.RoactNavigation).SceneView
local _ = require(Parent.Navigation)
local FFlagFix10ftGlobalNavSelection = require(Parent.SharedFlags).FFlagFix10ftGlobalNavSelection

return function(p1)
	-- upvalues: ReactModule (copy), UseRootFocusNavigationBindingsModule (copy), ReactFocusNavigationModule (copy), UseFocusNavigableSurfaceRegistryConnectionFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), FFlagFix10ftGlobalNavSelection (copy), SceneView (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRootFocusNavigationBindingsModuleResult = UseRootFocusNavigationBindingsModule(UseStateResult2)
	local NoShouldRestoreFocus = p1.shouldRestoreFocus == nil or p1.shouldRestoreFocus
	local UseMostRecentFocusBehaviorResult = ReactFocusNavigationModule.useMostRecentFocusBehavior(UseRootFocusNavigationBindingsModuleResult)
	local UseMostRecentFocusBehaviorResult1 = if NoShouldRestoreFocus then UseMostRecentFocusBehaviorResult else UseRootFocusNavigationBindingsModuleResult
	UseFocusNavigableSurfaceRegistryConnectionFunction(UseStateResult, FocusNavigableSurfaceIdentifierEnum.RouterView, p1.isFocusable)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(0, 0),
		Size = UDim2.fromScale(1, 1),
		SelectionGroup = if FFlagFix10ftGlobalNavSelection then true else nil,
		SelectionBehaviorLeft = if FFlagFix10ftGlobalNavSelection then Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorRight = if FFlagFix10ftGlobalNavSelection then Enum.SelectionBehavior.Stop else nil,
		ref = UseMostRecentFocusBehaviorResult1
	}, ReactModule.createElement(SceneView, {
		navigation = p1.navigation,
		component = p1.component,
		screenProps = p1.screenProps
	}))
end