local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local parent = script.Parent.Parent
local hideErrorModule = require(parent.Actions.HideError)
local constantsModule = require(parent.Constants)
local errorMessage = roactModule.PureComponent:extend("ErrorMessage")

function errorMessage.render(p0) --[[ line: 17 ]]
	-- upvalues: constantsModule (ref), roactModule (ref)
	local layout = constantsModule.Layouts[p0.props.layout]
	
	return roactModule.createElement("Frame", {
		Size = layout.ErrorFrameSize,
		Position = layout.ErrorFramePosition,
		BackgroundColor3 = constantsModule.Colors.Black,
		BackgroundTransparency = constantsModule.ErrorFrameBackgroundTransparency,
		BorderSizePixel = constantsModule.ErrorFrameBorderSize,
		Selectable = false,
		Visible = p0.props.displayOptions.errorVisible,
		[roactModule.Event.TouchTap] = function() --[[ line: 29 ]]
			-- upvalues: p0 (ref)
			p0.props.close()
		end,
		[roactModule.Event.InputBegan] = function(_, p1) --[[ line: 33 ]]
			-- upvalues: p0 (ref)
			if p1.UserInputType == Enum.UserInputType.MouseButton1 then
				p0.props.close()
			end
		end
	}, {
		AsspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", { AspectRatio = layout.ErrorFrameAspectRatio }),
		SizeConstraint = roactModule.createElement("UISizeConstraint", {
			MinSize = layout.ErrorFrameMinSize,
			MaxSize = layout.ErrorFrameMaxSize
		}),
		ErrorIcon = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, layout.ErrorIconOffset, 0.5, 0),
			Size = UDim2.new(0.2, -layout.ErrorIconOffset * 2, 1, -layout.ErrorIconOffset * 2),
			Image = layout.ErrorIcon
		}, {
			AsspectRatioConstraint = roactModule.createElement("UIAspectRatioConstraint", { AspectRatio = 1 })
		}),
		ErrorText = roactModule.createElement("TextLabel", {
			TextScaled = true,
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0.2, -layout.ErrorIconOffset, 0.5, 0),
			Size = UDim2.new(0.8, 0, 1, 0),
			Text = p0.props.displayOptions.errorText,
			TextSize = layout.ErrorTextSize,
			TextColor3 = constantsModule.Colors.White,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = layout.ErrorTextFont
		}, {
			SizeConstraint = roactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(layout.ErrorFrameMaxSize.X, layout.ErrorTextSize + constantsModule.TextPadding)
			}),
			TextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = layout.ErrorTextSize })
		})
	})
end

return roactRoduxModule.connect(function(p2) --[[ line: 86 | named "mapStateToProps" ]]
	return { displayOptions = p2.displayOptions, layout = p2.layout }
end, function(p3) --[[ line: 93 | named "mapDispatchToProps" ]]
	-- upvalues: hideErrorModule (ref)
	return {
		close = function() --[[ line: 95 ]]
			-- upvalues: p3 (ref), hideErrorModule (copy)
			return p3(hideErrorModule())
		end
	}
end)(errorMessage)