local Roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact
local CallbackInputBoxModule = require(script.Parent.CallbackInputBox)
local CallbackInputBoxWithIcon = Roact.PureComponent:extend("CallbackInputBoxWithIcon")
CallbackInputBoxWithIcon.defaultProps = {
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

function CallbackInputBoxWithIcon.render(p1) --[[ Line: 40 ]]
	-- upvalues: Roact (copy), CallbackInputBoxModule (copy)
	local IconCellWidth: number = p1.props.iconCellWidth
	local IconSize = p1.props.iconSize
	
	return Roact.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = p1.props.backgroundTransparency,
		BackgroundColor3 = p1.props.backgroundColor3,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		UIStroke = Roact.createElement("UIStroke", {
			Thickness = p1.props.borderThickness,
			Color = p1.props.borderColor,
			Transparency = p1.props.borderTransparency
		}),
		UICorner = Roact.createElement("UICorner", { CornerRadius = UDim.new(0, p1.props.cornerRadius) }),
		layout = Roact.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, IconCellWidth / 4)
		}),
		padding = Roact.createElement("UIPadding", { PaddingLeft = UDim.new(0, IconCellWidth / 4) }),
		icon = Roact.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0, IconSize, 0, IconSize),
			ImageColor3 = p1.props.iconColor3,
			ImageTransparency = p1.props.iconTransparency,
			Image = p1.props.iconImage
		}),
		inputBoxContainer = Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, -IconSize - IconCellWidth / 4, 1, 0)
		}, {
			padding = Roact.createElement("UIPadding", { PaddingRight = UDim.new(0, IconCellWidth / 4) }),
			inputBox = Roact.createElement(CallbackInputBoxModule, p1.props)
		})
	})
end

return CallbackInputBoxWithIcon