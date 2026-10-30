local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local GetInputModeStoreFunction = ResponsiveModule.GetInputModeStore
local InputSize = FoundationModule.Enums.InputSize
local GetSduiComponentWrapperFunction = require(Parent.SduiCoreSystem).getSduiComponentWrapper
local UseGameTileOverflowMenuFocusNavigationFunction = require(Parent.GameTile).useGameTileOverflowMenuFocusNavigation
local UseOverflowMenuOpenFunction = require(Parent.AppBlox).useOverflowMenuOpen
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagSduiGameTileDirectAction = require(Parent.SharedFlags).FFlagSduiGameTileDirectAction

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseOverflowMenuOpenFunction (copy), UseGameTileOverflowMenuFocusNavigationFunction (copy), FFlagSduiGameTileDirectAction (copy), GetInputModeStoreFunction (copy), ResponsiveModule (copy), ReactModule (copy), GetSduiComponentWrapperFunction (copy), InputSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UseOverflowMenuOpenResult = UseOverflowMenuOpenFunction(p1.menuKey)
	local UseGameTileOverflowMenuFocusNavigationResult = UseGameTileOverflowMenuFocusNavigationFunction(p1.menuKey, p1.isSelected, p1.parentRef, p1.onMenuOpenChanged)
	local IsLastInputTypeMatch = if FFlagSduiGameTileDirectAction then GetInputModeStoreFunction(false).getLastInputType(false) == ResponsiveModule.Input.Pointer else nil
	
	return if p1.isHovered or p1.isSelected or UseOverflowMenuOpenResult then if FFlagSduiGameTileDirectAction and p1.directActionComponentConfig and p1.isHovered and not UseOverflowMenuOpenResult and IsLastInputTypeMatch then ReactModule.createElement(GetSduiComponentWrapperFunction(p1.directActionComponentConfig), {
		debugName = "SduiTileOverflowMenu.DirectAction",
		componentConfig = p1.directActionComponentConfig,
		sduiContext = p1.sduiContext,
		extraLocalProps = {
			anchorPoint = Vector2.new(1, 0),
			position = UDim2.new(1, -UseTokensResult.Padding.Medium, 0, UseTokensResult.Padding.Medium),
			zIndex = p1.zIndex
		}
	}) else ReactModule.createElement(GetSduiComponentWrapperFunction(p1.componentConfig), {
		componentConfig = p1.componentConfig,
		debugName = p1.debugName,
		sduiContext = p1.sduiContext,
		extraLocalProps = {
			includeMenuItemTelemetry = true,
			anchorPoint = Vector2.new(1, 0),
			buttonIconBackgroundStyle = UseTokensResult.Color.OverMedia.OverMedia_0,
			buttonSize = InputSize.Small,
			hasOverflowButton = if FFlagSduiGameTileDirectAction then IsLastInputTypeMatch else GetInputModeStoreFunction(false).getLastInputType(false) == ResponsiveModule.Input.Pointer,
			menuKey = p1.menuKey,
			onMenuOpenChanged = p1.onMenuOpenChanged,
			position = UDim2.new(1, -UseTokensResult.Padding.Medium, 0, UseTokensResult.Padding.Medium),
			setFocusRef = UseGameTileOverflowMenuFocusNavigationResult,
			shouldShowAnchor = p1.isHovered,
			zIndex = p1.zIndex
		}
	}) else nil
end)