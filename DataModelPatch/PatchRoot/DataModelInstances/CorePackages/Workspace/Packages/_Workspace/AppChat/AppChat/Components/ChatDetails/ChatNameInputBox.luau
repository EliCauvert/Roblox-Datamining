local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local InputBoxWithCharacterCounter = require(AppChat.SocialLibraries).Components.InputBoxWithCharacterCounter
local ChatNameInputBox = RoactModule.PureComponent:extend("ChatNameInputBox")
ChatNameInputBox.defaultProps = {
	initialInputText = "",
	placeholderText = "(PLACEHOLDER) Name your chat group"
}

function ChatNameInputBox.render(p1)
	-- upvalues: UIBloxModule (copy), RoactModule (copy), InputBoxWithCharacterCounter (copy)
	return UIBloxModule.Style.withStyle(function(Style)
		-- upvalues: RoactModule (upval), InputBoxWithCharacterCounter (upval), p1 (copy)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 64)
		}, {
			InputBox = RoactModule.createElement(InputBoxWithCharacterCounter, {
				validInputTextTransparency = 0,
				invalidInputTextTransparency = 0,
				inputTextSize = 23,
				inputTextTransparency = 0,
				placeholderTextTransparency = 0,
				clearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-clear-solid.png",
				characterLimit = 150,
				initialInputText = p1.props.initialInputText,
				validInputTextColor3 = Color3.fromRGB(117, 117, 117),
				invalidInputTextColor3 = Color3.fromRGB(226, 35, 26),
				inputTextFont = Enum.Font.Gotham,
				inputTextColor3 = Color3.fromRGB(25, 25, 25),
				placeholderTextColor3 = Color3.fromRGB(184, 184, 184),
				placeholderText = p1.props.placeholderText,
				clearIconColor3 = Color3.fromRGB(255, 255, 255),
				style = Style
			})
		})
	end)
end

return ChatNameInputBox