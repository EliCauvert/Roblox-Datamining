-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:03 2026 Pacific Standard Time.

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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 79 | named "IconButton" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePresentationContext (ref), isBuilderOrMigratedIcon (ref), getIconScaleModule (ref), useIconButtonVariantsModule (ref), useIconSizeModule (ref), isBuilderIconModule (ref), reactModule (ref), fillBehaviorModule (ref), viewModule (ref), withCommonPropsModule (ref), constantsModule (ref), textModule (ref), isMigrated (ref), uiblox (ref), builderIconsModule (ref), imageModule (ref)
	local var26, var27
	local var19 = withDefaultsModule(p0, t)
	local var20 = useTokensModule()
	local var21 = usePresentationContext()
	local var22 = if typeof(var19.icon) == "table" then var19.icon.name else var19.icon
	local var23 = if typeof(var19.icon) == "table" then var19.icon.variant else nil
	local _ = nil
	local _ = nil
	
	if isBuilderOrMigratedIcon(var22) then
		var26 = nil
		var27 = 1
	else
		local var24, var25 = getIconScaleModule(var22, var19.size)
		var26 = var24
		var27 = var25
	end
	local new
	local var28 = useIconButtonVariantsModule(var20, var19.size, var19.variant, if var21 then var21.colorNamespace else nil)
	local size = var28.container.size
	
	if var19.isCircular then
		new = UDim.new(0, var20.Radius.Circle)
	else
		new = UDim.new
		new = new(0, var28.container.radius or var20.Radius.Large)
	end
	local var29 = useIconSizeModule(var19.size, isBuilderIconModule(var22), true)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var19, {
		onActivated = var19.onActivated,
		Size = UDim2.new(if var19.fillBehavior == fillBehaviorModule.Fill then UDim.new(1, 0) elseif if var19.width.Scale == 0 then var19.width.Offset ~= 0 else true then var19.width else size.X, UDim.new(0, size.Y.Offset)),
		flexItem = if var19.fillBehavior then {
			FlexMode = if var19.fillBehavior == fillBehaviorModule.Fill then Enum.UIFlexMode.Fill else Enum.UIFlexMode.Shrink
		} else nil,
		selection = {
			Selectable = if var19.isDisabled then false else var19.Selectable,
			NextSelectionUp = var19.NextSelectionUp,
			NextSelectionDown = var19.NextSelectionDown,
			NextSelectionLeft = var19.NextSelectionLeft,
			NextSelectionRight = var19.NextSelectionRight
		},
		isDisabled = var19.isDisabled,
		stateLayer = var28.container.stateLayer,
		padding = var28.container.padding,
		cornerRadius = new,
		backgroundStyle = var28.container.style,
		stroke = var28.container.stroke,
		cursor = reactModule.useMemo(function() --[[ line: 111 ]]
			-- upvalues: new (ref), var20 (ref)
			return {
				radius = new,
				offset = var20.Size.Size_150,
				borderWidth = var20.Stroke.Thicker
			}
		end, { var20, new }),
		GroupTransparency = if var19.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		ref = p1
	}), {
		Icon = if isBuilderOrMigratedIcon(var22) then reactModule.createElement(textModule, {
			tag = "position-center-center anchor-center-center",
			Text = if isMigrated(var22) then uiblox[var22].name else var22,
			fontStyle = {
				Font = builderIconsModule.Font[if isMigrated(var22) then uiblox[var22].variant else var23 or builderIconsModule.IconVariant.Regular],
				FontSize = var29.Y.Offset
			},
			Size = var29,
			textStyle = var28.content.style,
			testId = `{var19.testId}--icon`
		}) else reactModule.createElement(imageModule, {
			tag = "position-center-center anchor-center-center",
			Image = var22,
			Size = if var26 then UDim2.fromOffset(var26.X, var26.Y) else var29,
			imageStyle = var28.content.style,
			scale = var27,
			testId = `{var19.testId}--image`
		})
	})
end))