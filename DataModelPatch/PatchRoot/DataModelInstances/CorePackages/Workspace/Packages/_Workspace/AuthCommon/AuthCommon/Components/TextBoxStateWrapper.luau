local Parent = script:FindFirstAncestor("AuthCommon").Parent
local CryoModule = require(Parent.Cryo)
local UIBloxModule = require(Parent.UIBlox)
local RoactModule = require(Parent.Roact)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(Parent.RobloxAppAssets).GetImageData
local WithStyleFunction = UIBloxModule.Style.withStyle
local TextBoxStateWrapper = RoactModule.Component:extend("TextBoxStateWrapper")
TextBoxStateWrapper.defaultProps = {
	TextBoxLabelPadding = 12,
	InnerSidePadding = 0,
	IconSize = UDim2.new(1, 0, 1, 0)
}

function TextBoxStateWrapper.init(p1)
	p1:setState({ Focused = false, Hover = false })
	
	function p1.onMouseEnter()
		-- upvalues: p1 (copy)
		p1:setState({ Hover = true })
	end
	
	function p1.onMouseLeave()
		-- upvalues: p1 (copy)
		p1:setState({ Hover = false })
	end
	
	function p1.onFocused(...)
		-- upvalues: p1 (copy)
		p1:setState({ Focused = true })
		
		if p1.props.ChildProps.onFocused then
			p1.props.ChildProps.onFocused(...)
		end
	end
	
	function p1.onFocusLost(...)
		-- upvalues: p1 (copy)
		p1:setState({ Focused = false })
		
		if p1.props.ChildProps.onFocusLost then
			p1.props.ChildProps.onFocusLost(...)
		end
	end
end

function TextBoxStateWrapper.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ImageSetLabel (copy), GetImageDataFunction (copy), CryoModule (copy)
	local HelpComponent = p1.props.HelpComponent
	local ErrorText = p1.props.ErrorText
	local LabelText = p1.props.LabelText
	
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), LabelText (copy), ImageSetLabel (upval), GetImageDataFunction (upval), CryoModule (upval), ErrorText (copy), HelpComponent (copy)
		local Color = p2.Theme.UIDefault.Color
		local Transparency = p2.Theme.UIDefault.Transparency
		
		if p1.props.ErrorState then
			Color = p2.Theme.Alert.Color
			Transparency = p2.Theme.Alert.Transparency
		elseif p1.state.Focused then
			Color = p2.Theme.IconEmphasis.Color
			Transparency = p2.Theme.IconEmphasis.Transparency
		elseif p1.state.Hover then
			Color = p2.Theme.IconDefault.Color
			Transparency = p2.Theme.IconDefault.Transparency
		end
		return RoactModule.createElement("Frame", {
			AnchorPoint = p1.props.AnchorPoint,
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p1.props.LayoutOrder,
			Position = p1.props.Position,
			Size = UDim2.fromScale(1, 0),
			[RoactModule.Change.AbsolutePosition] = p1.props.onPositionChangedCallback
		}, {
			ListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, p1.props.TextBoxLabelPadding)
			}),
			TextBoxLabel = LabelText and RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = p2.Font.CaptionHeader.Font,
				Size = UDim2.fromScale(1, 0),
				Text = LabelText,
				TextColor3 = p2.Theme.TextEmphasis.Color,
				TextSize = p1.props.TextBoxLabelTextSize,
				TextTransparency = p2.Theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			TextBox = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = p1.props.Size,
				[RoactModule.Ref] = p1.props.buttonRef
			}, {
				Border = RoactModule.createElement(ImageSetLabel, {
					ZIndex = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(9, 9, 9, 9),
					Image = GetImageDataFunction("LuaApp/buttons/buttonStroke") or "LuaApp/buttons/buttonStroke",
					ImageColor3 = Color,
					ImageTransparency = Transparency
				}),
				TextBox = RoactModule.createElement(p1.props.ChildClass, CryoModule.Dictionary.join(p1.props.ChildProps, {
					Size = UDim2.new(1, 0, 1, 0),
					onMouseEnter = p1.onMouseEnter,
					onMouseLeave = p1.onMouseLeave,
					onFocused = p1.onFocused,
					onFocusLost = p1.onFocusLost
				})),
				IconWrapper = p1.props.Icon and RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Size = UDim2.new(1, 0, 1, 0),
					Position = UDim2.new(1, -2, 0, 0),
					AnchorPoint = Vector2.new(1, 0)
				}, {
					AspectRatio = RoactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1 }),
					Icon = RoactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						Size = p1.props.IconSize,
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Image = p1.props.Icon,
						ImageColor3 = Color,
						ImageTransparency = Transparency
					})
				})
			}),
			ErrorText = ErrorText and RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = p2.Font.CaptionBody.Font,
				Size = UDim2.fromScale(1, 0),
				Text = ErrorText,
				TextColor3 = p2.Theme.Alert.Color,
				TextSize = p2.Font.CaptionBody.RelativeSize * p2.Font.BaseSize,
				TextXAlignment = Enum.TextXAlignment.Left
			}, {
				Padding = p1.props.InnerSidePadding ~= 0 and RoactModule.createElement("UIPadding", {
					PaddingRight = UDim.new(0, p1.props.InnerSidePadding),
					PaddingLeft = UDim.new(0, p1.props.InnerSidePadding)
				})
			}),
			HelpComponentWrapper = not ErrorText and (HelpComponent and RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 4,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, {
				Padding = p1.props.InnerSidePadding ~= 0 and RoactModule.createElement("UIPadding", {
					PaddingRight = UDim.new(0, p1.props.InnerSidePadding),
					PaddingLeft = UDim.new(0, p1.props.InnerSidePadding)
				}),
				HelpComponent = HelpComponent
			}))
		})
	end)
end

return TextBoxStateWrapper