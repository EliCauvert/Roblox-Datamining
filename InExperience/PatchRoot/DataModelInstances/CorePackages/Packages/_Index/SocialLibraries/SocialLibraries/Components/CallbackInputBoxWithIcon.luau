local roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact
local callbackInputBoxModule = require(script.Parent.CallbackInputBox)
local callbackInputBoxWithIcon = roact.PureComponent:extend("CallbackInputBoxWithIcon")
callbackInputBoxWithIcon.defaultProps = {
	backgroundTransparency = 0,
	borderColor = nil,
	borderThickness = 0,
	borderTransparency = 1,
	cornerRadius = 0,
	iconCellWidth = 60,
	iconSize = 24,
	iconTransparency = 0,
	iconImage = "rbxasset://textures/ui/LuaChat/icons/ic-search.png",
	inputTextSize = 14,
	inputTextTransparency = 0,
	placeholderTextTransparency = 0.6,
	placeholderText = "Test placeholder text",
	clearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-close-white.png",
	clearButtonDisabled = nil,
	textChangedCallback = nil,
	backgroundColor3 = Color3.new(1, 1, 1),
	iconColor3 = Color3.new(1, 1, 1),
	inputTextFont = Enum.Font.BuilderSans,
	inputTextColor3 = Color3.new(1, 0, 1),
	inputTextYAlignment = Enum.TextYAlignment.Center,
	inputTextXAlignment = Enum.TextXAlignment.Left,
	placeholderTextColor3 = Color3.new(1, 0, 0),
	clearIconColor3 = Color3.new(1, 1, 0)
}

function callbackInputBoxWithIcon.render(p0)
	-- upvalues: roact (ref), callbackInputBoxModule (ref)
	local iconCellWidth = p0.props.iconCellWidth
	local iconSize = p0.props.iconSize
	
	return roact.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = p0.props.backgroundTransparency,
		BackgroundColor3 = p0.props.backgroundColor3,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		UIStroke = roact.createElement("UIStroke", {
			Thickness = p0.props.borderThickness,
			Color = p0.props.borderColor,
			Transparency = p0.props.borderTransparency
		}),
		UICorner = roact.createElement("UICorner", { CornerRadius = UDim.new(0, p0.props.cornerRadius) }),
		layout = roact.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, iconCellWidth / 4)
		}),
		padding = roact.createElement("UIPadding", { PaddingLeft = UDim.new(0, iconCellWidth / 4) }),
		icon = roact.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0, iconSize, 0, iconSize),
			ImageColor3 = p0.props.iconColor3,
			ImageTransparency = p0.props.iconTransparency,
			Image = p0.props.iconImage
		}),
		inputBoxContainer = roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, (-iconSize) - iconCellWidth / 4, 1, 0)
		}, {
			padding = roact.createElement("UIPadding", { PaddingRight = UDim.new(0, iconCellWidth / 4) }),
			inputBox = roact.createElement(callbackInputBoxModule, p0.props)
		})
	})
end

return callbackInputBoxWithIcon