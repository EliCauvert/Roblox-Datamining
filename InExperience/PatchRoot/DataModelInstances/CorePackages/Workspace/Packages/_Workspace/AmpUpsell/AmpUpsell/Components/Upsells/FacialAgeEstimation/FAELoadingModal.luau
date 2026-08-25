local parent = script:FindFirstAncestor("AmpUpsell").Parent
local reactModule = require(parent.React)
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useLocalization = require(parent.Localization).Hooks.useLocalization
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local authButtonClick = require(parent.AuthAnalytics).Events.authButtonClick

return function(p0)
	-- upvalues: useScreenSize (ref), useLocalization (ref), reactModule (ref), authButtonClick (ref), loading (ref), iconSize (ref), interactiveAlert (ref), buttonType (ref)
	local onCancel = p0.onCancel
	local sessionId = p0.sessionId
	local entryPointEventCtx = p0.entryPointEventCtx
	local var3 = useLocalization({
		title = "Amp.FAEUpsell.Modal.Loading.Title",
		bodyText = "Amp.FAEUpsell.Modal.Loading.Text",
		cancelBtn = "Amp.FAEUpsell.Modal.Loading.ButtonCancel"
	})
	
	return reactModule.createElement(interactiveAlert, {
		screenSize = useScreenSize(),
		title = var3.title,
		bodyText = var3.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.Secondary,
					props = {
						onActivated = reactModule.useCallback(function()
							-- upvalues: authButtonClick (copy), entryPointEventCtx (ref), sessionId (ref), onCancel (ref)
							authButtonClick(entryPointEventCtx, "faeLoadingCancel", sessionId)
							onCancel()
						end, { onCancel, sessionId, entryPointEventCtx }),
						text = var3.cancelBtn
					}
				}
			}
		},
		middleContent = reactModule.useCallback(function()
			-- upvalues: reactModule (copy), loading (copy), iconSize (copy)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 80)
			}, {
				Spinner = reactModule.createElement(loading, {
					size = iconSize.Medium,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			})
		end, {})
	})
end