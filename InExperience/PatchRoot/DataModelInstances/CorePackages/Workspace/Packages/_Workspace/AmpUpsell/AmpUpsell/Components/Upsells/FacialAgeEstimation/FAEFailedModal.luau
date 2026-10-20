local Parent = script:FindFirstAncestor("AmpUpsell").Parent
local ReactModule = require(Parent.React)
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UIBloxModule = require(Parent.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local AuthButtonClickFunction = require(Parent.AuthAnalytics).Events.authButtonClick

return function(p1)
	-- upvalues: UseScreenSizeFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), AuthButtonClickFunction (copy), InteractiveAlert (copy), ButtonType (copy)
	local OnCloseFunction = p1.onClose
	local OnRetryFunction = p1.onRetry
	local SessionId = p1.sessionId
	local EntryPointEventCtx = p1.entryPointEventCtx
	local UseScreenSizeResult = UseScreenSizeFunction()
	local AmpFAEUpsellModalFailedTitle = UseLocalizationFunction({
		title = "Amp.FAEUpsell.Modal.Failed.Title",
		bodyText = "Amp.FAEUpsell.Modal.Failed.Text",
		closeBtn = "Amp.FAEUpsell.Modal.Failed.ButtonClose",
		retryBtn = "Amp.FAEUpsell.Modal.Failed.ButtonRetry"
	})
	
	return ReactModule.createElement(InteractiveAlert, {
		screenSize = UseScreenSizeResult,
		title = AmpFAEUpsellModalFailedTitle.title,
		bodyText = AmpFAEUpsellModalFailedTitle.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					props = {
						buttonType = ButtonType.Secondary,
						onActivated = ReactModule.useCallback(function()
							-- upvalues: AuthButtonClickFunction (upval), EntryPointEventCtx (copy), SessionId (copy), OnCloseFunction (copy)
							AuthButtonClickFunction(EntryPointEventCtx, "faeFailedClose", SessionId)
							OnCloseFunction()
						end, { OnCloseFunction, SessionId, EntryPointEventCtx }),
						text = AmpFAEUpsellModalFailedTitle.closeBtn
					}
				},
				{
					buttonType = ButtonType.PrimaryContextual,
					props = {
						onActivated = ReactModule.useCallback(function()
							-- upvalues: AuthButtonClickFunction (upval), EntryPointEventCtx (copy), SessionId (copy), OnRetryFunction (copy)
							AuthButtonClickFunction(EntryPointEventCtx, "faeFailedRetry", SessionId)
							OnRetryFunction()
						end, { OnRetryFunction, SessionId, EntryPointEventCtx }),
						text = AmpFAEUpsellModalFailedTitle.retryBtn
					}
				}
			}
		}
	})
end