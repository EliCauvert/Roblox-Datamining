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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useLocalization (ref), reactModule (ref), traversalTelemetryModule (ref), teleportBackModule (ref), dialog (ref), dialogSize (ref), orientation (ref), buttonVariant (ref)
	local var1 = useLocalization({
		leaveHeader = "CoreScripts.InGameMenu.Traversal.LeaveHeader",
		leaveContinueAction = "CoreScripts.InGameMenu.Actions.Continue",
		leaveCancelAction = "CoreScripts.InGameMenu.Cancel",
		leaveBody = {
			"CoreScripts.InGameMenu.Traversal.LeaveBody",
			PREVIOUS_EXPERIENCE = p1.teleportName
		}
	})
	
	return reactModule.createElement(dialog.Root, {
		size = dialogSize.Small,
		onClose = function(p3)
			-- upvalues: traversalTelemetryModule (copy), p1 (ref)
			traversalTelemetryModule.sendTeleportConfirmationActions({ event_type = "cancel", source = p1.source })
			
			if p1.onClose then
				p1.onClose(p3)
			end
		end,
		hasBackdrop = p1.hasBackdrop ~= nil or p1.hasBackdrop,
		ref = p2
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, {
			testId = "--foundation-dialog--title",
			text = var1.leaveHeader
		}),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, { Text = var1.leaveBody })
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			orientation = orientation.Vertical,
			actions = {
				{
					testId = "--teleport-leave-continue",
					text = var1.leaveContinueAction,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function()
						-- upvalues: traversalTelemetryModule (copy), p1 (ref), teleportBackModule (copy)
						traversalTelemetryModule.sendTeleportConfirmationActions({ event_type = "confirm", source = p1.source })
						teleportBackModule(p1.placeId)
					end, { teleportBackModule, p1.placeId })
				},
				{
					testId = "--teleport-leave-cancel",
					text = var1.leaveCancelAction,
					variant = buttonVariant.Standard,
					onActivated = function()
						-- upvalues: traversalTelemetryModule (copy), p1 (ref)
						traversalTelemetryModule.sendTeleportConfirmationActions({ event_type = "cancel", source = p1.source })
						p1.onCancel()
					end
				}
			}
		})
	})
end))