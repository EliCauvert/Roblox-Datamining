local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local socialLibrariesModule = require(appChat.SocialLibraries)
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local warning = socialLibrariesModule.Components.AlertViews.Warning
local t = {
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

function LeaveGroupDialog(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), warning (ref)
	return reactModule.createElement(warning, cryoModule.Dictionary.join(t, p1))
end

return LeaveGroupDialog