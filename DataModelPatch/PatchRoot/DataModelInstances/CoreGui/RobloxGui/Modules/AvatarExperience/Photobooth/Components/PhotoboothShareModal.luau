local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local Default = require(CorePackages.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), Default (copy), ButtonType (copy), InteractiveAlert (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.Captures.Title.ShareCapturePrompt",
		bodyText = "Feature.Captures.Body.ShareCapturePrompt",
		shareButton = "Feature.Captures.Action.Share",
		cancelButton = "Feature.Captures.Action.NoThanks",
		shareSheetTitle = "Feature.Captures.Action.ShareYourCapture"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), Default (upval), UseLocalizationResult (copy)
		if p1.screenshotPath and Default then
			Default:shareImage({
				context = "Photobooth",
				image = p1.screenshotPath,
				shareSheetTitle = UseLocalizationResult.shareSheetTitle
			})
		end
		p1.onClose()
	end, { p1.screenshotPath, p1.onClose })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onClose()
	end, { p1.onClose })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseResult1 (copy), UseLocalizationResult (copy), ButtonType (upval), UseResult (copy)
		return {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = UseResult1,
						text = UseLocalizationResult.cancelButton
					}
				},
				{
					isDefaultChild = false,
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = UseResult,
						text = UseLocalizationResult.shareButton
					}
				}
			}
		}
	end, { UseLocalizationResult, UseResult, UseResult1 })
	
	return if p1.isVisible then ReactModule.createElement("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = "",
		AutoButtonColor = false,
		[ReactModule.Event.Activated] = UseResult1,
		ZIndex = 9999
	}, {
		Modal = ReactModule.createElement(InteractiveAlert, {
			title = UseLocalizationResult.title,
			bodyText = UseLocalizationResult.bodyText,
			buttonStackInfo = UseMemoResult,
			screenSize = Vector2.new(1000, 1000)
		})
	}) else nil
end