local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local UseMotionFunction = require(Parent.Motion).useMotion
local Components = Foundation.Components
local IconModule = require(Components.Icon)
local ImageModule = require(Components.Image)
local TextModule = require(Components.Text)
local _ = require(Components.Types)
local ViewModule = require(Components.View)
local ConstantsModule = require(Foundation.Constants)
local EscapeRichTextModule = require(Foundation.Utility.escapeRichText)
local IconMigrationUtilsModule = require(Foundation.Utility.iconMigrationUtils)
local IsBuilderOrMigratedIconFunction = IconMigrationUtilsModule.isBuilderOrMigratedIcon
local NormalizeIconNameFunction = IconMigrationUtilsModule.normalizeIconName
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseOptionSelectorGroupItemMotionStatesModule = require(script.Parent.useOptionSelectorGroupItemMotionStates)
local UseOptionSelectorGroupItemVariantsModule = require(script.Parent.useOptionSelectorGroupItemVariants)
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local _ = require(Foundation.Enums.IconSize)
local InputSizeModule = require(Foundation.Enums.InputSize)
local OptionSelectorGroupSizeModule = require(Foundation.Enums.OptionSelectorGroupSize)
local OrientationModule = require(Foundation.Enums.Orientation)
local UseOptionSelectorGroupModule = require(script.Parent.Parent.useOptionSelectorGroup)

local function _(p1, p2)
	return p2:map(function(p3)
		-- upvalues: p1 (copy)
		return if p1 == nil then p3 else p1 + (1 - p1) * p3
	end)
end

local function getTextStyle(TextTransparency, Transparency, SupportingContentColor)
	-- upvalues: ReactModule (copy)
	return ReactModule.joinBindings({ TextTransparency, Transparency }):map(function(Entry)
		-- upvalues: SupportingContentColor (copy)
		return { Color3 = SupportingContentColor, Transparency = Entry[2] }
	end)
end

local function renderIcon(p1)
	-- upvalues: IsBuilderOrMigratedIconFunction (copy), ReactModule (copy), ImageModule (copy), NormalizeIconNameFunction (copy), IconModule (copy)
	if not p1.icon then
		return nil
	end
	if not IsBuilderOrMigratedIconFunction(p1.icon) then
		local IconExtent = p1.iconExtent
		
		return ReactModule.createElement(ImageModule, {
			Image = p1.icon,
			Size = UDim2.fromOffset(IconExtent, IconExtent),
			imageStyle = p1.transparency:map(function(Transparency)
				-- upvalues: p1 (copy)
				return { Color3 = p1.contentColor, Transparency = Transparency }
			end),
			LayoutOrder = p1.layoutOrder,
			testId = `{p1.testId}--icon`
		})
	end
	local NormalizeIconNameResult = NormalizeIconNameFunction(p1.icon)
	local config = {
		name = NormalizeIconNameResult.name,
		size = p1.iconSize,
		style = p1.transparency:map(function(Transparency)
			-- upvalues: p1 (copy)
			return { Color3 = p1.contentColor, Transparency = Transparency }
		end),
		LayoutOrder = p1.layoutOrder,
		testId = `{p1.testId}--icon`
	}
	
	if NormalizeIconNameResult.variant then
		config.variant = NormalizeIconNameResult.variant
	end
	return ReactModule.createElement(IconModule, config)
end

