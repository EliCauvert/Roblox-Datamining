local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
local VRService = game:GetService("VRService")
local reactModule = require(parent.React)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local constantsModule = require(interventionShared.Utils.Constants)
local cryoModule = require(parent.Cryo)
local evidenceFieldModule = require(interventionShared.Components.genericComponents.EvidenceField)
local interventionDialogFooterModule = require(interventionShared.Components.genericComponents.InterventionDialogFooter)
local interventionDialogLoadingSkeletonModule = require(interventionShared.Components.genericComponents.InterventionDialogLoadingSkeleton)
local interventionAnalyticsModule = require(interventionShared.InterventionAnalytics)
local linkingProtocol = require(parent.LinkingProtocol).LinkingProtocol
local postDismissInterventionModule = require(interventionShared.Http.PostDismissIntervention)
local responsiveModule = require(parent.Responsive)
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local focusNavigableSurfaceIdentifierEnum = require(parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local foundationModule = require(parent.Foundation)
local badge = foundationModule.Badge
local badgeVariant = foundationModule.Enums.BadgeVariant
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local buttonSize = foundationModule.Enums.ButtonSize
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local divider = foundationModule.Divider
local iconName = foundationModule.Enums.IconName
local iconPosition = foundationModule.Enums.IconPosition
local iconVariant = foundationModule.Enums.IconVariant
local text = foundationModule.Text
local view = foundationModule.View
local images = require(parent.FoundationImages).Images
local useInterventionFocusRootModule = require(interventionShared.Hooks.useInterventionFocusRoot)
local useInterventionPlacementModule = require(interventionShared.Hooks.useInterventionPlacement)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local usePreferredInput = responsiveModule.usePreferredInput
local useTokens = foundationModule.Hooks.useTokens
local useWebViewModule = require(interventionShared.Hooks.useWebView)
local fFlagNavigateToSafetyDashboardForAppeals = require(parent.SharedFlags).FFlagNavigateToSafetyDashboardForAppeals
local fFlagUFRImprovementsModule = require(interventionShared.Flags.FFlagUFRImprovements)
local fFlagUFRInlineAppealLinkModule = require(interventionShared.Flags.FFlagUFRInlineAppealLink)
local fFlagUniversalFeatureRestrictionReceivers = require(parent.SharedFlags).FFlagUniversalFeatureRestrictionReceivers
local accept = images["icons/actions/accept"]

local function _(p0) --[[ line: 88 | named "getNonEmptyString" ]]
	return if p0 == "" then nil else p0
end

return reactModule.memo(function(p1) --[[ line: 97 | named "GenericInterventionDialog" ]]
	-- upvalues: useTokens (ref), useRef (ref), useInterventionPlacementModule (ref), useLocalization (ref), constantsModule (ref), usePreferredInput (ref), responsiveModule (ref), fFlagNavigateToSafetyDashboardForAppeals (ref), urlBuilder (ref), useWebViewModule (ref), linkingProtocol (ref), useInterventionFocusRootModule (ref), focusNavigableSurfaceIdentifierEnum (ref), useEffect (ref), interventionAnalyticsModule (ref), useCallback (ref), postDismissInterventionModule (ref), fFlagUniversalFeatureRestrictionReceivers (ref), notificationModalsManagerModule (ref), accept (ref), VRService (ref), fFlagUFRInlineAppealLinkModule (ref), reactModule (ref), text (ref), fFlagUFRImprovementsModule (ref), view (ref), divider (ref), evidenceFieldModule (ref), badge (ref), badgeVariant (ref), iconName (ref), iconPosition (ref), iconVariant (ref), cryoModule (ref), button (ref), buttonVariant (ref), buttonSize (ref), dialog (ref), dialogSize (ref), interventionDialogLoadingSkeletonModule (ref), interventionDialogFooterModule (ref)
	local var18 = useTokens()
	local interventionId = p1.interventionId
	local var19 = if interventionId == "" then nil else interventionId
	local dsaMessage = p1.dsaMessage
	local var20 = if dsaMessage == "" then nil else dsaMessage
	local evidence = p1.evidence
	local var21 = if evidence == "" then nil else evidence
	local formattedEndDate = p1.formattedEndDate
	local var22 = if formattedEndDate == "" then nil else formattedEndDate
	local userNote = p1.userNote
	local var23 = if userNote == "" then nil else userNote
	local violationReason = p1.violationReason
	local var24 = if violationReason == "" then nil else violationReason
	local var25 = useRef(DateTime.now().UnixTimestampMillis)
	local var26 = useInterventionPlacementModule()
	local var27 = useLocalization(constantsModule.localizationKeys)
	local var28 = usePreferredInput() == responsiveModule.Input.Directional
	local var29 = if fFlagNavigateToSafetyDashboardForAppeals then urlBuilder.static.safetyDashboard.main() else urlBuilder.static.appealsPortal.main()
	local var30 = useWebViewModule(var29, if fFlagNavigateToSafetyDashboardForAppeals then var27.AccountStatusTitleText else var27.AppealsPortalTitleText)
	local default = linkingProtocol.default
	local var31 = useInterventionFocusRootModule({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ModerationOverlay
	})
	useEffect(function() --[[ line: 128 ]]
		-- upvalues: interventionAnalyticsModule (copy), p1 (ref), var26 (ref), var25 (ref)
		interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogRendered, {
			eventType = interventionAnalyticsModule.Constants.EventTypes.ModalAppeared,
			interventionType = p1.interventionTypeForAnalytics,
			placement = var26,
			renderedTimestamp = var25.current,
			eventId = p1.eventId,
			evidence = p1.evidence,
			duration = p1.durationForAnalytics,
			acknowledgeable = p1.acknowledgeable,
			abuseVector = p1.abuseVectorForAnalytics
		})
	end, { var25 })
	local var32 = useCallback(function() --[[ line: 143 ]]
		-- upvalues: p1 (ref), var19 (ref), postDismissInterventionModule (copy), interventionAnalyticsModule (copy), var26 (ref), var25 (ref)
		if p1.acknowledgeable and var19 then
			postDismissInterventionModule(var19):andThen(function(_) --[[ line: 145 ]]
				-- upvalues: interventionAnalyticsModule (copy), p1 (copy), var26 (copy), var25 (copy)
				interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissSuccess, {
					eventType = interventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissSuccess,
					interventionType = p1.interventionTypeForAnalytics,
					placement = var26,
					renderedTimestamp = var25.current,
					eventId = p1.eventId,
					acknowledgeable = p1.acknowledgeable,
					abuseVector = p1.abuseVectorForAnalytics
				})
			end):catch(function(p2) --[[ line: 158 ]]
				-- upvalues: interventionAnalyticsModule (copy), p1 (copy), var26 (copy), var25 (copy)
				interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissFailed, {
					eventType = interventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissFailed,
					interventionType = p1.interventionTypeForAnalytics,
					placement = var26,
					renderedTimestamp = var25.current,
					eventId = p1.eventId,
					error = p2.error,
					acknowledgeable = p1.acknowledgeable,
					abuseVector = p1.abuseVectorForAnalytics
				})
			end)
		end
	end, {
		p1.acknowledgeable, var19, p1.interventionTypeForAnalytics, var26,
		var25.current, p1.eventId, p1.abuseVectorForAnalytics
	})
	local var33 = useCallback(function() --[[ line: 189 ]]
		-- upvalues: interventionAnalyticsModule (copy), p1 (ref), var26 (ref), var25 (ref), fFlagUniversalFeatureRestrictionReceivers (copy), var32 (ref), var19 (ref), postDismissInterventionModule (copy)
		interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogCtaClicked, {
			eventType = interventionAnalyticsModule.Constants.EventTypes.CtaClicked,
			interventionType = p1.interventionTypeForAnalytics,
			placement = var26,
			renderedTimestamp = var25.current,
			eventId = p1.eventId,
			acknowledgeable = p1.acknowledgeable,
			abuseVector = p1.abuseVectorForAnalytics
		})
		
		if fFlagUniversalFeatureRestrictionReceivers then
			var32()
		elseif p1.acknowledgeable and var19 then
			postDismissInterventionModule(var19):andThen(function(_) --[[ line: 204 ]]
				-- upvalues: interventionAnalyticsModule (copy), p1 (copy), var26 (copy), var25 (copy)
				interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissSuccess, {
					eventType = interventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissSuccess,
					interventionType = p1.interventionTypeForAnalytics,
					placement = var26,
					renderedTimestamp = var25.current,
					eventId = p1.eventId,
					acknowledgeable = p1.acknowledgeable,
					abuseVector = p1.abuseVectorForAnalytics
				})
			end):catch(function(p3) --[[ line: 217 ]]
				-- upvalues: interventionAnalyticsModule (copy), p1 (copy), var26 (copy), var25 (copy)
				interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissFailed, {
					eventType = interventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissFailed,
					interventionType = p1.interventionTypeForAnalytics,
					placement = var26,
					renderedTimestamp = var25.current,
					eventId = p1.eventId,
					error = p3.error,
					acknowledgeable = p1.acknowledgeable,
					abuseVector = p1.abuseVectorForAnalytics
				})
			end)
		end
		p1.onDismiss()
	end, {
		p1.onDismiss, p1.interventionTypeForAnalytics, var26, var25.current,
		p1.eventId, p1.abuseVectorForAnalytics, p1.acknowledgeable, var19, var32
	})
	local var34 = useCallback(function() --[[ line: 253 ]]
		-- upvalues: interventionAnalyticsModule (copy), p1 (ref), var26 (ref), var25 (ref), fFlagUniversalFeatureRestrictionReceivers (copy), var32 (ref), notificationModalsManagerModule (copy), accept (copy), var27 (ref), var18 (ref), VRService (copy), var28 (ref), default (ref), var29 (ref), var30 (ref)
		interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogAppealClicked, {
			eventType = interventionAnalyticsModule.Constants.EventTypes.AppealClicked,
			interventionType = p1.interventionTypeForAnalytics,
			placement = var26,
			renderedTimestamp = var25.current,
			eventId = p1.eventId,
			acknowledgeable = p1.acknowledgeable,
			abuseVector = p1.abuseVectorForAnalytics
		})
		
		if fFlagUniversalFeatureRestrictionReceivers and p1.useDetailedLayout and p1.onAppeal then
			p1.onAppeal()
			
			if not p1.shouldOpenAppealsPortal then
				var32()
				p1.onDismiss()
				notificationModalsManagerModule.SetUIBloxToast({
					iconImage = accept,
					toastTitle = var27.TakeALookText,
					toastSubtitle = var27.FeedbackHelpsText,
					sequenceNumber = DateTime.now().UnixTimestamp,
					iconColorStyle = {
						Transparency = 0,
						Color = var18.Color.System.Success.Color3
					}
				})
				
				return
			elseif VRService.VREnabled or var28 then
				default:openURL(var29)
				
				return
			end
			var30()
		end
	end, {
		var30, default, VRService.VREnabled, var28, p1.interventionTypeForAnalytics,
		var26, var25.current, var29, p1.abuseVectorForAnalytics, p1.acknowledgeable,
		var19, p1.eventId, var27.FeedbackHelpsText, var27.TakeALookText, p1.onAppeal,
		p1.shouldOpenAppealsPortal, p1.onDismiss, p1.useDetailedLayout,
		var18.Color.System.Success.Color3, var32
	})
	local t = {}
	local useDetailedLayout = fFlagUniversalFeatureRestrictionReceivers and p1.useDetailedLayout
	local useDetailedLayout_1 = fFlagUFRInlineAppealLinkModule and useDetailedLayout
	
	if p1.bodyText and p1.bodyText ~= "" then
		t.BodyText = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium content-default text-align-x-left text-wrap",
			testId = "dialog-body-text",
			LayoutOrder = 1,
			Text = p1.bodyText
		})
	end
	if useDetailedLayout then
		local t_1 = {}
		local var39 = if fFlagUFRImprovementsModule then var24 else var23 or var22
		
		if var21 then
			t_1.EvidenceItem = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-x-medium",
				testId = "dialog-evidence-item",
				LayoutOrder = 1
			}, {
				EvidenceText = reactModule.createElement(text, {
					tag = "auto-xy text-body-medium text-align-x-left text-wrap",
					RichText = true,
					Text = var21
				})
			})
			
			if fFlagUFRImprovementsModule and var39 then
				t_1.DividerBelowEvidence = reactModule.createElement(divider, { LayoutOrder = 2 })
			end
		end
		if var24 then
			if not fFlagUFRImprovementsModule and var21 then
				t_1.DividerAfterEvidence = reactModule.createElement(divider, { LayoutOrder = 2 })
			end
			t_1.ReasonItem = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-x-medium",
				testId = "dialog-reason-item",
				LayoutOrder = 3
			}, {
				ReasonField = reactModule.createElement(evidenceFieldModule, { fieldLabel = var27.ReasonText, fieldValue = var24 })
			})
		end
		if var23 then
			t_1.NoteItem = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-x-medium",
				testId = "dialog-note-item",
				LayoutOrder = 4
			}, {
				NoteText = reactModule.createElement(evidenceFieldModule, {
					fieldLabel = var27.ModeratorNoteLabel,
					fieldValue = var23
				})
			})
		end
		if var22 then
			t_1.EndingOnItem = reactModule.createElement(view, {
				tag = "size-full-0 auto-y row padding-x-medium align-y-center",
				testId = "dialog-ending-on-item",
				LayoutOrder = 5
			}, {
				EndingOnInfo = reactModule.createElement(view, { tag = "auto-y col fill", LayoutOrder = 1 }, {
					EvidenceField = reactModule.createElement(evidenceFieldModule, {
						hasColon = false,
						fieldLabel = var27.EndsOnText,
						fieldValue = var22
					})
				}),
				CountdownBadge = reactModule.createElement(badge, {
					LayoutOrder = 2,
					text = p1.countdownText or var27.CompleteText,
					variant = badgeVariant.Neutral,
					icon = if p1.countdownText then {
						name = iconName.Clock,
						position = iconPosition.Left,
						variant = iconVariant.Filled
					} else nil
				})
			})
		end
		if not cryoModule.isEmpty(t_1) then
			t.DetailedList = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-top-xxsmall padding-x-xxsmall padding-bottom-medium",
				testId = "dialog-detailed-list",
				LayoutOrder = 2
			}, reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y padding-y-large stroke-standard stroke-default radius-large bg-shift-100"
			}, t_1))
		end
	elseif var21 or var24 or p1.isAppealable then
		t.Evidence = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-xxsmall",
			LayoutOrder = 2
		}, {
			reactModule.createElement(view, {
				tag = "size-full-0 auto-y col gap-small padding-medium radius-medium bg-surface-200 stroke-standard stroke-default"
			}, {
				EvidenceText = var21 and reactModule.createElement(text, {
					tag = "auto-xy text-body-medium text-align-x-left text-wrap",
					RichText = true,
					LayoutOrder = 1,
					Text = var21
				}),
				Reason = var24 and reactModule.createElement(text, {
					tag = "auto-xy text-body-medium text-align-x-left text-wrap",
					RichText = true,
					LayoutOrder = 2,
					Text = `<b>{var27.ReasonText}:</b>\n{var24}`
				}),
				AppealButton = p1.isAppealable and reactModule.createElement(button, {
					LayoutOrder = 3,
					text = var27.ReportMistakeText,
					variant = buttonVariant.Standard,
					size = buttonSize.XSmall,
					width = UDim.new(1, 0),
					onActivated = var34
				})
			})
		})
	end
	if var20 and not useDetailedLayout then
		t.DsaMessage = reactModule.createElement(text, {
			tag = "auto-xy text-caption-small content-default text-align-x-left text-wrap",
			LayoutOrder = 3,
			Text = var20
		})
	end
	local var40 = if useDetailedLayout then {
		{
			variant = buttonVariant.Emphasis,
			size = buttonSize.Medium,
			text = var27.OkText,
			onActivated = var33,
			width = UDim.new(1, 0)
		}
	} else {
		{
			variant = buttonVariant.Emphasis,
			size = buttonSize.Small,
			text = var27.OkText,
			onActivated = var33
		}
	}
	
	if useDetailedLayout and p1.isAppealable and not fFlagUFRInlineAppealLinkModule then
		table.insert(var40, {
			variant = buttonVariant.Standard,
			size = buttonSize.Medium,
			text = var27.ReportMistakeText,
			onActivated = var34,
			width = UDim.new(1, 0)
		})
	end
	local createElement = reactModule.createElement
	local root = dialog.Root
	local t_1 = {
		hasCloseButton = false,
		size = dialogSize.Medium,
		ref = var31,
		hasBackdrop = not VRService.VREnabled,
		disablePortal = var26 ~= constantsModule.InterventionPlacementType.InExperience
	}
	local t_2 = {
		DialogTitle = not p1.isLoading and reactModule.createElement(dialog.Title, { text = p1.titleText }),
		DialogContent = reactModule.createElement(dialog.Content, if useDetailedLayout_1 then { LayoutOrder = 2 } else nil, if p1.isLoading then reactModule.createElement(interventionDialogLoadingSkeletonModule) else reactModule.createElement(view, { tag = "size-full-0 auto-y col gap-medium" }, t)),
		DialogFooter = not p1.isLoading and (useDetailedLayout_1 and reactModule.createElement(interventionDialogFooterModule, {
			ctaText = var27.OkText,
			dsaMessage = p1.dsaMessage,
			isAppealable = p1.isAppealable,
			onAppealActivated = var34,
			onCtaActivated = var33
		}))
	}
	local var43 = not p1.isLoading
	
	if var43 then
		var43 = not useDetailedLayout_1
		
		if var43 then
			var43 = reactModule.createElement
			var43 = var43(dialog.Actions, {
				actions = var40,
				label = if useDetailedLayout and p1.useDetailedLayout and var20 then var20 else nil
			})
		end
	end
	t_2.DialogActions = var43
	
	return createElement(root, t_1, t_2)
end)