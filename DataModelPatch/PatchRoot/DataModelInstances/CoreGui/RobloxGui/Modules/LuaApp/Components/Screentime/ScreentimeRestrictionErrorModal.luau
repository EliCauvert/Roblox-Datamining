local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local ConstantsModule = require(Modules.LuaApp.Constants)
local GetScreenBottomInsetModule = require(Modules.LuaApp.getScreenBottomInset)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseStyleFunction (copy), GetScreenBottomInsetModule (copy), ReactModule (copy), ButtonType (copy), InteractiveAlert (copy), ConstantsModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		RetryButtonText = "Amp.ErrorScreen.Retry",
		OkButtonText = "CommonUI.Controls.Action.OK",
		CancelButtonText = "Amp.ErrorScreen.Cancel",
		SomethingWentWrontText = "Feature.Parents.Title.SomethingWentWrong"
	})
	local ScreenSize = p1.screenSize
	local Theme = UseStyleFunction().Theme
	local GlobalGuiInset = p1.globalGuiInset
	local _UDim2 = UDim2.fromOffset(0, GlobalGuiInset.top)
	local _UDim2_1 = UDim2.fromOffset(ScreenSize.X, ScreenSize.Y - GlobalGuiInset.top - GetScreenBottomInsetModule())
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		DisplayOrder = ConstantsModule.DisplayOrder.AntiAddictionPrompt
	}, {
		OverlayFrame = ReactModule.createElement("ImageButton", {
			AutoButtonColor = false,
			ImageTransparency = 1,
			BorderSizePixel = 0,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Theme.Overlay.Color,
			BackgroundTransparency = Theme.Overlay.Transparency
		}, {
			Overlay = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Position = _UDim2,
				Size = _UDim2_1
			}, {
				Content = ReactModule.createElement(InteractiveAlert, {
					anchorPoint = Vector2.new(0.5, 0.5),
					position = UDim2.new(0.5, 0, 0.5, 0),
					screenSize = ScreenSize,
					title = UseLocalizationResult.SomethingWentWrontText,
					bodyText = UseLocalizationResult.SomethingWentWrontText,
					buttonStackInfo = {
						buttonHeight = 48,
						buttons = if p1.onRetry == nil then {
							{
								buttonType = ButtonType.Secondary,
								props = {
									onActivated = function()
										-- upvalues: p1 (copy)
										p1.onClose()
									end,
									text = UseLocalizationResult.OkButtonText
								}
							}
						} else {
							{
								buttonType = ButtonType.Secondary,
								props = {
									onActivated = function()
										-- upvalues: p1 (copy)
										p1.onClose()
									end,
									text = UseLocalizationResult.CancelButtonText,
									isDisabled = UseStateResult
								}
							},
							{
								buttonType = ButtonType.Secondary,
								props = {
									onActivated = function()
										-- upvalues: UseStateResult2 (copy), p1 (copy)
										UseStateResult2(true)
										p1.onRetry()
										UseStateResult2(false)
									end,
									text = UseLocalizationResult.RetryButtonText,
									isDisabled = UseStateResult
								}
							}
						},
						forcedFillDirection = Enum.FillDirection.Vertical
					},
					onCloseClicked = p1.onClose
				})
			})
		})
	})
end