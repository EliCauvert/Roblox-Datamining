local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local BuilderIconsModule = require(Parent.BuilderIcons)
local IconModule = require(Foundation.Components.Icon)
local ImageModule = require(Foundation.Components.Image)
local StatusIndicatorModule = require(Foundation.Components.StatusIndicator)
local _ = require(Foundation.Enums.StatusIndicatorShape)
local _ = require(Foundation.Enums.StatusIndicatorVariant)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local Uiblox = BuilderIconsModule.Migration.uiblox
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local _ = require(Foundation.Enums.InputSize)
local GetIconScaleModule = require(Foundation.Utility.getIconScale)
local IconMigrationUtilsModule = require(Foundation.Utility.iconMigrationUtils)
local IsMigratedFunction = IconMigrationUtilsModule.isMigrated
local IsBuilderOrMigratedIconFunction = IconMigrationUtilsModule.isBuilderOrMigratedIcon
local ConstantsModule = require(Foundation.Constants)
local UseTabItemVariantsModule = require(script.Parent.useTabItemVariants)

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 66 | Named "TabItem" ]]
	-- upvalues: UseTokensModule (copy), FillBehaviorModule (copy), UseTabItemVariantsModule (copy), ReactModule (copy), BuilderIconsModule (copy), IsBuilderOrMigratedIconFunction (copy), IconModule (copy), IsMigratedFunction (copy), Uiblox (copy), GetIconScaleModule (copy), ImageModule (copy), ViewModule (copy), ConstantsModule (copy), TextModule (copy), StatusIndicatorModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local Default = if p1.isActive then UseTokensModuleResult.Color.Content.Default else UseTokensModuleResult.Color.Content.Emphasis
	local UseTabItemVariantsModuleResult = UseTabItemVariantsModule(UseTokensModuleResult, p1.size, p1.fillBehavior == FillBehaviorModule.Fill)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 75 ]]
		-- upvalues: UseTokensModuleResult (copy)
		return {
			offset = 0,
			radius = UDim.new(0, 0),
			borderWidth = UseTokensModuleResult.Stroke.Thicker
		}
	end, { UseTokensModuleResult })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 83 ]]
		-- upvalues: p1 (copy), BuilderIconsModule (upval)
		return if p1.icon == nil then nil elseif typeof(p1.icon) == "string" then {
			name = p1.icon,
			variant = BuilderIconsModule.IconVariant.Regular
		} else p1.icon
	end, { p1.icon })
	local Element = nil
	
	if UseMemoResult1 then
		if IsBuilderOrMigratedIconFunction(UseMemoResult1.name) then
			Element = ReactModule.createElement(IconModule, {
				name = if IsMigratedFunction(UseMemoResult1.name) then Uiblox[UseMemoResult1.name].name else UseMemoResult1.name,
				variant = if IsMigratedFunction(UseMemoResult1.name) then Uiblox[UseMemoResult1.name].variant else UseMemoResult1.variant,
				size = UseTabItemVariantsModuleResult.icon.size,
				style = Default
			})
		else
			local IconScaleModule, IconScaleModule2 = GetIconScaleModule(UseMemoResult1.name, UseTabItemVariantsModuleResult.icon.size)
			
			if IconScaleModule then
				Element = ReactModule.createElement(ImageModule, {
					Image = UseMemoResult1.name,
					Size = UDim2.fromOffset(IconScaleModule.X, IconScaleModule.Y),
					imageStyle = Default,
					scale = IconScaleModule2
				})
			end
		end
	end
	return ReactModule.createElement(ViewModule, {
		tag = UseTabItemVariantsModuleResult.container.tag,
		GroupTransparency = if p1.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
		testId = p1.testId
	}, {
		Interactive = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 1),
			onActivated = function() --[[ Line: 126 ]]
				-- upvalues: p1 (copy)
				p1.onActivated(p1.id)
			end,
			selection = { Selectable = not p1.isDisabled },
			cursor = UseMemoResult,
			isDisabled = p1.isDisabled,
			ref = Ref
		}),
		Content = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = UseTabItemVariantsModuleResult.content.tag,
			Size = UseTabItemVariantsModuleResult.content.Size
		}, {
			Icon = if p1.icon then Element else nil,
			Text = ReactModule.createElement(TextModule, {
				LayoutOrder = 2,
				Text = p1.text,
				style = Default,
				tag = UseTabItemVariantsModuleResult.text.tag
			}),
			Indicator = if p1.indicator then ReactModule.createElement(StatusIndicatorModule, if p1.indicator.value then {
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