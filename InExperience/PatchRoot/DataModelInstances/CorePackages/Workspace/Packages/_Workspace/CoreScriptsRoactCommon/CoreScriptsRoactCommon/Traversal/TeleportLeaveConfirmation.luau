local parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local teleportBackModule = require(script.Parent.TeleportBack)
local traversalTelemetryModule = require(script.Parent.TraversalTelemetry)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local orientation = foundationModule.Enums.Orientation
local useLocalization = localizationModule.Hooks.useLocalization
local fFlagCoreUIExperiencesToGames = require(parent.SharedFlags).FFlagCoreUIExperiencesToGames

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 43 | named "TeleportLeaveConfirmation" ]]
	-- upvalues: useLocalization (ref), fFlagCoreUIExperiencesToGames (ref), reactModule (ref), traversalTelemetryModule (ref), teleportBackModule (ref), dialog (ref), dialogSize (ref), orientation (ref), buttonVariant (ref)
	local var5 = useLocalization({
		leaveHeader = "CoreScripts.InGameMenu.Traversal.LeaveHeader",
		leaveContinueAction = "CoreScripts.InGameMenu.Actions.Continue",
		leaveCancelAction = "CoreScripts.InGameMenu.Cancel",
		leaveBody = if fFlagCoreUIExperiencesToGames then {
			"CoreScripts.InGameMenu.Traversal.LeaveBodyUsingGame",
			PREVIOUS_GAME = p0.teleportName
		} else {
			"CoreScripts.InGameMenu.Traversal.LeaveBody",
			PREVIOUS_EXPERIENCE = p0.teleportName
		}
	})
	
	return reactModule.createElement(dialog.Root, {
		size = dialogSize.Small,
		onClose = function(p2) --[[ line: 73 ]]
			-- upvalues: traversalTelemetryModule (copy), p0 (ref)
			traversalTelemetryModule.sendTeleportConfirmationActions({ event_type = "cancel", source = p0.source })
			
			if p0.onClose then
				p0.onClose(p2)
			end
		end,
		hasBackdrop = p0.hasBackdrop ~= nil or p0.hasBackdrop,
		ref = p1
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, {
			testId = "--foundation-dialog--title",
			text = var5.leaveHeader
		}),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var5.leaveBody })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Vertical,
			actions = {
				{
					testId = "--teleport-leave-continue",
					text = var5.leaveContinueAction,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function() --[[ line: 62 ]]
						-- upvalues: traversalTelemetryModule (copy), p0 (ref), teleportBackModule (copy)
						traversalTelemetryModule.sendTeleportConfirmationActions({ event_type = "confirm", source = p0.source })
						teleportBackModule(p0.placeId)
					end, { teleportBackModule, p0.placeId })
				},
				{
					testId = "--teleport-leave-cancel",
					text = var5.leaveCancelAction,
					variant = buttonVariant.Standard,
					onActivated = function() --[[ line: 113 ]]
						-- upvalues: traversalTelemetryModule (copy), p0 (ref)
						traversalTelemetryModule.sendTeleportConfirmationActions({ event_type = "cancel", source = p0.source })
						p0.onCancel()
					end
				}
			}
		})
	})
end))