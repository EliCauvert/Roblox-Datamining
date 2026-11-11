local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CloseCentralOverlayModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.CloseCentralOverlay)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch

return function(p1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), UseDispatchFunction (copy), CloseCentralOverlayModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseLocalizationResult = UseLocalizationFunction({
		newAppAvailableText = "Authentication.Login.Heading.NewAppAvailable",
		descriptionText = "Authentication.Login.Description.DownloadNewVersion",
		downloadNowText = "Authentication.Login.Action.DownloadNow"
	})
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayModule (upval)
		UseDispatchResult(CloseCentralOverlayModule())
	end, { UseDispatchResult })
	
	return ReactModule.createElement("TextButton", {
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		Text = "",
		Visible = true,
		[ReactModule.Event.Activated] = function()
			-- upvalues: UseResult (copy)
			UseResult()
		end
	}, {
		Alert = ReactModule.createElement(InteractiveAlert, {
			title = UseLocalizationResult.newAppAvailableText,
			bodyText = UseLocalizationResult.descriptionText,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							isDefaultChild = true,
							text = UseLocalizationResult.downloadNowText,
							isDisabled = UseStateResult,
							isLoading = UseStateResult,
							onActivated = function()
								-- upvalues: UseStateResult2 (copy), p1 (copy), UseResult (copy)
								UseStateResult2(true)
								
								if p1.onButtonActivated then
									p1.onButtonActivated()
								end
								UseResult()
							end
						}
					}
				}
			},
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = Vector2.new(300, nil)
		})
	})
end