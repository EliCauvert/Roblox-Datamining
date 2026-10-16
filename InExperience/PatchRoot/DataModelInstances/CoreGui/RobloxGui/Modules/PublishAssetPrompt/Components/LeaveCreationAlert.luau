local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local ReactModule = require(CorePackages.Packages.React)

return function(p1) --[[ Line: 19 | Named "LeaveCreationAlert" ]]
	-- upvalues: ReactModule (copy), InteractiveAlert (copy), RobloxTranslatorModule (copy), ButtonType (copy)
	return ReactModule.createElement(InteractiveAlert, {
		title = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAvatarPrompt.LeaveCreationTitle"),
		bodyText = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishCommon.UnsavedWarning"),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = false,
					props = {
						onActivated = p1.closePrompt,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishCommon.Leave")
					}
				},
				{
					isDefaultChild = true,
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p1.cancelClosePrompt,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.PublishCommon.Stay")
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.screenSize
	})
end