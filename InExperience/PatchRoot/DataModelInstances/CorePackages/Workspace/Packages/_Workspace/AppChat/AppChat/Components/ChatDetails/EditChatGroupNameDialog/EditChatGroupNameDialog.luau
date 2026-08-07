local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local socialLibrariesModule = require(appChat.SocialLibraries)
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local textInput = socialLibrariesModule.Components.AlertViews.TextInput
local usePositionOffsetForVirtualKeyboardModule = require(appChat.Hooks.usePositionOffsetForVirtualKeyboard)
local t = {
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

function EditChatGroupNameDialog(p0) --[[ line: 46 ]]
	-- upvalues: cryoModule (ref), t (ref), usePositionOffsetForVirtualKeyboardModule (ref), reactModule (ref), textInput (ref)
	return reactModule.createElement(textInput, cryoModule.Dictionary.join(cryoModule.Dictionary.join(t, p0), {
		shouldAdjustForKeyboard = usePositionOffsetForVirtualKeyboardModule({ isNearBottomOfScreen = false }) == nil
	}))
end

return EditChatGroupNameDialog