local config = {
	isDisabled = false,
	size = InputSizeModule.Medium,
	width = UDim.new(0, 0)
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseOptionSelectorGroupModule (copy), InputSizeModule (copy), OptionSelectorGroupSizeModule (copy), OrientationModule (copy), FillBehaviorModule (copy), UseTokensModule (copy), UseOptionSelectorGroupItemVariantsModule (copy), UseOptionSelectorGroupItemMotionStatesModule (copy), ConstantsModule (copy), UseMotionFunction (copy), ReactModule (copy), renderIcon (copy), ViewModule (copy), TextModule (copy), EscapeRichTextModule (copy), getTextStyle (copy), WithCommonPropsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseOptionSelectorGroupModuleResult = UseOptionSelectorGroupModule()
	local IsValueMatch = UseOptionSelectorGroupModuleResult.value == WithDefaultsModuleResult.value
	local Horizontal = if UseOptionSelectorGroupModuleResult.orientation == OrientationModule.Vertical then OrientationModule.Horizontal else OrientationModule.Vertical
	local FillBehavior = if UseOptionSelectorGroupModuleResult.fillBehavior == nil then WithDefaultsModuleResult.fillBehavior else UseOptionSelectorGroupModuleResult.fillBehavior
	local Fill = if Horizontal == OrientationModule.Horizontal then FillBehaviorModule.Fill else FillBehavior or FillBehaviorModule.Fit
	local IsFillMatch: boolean = Horizontal == OrientationModule.Vertical and Fill == FillBehaviorModule.Fit
	local _UDim2 = if IsFillMatch then nil else UDim2.fromScale(1, 0)
	local UseTokensModuleResult = UseTokensModule()
	local UseOptionSelectorGroupItemVariantsModuleResult = UseOptionSelectorGroupItemVariantsModule(UseTokensModuleResult, if UseOptionSelectorGroupModuleResult.size == nil then if WithDefaultsModuleResult.size == InputSizeModule.Large then OptionSelectorGroupSizeModule.Medium else WithDefaultsModuleResult.size else UseOptionSelectorGroupModuleResult.size, Horizontal, Fill, IsValueMatch)
	local ContentColor3 = UseOptionSelectorGroupItemVariantsModuleResult.content.Color3
	local SupportingContentColor3 = if UseOptionSelectorGroupItemVariantsModuleResult.supportingContent then UseOptionSelectorGroupItemVariantsModuleResult.supportingContent.Color3 else ContentColor3
	local Stroke = UseOptionSelectorGroupItemVariantsModuleResult.container.stroke
	local UseOptionSelectorGroupItemMotionStatesModuleResult = UseOptionSelectorGroupItemMotionStatesModule(0, ConstantsModule.DISABLED_TRANSPARENCY)
	local UseMotionResult, UseMotionResult2 = UseMotionFunction(UseOptionSelectorGroupItemMotionStatesModuleResult.Default)
	local UseMotionResult1, _ = UseMotionFunction(UseOptionSelectorGroupItemMotionStatesModuleResult.Default)
	ReactModule.useEffect(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseMotionResult2 (copy), UseOptionSelectorGroupItemMotionStatesModuleResult (copy)
		if WithDefaultsModuleResult.isDisabled then
			UseMotionResult2(UseOptionSelectorGroupItemMotionStatesModuleResult.Disabled)
			
			return
		else
			UseMotionResult2(UseOptionSelectorGroupItemMotionStatesModuleResult.Default)
		end
	end, { WithDefaultsModuleResult.isDisabled })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseOptionSelectorGroupModuleResult (copy), WithDefaultsModuleResult (copy)
		UseOptionSelectorGroupModuleResult.onValueChanged(if UseOptionSelectorGroupModuleResult.value == WithDefaultsModuleResult.value then nil else WithDefaultsModuleResult.value)
	end, {
		WithDefaultsModuleResult.isDisabled,
		WithDefaultsModuleResult.value,
		UseOptionSelectorGroupModuleResult.onValueChanged,
		UseOptionSelectorGroupModuleResult.value
	})
	WithDefaultsModuleResult.testId = `{UseOptionSelectorGroupModuleResult.testId}--item-{WithDefaultsModuleResult.value}`
	local Transparency = Stroke.Transparency
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		stroke = {
			Color = Stroke.Color3,
			Transparency = UseMotionResult.transparency:map(function(p2)
				-- upvalues: Transparency (copy)
				return if Transparency == nil then p2 else Transparency + (1 - Transparency) * p2
			end)
		},
		Size = _UDim2,
		padding = UseOptionSelectorGroupItemVariantsModuleResult.container.padding,
		selection = {
			Selectable = not WithDefaultsModuleResult.isDisabled and UseOptionSelectorGroupModuleResult.Selectable
		},
		cursor = ReactModule.useMemo(function()
			-- upvalues: UseOptionSelectorGroupItemVariantsModuleResult (copy), UseTokensModuleResult (copy)
			return {
				radius = UDim.new(0, UseOptionSelectorGroupItemVariantsModuleResult.container.radius),
				offset = UseTokensModuleResult.Size.Size_200,
				borderWidth = UseTokensModuleResult.Stroke.Thicker
			}
		end, {
			UseTokensModuleResult,
			UseOptionSelectorGroupItemVariantsModuleResult.container.radius
		}),
		onActivated = UseResult,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		tag = UseOptionSelectorGroupItemVariantsModuleResult.container.tag,
		ref = Ref
	}), {
		ItemInner = ReactModule.createElement(ViewModule, {
			tag = UseOptionSelectorGroupItemVariantsModuleResult.itemInner.tag,
			Size = _UDim2,
			testId = `{WithDefaultsModuleResult.testId}--content`
		}, {
			Icon = renderIcon({
				layoutOrder = 1,
				icon = WithDefaultsModuleResult.icon,
				iconExtent = UseOptionSelectorGroupItemVariantsModuleResult.icon.extent,
				iconSize = UseOptionSelectorGroupItemVariantsModuleResult.icon.size,
				contentColor = ContentColor3,
				transparency = UseMotionResult.transparency,
				testId = WithDefaultsModuleResult.testId
			}),
			Text = ReactModule.createElement(ViewModule, {
				LayoutOrder = 2,
				tag = UseOptionSelectorGroupItemVariantsModuleResult.textContainer.tag,
				testId = `{WithDefaultsModuleResult.testId}--body`
			}, {
				Label = ReactModule.createElement(TextModule, {
					TextWrapped = true,
					RichText = true,
					LayoutOrder = 1,
					Text = EscapeRichTextModule(WithDefaultsModuleResult.label or WithDefaultsModuleResult.value),
					TextXAlignment = Enum.TextXAlignment.Left,
					tag = UseOptionSelectorGroupItemVariantsModuleResult.label.tag,
					textStyle = getTextStyle(UseMotionResult1.textTransparency, UseMotionResult.transparency, ContentColor3),
					testId = `{WithDefaultsModuleResult.testId}--label`
				}),
				Metadata = if WithDefaultsModuleResult.metadata then ReactModule.createElement(TextModule, {
					TextWrapped = true,
					RichText = true,
					LayoutOrder = 2,
					Text = EscapeRichTextModule(WithDefaultsModuleResult.metadata),
					TextTruncate = Enum.TextTruncate.None,
					TextXAlignment = Enum.TextXAlignment.Left,
					tag = UseOptionSelectorGroupItemVariantsModuleResult.metadata.tag,
					textStyle = getTextStyle(UseMotionResult1.textTransparency, UseMotionResult.transparency, SupportingContentColor3),
					testId = `{WithDefaultsModuleResult.testId}--metadata`
				}) else nil,
				Description = if WithDefaultsModuleResult.description then ReactModule.createElement(TextModule, {
					TextWrapped = true,
					RichText = true,
					LayoutOrder = 3,
					Text = EscapeRichTextModule(WithDefaultsModuleResult.description),
					TextXAlignment = Enum.TextXAlignment.Left,
					tag = UseOptionSelectorGroupItemVariantsModuleResult.description.tag,
					textStyle = getTextStyle(UseMotionResult1.textTransparency, UseMotionResult.transparency, SupportingContentColor3),
					testId = `{WithDefaultsModuleResult.testId}--description`
				}) else nil
			})
		})
	})
end))