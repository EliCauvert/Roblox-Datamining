local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
local playersService = game:GetService("Players")
local telemetryService = game:GetService("TelemetryService")
local VRService = game:GetService("VRService")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local buttonSize = foundationModule.Enums.ButtonSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local focusNavigableSurfaceIdentifierEnum = require(parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local images = require(parent.FoundationImages).Images
local constantsModule = require(interventionShared.Utils.Constants)
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useInterventionFocusRootModule = require(interventionShared.Hooks.useInterventionFocusRoot)
local useInterventionPlacementModule = require(interventionShared.Hooks.useInterventionPlacement)
local accept = images["icons/actions/accept"]
local t = {
	eventName = "InExpAvatarViolationReportMistake",
	throttlingPercentage = 10000,
	description = "Fired when user clicks on the report mistake button on the avatar kick warning dialog",
	backends = { "EventIngest" },
	lastUpdated = { 2026, 6, 8 }
}

local function sendReportMistakeAnalytics(p0)
	-- upvalues: playersService (ref), telemetryService (ref), t (ref)
	telemetryService:LogEvent(t, {
		customFields = {
			avatar_entity_id = p0.avatarEntityId or "",
			user_id = if playersService.LocalPlayer and playersService.LocalPlayer.UserId then tostring(playersService.LocalPlayer.UserId) else "0",
			violation_type = p0.violationType or "",
			place_id = p0.placeId or tostring(game.PlaceId),
			timestamp = DateTime.now().UnixTimestampMillis
		}
	})
end

return reactModule.memo(function(p1)
	-- upvalues: useLocalization (ref), constantsModule (ref), useTokens (ref), useInterventionPlacementModule (ref), useInterventionFocusRootModule (ref), focusNavigableSurfaceIdentifierEnum (ref), reactModule (ref), sendReportMistakeAnalytics (ref), notificationModalsManagerModule (ref), accept (ref), dialog (ref), dialogSize (ref), VRService (ref), view (ref), text (ref), buttonVariant (ref), buttonSize (ref)
	local var12 = useLocalization(constantsModule.localizationKeys)
	local var13 = useTokens()
	
	return reactModule.createElement(dialog.Root, {
		hasCloseButton = false,
		size = dialogSize.Medium,
		hasBackdrop = not VRService.VREnabled,
		disablePortal = useInterventionPlacementModule() ~= constantsModule.InterventionPlacementType.InExperience,
		ref = useInterventionFocusRootModule({
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ModerationOverlay
		})
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var12.AvatarKickWarningTitle }),
		DialogContent = reactModule.createElement(dialog.Content, nil, {
			Body = reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, {
				BodyText = reactModule.createElement(text, {
					tag = "auto-xy text-body-medium text-wrap text-align-x-left content-default",
					LayoutOrder = 1,
					Text = var12.AvatarKickWarningDescription
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			actions = {
				{
					variant = buttonVariant.Emphasis,
					size = buttonSize.Medium,
					text = var12.OkText,
					onActivated = p1.onDismiss,
					width = UDim.new(1, 0)
				},
				{
					variant = buttonVariant.Utility,
					size = buttonSize.Medium,
					text = var12.ReportMistakeText,
					onActivated = reactModule.useCallback(function()
						-- upvalues: sendReportMistakeAnalytics (copy), p1 (ref), notificationModalsManagerModule (copy), accept (copy), var12 (ref), var13 (ref)
						sendReportMistakeAnalytics(p1)
						p1.onDismiss()
						notificationModalsManagerModule.SetUIBloxToast({
							iconImage = accept,
							toastTitle = var12.Thanks,
							toastSubtitle = var12.FeedbackHelpsText,
							sequenceNumber = DateTime.now().UnixTimestamp,
							iconColorStyle = {
								Color = var13.Color.System.Success.Color3,
								Transparency = var13.Color.System.Success.Transparency
							}
						})
					end, { p1, var13, var12.FeedbackHelpsText, var12.Thanks }),
					width = UDim.new(1, 0)
				}
			}
		})
	})
end)