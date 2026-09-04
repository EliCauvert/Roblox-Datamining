local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local appBloxModule = require(parent.AppBlox)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local getInputModeStore = responsiveModule.GetInputModeStore
local inputSize = foundationModule.Enums.InputSize
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local useGameTileOverflowMenuFocusNavigation = require(parent.GameTile).useGameTileOverflowMenuFocusNavigation
local useOverflowMenuOpen = appBloxModule.useOverflowMenuOpen
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useOverflowMenuOpen (ref), useGameTileOverflowMenuFocusNavigation (ref), reactModule (ref), getSduiComponentWrapper (ref), inputSize (ref), getInputModeStore (ref), responsiveModule (ref)
	local var1 = useTokens()
	
	return if p1.isHovered or p1.isSelected or useOverflowMenuOpen(p1.menuKey) then reactModule.createElement(getSduiComponentWrapper(p1.componentConfig), {
		debugName = "SduiGameTile.OverflowMenu",
		componentConfig = p1.componentConfig,
		sduiContext = p1.sduiContext,
		extraLocalProps = {
			includeMenuItemTelemetry = true,
			zIndex = 5,
			anchorPoint = Vector2.new(1, 0),
			buttonIconBackgroundStyle = var1.Color.OverMedia.OverMedia_0,
			buttonSize = inputSize.Small,
			hasOverflowButton = getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Pointer,
			menuKey = p1.menuKey,
			onMenuOpenChanged = p1.onMenuOpenChanged,
			position = UDim2.new(1, -var1.Padding.Medium, 0, var1.Padding.Medium),
			setFocusRef = useGameTileOverflowMenuFocusNavigation(p1.menuKey, p1.isSelected, p1.parentRef, p1.onMenuOpenChanged),
			shouldShowAnchor = p1.isHovered
		}
	}) else nil
end)