local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local TextInput = require(AppChat.SocialLibraries).Components.AlertViews.TextInput
local UsePositionOffsetForVirtualKeyboardModule = require(AppChat.Hooks.usePositionOffsetForVirtualKeyboard)
local config = {
	titleText = "Placeholder",
	cancelText = "CancelText",
	confirmText = "ConfirmText",
	warningText = nil,
	inputText = nil,
	placeholderText = nil,
	soakAreaTransparency = 0.8,
	onActivated = nil,
	onModalClose = nil,
	soakAreaColor3 = Color3.fromRGB(25, 25, 25)
}

function EditChatGroupNameDialog(p1) --[[ Line: 46 ]]
	-- upvalues: CryoModule (copy), config (copy), UsePositionOffsetForVirtualKeyboardModule (copy), ReactModule (copy), TextInput (copy)
	return ReactModule.createElement(TextInput, CryoModule.Dictionary.join(CryoModule.Dictionary.join(config, p1), {
		shouldAdjustForKeyboard = UsePositionOffsetForVirtualKeyboardModule({ isNearBottomOfScreen = false }) == nil
	}))
end

return EditChatGroupNameDialog