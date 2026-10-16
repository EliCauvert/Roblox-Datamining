local InterventionShared = script:FindFirstAncestor("InterventionShared")
local Parent = InterventionShared.Parent
local Players = game:GetService("Players")
local TelemetryService = game:GetService("TelemetryService")
local VRService = game:GetService("VRService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ButtonSize = FoundationModule.Enums.ButtonSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local FocusNavigableSurfaceIdentifierEnum = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local ConstantsModule = require(InterventionShared.Utils.Constants)
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseInterventionFocusRootModule = require(InterventionShared.Hooks.useInterventionFocusRoot)
local UseInterventionPlacementModule = require(InterventionShared.Hooks.useInterventionPlacement)
local IconsActionsAccept = require(Parent.FoundationImages).Images["icons/actions/accept"]
local config = {
	eventName = "InExpAvatarViolationReportMistake",
	throttlingPercentage = 10000,
	description = "Fired when user clicks on the report mistake button on the avatar kick warning dialog",
	backends = { "EventIngest" },
	lastUpdated = { 2026, 6, 8 }
}

local function sendReportMistakeAnalytics(p1) --[[ Line: 48 ]]
	-- upvalues: Players (copy), TelemetryService (copy), config (copy)
	TelemetryService:LogEvent(config, {
		customFields = {
			avatar_entity_id = p1.avatarEntityId or "",
			user_id = if Players.LocalPlayer and Players.LocalPlayer.UserId then tostring(Players.LocalPlayer.UserId) else "0",
			violation_type = p1.violationType or "",
			place_id = p1.placeId or tostring(game.PlaceId),
			timestamp = DateTime.now().UnixTimestampMillis
		}
	})
end

return ReactModule.memo(function(p1) --[[ Line: 72 | Named "TemporaryAvatarKickWarningDialog" ]]
	-- upvalues: UseLocalizationFunction (copy), ConstantsModule (copy), UseTokensFunction (copy), UseInterventionPlacementModule (copy), UseInterventionFocusRootModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), ReactModule (copy), sendReportMistakeAnalytics (copy), NotificationModalsManagerModule (copy), IconsActionsAccept (copy), Dialog (copy), DialogSize (copy), VRService (copy), View (copy), Text (copy), ButtonVariant (copy), ButtonSize (copy)
	local UseLocalizationResult = UseLocalizationFunction(ConstantsModule.localizationKeys)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(Dialog.Root, {
		hasCloseButton = false,
		size = DialogSize.Medium,
		hasBackdrop = not VRService.VREnabled,
		disablePortal = UseInterventionPlacementModule() ~= ConstantsModule.InterventionPlacementType.InExperience,
		ref = UseInterventionFocusRootModule({
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ModerationOverlay
		})
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.AvatarKickWarningTitle }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			Body = ReactModule.createElement(View, { tag = "col gap-medium size-full-0 auto-y" }, {
				BodyText = ReactModule.createElement(Text, {
					tag = "auto-xy text-body-medium text-wrap text-align-x-left content-default",
					LayoutOrder = 1,
					Text = UseLocalizationResult.AvatarKickWarningDescription
				})
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			actions = {
				{
					variant = ButtonVariant.Emphasis,
					size = ButtonSize.Medium,
					text = UseLocalizationResult.OkText,
					onActivated = p1.onDismiss,
					width = UDim.new(1, 0)
				},
				{
					variant = ButtonVariant.Utility,
					size = ButtonSize.Medium,
					text = UseLocalizationResult.ReportMistakeText,
					onActivated = ReactModule.useCallback(function() --[[ Line: 82 ]]
						-- upvalues: sendReportMistakeAnalytics (upval), p1 (copy), NotificationModalsManagerModule (upval), IconsActionsAccept (upval), UseLocalizationResult (copy), UseTokensResult (copy)
						sendReportMistakeAnalytics(p1)
						p1.onDismiss()
						NotificationModalsManagerModule.SetUIBloxToast({
							iconImage = IconsActionsAccept,
							toastTitle = UseLocalizationResult.Thanks,
							toastSubtitle = UseLocalizationResult.FeedbackHelpsText,
							sequenceNumber = DateTime.now().UnixTimestamp,
							iconColorStyle = {
								Color = UseTokensResult.Color.System.Success.Color3,
								Transparency = UseTokensResult.Color.System.Success.Transparency
							}
						})
					end, {
						p1,
						UseTokensResult,
						UseLocalizationResult.FeedbackHelpsText,
						UseLocalizationResult.Thanks
					}),
					width = UDim.new(1, 0)
				}
			}
		})
	})
end)