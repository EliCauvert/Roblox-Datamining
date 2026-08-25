local parent = script:FindFirstAncestor("AmpUpsell").Parent
local reactModule = require(parent.React)
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useLocalization = require(parent.Localization).Hooks.useLocalization
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local authButtonClick = require(parent.AuthAnalytics).Events.authButtonClick

return function(p0)
	-- upvalues: useScreenSize (ref), useLocalization (ref), reactModule (ref), authButtonClick (ref), interactiveAlert (ref), buttonType (ref)
	local onClose = p0.onClose
	local onRetry = p0.onRetry
	local sessionId = p0.sessionId
	local entryPointEventCtx = p0.entryPointEventCtx
	local var2 = useLocalization({
		title = "Amp.FAEUpsell.Modal.Failed.Title",
		bodyText = "Amp.FAEUpsell.Modal.Failed.Text",
		closeBtn = "Amp.FAEUpsell.Modal.Failed.ButtonClose",
		retryBtn = "Amp.FAEUpsell.Modal.Failed.ButtonRetry"
	})
	
	return reactModule.createElement(interactiveAlert, {
		screenSize = useScreenSize(),
		title = var2.title,
		bodyText = var2.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					props = {
						buttonType = buttonType.Secondary,
						onActivated = reactModule.useCallback(function()
							-- upvalues: authButtonClick (copy), entryPointEventCtx (ref), sessionId (ref), onClose (ref)
							authButtonClick(entryPointEventCtx, "faeFailedClose", sessionId)
							onClose()
						end, { onClose, sessionId, entryPointEventCtx }),
						text = var2.closeBtn
					}
				},
				{
					buttonType = buttonType.PrimaryContextual,
					props = {
						onActivated = reactModule.useCallback(function()
							-- upvalues: authButtonClick (copy), entryPointEventCtx (ref), sessionId (ref), onRetry (ref)
							authButtonClick(entryPointEventCtx, "faeFailedRetry", sessionId)
							onRetry()
						end, { onRetry, sessionId, entryPointEventCtx }),
						text = var2.retryBtn
					}
				}
			}
		}
	})
end