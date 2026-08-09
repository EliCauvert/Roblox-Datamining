local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local builderIconsModule = require(parent.BuilderIcons)
local iconModule = require(foundation.Components.Icon)
local imageModule = require(foundation.Components.Image)
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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 53 | named "TabItem" ]]
	-- upvalues: useTokensModule (ref), fillBehaviorModule (ref), useTabItemVariantsModule (ref), reactModule (ref), builderIconsModule (ref), isBuilderOrMigratedIcon (ref), iconModule (ref), isMigrated (ref), uiblox (ref), getIconScaleModule (ref), imageModule (ref), viewModule (ref), constantsModule (ref), textModule (ref)
	local var13 = useTokensModule()
	local var14 = if p0.isActive then var13.Color.Content.Default else var13.Color.Content.Emphasis
	local var15 = p0.fillBehavior == fillBehaviorModule.Fill
	local var16 = useTabItemVariantsModule(var13, p0.size, var15)
	local var17 = reactModule.useMemo(function() --[[ line: 62 ]]
		-- upvalues: var13 (ref)
		return {
			offset = 0,
			radius = UDim.new(0, 0),
			borderWidth = var13.Stroke.Thicker
		}
	end, { var13 })
	local var18 = reactModule.useMemo(function() --[[ line: 70 ]]
		-- upvalues: p0 (ref), builderIconsModule (copy)
		return if p0.icon == nil then nil elseif typeof(p0.icon) == "string" then {
			name = p0.icon,
			variant = builderIconsModule.IconVariant.Regular
		} else p0.icon
	end, { p0.icon })
	local var19 = nil
	
	if var18 then
		if isBuilderOrMigratedIcon(var18.name) then
			var19 = reactModule.createElement(iconModule, {
				name = if isMigrated(var18.name) then uiblox[var18.name].name else var18.name,
				variant = if isMigrated(var18.name) then uiblox[var18.name].variant else var18.variant,
				size = var16.icon.size,
				style = var14
			})
		else
			local var20, var21 = getIconScaleModule(var18.name, var16.icon.size)
			
			if var20 then
				var19 = reactModule.createElement(imageModule, {
					Image = var18.name,
					Size = UDim2.fromOffset(var20.X, var20.Y),
					imageStyle = var14,
					scale = var21
				})
			end
		end
	end
	local uDim2, uDim2_1
	local _ = nil
	local _ = nil
	
	if var15 then
		uDim2 = UDim2.fromScale(1, 1)
		uDim2_1 = nil
	else
		local size100 = var13.Size.Size_100
		uDim2 = UDim2.new(1, size100 * 2, 1, 0)
		uDim2_1 = UDim2.fromOffset(-size100, 0)
	end
	return reactModule.createElement(viewModule, {
		tag = var16.container.tag,
		GroupTransparency = if p0.isDisabled then constantsModule.DISABLED_TRANSPARENCY else nil,
		testId = p0.testId
	}, {
		Interactive = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			Size = uDim2,
			Position = uDim2_1,
			onActivated = function() --[[ line: 125 ]]
				-- upvalues: p0 (ref)
				p0.onActivated(p0.id)
			end,
			selection = { Selectable = not p0.isDisabled },
			cursor = var17,
			isDisabled = p0.isDisabled,
			ref = p1
		}),
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = var16.content.tag,
			Size = var16.content.Size
		}, {
			Icon = if p0.icon then var19 else nil,
			Text = reactModule.createElement(textModule, {
				LayoutOrder = 2,
				Text = p0.text,
				style = var14,
				tag = var16.text.tag
			})
		})
	})
end))