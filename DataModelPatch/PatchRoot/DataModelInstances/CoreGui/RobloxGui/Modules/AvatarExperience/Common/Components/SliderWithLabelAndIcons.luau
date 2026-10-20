local CorePackages = game:GetService("CorePackages")
local FoundationModule = require(CorePackages.Packages.Foundation)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local MutedErrorModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.mutedError)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local SystemSlider = UIBloxModule.App.Slider.SystemSlider
local FFlagAXMigrateSystemSliderToFoundationSlider = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateSystemSliderToFoundationSlider
local FFlagAXMakeSlidersSmoothWithGamepad = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMakeSlidersSmoothWithGamepad
local SliderWithLabelAndIcons = RoactModule.PureComponent:extend("SliderWithLabelAndIcons")
SliderWithLabelAndIcons.validateProps = TModule.strictInterface({
	layoutOrder = TModule.number,
	text = TModule.string,
	leftIcon = TModule.table,
	rightIcon = TModule.table,
	value = TModule.number,
	onSliderChanged = TModule.callback,
	min = TModule.number,
	max = TModule.number,
	baseRef = TModule.table,
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table)
})

function SliderWithLabelAndIcons.init(p1)
	-- upvalues: RoactModule (copy), FFlagAXMigrateSystemSliderToFoundationSlider (copy), MutedErrorModule (copy)
	p1.sliderRef = RoactModule.createRef()
	
	if FFlagAXMigrateSystemSliderToFoundationSlider then
		function p1.convertPositionValueToSliderValue(p2, Min, Max)
			-- upvalues: MutedErrorModule (upval)
			if Max <= Min then
				MutedErrorModule("SliderWithLabelAndIcons.lua convertPositionValueToSliderValue argument error: posMaxVal must be greater than posMinVal.")
				
				return 0.5
			else
				return (p2 - Min) / (Max - Min)
			end
		end
		
		function p1.convertSliderValueToPositionValue(p2, Min, Max)
			return p2 * (Max - Min) + Min
		end
	end
end

function SliderWithLabelAndIcons.render(p1)
	-- upvalues: WithStyleFunction (copy), FFlagAXMigrateSystemSliderToFoundationSlider (copy), RoactModule (copy), ImageSetLabel (copy), FoundationModule (copy), FFlagAXMakeSlidersSmoothWithGamepad (copy), Focusable (copy), SystemSlider (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: FFlagAXMigrateSystemSliderToFoundationSlider (upval), RoactModule (upval), p1 (copy), ImageSetLabel (upval), FoundationModule (upval), FFlagAXMakeSlidersSmoothWithGamepad (upval), Focusable (upval), SystemSlider (upval)
		local _Font = p2.Font
		local ScaledRelativeSize = _Font.CaptionHeader.RelativeSize * _Font.BaseSize
		local CaptionHeaderFont = _Font.CaptionHeader.Font
		local XOffset = 50 - ScaledRelativeSize
		
		return if FFlagAXMigrateSystemSliderToFoundationSlider then RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(0.9, 0, 0, 50),
			LayoutOrder = p1.props.layoutOrder
		}, {
			TopFrame = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, ScaledRelativeSize)
			}, {
				SliderLabel = RoactModule.createElement("TextLabel", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Text = p1.props.text,
					Size = UDim2.new(1, -2 * XOffset, 1, 0),
					Position = UDim2.fromOffset(XOffset, 0),
					TextColor3 = p2.Theme.TextEmphasis.Color,
					Font = CaptionHeaderFont,
					TextSize = ScaledRelativeSize,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			BottomFrame = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, XOffset),
				Position = UDim2.fromOffset(0, ScaledRelativeSize)
			}, {
				LeftIcon = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = p1.props.leftIcon,
					Size = UDim2.fromOffset(XOffset, XOffset),
					Position = UDim2.fromOffset(0, 0),
					ImageColor3 = p2.Theme.TextEmphasis.Color
				}),
				SliderBar = RoactModule.createElement(FoundationModule.Slider, {
					range = NumberRange.new(0, 1),
					value = p1.convertPositionValueToSliderValue(p1.props.value, p1.props.min, p1.props.max),
					onValueChanged = function(p3)
						-- upvalues: p1 (upval)
						p1.props.onSliderChanged((p1.convertSliderValueToPositionValue(p3, p1.props.min, p1.props.max)))
					end,
					width = UDim.new(1, -2 * XOffset),
					Position = UDim2.new(0, XOffset, 0, 4),
					anchorPoint = Vector2.new(0, 0.5),
					NextSelectionUp = p1.props.NextSelectionUp,
					NextSelectionDown = p1.props.NextSelectionDown,
					[RoactModule.Ref] = p1.props.baseRef,
					step = if FFlagAXMakeSlidersSmoothWithGamepad then 0.01 else nil
				}),
				RightIcon = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = p1.props.rightIcon,
					AnchorPoint = Vector2.new(1, 0),
					Size = UDim2.fromOffset(XOffset, XOffset),
					Position = UDim2.fromScale(1, 0),
					ImageColor3 = p2.Theme.TextEmphasis.Color
				})
			})
		}) else RoactModule.createElement(Focusable.Frame, {
			Size = UDim2.new(0.9, 0, 0, 50),
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.layoutOrder,
			defaultChild = p1.sliderRef,
			[RoactModule.Ref] = p1.props.baseRef
		}, {
			TopFrame = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, ScaledRelativeSize)
			}, {
				SliderLabel = RoactModule.createElement("TextLabel", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Text = p1.props.text,
					Size = UDim2.new(1, -2 * XOffset, 1, 0),
					Position = UDim2.fromOffset(XOffset, 0),
					TextColor3 = p2.Theme.TextEmphasis.Color,
					Font = CaptionHeaderFont,
					TextSize = ScaledRelativeSize,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			BottomFrame = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, XOffset),
				Position = UDim2.fromOffset(0, ScaledRelativeSize)
			}, {
				LeftIcon = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = p1.props.leftIcon,
					Size = UDim2.fromOffset(XOffset, XOffset),
					Position = UDim2.fromOffset(0, 0),
					ImageColor3 = p2.Theme.TextEmphasis.Color
				}),
				SliderBar = RoactModule.createElement(SystemSlider, {
					min = p1.props.min,
					max = p1.props.max,
					stepInterval = 1,
					value = p1.props.value,
					onValueChanged = p1.props.onSliderChanged,
					width = UDim.new(1, -2 * XOffset),
					position = UDim2.new(0, XOffset, 0.5, 0),
					anchorPoint = Vector2.new(0, 0.5),
					NextSelectionUp = p1.props.NextSelectionUp,
					NextSelectionDown = p1.props.NextSelectionDown,
					[RoactModule.Ref] = p1.sliderRef
				}),
				RightIcon = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = p1.props.rightIcon,
					AnchorPoint = Vector2.new(1, 0),
					Size = UDim2.fromOffset(XOffset, XOffset),
					Position = UDim2.fromScale(1, 0),
					ImageColor3 = p2.Theme.TextEmphasis.Color
				})
			})
		})
	end)
end

return SliderWithLabelAndIcons