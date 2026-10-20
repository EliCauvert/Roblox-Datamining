local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local Warning = require(AppChat.SocialLibraries).Components.AlertViews.Warning
local config = {
	titleText = "Placeholder title",
	bodyText = "Placeholder body",
	cancelText = "TempCancel",
	confirmText = "TempConfirm",
	failureTitleText = "FailureTitle",
	failureBodyText = "FailureBody",
	failureButtonText = "FailureButton",
	soakAreaTransparency = 0.8,
	displayFailed = false,
	onActivated = nil,
	onModalClose = nil,
	soakAreaColor3 = Color3.fromRGB(25, 25, 25),
	width = UDim.new(0.8, 0)
}

function RemoveUserDialog(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), Warning (copy)
	return ReactModule.createElement(Warning, (CryoModule.Dictionary.join(config, p1)))
end

return RemoveUserDialog