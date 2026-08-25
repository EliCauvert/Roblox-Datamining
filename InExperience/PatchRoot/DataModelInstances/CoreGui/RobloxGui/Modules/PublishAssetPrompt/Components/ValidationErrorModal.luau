local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local overlay = UIBloxModule.App.Dialog.Overlay
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local xboxA = UIBloxModule.App.ImageSet.Images["icons/controls/keys/xboxA"]
local roactUtilsModule = require(corePackagesService.Workspace.Packages.RoactUtils)
local useIsGamepad = roactUtilsModule.Hooks.useIsGamepad
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local reactModule = require(corePackagesService.Packages.React)
local closeOpenPromptModule = require(script.Parent.Parent.Actions.CloseOpenPrompt)

return function(p0)
	-- upvalues: useIsGamepad (ref), useDispatch (ref), closeOpenPromptModule (ref), reactModule (ref), overlay (ref), interactiveAlert (ref), buttonType (ref), robloxTranslatorModule (ref), xboxA (ref)
	local var6 = useDispatch()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 3,
		Size = UDim2.fromScale(1, 1)
	}, {
		Overlay = reactModule.createElement(overlay, { showGradient = false, ZIndex = 3 }),
		InteractiveAlertWrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 4,
			Size = UDim2.fromScale(1, 1)
		}, {
			InteractiveAlert = reactModule.createElement(interactiveAlert, {
				title = "Something Went Wrong",
				bodyText = "Your creation could not be created due to an error. A report has been sent to the developer of this experience.",
				screenSize = p0.screenSize,
				buttonStackInfo = {
					buttons = {
						{
							buttonType = buttonType.PrimarySystem,
							props = {
								onActivated = function()
									-- upvalues: var6 (ref), closeOpenPromptModule (copy)
									var6(closeOpenPromptModule())
								end,
								text = robloxTranslatorModule:FormatByKey("InGame.CommonUI.Button.Ok"),
								inputIcon = if useIsGamepad() then xboxA else nil
							}
						}
					}
				}
			})
		})
	})
end