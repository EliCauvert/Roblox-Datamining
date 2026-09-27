local parent = script:FindFirstAncestor("SduiSharedContent").Parent
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
local fFlagSduiGameTileDirectAction = require(parent.SharedFlags).FFlagSduiGameTileDirectAction

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useOverflowMenuOpen (ref), useGameTileOverflowMenuFocusNavigation (ref), fFlagSduiGameTileDirectAction (ref), getInputModeStore (ref), responsiveModule (ref), reactModule (ref), getSduiComponentWrapper (ref), inputSize (ref)
	local var1 = useTokens()
	local var2 = useOverflowMenuOpen(p1.menuKey)
	local var3 = if fFlagSduiGameTileDirectAction then getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Pointer else nil
	
	return if not (not p1.isHovered and not p1.isSelected and not var2) then if fFlagSduiGameTileDirectAction and p1.directActionComponentConfig and (p1.isHovered and not var2) and var3 then reactModule.createElement(getSduiComponentWrapper(p1.directActionComponentConfig), {
		debugName = "SduiTileOverflowMenu.DirectAction",
		componentConfig = p1.directActionComponentConfig,
		sduiContext = p1.sduiContext,
		extraLocalProps = {
			anchorPoint = Vector2.new(1, 0),
			position = UDim2.new(1, -var1.Padding.Medium, 0, var1.Padding.Medium),
			zIndex = p1.zIndex
		}
	}) else reactModule.createElement(getSduiComponentWrapper(p1.componentConfig), {
		componentConfig = p1.componentConfig,
		debugName = p1.debugName,
		sduiContext = p1.sduiContext,
		extraLocalProps = {
			includeMenuItemTelemetry = true,
			anchorPoint = Vector2.new(1, 0),
			buttonIconBackgroundStyle = var1.Color.OverMedia.OverMedia_0,
			buttonSize = inputSize.Small,
			hasOverflowButton = if fFlagSduiGameTileDirectAction then var3 else getInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Pointer,
			menuKey = p1.menuKey,
			onMenuOpenChanged = p1.onMenuOpenChanged,
			position = UDim2.new(1, -var1.Padding.Medium, 0, var1.Padding.Medium),
			setFocusRef = useGameTileOverflowMenuFocusNavigation(p1.menuKey, p1.isSelected, p1.parentRef, p1.onMenuOpenChanged),
			shouldShowAnchor = p1.isHovered,
			zIndex = p1.zIndex
		}
	}) else nil
end)