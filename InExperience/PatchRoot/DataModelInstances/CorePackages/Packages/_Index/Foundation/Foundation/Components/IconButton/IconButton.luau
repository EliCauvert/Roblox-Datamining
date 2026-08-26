local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local uiblox = builderIconsModule.Migration.uiblox
local inputSizeModule = require(foundation.Enums.InputSize)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local _ = require(foundation.Enums.IconSize)
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local _ = require(foundation.Enums.Radius)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local usePresentationContext = require(foundation.Providers.Style.PresentationContext).usePresentationContext
local getIconScaleModule = require(foundation.Utility.getIconScale)
local iconMigrationUtilsModule = require(foundation.Utility.iconMigrationUtils)
local isBuilderIconModule = require(foundation.Utility.isBuilderIcon)
local useIconButtonVariantsModule = require(script.Parent.useIconButtonVariants)
local useIconSizeModule = require(foundation.Utility.useIconSize)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local isMigrated = iconMigrationUtilsModule.isMigrated
local isBuilderOrMigratedIcon = iconMigrationUtilsModule.isBuilderOrMigratedIcon
local constantsModule = require(foundation.Constants)
local imageModule = require(foundation.Components.Image)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local t = {
	isDisabled = false,
	isCircular = false,
	testId = "--foundation-icon-button",
	size = inputSizeModule.Medium,
	width = UDim.new(0, 0),
	variant = buttonVariantModule.Utility
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePresentationContext (ref), isBuilderOrMigratedIcon (ref), getIconScaleModule (ref), useIconButtonVariantsModule (ref), useIconSizeModule (ref), isBuilderIconModule (ref), reactModule (ref), fillBehaviorModule (ref), viewModule (ref), withCommonPropsModule (ref), constantsModule (ref), textModule (ref), isMigrated (ref), uiblox (ref), builderIconsModule (ref), imageModule (ref)
	local var1, var2
	local var3 = withDefaultsModule(p1, t)
	local var4 = useTokensModule()
	local var5 = usePresentationContext()
	local var6 = if typeof(var3.icon) == "table" then var3.icon.name else var3.icon
	local var7 = if typeof(var3.icon) == "table" then var3.icon.variant else nil
	local _ = nil
	local _ = nil
	
	if isBuilderOrMigratedIcon(var6) then
		var1 = nil
		var2 = 1
	else
		local var8, var9 = getIconScaleModule(var6, var3.size)
		var1 = var8
		var2 = var9
	end
	local new
	local var10 = useIconButtonVariantsModule(var4, var3.size, var3.variant, if var5 then var5.colorNamespace else nil)
	local size = var10.container.size
	
	if var3.isCircular then
		new = UDim.new(0, var4.Radius.Circle)
	else
		new = UDim.new
		new = new(0, var10.container.radius or var4.Radius.Large)
	end
	local var11 = useIconSizeModule(var3.size, isBuilderIconModule(var6), true)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var3, {
		onActivated = var3.onActivated,
		Size = UDim2.new(if var3.fillBehavior == fillBehaviorModule.Fill then UDim.new(1, 0) elseif if var3.width.Scale == 0 then var3.width.Offset ~= 0 else true then var3.width else size.X, UDim.new(0, size.Y.Offset)),
		flexItem = if var3.fillBehavior then {
			FlexMode = if var3.fillBehavior == fillBehaviorModule.Fill then Enum.UIFlexMode.Fill else Enum.UIFlexMode.Shrink
		} else nil,
		selection = {
			Selectable = if var3.isDisabled then false else var3.Selectable,
			NextSelectionUp = var3.NextSelectionUp,
			NextSelectionDown = var3.NextSelectionDown,
			NextSelectionLeft = var3.NextSelectionLeft,
			NextSelectionRight = var3.NextSelectionRight
		},
		isDisabled = var3.isDisabled,
		stateLayer = var10.container.stateLayer,
		padding = var10.container.padding,
		cornerRadius = new,
		backgroundStyle = var10.container.style,
		stroke = var10.container.stroke,
		cursor = reactModule.useMemo(function()
			-- upvalues: new (ref), var4 (ref)
			return {
				radius = new,
				offset = var4.Size.Size_150,
				borderWidth = var4.Stroke.Thicker
			}
		end, { var4, new }),
		GroupTransparency = if var3.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		ref = p2
	}), {
		Icon = if isBuilderOrMigratedIcon(var6) then reactModule.createElement(textModule, {
			tag = "position-center-center anchor-center-center",
			Text = if isMigrated(var6) then uiblox[var6].name else var6,
			fontStyle = {
				Font = builderIconsModule.Font[if isMigrated(var6) then uiblox[var6].variant else var7 or builderIconsModule.IconVariant.Regular],
				FontSize = var11.Y.Offset
			},
			Size = var11,
			textStyle = var10.content.style,
			testId = `{var3.testId}--icon`
		}) else reactModule.createElement(imageModule, {
			tag = "position-center-center anchor-center-center",
			Image = var6,
			Size = if var1 then UDim2.fromOffset(var1.X, var1.Y) else var11,
			imageStyle = var10.content.style,
			scale = var2,
			testId = `{var3.testId}--image`
		})
	})
end))