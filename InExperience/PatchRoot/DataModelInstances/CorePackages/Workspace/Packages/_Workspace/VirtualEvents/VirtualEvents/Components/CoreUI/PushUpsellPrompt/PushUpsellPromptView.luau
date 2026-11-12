local Parent = script:FindFirstAncestor("VirtualEvents").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert

return function(p1)
	-- upvalues: ReactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return ReactModule.createElement(InteractiveAlert, {
		title = p1.title,
		bodyText = p1.bodyText,
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.screenSize,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = { onActivated = p1.onCancel, text = p1.cancelText }
				},
				{
					isDefaultChild = false,
					buttonType = ButtonType.PrimarySystem,
					props = { onActivated = p1.onConfirm, text = p1.confirmText }
				}
			}
		}
	})
end