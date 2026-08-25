local parent = script:FindFirstAncestor("AuthCommon").Parent
local cryoModule = require(parent.Cryo)
local UIBloxModule = require(parent.UIBlox)
local roactModule = require(parent.Roact)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local getImageData = require(parent.RobloxAppAssets).GetImageData
local withStyle = UIBloxModule.Style.withStyle
local textBoxStateWrapper = roactModule.Component:extend("TextBoxStateWrapper")
textBoxStateWrapper.defaultProps = {
	TextBoxLabelPadding = 12,
	InnerSidePadding = 0,
	IconSize = UDim2.new(1, 0, 1, 0)
}

function textBoxStateWrapper.init(p0)
	p0:setState({ Focused = false, Hover = false })
	
	function p0.onMouseEnter()
		-- upvalues: p0 (ref)
		p0:setState({ Hover = true })
	end
	
	function p0.onMouseLeave()
		-- upvalues: p0 (ref)
		p0:setState({ Hover = false })
	end
	
	function p0.onFocused(...)
		-- upvalues: p0 (ref)
		p0:setState({ Focused = true })
		
		if p0.props.ChildProps.onFocused then
			p0.props.ChildProps.onFocused(...)
		end
	end
	
	function p0.onFocusLost(...)
		-- upvalues: p0 (ref)
		p0:setState({ Focused = false })
		
		if p0.props.ChildProps.onFocusLost then
			p0.props.ChildProps.onFocusLost(...)
		end
	end
end

function textBoxStateWrapper.render(p1)
	-- upvalues: withStyle (ref), roactModule (ref), imageSetLabel (ref), getImageData (ref), cryoModule (ref)
	local helpComponent = p1.props.HelpComponent
	local errorText = p1.props.ErrorText
	local labelText = p1.props.LabelText
	
	return withStyle(function(p2)
		-- upvalues: p1 (ref), roactModule (copy), labelText (ref), imageSetLabel (copy), getImageData (copy), cryoModule (copy), errorText (ref), helpComponent (ref)
		local color = p2.Theme.UIDefault.Color
		local transparency = p2.Theme.UIDefault.Transparency
		
		if p1.props.ErrorState then
			color = p2.Theme.Alert.Color
			transparency = p2.Theme.Alert.Transparency
		elseif p1.state.Focused then
			color = p2.Theme.IconEmphasis.Color
			transparency = p2.Theme.IconEmphasis.Transparency
		elseif p1.state.Hover then
			color = p2.Theme.IconDefault.Color
			transparency = p2.Theme.IconDefault.Transparency
		end
		local createElement = roactModule.createElement
		local var4 = "Frame"
		local t = {
			AnchorPoint = p1.props.AnchorPoint,
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p1.props.LayoutOrder,
			Position = p1.props.Position,
			Size = UDim2.fromScale(1, 0),
			[roactModule.Change.AbsolutePosition] = p1.props.onPositionChangedCallback
		}
		local t_1 = {
			ListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, p1.props.TextBoxLabelPadding)
			}),
			TextBoxLabel = labelText and roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = p2.Font.CaptionHeader.Font,
				Size = UDim2.fromScale(1, 0),
				Text = labelText,
				TextColor3 = p2.Theme.TextEmphasis.Color,
				TextSize = p1.props.TextBoxLabelTextSize,
				TextTransparency = p2.Theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			TextBox = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = p1.props.Size,
				[roactModule.Ref] = p1.props.buttonRef
			}, {
				Border = roactModule.createElement(imageSetLabel, {
					ZIndex = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					ScaleType = Enum.ScaleType.Slice,
					SliceCenter = Rect.new(9, 9, 9, 9),
					Image = getImageData("LuaApp/buttons/buttonStroke") or "LuaApp/buttons/buttonStroke",
					ImageColor3 = color,
					ImageTransparency = transparency
				}),
				TextBox = roactModule.createElement(p1.props.ChildClass, cryoModule.Dictionary.join(p1.props.ChildProps, {
					Size = UDim2.new(1, 0, 1, 0),
					onMouseEnter = p1.onMouseEnter,
					onMouseLeave = p1.onMouseLeave,
					onFocused = p1.onFocused,
					onFocusLost = p1.onFocusLost
				})),
				IconWrapper = p1.props.Icon and roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Size = UDim2.new(1, 0, 1, 0),
					Position = UDim2.new(1, -2, 0, 0),
					AnchorPoint = Vector2.new(1, 0)
				}, {
					AspectRatio = roactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1 }),
					Icon = roactModule.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						Size = p1.props.IconSize,
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Image = p1.props.Icon,
						ImageColor3 = color,
						ImageTransparency = transparency
					})
				})
			})
		}
		local var7 = errorText
		
		if var7 then
			var7 = roactModule.createElement
			var7 = var7("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = p2.Font.CaptionBody.Font,
				Size = UDim2.fromScale(1, 0),
				Text = errorText,
				TextColor3 = p2.Theme.Alert.Color,
				TextSize = p2.Font.CaptionBody.RelativeSize * p2.Font.BaseSize,
				TextXAlignment = Enum.TextXAlignment.Left
			}, {
				Padding = p1.props.InnerSidePadding ~= 0 and roactModule.createElement("UIPadding", {
					PaddingRight = UDim.new(0, p1.props.InnerSidePadding),
					PaddingLeft = UDim.new(0, p1.props.InnerSidePadding)
				})
			})
		end
		t_1.ErrorText = var7
		local var8 = not errorText
		
		if var8 then
			var8 = helpComponent
			
			if var8 then
				var8 = roactModule.createElement
				var8 = var8("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 4,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.fromScale(1, 0)
				}, {
					Padding = p1.props.InnerSidePadding ~= 0 and roactModule.createElement("UIPadding", {
						PaddingRight = UDim.new(0, p1.props.InnerSidePadding),
						PaddingLeft = UDim.new(0, p1.props.InnerSidePadding)
					}),
					HelpComponent = helpComponent
				})
			end
		end
		t_1.HelpComponentWrapper = var8
		
		return createElement(var4, t, t_1)
	end)
end

return textBoxStateWrapper