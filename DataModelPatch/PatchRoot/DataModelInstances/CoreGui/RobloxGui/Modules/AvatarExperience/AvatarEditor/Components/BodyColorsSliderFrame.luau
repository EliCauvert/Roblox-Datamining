local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local InputSize = FoundationModule.Enums.InputSize
local Visibility = FoundationModule.Enums.Visibility
local SliderVariant = FoundationModule.Enums.SliderVariant
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local SystemSlider = UIBloxModule.App.Slider.SystemSlider
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local SelectButtonSliderValueModule = require(Modules.AvatarExperience.AvatarEditor.Selectors.selectButtonSliderValue)
local SetBodyColor3Module = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetBodyColor3)
local UseBodyDataCallbacksContextModule = require(Modules.AvatarExperience.Common.Context.useBodyDataCallbacksContext)
local SelectDefaultTryOnBodyColorsToggledModule = require(Modules.AvatarExperience.Common.Selectors.selectDefaultTryOnBodyColorsToggled)
local ColorPickerVRFix2 = game:DefineFastFlag("ColorPickerVRFix2", false)
local FFlagAXMigrateSystemSliderToFoundationSlider = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateSystemSliderToFoundationSlider
local FFlagAXMakeSlidersSmoothWithGamepad = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMakeSlidersSmoothWithGamepad
local _Color3 = Color3.new(0.75, 0.75, 0.75)
local BodyColorsSliderFrame = RoactModule.PureComponent:extend("BodyColorsSliderFrame")
BodyColorsSliderFrame.validateProps = TModule.strictInterface({
	sliderValue = TModule.number,
	rangeStruct = TModule.optional(TModule.table),
	setBodyColor3 = TModule.optional(TModule.callback),
	setBodyColors = TModule.optional(TModule.callback),
	setAvatarScales = TModule.optional(TModule.callback),
	NextSelectionUp = TModule.optional(TModule.table),
	sliderRef = TModule.optional(TModule.table),
	gridAndSidebarFrameSizeBinding = TModule.union(TModule.UDim2, TModule.table),
	rangeIdForSelectedBodyParts = TModule.optional(TModule.string),
	defaultBodyColorRanges = TModule.optional(TModule.table),
	disabled = TModule.optional(TModule.boolean),
	tokens = if FFlagAXMigrateSystemSliderToFoundationSlider then TModule.table else nil,
	analytics = TModule.table
})

function BodyColorsSliderFrame.init(p1)
	-- upvalues: UtilsModule (copy), ColorPickerVRFix2 (copy), RoactModule (copy)
	p1.state = { sliderValue = p1.props.sliderValue }
	
	function p1.onSliderChanged(SliderValue)
		-- upvalues: UtilsModule (upval), p1 (copy)
		local Color3AtValueForRangeId = UtilsModule.getColor3AtValueForRangeId(p1.props.rangeIdForSelectedBodyParts, SliderValue, p1.props.defaultBodyColorRanges)
		p1:setState({ sliderValue = SliderValue })
		p1.props.setBodyColors(Color3AtValueForRangeId)
	end
	
	function p1.onDragEnd()
		-- upvalues: p1 (copy), UtilsModule (upval)
		if p1.isMounted then
			local SliderValue = p1.state.sliderValue
			local Color3AtValueForRangeId = UtilsModule.getColor3AtValueForRangeId(p1.props.rangeIdForSelectedBodyParts, SliderValue, p1.props.defaultBodyColorRanges)
			p1.props.setBodyColors(nil)
			p1.props.setBodyColor3(Color3AtValueForRangeId, p1.props.rangeIdForSelectedBodyParts, SliderValue, p1.props.analytics)
		end
	end
	
	p1.containerRef = if ColorPickerVRFix2 then nil else RoactModule.createRef()
end

function BodyColorsSliderFrame.didMount(p1)
	p1:setState({ sliderValue = p1.props.sliderValue })
	p1.isMounted = true
end

function BodyColorsSliderFrame.didUpdate(p1, p2)
	if p2.sliderValue ~= p1.props.sliderValue then
		p1:setState({ sliderValue = p1.props.sliderValue })
	end
end

function BodyColorsSliderFrame.getCustomKnobColorLower(p1)
	-- upvalues: UtilsModule (copy)
	return (UtilsModule.getColor3AtValueForRangeId(p1.props.rangeIdForSelectedBodyParts, p1.state.sliderValue, p1.props.defaultBodyColorRanges))
end

