local Parent = script:FindFirstAncestor("AmpUpsell").Parent
local ReactModule = require(Parent.React)
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local AuthButtonClickFunction = require(Parent.AuthAnalytics).Events.authButtonClick

return function(p1) --[[ Line: 27 | Named "FAELoadingModal" ]]
	-- upvalues: UseScreenSizeFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), AuthButtonClickFunction (copy), Loading (copy), IconSize (copy), InteractiveAlert (copy), ButtonType (copy)
	local OnCancelFunction = p1.onCancel
	local SessionId = p1.sessionId
	local EntryPointEventCtx = p1.entryPointEventCtx
	local UseScreenSizeResult = UseScreenSizeFunction()
	local AmpFAEUpsellModalLoadingTitle = UseLocalizationFunction({
		title = "Amp.FAEUpsell.Modal.Loading.Title",
		bodyText = "Amp.FAEUpsell.Modal.Loading.Text",
		cancelBtn = "Amp.FAEUpsell.Modal.Loading.ButtonCancel"
	})
	
	return ReactModule.createElement(InteractiveAlert, {
		screenSize = UseScreenSizeResult,
		title = AmpFAEUpsellModalLoadingTitle.title,
		bodyText = AmpFAEUpsellModalLoadingTitle.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.Secondary,
					props = {
						onActivated = ReactModule.useCallback(function() --[[ Line: 40 ]]
							-- upvalues: AuthButtonClickFunction (upval), EntryPointEventCtx (copy), SessionId (copy), OnCancelFunction (copy)
							AuthButtonClickFunction(EntryPointEventCtx, "faeLoadingCancel", SessionId)
							OnCancelFunction()
						end, { OnCancelFunction, SessionId, EntryPointEventCtx }),
						text = AmpFAEUpsellModalLoadingTitle.cancelBtn
					}
				}
			}
		},
		middleContent = ReactModule.useCallback(function() --[[ Line: 45 ]]
			-- upvalues: ReactModule (upval), Loading (upval), IconSize (upval)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 80)
			}, {
				Spinner = ReactModule.createElement(Loading, {
					size = IconSize.Medium,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			})
		end, {})
	})
end