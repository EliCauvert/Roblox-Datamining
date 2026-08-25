local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local uiblox = builderIconsModule.Migration.uiblox
local reactModule = require(parent.React)
local _ = require(foundation.Enums.ButtonVariant)
local _ = require(foundation.Enums.InputSize)
local imageModule = require(foundation.Components.Image)
local textModule = require(foundation.Components.Text)
local getIconScaleModule = require(foundation.Utility.getIconScale)
local iconMigrationUtilsModule = require(foundation.Utility.iconMigrationUtils)
local isMigrated = iconMigrationUtilsModule.isMigrated
local isBuilderOrMigratedIcon = iconMigrationUtilsModule.isBuilderOrMigratedIcon
local useButtonVariantsModule = require(script.Parent.useButtonVariants)
local useTextSizeOffsetModule = require(foundation.Providers.Style.useTextSizeOffset)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local usePresentationContext = require(foundation.Providers.Style.PresentationContext).usePresentationContext

return function(p1)
	-- upvalues: useTokensModule (ref), useTextSizeOffsetModule (ref), getIconScaleModule (ref), usePresentationContext (ref), useButtonVariantsModule (ref), isBuilderOrMigratedIcon (ref), reactModule (ref), textModule (ref), isMigrated (ref), uiblox (ref), builderIconsModule (ref), imageModule (ref)
	local disabledTransparencyBinding = p1.disabledTransparencyBinding
	local textTransparencyBinding = p1.textTransparencyBinding
	local var1 = useTokensModule()
	local var2 = useTextSizeOffsetModule()
	local var3, var4 = getIconScaleModule(p1.icon, p1.size)
	local var5 = usePresentationContext()
	local var6 = useButtonVariantsModule(var1, p1.size, p1.variant, if var5 then var5.colorNamespace else nil)
	
	return if p1.icon then if isBuilderOrMigratedIcon(p1.icon) then reactModule.createElement(textModule, {
		tag = "position-center-center anchor-center-center",
		Text = if isMigrated(p1.icon) then uiblox[p1.icon].name else p1.icon,
		fontStyle = {
			Font = builderIconsModule.Font[if isMigrated(p1.icon) then uiblox[p1.icon].variant else builderIconsModule.IconVariant.Regular],
			FontSize = var6.icon.size.Y.Offset
		},
		Size = var6.icon.size,
		textStyle = reactModule.joinBindings({ disabledTransparencyBinding, textTransparencyBinding }):map(function(p1)
			-- upvalues: var6 (ref)
			return {
				Color3 = var6.content.style.Color3,
				Transparency = p1[2] + p1[1]
			}
		end),
		testId = `{p1.testId}--icon`
	}, {
		UITextSizeConstraint = if var2 > 0 then reactModule.createElement("UITextSizeConstraint", { MaxTextSize = var6.icon.size.Y.Offset }) else nil
	}) else reactModule.createElement(imageModule, {
		tag = "position-center-center anchor-center-center",
		Image = p1.icon,
		Size = if var3 then UDim2.fromOffset(var3.X, var3.Y) else var6.icon.size,
		imageStyle = reactModule.joinBindings({ disabledTransparencyBinding, textTransparencyBinding }):map(function(p1)
			-- upvalues: var6 (ref)
			return {
				Color3 = var6.content.style.Color3,
				Transparency = p1[2] + p1[1]
			}
		end),
		scale = var4,
		testId = `{p1.testId}--icon`
	}) else nil
end