if not FFlagAXMigrateSystemSliderToFoundationSlider then
	function BodyColorsSliderFrame.renderTrack(p1)
		-- upvalues: RoactModule (copy), ConstantsModule (copy), _Color3 (copy)
		local RangeStruct = p1.props.rangeStruct
		
		if not RangeStruct then
			return nil
		end
		local ColorSequenceKeypoints = {}
		
		for i, value in RangeStruct.range do
			table.insert(ColorSequenceKeypoints, (ColorSequenceKeypoint.new((i - 1) / (#RangeStruct.range - 1), value)))
		end
		return RoactModule.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 0, ConstantsModule.BodyColorsSliderTrackHeight),
			Position = UDim2.fromScale(0.5, 0.5),
			BackgroundColor3 = _Color3
		}, {
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
			TrackContent = RoactModule.createElement("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, -2, 0, ConstantsModule.BodyColorsSliderTrackHeight - 2),
				Position = UDim2.fromScale(0.5, 0.5),
				BackgroundColor3 = Color3.new(1, 1, 1)
			}, {
				UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
				UIGradient = RoactModule.createElement("UIGradient", { Color = ColorSequence.new(ColorSequenceKeypoints) })
			})
		})
	end
end
function BodyColorsSliderFrame.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithProviders(p2)
	end)
end

function BodyColorsSliderFrame.renderWithProviders(p1, p2)
	-- upvalues: FFlagAXMigrateSystemSliderToFoundationSlider (copy), RoactModule (copy), ConstantsModule (copy), ColorPickerVRFix2 (copy), ReactModule (copy), FoundationModule (copy), InputSize (copy), SliderVariant (copy), Visibility (copy), FFlagAXMakeSlidersSmoothWithGamepad (copy), SystemSlider (copy), _Color3 (copy)
	local Theme = p2.Theme
	local SliderValue = p1.state.sliderValue
	
	if not FFlagAXMigrateSystemSliderToFoundationSlider then
		return RoactModule.createElement("Frame", {
			Size = p1.props.gridAndSidebarFrameSizeBinding:map(function(p3): UDim2
				-- upvalues: ConstantsModule (upval)
				return UDim2.new(1, -2 * ConstantsModule.SkinColorSliderPadding, 0, -p3.Y.Offset)
			end),
			Position = p1.props.gridAndSidebarFrameSizeBinding:map(function(p3): UDim2
				-- upvalues: ConstantsModule (upval)
				return UDim2.new(0, ConstantsModule.SkinColorSliderPadding, 1, p3.Y.Offset)
			end),
			BorderSizePixel = 0,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			[RoactModule.Ref] = if ColorPickerVRFix2 then nil else p1.containerRef
		}, {
			Divider1 = RoactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundColor3 = Theme.Divider.Color,
				BackgroundTransparency = Theme.Divider.Transparency
			}),
			SliderBar = RoactModule.createElement(SystemSlider, {
				min = 0,
				max = 1,
				stepInterval = 0.01,
				value = SliderValue,
				isDisabled = p1.props.disabled,
				onValueChanged = p1.onSliderChanged,
				onDragEnd = p1.onDragEnd,
				width = UDim.new(1, 0),
				position = UDim2.new(0.5, 0, 0, ConstantsModule.BodyColorsSliderFrameHeight / 2),
				anchorPoint = Vector2.new(0.5, 0.5),
				customTrack = p1:renderTrack(),
				customKnobColorLower = p1:getCustomKnobColorLower(),
				customPressedKnobShadowTransparencyLower = 0.5,
				customKnobBorderSize = 1,
				customKnobBorderColor = _Color3,
				[RoactModule.Ref] = p1.props.sliderRef,
				NextSelectionUp = p1.props.NextSelectionUp,
				containerRef = if ColorPickerVRFix2 then nil else p1.containerRef
			})
		})
	end
	local Tokens = p1.props.tokens
	local RangeStruct = p1.props.rangeStruct
	
	if not RangeStruct then
		return nil
	end
	local ColorSequenceKeypoints = {}
	
	for i, value in RangeStruct.range do
		table.insert(ColorSequenceKeypoints, (ColorSequenceKeypoint.new((i - 1) / (#RangeStruct.range - 1), value)))
	end
	return RoactModule.createElement("Frame", {
		Size = p1.props.gridAndSidebarFrameSizeBinding:map(function(p3): UDim2
			-- upvalues: ConstantsModule (upval)
			return UDim2.new(1, -2 * ConstantsModule.SkinColorSliderPadding, 0, -p3.Y.Offset)
		end),
		Position = p1.props.gridAndSidebarFrameSizeBinding:map(function(p3): UDim2
			-- upvalues: ConstantsModule (upval)
			return UDim2.new(0, ConstantsModule.SkinColorSliderPadding, 1, p3.Y.Offset)
		end),
		BorderSizePixel = 0,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		[RoactModule.Ref] = if ColorPickerVRFix2 then nil else p1.containerRef
	}, {
		Divider1 = RoactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = Theme.Divider.Color,
			BackgroundTransparency = Theme.Divider.Transparency
		}),
		SliderBar = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-y size-full-0 radius-circle stroke-standard stroke-emphasis",
			backgroundStyle = Tokens.Color.Extended.White.White_100,
			Position = UDim2.new(0, 0, 0, ConstantsModule.BodyColorsSliderFrameHeight / 2),
			containerRef = if ColorPickerVRFix2 then nil else p1.containerRef
		}, {
			Gradient = ReactModule.createElement("UIGradient", { Color = ColorSequence.new(ColorSequenceKeypoints) }),
			ColorSlider = ReactModule.createElement(FoundationModule.Slider, {
				isContained = true,
				value = SliderValue,
				range = NumberRange.new(0, 1),
				size = InputSize.Medium,
				variant = SliderVariant.Utility,
				isDisabled = p1.props.disabled,
				knob = ReactModule.createElement(FoundationModule.Knob, {
					hasShadow = true,
					size = InputSize.Medium,
					style = {
						Transparency = 0.5,
						Color3 = p1:getCustomKnobColorLower()
					},
					stroke = {
						Color = Tokens.Color.System.Neutral.Color3,
						Transparency = Tokens.Color.System.Neutral.Transparency,
						Thickness = Tokens.Stroke.Thick
					}
				}),
				knobVisibility = Visibility.Always,
				onValueChanged = p1.onSliderChanged,
				width = UDim.new(1, 0),
				onDragEnded = p1.onDragEnd,
				ref = p1.props.sliderRef,
				NextSelectionUp = p1.props.NextSelectionUp,
				step = if FFlagAXMakeSlidersSmoothWithGamepad then 0.01 else nil
			})
		})
	})
