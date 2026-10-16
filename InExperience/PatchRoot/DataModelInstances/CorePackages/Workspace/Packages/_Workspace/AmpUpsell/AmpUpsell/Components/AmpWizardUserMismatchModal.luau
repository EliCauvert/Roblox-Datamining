local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local AuthModalShownFunction = require(Parent.AuthAnalytics).Events.authModalShown
local GetFFlagEnableAmpUserMismatchTelemetryModule = require(AmpUpsell.Flags.GetFFlagEnableAmpUserMismatchTelemetry)

return function(p1) --[[ Line: 22 | Named "AmpWizardUserMismatchModal" ]]
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), GetFFlagEnableAmpUserMismatchTelemetryModule (copy), AuthModalShownFunction (copy), Dialog (copy), DialogSize (copy), ButtonVariant (copy)
	local Navigation = p1.navigation
	local EntryPointEventCtx = p1.entryPointEventCtx
	local AmpErrorScreenUserMismatchTitle = UseLocalizationFunction({
		title = "Amp.ErrorScreen.UserMismatchTitle",
		description = "Amp.ErrorScreen.UserMismatchBody",
		ok = "CommonUI.Controls.Action.OK"
	})
	ReactModule.useEffect(function() --[[ Line: 32 ]]
		-- upvalues: GetFFlagEnableAmpUserMismatchTelemetryModule (upval), AuthModalShownFunction (upval), EntryPointEventCtx (copy)
		if GetFFlagEnableAmpUserMismatchTelemetryModule() then
			AuthModalShownFunction(EntryPointEventCtx or "", nil, "userMismatch")
		end
	end, { EntryPointEventCtx })
	
	return ReactModule.createElement(Dialog.Root, { size = DialogSize.Medium }, {
		Title = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = AmpErrorScreenUserMismatchTitle.title
		}),
		BodyText = ReactModule.createElement(Dialog.Text, {
			LayoutOrder = 2,
			Text = AmpErrorScreenUserMismatchTitle.description
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = AmpErrorScreenUserMismatchTitle.ok,
					variant = ButtonVariant.Emphasis,
					onActivated = ReactModule.useCallback(function() --[[ Line: 38 ]]
						-- upvalues: Navigation (copy)
						Navigation.goBack()
					end, { Navigation })
				}
			}
		})
	})
end