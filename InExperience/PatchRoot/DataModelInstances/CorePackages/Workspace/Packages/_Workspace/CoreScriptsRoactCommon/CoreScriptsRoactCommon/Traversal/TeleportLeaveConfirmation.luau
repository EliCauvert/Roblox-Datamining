local Parent = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local TeleportBackModule = require(script.Parent.TeleportBack)
local TraversalTelemetryModule = require(script.Parent.TraversalTelemetry)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Orientation = FoundationModule.Enums.Orientation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 40 | Named "TeleportLeaveConfirmation" ]]
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), TraversalTelemetryModule (copy), TeleportBackModule (copy), Dialog (copy), DialogSize (copy), Orientation (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		leaveHeader = "CoreScripts.InGameMenu.Traversal.LeaveHeader",
		leaveContinueAction = "CoreScripts.InGameMenu.Actions.Continue",
		leaveCancelAction = "CoreScripts.InGameMenu.Cancel",
		leaveBody = {
			"CoreScripts.InGameMenu.Traversal.LeaveBody",
			PREVIOUS_EXPERIENCE = p1.teleportName
		}
	})
	
	return ReactModule.createElement(Dialog.Root, {
		size = DialogSize.Small,
		onClose = function(p2) --[[ Line: 65 ]]
			-- upvalues: TraversalTelemetryModule (upval), p1 (copy)
			TraversalTelemetryModule.sendTeleportConfirmationActions({ event_type = "cancel", source = p1.source })
			
			if p1.onClose then
				p1.onClose(p2)
			end
		end,
		hasBackdrop = p1.hasBackdrop == nil or p1.hasBackdrop,
		ref = Ref
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, {
			testId = "--foundation-dialog--title",
			text = UseLocalizationResult.leaveHeader
		}),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.leaveBody })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			orientation = Orientation.Vertical,
			actions = {
				{
					testId = "--teleport-leave-continue",
					text = UseLocalizationResult.leaveContinueAction,
					variant = ButtonVariant.Emphasis,
					onActivated = ReactModule.useCallback(function() --[[ Line: 54 ]]
						-- upvalues: TraversalTelemetryModule (upval), p1 (copy), TeleportBackModule (upval)
						TraversalTelemetryModule.sendTeleportConfirmationActions({ event_type = "confirm", source = p1.source })
						TeleportBackModule(p1.placeId)
					end, { TeleportBackModule, p1.placeId })
				},
				{
					testId = "--teleport-leave-cancel",
					text = UseLocalizationResult.leaveCancelAction,
					variant = ButtonVariant.Standard,
					onActivated = function() --[[ Line: 105 ]]
						-- upvalues: TraversalTelemetryModule (upval), p1 (copy)
						TraversalTelemetryModule.sendTeleportConfirmationActions({ event_type = "cancel", source = p1.source })
						p1.onCancel()
					end
				}
			}
		})
	})
end))