end

function BodyColorsSliderFrame.willUnmount(p3)
	p3.isMounted = false
end

local v1 = RoactRoduxModule.connect(function(p3, p4)
	-- upvalues: UtilsModule (copy), SelectDefaultTryOnBodyColorsToggledModule (copy), SelectButtonSliderValueModule (copy)
	local AvatarExperience = p3.AvatarExperience
	local DefaultBodyColorRanges = p4.defaultBodyColorRanges
	local RangeIdForSelectedBodyParts = p4.rangeIdForSelectedBodyParts
	assert(RangeIdForSelectedBodyParts, "rangeIdForSelectedBodyParts ~= nil.")
	local RangeStructForRangeId = UtilsModule.getRangeStructForRangeId(RangeIdForSelectedBodyParts, DefaultBodyColorRanges)
	assert(RangeStructForRangeId, "rangeStruct ~= nil.")
	local SelectDefaultTryOnBodyColorsToggledModuleResult = SelectDefaultTryOnBodyColorsToggledModule(p3)
	
	return {
		rangeStruct = RangeStructForRangeId,
		sliderValue = if SelectDefaultTryOnBodyColorsToggledModuleResult then 0.5 else SelectButtonSliderValueModule(AvatarExperience, RangeIdForSelectedBodyParts),
		disabled = SelectDefaultTryOnBodyColorsToggledModuleResult
	}
end, function(Callback)
	-- upvalues: SetBodyColor3Module (copy)
	return {
		setBodyColor3 = function(p3, p4, p5, p6)
			-- upvalues: Callback (copy), SetBodyColor3Module (upval)
			Callback(SetBodyColor3Module(p3, p4, p5, p6))
		end
	}
end)((RoactServices.connect({ analytics = AnalyticsModule })(BodyColorsSliderFrame)))

return function(p3)
	-- upvalues: UseBodyDataCallbacksContextModule (copy), CryoModule (copy), FFlagAXMigrateSystemSliderToFoundationSlider (copy), UseTokensFunction (copy), ReactModule (copy), v1 (ref)
	local JoinResult = CryoModule.Dictionary.join(UseBodyDataCallbacksContextModule(), p3)
	
	if FFlagAXMigrateSystemSliderToFoundationSlider then
		JoinResult = CryoModule.Dictionary.join({ tokens = UseTokensFunction() }, JoinResult)
	end
	return ReactModule.createElement(v1, JoinResult)
end