local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local builderIconsModule = require(parent.BuilderIcons)
local iconModule = require(foundation.Components.Icon)
local imageModule = require(foundation.Components.Image)
local statusIndicatorModule = require(foundation.Components.StatusIndicator)
local _ = require(foundation.Enums.StatusIndicatorShape)
local _ = require(foundation.Enums.StatusIndicatorVariant)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local uiblox = builderIconsModule.Migration.uiblox
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local _ = require(foundation.Enums.InputSize)
local getIconScaleModule = require(foundation.Utility.getIconScale)
local iconMigrationUtilsModule = require(foundation.Utility.iconMigrationUtils)
local isMigrated = iconMigrationUtilsModule.isMigrated
local isBuilderOrMigratedIcon = iconMigrationUtilsModule.isBuilderOrMigratedIcon
local constantsModule = require(foundation.Constants)
local useTabItemVariantsModule = require(script.Parent.useTabItemVariants)
local flagsModule = require(foundation.Utility.Flags)

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokensModule (ref), fillBehaviorModule (ref), useTabItemVariantsModule (ref), reactModule (ref), builderIconsModule (ref), isBuilderOrMigratedIcon (ref), iconModule (ref), isMigrated (ref), uiblox (ref), getIconScaleModule (ref), imageModule (ref), flagsModule (ref), viewModule (ref), constantsModule (ref), textModule (ref), statusIndicatorModule (ref)
	local var1 = useTokensModule()
	local var2 = if p1.isActive then var1.Color.Content.Default else var1.Color.Content.Emphasis
	local var3 = p1.fillBehavior == fillBehaviorModule.Fill
	local var4 = useTabItemVariantsModule(var1, p1.size, var3)
	local var5 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return {
			offset = 0,
			radius = UDim.new(0, 0),
			borderWidth = var1.Stroke.Thicker
		}
	end, { var1 })
	local var6 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), builderIconsModule (copy)
		return if p1.icon == nil then nil elseif typeof(p1.icon) == "string" then {
			name = p1.icon,
			variant = builderIconsModule.IconVariant.Regular
		} else p1.icon
	end, { p1.icon })
	local var7 = nil
	
	if var6 then
		if isBuilderOrMigratedIcon(var6.name) then
			var7 = reactModule.createElement(iconModule, {
				name = if isMigrated(var6.name) then uiblox[var6.name].name else var6.name,
				variant = if isMigrated(var6.name) then uiblox[var6.name].variant else var6.variant,
				size = var4.icon.size,
				style = var2
			})
		else
			local var8, var9 = getIconScaleModule(var6.name, var4.icon.size)
			
			if var8 then
				var7 = reactModule.createElement(imageModule, {
					Image = var6.name,
					Size = UDim2.fromOffset(var8.X, var8.Y),
					imageStyle = var2,
					scale = var9
				})
			end
		end
	end
	local uDim2, uDim2_1
	local _ = nil
	local _ = nil
	
	if var3 or flagsModule.FoundationFixTabsFitBorderWidth then
		uDim2 = UDim2.fromScale(1, 1)
		uDim2_1 = nil
	else
		local size100 = var1.Size.Size_100
		uDim2 = UDim2.new(1, size100 * 2, 1, 0)
		uDim2_1 = UDim2.fromOffset(-size100, 0)
	end
	return reactModule.createElement(viewModule, {
		tag = var4.container.tag,
		GroupTransparency = if p1.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		testId = p1.testId
	}, {
		Interactive = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			Size = uDim2,
			Position = uDim2_1,
			onActivated = function()
				-- upvalues: p1 (ref)
				p1.onActivated(p1.id)
			end,
			selection = { Selectable = not p1.isDisabled },
			cursor = var5,
			isDisabled = p1.isDisabled,
			ref = p2
		}),
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = var4.content.tag,
			Size = var4.content.Size
		}, {
			Icon = if p1.icon then var7 else nil,
			Text = reactModule.createElement(textModule, {
				LayoutOrder = 2,
				Text = p1.text,
				style = var2,
				tag = var4.text.tag
			}),
			Indicator = if p1.indicator then reactModule.createElement(statusIndicatorModule, if p1.indicator.value then {
				LayoutOrder = 3,
				value = p1.indicator.value,
				variant = p1.indicator.variant,
				max = p1.indicator.max,
				testId = `{p1.testId}--indicator`
			} else {
				LayoutOrder = 3,
				variant = p1.indicator.variant,
				shape = p1.indicator.shape,
				testId = `{p1.testId}--indicator`
			}) else nil
		})
	})
end))