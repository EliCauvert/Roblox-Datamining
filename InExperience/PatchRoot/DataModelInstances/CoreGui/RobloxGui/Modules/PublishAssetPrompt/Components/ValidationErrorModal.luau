local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local Overlay = UIBloxModule.App.Dialog.Overlay
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local IconsControlsKeysXboxA = UIBloxModule.App.ImageSet.Images["icons/controls/keys/xboxA"]
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseIsGamepadFunction = RoactUtilsModule.Hooks.useIsGamepad
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local ReactModule = require(CorePackages.Packages.React)
local CloseOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)

return function(p1)
	-- upvalues: UseIsGamepadFunction (copy), UseDispatchFunction (copy), CloseOpenPromptModule (copy), ReactModule (copy), Overlay (copy), InteractiveAlert (copy), ButtonType (copy), RobloxTranslatorModule (copy), IconsControlsKeysXboxA (copy)
	local UseIsGamepadResult = UseIsGamepadFunction()
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 3,
		Size = UDim2.fromScale(1, 1)
	}, {
		Overlay = ReactModule.createElement(Overlay, { showGradient = false, ZIndex = 3 }),
		InteractiveAlertWrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 4,
			Size = UDim2.fromScale(1, 1)
		}, {
			InteractiveAlert = ReactModule.createElement(InteractiveAlert, {
				title = "Something Went Wrong",
				bodyText = "Your creation could not be created due to an error. A report has been sent to the developer of this experience.",
				screenSize = p1.screenSize,
				buttonStackInfo = {
					buttons = {
						{
							buttonType = ButtonType.PrimarySystem,
							props = {
								onActivated = function()
									-- upvalues: UseDispatchResult (copy), CloseOpenPromptModule (upval)
									UseDispatchResult(CloseOpenPromptModule())
								end,
								text = RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Button.Ok"),
								inputIcon = UseIsGamepadResult and IconsControlsKeysXboxA or nil
							}
						}
					}
				}
			})
		})
	})
end