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

return function(p0) --[[ line: 38 | named "ButtonIcon" ]]
	-- upvalues: useTokensModule (ref), useTextSizeOffsetModule (ref), getIconScaleModule (ref), usePresentationContext (ref), useButtonVariantsModule (ref), isBuilderOrMigratedIcon (ref), reactModule (ref), textModule (ref), isMigrated (ref), uiblox (ref), builderIconsModule (ref), imageModule (ref)
	local disabledTransparencyBinding = p0.disabledTransparencyBinding
	local textTransparencyBinding = p0.textTransparencyBinding
	local var10 = useTokensModule()
	local var11 = useTextSizeOffsetModule()
	local var12, var13 = getIconScaleModule(p0.icon, p0.size)
	local var14 = usePresentationContext()
	local var15 = useButtonVariantsModule(var10, p0.size, p0.variant, if var14 then var14.colorNamespace else nil)
	
	return if p0.icon then if isBuilderOrMigratedIcon(p0.icon) then reactModule.createElement(textModule, {
		tag = "position-center-center anchor-center-center",
		Text = if isMigrated(p0.icon) then uiblox[p0.icon].name else p0.icon,
		fontStyle = {
			Font = builderIconsModule.Font[if isMigrated(p0.icon) then uiblox[p0.icon].variant else builderIconsModule.IconVariant.Regular],
			FontSize = var15.icon.size.Y.Offset
		},
		Size = var15.icon.size,
		textStyle = reactModule.joinBindings({ disabledTransparencyBinding, textTransparencyBinding }):map(function(p2) --[[ line: 71 ]]
			-- upvalues: var15 (ref)
			return {
				Color3 = var15.content.style.Color3,
				Transparency = p2[2] + p2[1]
			}
		end),
		testId = `{p0.testId}--icon`
	}, {
		UITextSizeConstraint = if var11 > 0 then reactModule.createElement("UITextSizeConstraint", { MaxTextSize = var15.icon.size.Y.Offset }) else nil
	}) else reactModule.createElement(imageModule, {
		tag = "position-center-center anchor-center-center",
		Image = p0.icon,
		Size = if var12 then UDim2.fromOffset(var12.X, var12.Y) else var15.icon.size,
		imageStyle = reactModule.joinBindings({ disabledTransparencyBinding, textTransparencyBinding }):map(function(p1) --[[ line: 97 ]]
			-- upvalues: var15 (ref)
			return {
				Color3 = var15.content.style.Color3,
				Transparency = p1[2] + p1[1]
			}
		end),
		scale = var13,
		testId = `{p0.testId}--icon`
	}) else nil
end