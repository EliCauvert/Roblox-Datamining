local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local UseMotionFunction = require(Parent.Motion).useMotion
local Components = Foundation.Components
local IconModule = require(Components.Icon)
local TextModule = require(Components.Text)
local _ = require(Components.Types)
local ViewModule = require(Components.View)
local ConstantsModule = require(Foundation.Constants)
local EscapeRichTextModule = require(Foundation.Utility.escapeRichText)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseOptionSelectorGroupItemMotionStatesModule = require(script.Parent.useOptionSelectorGroupItemMotionStates)
local UseOptionSelectorGroupItemVariantsModule = require(script.Parent.useOptionSelectorGroupItemVariants)
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local OrientationModule = require(Foundation.Enums.Orientation)
local UseOptionSelectorGroupModule = require(script.Parent.Parent.useOptionSelectorGroup)

local function _(p1, p2)
	return p2:map(function(p3)
		-- upvalues: p1 (copy)
		return if p1 == nil then p3 else p1 + (1 - p1) * p3
	end)
end

local function getTextStyle(TextTransparency, Transparency, ContentColor)
	-- upvalues: ReactModule (copy)
	return ReactModule.joinBindings({ TextTransparency, Transparency }):map(function(Entry)
		-- upvalues: ContentColor (copy)
		return { Color3 = ContentColor, Transparency = Entry[2] }
	end)
end

local config = {
	isDisabled = false,
	size = require(Foundation.Enums.InputSize).Medium,
	width = UDim.new(0, 0)
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseOptionSelectorGroupModule (copy), OrientationModule (copy), FillBehaviorModule (copy), UseTokensModule (copy), UseOptionSelectorGroupItemVariantsModule (copy), UseOptionSelectorGroupItemMotionStatesModule (copy), ConstantsModule (copy), UseMotionFunction (copy), ReactModule (copy), TextModule (copy), EscapeRichTextModule (copy), getTextStyle (copy), ViewModule (copy), WithCommonPropsModule (copy), IconModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseOptionSelectorGroupModuleResult = UseOptionSelectorGroupModule()
	local IsValueMatch = UseOptionSelectorGroupModuleResult.value == WithDefaultsModuleResult.value
	local Label = WithDefaultsModuleResult.label or WithDefaultsModuleResult.value
	local Horizontal = if UseOptionSelectorGroupModuleResult.orientation == OrientationModule.Vertical then OrientationModule.Horizontal else OrientationModule.Vertical
	local Fit = if Horizontal == OrientationModule.Horizontal then FillBehaviorModule.Fit else WithDefaultsModuleResult.fillBehavior or FillBehaviorModule.Fill
	local _UDim2 = UDim2.fromScale(1, 0)
	local UseTokensModuleResult = UseTokensModule()
	local UseOptionSelectorGroupItemVariantsModuleResult = UseOptionSelectorGroupItemVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size)
	local ContentColor3 = UseOptionSelectorGroupItemVariantsModuleResult.content.Color3
	local Contrast = if IsValueMatch then UseTokensModuleResult.Color.System.Contrast else UseTokensModuleResult.Color.Stroke.Emphasis
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
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseOptionSelectorGroupItemVariantsModuleResult (copy), UseTokensModuleResult (copy)
		return {
			radius = UDim.new(0, UseOptionSelectorGroupItemVariantsModuleResult.container.radius),
			offset = UseTokensModuleResult.Size.Size_200,
			borderWidth = UseTokensModuleResult.Stroke.Thicker
		}
	end, {
		UseTokensModuleResult,
		UseOptionSelectorGroupItemVariantsModuleResult.container.radius
	})
	local Element = ReactModule.createElement(TextModule, {
		TextWrapped = true,
		RichText = true,
		LayoutOrder = 2,
		Text = EscapeRichTextModule(Label),
		TextXAlignment = Enum.TextXAlignment.Left,
		tag = UseOptionSelectorGroupItemVariantsModuleResult.label.tag,
		textStyle = getTextStyle(UseMotionResult1.textTransparency, UseMotionResult.transparency, ContentColor3)
	})
	local Transparency = Contrast.Transparency
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		stroke = {
			Color = Contrast.Color3,
			Transparency = UseMotionResult.transparency:map(function(p2)
				-- upvalues: Transparency (copy)
				return if Transparency == nil then p2 else Transparency + (1 - Transparency) * p2
			end)
		},
		Size = _UDim2,
		selection = {
			Selectable = not WithDefaultsModuleResult.isDisabled and UseOptionSelectorGroupModuleResult.Selectable
		},
		cursor = UseMemoResult,
		onActivated = UseResult,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		tag = {
			["auto-xy"] = Fit ~= FillBehaviorModule.Fill,
			["fill auto-y"] = Fit == FillBehaviorModule.Fill,
			[UseOptionSelectorGroupItemVariantsModuleResult.container.tag] = true
		},
		ref = Ref
	}), {
		ItemInner = ReactModule.createElement(ViewModule, {
			tag = UseOptionSelectorGroupItemVariantsModuleResult.itemInner.tag,
			Size = _UDim2
		}, {
			IconRow = ReactModule.createElement(ViewModule, {
				tag = "row align-y-center gap-small size-full-0 auto-y",
				LayoutOrder = 1
			}, {
				Icon = if WithDefaultsModuleResult.icon then ReactModule.createElement(IconModule, {
					LayoutOrder = 0,
					name = WithDefaultsModuleResult.icon,
					size = UseOptionSelectorGroupItemVariantsModuleResult.icon.size,
					style = UseMotionResult.transparency:map(function(Transparency)
						-- upvalues: ContentColor3 (copy)
						return { Color3 = ContentColor3, Transparency = Transparency }
					end)
				}) else nil,
				Label = if Horizontal == OrientationModule.Horizontal then Element else ReactModule.createElement(ViewModule, { tag = "grow" }),
				Checkmark = ReactModule.createElement(IconModule, {
					name = "check-large",
					LayoutOrder = 3,
					size = UseOptionSelectorGroupItemVariantsModuleResult.icon.size,
					style = UseMotionResult.transparency:map(function(p2)
						-- upvalues: ContentColor3 (copy), IsValueMatch (copy)
						return {
							Color3 = ContentColor3,
							Transparency = if IsValueMatch then p2 else 1
						}
					end)
				})
			}),
			Label = if Horizontal == OrientationModule.Vertical then Element else nil,
			Metadata = if WithDefaultsModuleResult.metadata then ReactModule.createElement(TextModule, {
				RichText = true,
				LayoutOrder = 3,
				Text = EscapeRichTextModule(WithDefaultsModuleResult.metadata),
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				tag = UseOptionSelectorGroupItemVariantsModuleResult.metadata.tag,
				textStyle = getTextStyle(UseMotionResult1.textTransparency, UseMotionResult.transparency, ContentColor3)
			}) else nil,
			Description = if WithDefaultsModuleResult.description then ReactModule.createElement(TextModule, {
				TextWrapped = true,
				RichText = true,
				LayoutOrder = 4,
				Text = EscapeRichTextModule(WithDefaultsModuleResult.description),
				TextXAlignment = Enum.TextXAlignment.Left,
				tag = UseOptionSelectorGroupItemVariantsModuleResult.description.tag,
				textStyle = getTextStyle(UseMotionResult1.textTransparency, UseMotionResult.transparency, ContentColor3)
			}) else nil
		})
	})
end))