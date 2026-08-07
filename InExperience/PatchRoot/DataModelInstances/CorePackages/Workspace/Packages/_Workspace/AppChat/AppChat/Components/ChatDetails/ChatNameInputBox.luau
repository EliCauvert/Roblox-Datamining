local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local socialLibrariesModule = require(appChat.SocialLibraries)
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local inputBoxWithCharacterCounter = socialLibrariesModule.Components.InputBoxWithCharacterCounter
local chatNameInputBox = roactModule.PureComponent:extend("ChatNameInputBox")
chatNameInputBox.defaultProps = {
	initialInputText = "",
	placeholderText = "(PLACEHOLDER) Name your chat group"
}

function chatNameInputBox.render(p0) --[[ line: 18 ]]
	-- upvalues: UIBloxModule (ref), roactModule (ref), inputBoxWithCharacterCounter (ref)
	return UIBloxModule.Style.withStyle(function(p1) --[[ line: 19 ]]
		-- upvalues: roactModule (copy), inputBoxWithCharacterCounter (copy), p0 (ref)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 64)
		}, {
			InputBox = roactModule.createElement(inputBoxWithCharacterCounter, {
				validInputTextTransparency = 0,
				invalidInputTextTransparency = 0,
				inputTextSize = 23,
				inputTextTransparency = 0,
				placeholderTextTransparency = 0,
				clearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-clear-solid.png",
				characterLimit = 150,
				initialInputText = p0.props.initialInputText,
				validInputTextColor3 = Color3.fromRGB(117, 117, 117),
				invalidInputTextColor3 = Color3.fromRGB(226, 35, 26),
				inputTextFont = Enum.Font.Gotham,
				inputTextColor3 = Color3.fromRGB(25, 25, 25),
				placeholderTextColor3 = Color3.fromRGB(184, 184, 184),
				placeholderText = p0.props.placeholderText,
				clearIconColor3 = Color3.fromRGB(255, 255, 255),
				style = p1
			})
		})
	end)
end

return chatNameInputBox