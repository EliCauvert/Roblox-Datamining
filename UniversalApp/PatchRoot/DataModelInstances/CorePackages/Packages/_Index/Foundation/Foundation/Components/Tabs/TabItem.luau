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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 68 | named "TabItem" ]]
	-- upvalues: useTokensModule (ref), fillBehaviorModule (ref), useTabItemVariantsModule (ref), reactModule (ref), builderIconsModule (ref), isBuilderOrMigratedIcon (ref), iconModule (ref), isMigrated (ref), uiblox (ref), getIconScaleModule (ref), imageModule (ref), flagsModule (ref), viewModule (ref), constantsModule (ref), textModule (ref), statusIndicatorModule (ref)
	local var15 = useTokensModule()
	local var16 = if p0.isActive then var15.Color.Content.Default else var15.Color.Content.Emphasis
	local var17 = p0.fillBehavior == fillBehaviorModule.Fill
	local var18 = useTabItemVariantsModule(var15, p0.size, var17)
	local var19 = reactModule.useMemo(function() --[[ line: 77 ]]
		-- upvalues: var15 (ref)
		return {
			offset = 0,
			radius = UDim.new(0, 0),
			borderWidth = var15.Stroke.Thicker
		}
	end, { var15 })
	local var20 = reactModule.useMemo(function() --[[ line: 85 ]]
		-- upvalues: p0 (ref), builderIconsModule (copy)
		return if p0.icon == nil then nil elseif typeof(p0.icon) == "string" then {
			name = p0.icon,
			variant = builderIconsModule.IconVariant.Regular
		} else p0.icon
	end, { p0.icon })
	local var21 = nil
	
	if var20 then
		if isBuilderOrMigratedIcon(var20.name) then
			var21 = reactModule.createElement(iconModule, {
				name = if isMigrated(var20.name) then uiblox[var20.name].name else var20.name,
				variant = if isMigrated(var20.name) then uiblox[var20.name].variant else var20.variant,
				size = var18.icon.size,
				style = var16
			})
		else
			local var22, var23 = getIconScaleModule(var20.name, var18.icon.size)
			
			if var22 then
				var21 = reactModule.createElement(imageModule, {
					Image = var20.name,
					Size = UDim2.fromOffset(var22.X, var22.Y),
					imageStyle = var16,
					scale = var23
				})
			end
		end
	end
	local uDim2, uDim2_1
	local _ = nil
	local _ = nil
	
	if var17 or flagsModule.FoundationFixTabsFitBorderWidth then
		uDim2 = UDim2.fromScale(1, 1)
		uDim2_1 = nil
	else
		local size100 = var15.Size.Size_100
		uDim2 = UDim2.new(1, size100 * 2, 1, 0)
		uDim2_1 = UDim2.fromOffset(-size100, 0)
	end
	return reactModule.createElement(viewModule, {
		tag = var18.container.tag,
		GroupTransparency = if p0.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		testId = p0.testId
	}, {
		Interactive = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			Size = uDim2,
			Position = uDim2_1,
			onActivated = function() --[[ line: 140 ]]
				-- upvalues: p0 (ref)
				p0.onActivated(p0.id)
			end,
			selection = { Selectable = not p0.isDisabled },
			cursor = var19,
			isDisabled = p0.isDisabled,
			ref = p1
		}),
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = var18.content.tag,
			Size = var18.content.Size
		}, {
			Icon = if p0.icon then var21 else nil,
			Text = reactModule.createElement(textModule, {
				LayoutOrder = 2,
				Text = p0.text,
				style = var16,
				tag = var18.text.tag
			}),
			Indicator = if p0.indicator then reactModule.createElement(statusIndicatorModule, if p0.indicator.value then {
				LayoutOrder = 3,
				value = p0.indicator.value,
				variant = p0.indicator.variant,
				max = p0.indicator.max,
				testId = `{p0.testId}--indicator`
			} else {
				LayoutOrder = 3,
				variant = p0.indicator.variant,
				shape = p0.indicator.shape,
				testId = `{p0.testId}--indicator`
			}) else nil
		})
	})
end))