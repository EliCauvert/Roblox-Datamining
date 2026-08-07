local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local authModalShown = require(parent.AuthAnalytics).Events.authModalShown
local getFFlagEnableAmpUserMismatchTelemetryModule = require(ampUpsell.Flags.GetFFlagEnableAmpUserMismatchTelemetry)

return function(p0) --[[ line: 22 | named "AmpWizardUserMismatchModal" ]]
	-- upvalues: useLocalization (ref), reactModule (ref), getFFlagEnableAmpUserMismatchTelemetryModule (ref), authModalShown (ref), dialog (ref), dialogSize (ref), buttonVariant (ref)
	local navigation = p0.navigation
	local entryPointEventCtx = p0.entryPointEventCtx
	local var4 = useLocalization({
		title = "Amp.ErrorScreen.UserMismatchTitle",
		description = "Amp.ErrorScreen.UserMismatchBody",
		ok = "CommonUI.Controls.Action.OK"
	})
	reactModule.useEffect(function() --[[ line: 32 ]]
		-- upvalues: getFFlagEnableAmpUserMismatchTelemetryModule (copy), authModalShown (copy), entryPointEventCtx (ref)
		if getFFlagEnableAmpUserMismatchTelemetryModule() then
			authModalShown(entryPointEventCtx or "", nil, "userMismatch")
		end
	end, { entryPointEventCtx })
	
	return reactModule.createElement(dialog.Root, { size = dialogSize.Medium }, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var4.title }),
		BodyText = reactModule.createElement(dialog.Text, { LayoutOrder = 2, Text = var4.description }),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var4.ok,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function() --[[ line: 38 ]]
						-- upvalues: navigation (ref)
						navigation.goBack()
					end, { navigation })
				}
			}
		})
	})
end