local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Parent = script.Parent.Parent
local HideErrorModule = require(Parent.Actions.HideError)
local ConstantsModule = require(Parent.Constants)
local ErrorMessage = RoactModule.PureComponent:extend("ErrorMessage")

function ErrorMessage.render(p1) --[[ Line: 17 ]]
	-- upvalues: ConstantsModule (copy), RoactModule (copy)
	local Layout = ConstantsModule.Layouts[p1.props.layout]
	
	return RoactModule.createElement("Frame", {
		Size = Layout.ErrorFrameSize,
		Position = Layout.ErrorFramePosition,
		BackgroundColor3 = ConstantsModule.Colors.Black,
		BackgroundTransparency = ConstantsModule.ErrorFrameBackgroundTransparency,
		BorderSizePixel = ConstantsModule.ErrorFrameBorderSize,
		Selectable = false,
		Visible = p1.props.displayOptions.errorVisible,
		[RoactModule.Event.TouchTap] = function() --[[ Line: 29 ]]
			-- upvalues: p1 (copy)
			p1.props.close()
		end,
		[RoactModule.Event.InputBegan] = function(_, Input) --[[ Line: 33 ]]
			-- upvalues: p1 (copy)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				p1.props.close()
			end
		end
	}, {
		AsspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", { AspectRatio = Layout.ErrorFrameAspectRatio }),
		SizeConstraint = RoactModule.createElement("UISizeConstraint", {
			MinSize = Layout.ErrorFrameMinSize,
			MaxSize = Layout.ErrorFrameMaxSize
		}),
		ErrorIcon = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, Layout.ErrorIconOffset, 0.5, 0),
			Size = UDim2.new(0.2, -Layout.ErrorIconOffset * 2, 1, -Layout.ErrorIconOffset * 2),
			Image = Layout.ErrorIcon
		}, {
			AsspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1 })
		}),
		ErrorText = RoactModule.createElement("TextLabel", {
			TextScaled = true,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0.2, -Layout.ErrorIconOffset, 0.5, 0),
			Size = UDim2.new(0.8, 0, 1, 0),
			Text = p1.props.displayOptions.errorText,
			TextSize = Layout.ErrorTextSize,
			TextColor3 = ConstantsModule.Colors.White,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = Layout.ErrorTextFont
		}, {
			SizeConstraint = RoactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(Layout.ErrorFrameMaxSize.X, Layout.ErrorTextSize + ConstantsModule.TextPadding)
			}),
			TextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", { MaxTextSize = Layout.ErrorTextSize })
		})
	})
end

return RoactRoduxModule.connect(function(p1) --[[ Line: 86 | Named "mapStateToProps" ]]
	return { displayOptions = p1.displayOptions, layout = p1.layout }
end, function(Callback) --[[ Line: 93 | Named "mapDispatchToProps" ]]
	-- upvalues: HideErrorModule (copy)
	return {
		close = function() --[[ Line: 95 ]]
			-- upvalues: Callback (copy), HideErrorModule (upval)
			return Callback(HideErrorModule())
		end
	}
end)(ErrorMessage)