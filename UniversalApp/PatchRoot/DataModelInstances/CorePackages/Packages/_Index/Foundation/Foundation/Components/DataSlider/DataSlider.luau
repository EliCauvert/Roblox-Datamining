local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(Foundation.Constants)
local InternalSliderModule = require(Foundation.Components.InternalSlider)
local SliderKnobModule = require(Foundation.Components.InternalSlider.SliderKnob)
local SliderTrackModule = require(Foundation.Components.InternalSlider.SliderTrack)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local GetKnobSizeModule = require(Foundation.Components.Knob.getKnobSize)
local UseIconSizeModule = require(Foundation.Utility.useIconSize)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseSliderValueModule = require(Foundation.Components.InternalSlider.useSliderValue)
local UseSliderVariantsModule = require(Foundation.Components.Slider.useSliderVariants)
local UseTextSizeModule = require(Foundation.Utility.useTextSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local DataSliderAccessoryModule = require(script.Parent.DataSliderAccessory)
local GetDataSliderAccessoryFormModule = require(script.Parent.getDataSliderAccessoryForm)
local IconSizeModule = require(Foundation.Enums.IconSize)
local DataSliderAccessoryPlacementModule = require(Foundation.Enums.DataSliderAccessoryPlacement)
local InputSizeModule = require(Foundation.Enums.InputSize)
local SliderTypeModule = require(Foundation.Enums.SliderType)
local SliderVariantModule = require(Foundation.Enums.SliderVariant)
local VisibilityModule = require(Foundation.Enums.Visibility)

local function _(p1): boolean
	return p1 ~= nil and (p1.text ~= nil or p1.icon ~= nil)
end

local config = {
	isDisabled = false,
	isContained = false,
	testId = "--foundation-data-slider",
	accessoryPlacement = DataSliderAccessoryPlacementModule.Bottom,
	range = NumberRange.new(0, 1),
	size = InputSizeModule.Medium,
	width = UDim.new(1, 0),
	knobVisibility = VisibilityModule.Auto
}

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), SliderTypeModule (copy), DataSliderAccessoryPlacementModule (copy), UseTokensModule (copy), UseSliderVariantsModule (copy), SliderVariantModule (copy), UseSliderValueModule (copy), UseTextSizeModule (copy), UseIconSizeModule (copy), IconSizeModule (copy), UseScaledValueModule (copy), ReactModule (copy), GetDataSliderAccessoryFormModule (copy), GetKnobSizeModule (copy), SliderKnobModule (copy), SliderTrackModule (copy), InternalSliderModule (copy), DataSliderAccessoryModule (copy), WithCommonPropsModule (copy), ViewModule (copy), ConstantsModule (copy), TextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local IsTypeMatch = p1.type == SliderTypeModule.Range
	local AccessoryPlacement = WithDefaultsModuleResult.accessoryPlacement
	local IsAccessoryPlacementMatch = AccessoryPlacement == DataSliderAccessoryPlacementModule.Sides
	local UseTokensModuleResult = UseTokensModule()
	local UseSliderVariantsModuleResult = UseSliderVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.size, SliderVariantModule.Standard, false)
	local UseSliderValueModuleResult = UseSliderValueModule(p1, WithDefaultsModuleResult.range, WithDefaultsModuleResult.testId)
	local UseTextSizeModuleResult = UseTextSizeModule(if IsAccessoryPlacementMatch and WithDefaultsModuleResult.leading then WithDefaultsModuleResult.leading.text else nil, UseTokensModuleResult.Typography.LabelMedium)
	local UseTextSizeModuleResult1 = UseTextSizeModule(if IsAccessoryPlacementMatch and WithDefaultsModuleResult.trailing then WithDefaultsModuleResult.trailing.text else nil, UseTokensModuleResult.Typography.LabelMedium)
	local UseIconSizeModuleResult = UseIconSizeModule(IconSizeModule.Medium, true)
	local UseScaledValueModuleResult = UseScaledValueModule(200)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(1)
	local Leading = WithDefaultsModuleResult.leading
	local HasText: boolean = Leading ~= nil and (Leading.text ~= nil or Leading.icon ~= nil)
	local Leading1 = if HasText then WithDefaultsModuleResult.leading else nil
	local Trailing = WithDefaultsModuleResult.trailing
	local HasText1: boolean = Trailing ~= nil and (Trailing.text ~= nil or Trailing.icon ~= nil)
	local Trailing1 = if HasText1 then WithDefaultsModuleResult.trailing else nil
	local Accessories = {}
	local list = { Leading1, Trailing1 }
	local list1 = { UseTextSizeModuleResult, UseTextSizeModuleResult1 }
	
	for i = 1, 2 do
		local Entry = list[i]
		
		if Entry then
			local Entry1 = list1[i]
			table.insert(Accessories, {
				hasText = Entry.text ~= nil,
				hasIcon = Entry.icon ~= nil,
				textWidth = if Entry1 then Entry1.X else nil
			})
		end
	end
	local DataSliderAccessoryFormModule = if UseStateResult and #Accessories > 0 then GetDataSliderAccessoryFormModule({
		width = UseStateResult / UseStateResult1,
		textMinTrackWidth = UseScaledValueModuleResult,
		accessoryMinTrackWidth = UseTokensModuleResult.Size.Size_3000,
		isSides = IsAccessoryPlacementMatch,
		gap = UseTokensModuleResult.Gap.Small,
		iconWidth = UseIconSizeModuleResult.X.Offset,
		accessories = Accessories
	}) else "Text"
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy), WithDefaultsModuleResult (copy)
		UseStateResult2(Frame.AbsoluteSize.X)
		
		if WithDefaultsModuleResult.onAbsoluteSizeChanged then
			WithDefaultsModuleResult.onAbsoluteSizeChanged(Frame)
		end
	end, { WithDefaultsModuleResult.onAbsoluteSizeChanged })
	local Offset = GetKnobSizeModule(UseTokensModuleResult, WithDefaultsModuleResult.size).Y.Offset
	local Element = ReactModule.createElement(InternalSliderModule, {
		LayoutOrder = 2,
		thumbs = UseSliderValueModuleResult.thumbs,
		onValueChanged = UseSliderValueModuleResult.onValueChanged,
		renderThumb = ReactModule.useCallback(function(p2, p3)
			-- upvalues: ReactModule (upval), SliderKnobModule (upval), WithDefaultsModuleResult (copy), UseSliderVariantsModuleResult (copy), UseSliderValueModuleResult (copy)
			return ReactModule.createElement(SliderKnobModule, {
				size = WithDefaultsModuleResult.size,
				variant = UseSliderVariantsModuleResult.knob,
				isVisible = p3.isVisible,
				isDragging = p3.isDragging,
				testId = `{UseSliderValueModuleResult.thumbs[p2].testId}--knob`
			})
		end, {
			WithDefaultsModuleResult.size,
			UseSliderVariantsModuleResult,
			UseSliderValueModuleResult.thumbs
		}),
		renderTrack = ReactModule.useCallback(function(ThumbSpan)
			-- upvalues: ReactModule (upval), SliderTrackModule (upval), UseSliderVariantsModuleResult (copy), IsTypeMatch (copy), UseSliderValueModuleResult (copy), WithDefaultsModuleResult (copy)
			return ReactModule.createElement(SliderTrackModule, {
				isVertical = false,
				bar = UseSliderVariantsModuleResult.bar,
				fill = UseSliderVariantsModuleResult.fill,
				isRange = IsTypeMatch,
				thumbSpan = ThumbSpan,
				singleValue = UseSliderValueModuleResult.singleValue,
				range = WithDefaultsModuleResult.range,
				testId = WithDefaultsModuleResult.testId
			})
		end, {
			WithDefaultsModuleResult.range,
			WithDefaultsModuleResult.testId,
			IsTypeMatch,
			UseSliderValueModuleResult.singleValue,
			UseSliderVariantsModuleResult
		}),
		range = WithDefaultsModuleResult.range,
		step = WithDefaultsModuleResult.step,
		size = WithDefaultsModuleResult.size,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		isContained = WithDefaultsModuleResult.isContained,
		knobVisibility = WithDefaultsModuleResult.knobVisibility,
		onDragStarted = WithDefaultsModuleResult.onDragStarted,
		onDragEnded = WithDefaultsModuleResult.onDragEnded,
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame: Frame)
			-- upvalues: Offset (copy), UseStateResult2_1 (copy)
			if Offset > 0 and Frame.AbsoluteSize.Y > 0 then
				UseStateResult2_1(Frame.AbsoluteSize.Y / Offset)
			end
		end, { Offset }),
		testId = `{WithDefaultsModuleResult.testId}--slider`
	})
	local Element1 = if Leading1 and DataSliderAccessoryFormModule ~= "Hidden" then ReactModule.createElement(DataSliderAccessoryModule, {
		position = "Leading",
		LayoutOrder = 1,
		text = Leading1.text,
		icon = if typeof(Leading1.icon) == "table" then Leading1.icon.name else Leading1.icon,
		iconVariant = if typeof(Leading1.icon) == "table" then Leading1.icon.variant else nil,
		form = DataSliderAccessoryFormModule,
		placement = AccessoryPlacement,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		testId = `{WithDefaultsModuleResult.testId}--leading`
	}) else nil
	local Element2 = if Trailing1 and DataSliderAccessoryFormModule ~= "Hidden" then ReactModule.createElement(DataSliderAccessoryModule, {
		position = "Trailing",
		LayoutOrder = 3,
		text = Trailing1.text,
		icon = if typeof(Trailing1.icon) == "table" then Trailing1.icon.name else Trailing1.icon,
		iconVariant = if typeof(Trailing1.icon) == "table" then Trailing1.icon.variant else nil,
		form = DataSliderAccessoryFormModule,
		placement = AccessoryPlacement,
		isDisabled = WithDefaultsModuleResult.isDisabled,
		testId = `{WithDefaultsModuleResult.testId}--trailing`
	}) else nil
	local IsNotAccessoryPlacementMatch: boolean = WithDefaultsModuleResult.label ~= nil and (WithDefaultsModuleResult.label ~= "" and AccessoryPlacement ~= DataSliderAccessoryPlacementModule.Top)
	local HasElement: boolean = not IsAccessoryPlacementMatch and (Element1 ~= nil or Element2 ~= nil)
	local WithCommonPropsModuleResult = WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = "col gap-xsmall auto-y",
		Size = UDim2.new(WithDefaultsModuleResult.width, UDim.new()),
		ref = Ref
	})
	WithCommonPropsModuleResult.onAbsoluteSizeChanged = UseResult
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModuleResult, {
		Label = if IsNotAccessoryPlacementMatch then ReactModule.createElement(ViewModule, {
			tag = "size-full-0 auto-y padding-bottom-small",
			LayoutOrder = 1,
			GroupTransparency = if WithDefaultsModuleResult.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
			testId = `{WithDefaultsModuleResult.testId}--label-container`
		}, {
			Text = ReactModule.createElement(TextModule, {
				tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis",
				Text = WithDefaultsModuleResult.label,
				testId = `{WithDefaultsModuleResult.testId}--label`
			})
		}) else nil,
		Track = if IsAccessoryPlacementMatch then ReactModule.createElement(ViewModule, {
			tag = "row align-y-center gap-small size-full-0 auto-y",
			LayoutOrder = 2
		}, {
			Leading = Element1,
			Slider = ReactModule.createElement(ViewModule, { tag = "fill auto-y", LayoutOrder = 2 }, { Slider = Element }),
			Trailing = Element2
		}) else Element,
		Accessories = if HasElement then ReactModule.createElement(ViewModule, {
			tag = "row gap-xsmall size-full-0 auto-y",
			LayoutOrder = if AccessoryPlacement == DataSliderAccessoryPlacementModule.Top then 1 else 3
		}, { Leading = Element1, Trailing = Element2 }) else nil
	})
end)