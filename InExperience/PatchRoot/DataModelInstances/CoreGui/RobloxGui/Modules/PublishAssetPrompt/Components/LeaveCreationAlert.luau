local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local reactModule = require(corePackagesService.Packages.React)

return function(p1)
	-- upvalues: reactModule (ref), interactiveAlert (ref), robloxTranslatorModule (ref), buttonType (ref)
	return reactModule.createElement(interactiveAlert, {
		title = robloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.LeaveCreationTitle"),
		bodyText = robloxTranslatorModule:FormatByKey("CoreScripts.PublishCommon.UnsavedWarning"),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = false,
					props = {
						onActivated = p1.closePrompt,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.PublishCommon.Leave")
					}
				},
				{
					isDefaultChild = true,
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = p1.cancelClosePrompt,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.PublishCommon.Stay")
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.screenSize
	})
end