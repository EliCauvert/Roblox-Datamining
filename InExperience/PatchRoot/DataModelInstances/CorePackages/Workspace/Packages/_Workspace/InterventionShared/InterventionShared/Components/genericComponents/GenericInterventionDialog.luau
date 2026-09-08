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

local function _(p1)
	return if p1 == "" then nil else p1
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useRef (ref), useInterventionPlacementModule (ref), useLocalization (ref), constantsModule (ref), usePreferredInput (ref), responsiveModule (ref), fFlagNavigateToSafetyDashboardForAppeals (ref), urlBuilder (ref), useWebViewModule (ref), linkingProtocol (ref), useInterventionFocusRootModule (ref), focusNavigableSurfaceIdentifierEnum (ref), useEffect (ref), interventionAnalyticsModule (ref), useCallback (ref), postDismissInterventionModule (ref), fFlagUniversalFeatureRestrictionReceivers (ref), notificationModalsManagerModule (ref), accept (ref), VRService (ref), fFlagUFRInlineAppealLinkModule (ref), reactModule (ref), text (ref), fFlagUFRImprovementsModule (ref), view (ref), divider (ref), evidenceFieldModule (ref), badge (ref), badgeVariant (ref), iconName (ref), iconPosition (ref), iconVariant (ref), cryoModule (ref), button (ref), buttonVariant (ref), buttonSize (ref), dialog (ref), dialogSize (ref), interventionDialogLoadingSkeletonModule (ref), interventionDialogFooterModule (ref)
	local var1 = useTokens()
	local interventionId = p1.interventionId
	local var2 = if interventionId == "" then nil else interventionId
	local dsaMessage = p1.dsaMessage
	local var3 = if dsaMessage == "" then nil else dsaMessage
	local evidence = p1.evidence
	local var4 = if evidence == "" then nil else evidence
	local formattedEndDate = p1.formattedEndDate
	local var5 = if formattedEndDate == "" then nil else formattedEndDate
	local userNote = p1.userNote
	local var6 = if userNote == "" then nil else userNote
	local violationReason = p1.violationReason
	local var7 = if violationReason == "" then nil else violationReason
	local violationUid = p1.violationUid
	local var8 = if violationUid == "" then nil else violationUid
	local var9 = useRef(DateTime.now().UnixTimestampMillis)
	local var10 = useInterventionPlacementModule()
	local var11 = useLocalization(constantsModule.localizationKeys)
	local var12 = usePreferredInput() == responsiveModule.Input.Directional
	local var13 = if fFlagNavigateToSafetyDashboardForAppeals then if var8 then urlBuilder.static.safetyDashboard.violation({ id = var8 }) else urlBuilder.static.safetyDashboard.violations() else urlBuilder.static.appealsPortal.main()
	local var14 = useWebViewModule(var13, if fFlagNavigateToSafetyDashboardForAppeals then var11.AccountStatusTitleText else var11.AppealsPortalTitleText)
	local default = linkingProtocol.default
	local var15 = useInterventionFocusRootModule({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ModerationOverlay
	})
	useEffect(function()
		-- upvalues: interventionAnalyticsModule (copy), p1 (ref), var10 (ref), var9 (ref)
		interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogRendered, {
			eventType = interventionAnalyticsModule.Constants.EventTypes.ModalAppeared,
			interventionType = p1.interventionTypeForAnalytics,
			placement = var10,
			renderedTimestamp = var9.current,
			eventId = p1.eventId,
			evidence = p1.evidence,
			duration = p1.durationForAnalytics,
			acknowledgeable = p1.acknowledgeable,
			abuseVector = p1.abuseVectorForAnalytics
		})
	end, { var9 })
	local var16 = useCallback(function()
		-- upvalues: p1 (ref), var2 (ref), postDismissInterventionModule (copy), interventionAnalyticsModule (copy), var10 (ref), var9 (ref)
		if p1.acknowledgeable and var2 then
			postDismissInterventionModule(var2):andThen(function(_)
				-- upvalues: interventionAnalyticsModule (copy), p1 (copy), var10 (copy), var9 (copy)
				interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissSuccess, {
					eventType = interventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissSuccess,
					interventionType = p1.interventionTypeForAnalytics,
					placement = var10,
					renderedTimestamp = var9.current,
					eventId = p1.eventId,
					acknowledgeable = p1.acknowledgeable,
					abuseVector = p1.abuseVectorForAnalytics
				})
				
				if p1.onAcknowledgementSuccess then
					p1.onAcknowledgementSuccess()
				end
			end):catch(function(p2)
				-- upvalues: interventionAnalyticsModule (copy), p1 (copy), var10 (copy), var9 (copy)
				interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissFailed, {
					eventType = interventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissFailed,
					interventionType = p1.interventionTypeForAnalytics,
					placement = var10,
					renderedTimestamp = var9.current,
					eventId = p1.eventId,
					error = p2.error,
					acknowledgeable = p1.acknowledgeable,
					abuseVector = p1.abuseVectorForAnalytics
				})
			end)
		end
	end, {
		p1.acknowledgeable, var2, p1.interventionTypeForAnalytics, var10,
		var9.current, p1.eventId, p1.abuseVectorForAnalytics,
		p1.onAcknowledgementSuccess
	})
	local var17 = useCallback(function()
		-- upvalues: interventionAnalyticsModule (copy), p1 (ref), var10 (ref), var9 (ref), fFlagUniversalFeatureRestrictionReceivers (copy), var16 (ref), var2 (ref), postDismissInterventionModule (copy)
		interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogCtaClicked, {
			eventType = interventionAnalyticsModule.Constants.EventTypes.CtaClicked,
			interventionType = p1.interventionTypeForAnalytics,
			placement = var10,
			renderedTimestamp = var9.current,
			eventId = p1.eventId,
			acknowledgeable = p1.acknowledgeable,
			abuseVector = p1.abuseVectorForAnalytics
		})
		
		if fFlagUniversalFeatureRestrictionReceivers then
			var16()
		elseif p1.acknowledgeable and var2 then
			postDismissInterventionModule(var2):andThen(function(_)
				-- upvalues: interventionAnalyticsModule (copy), p1 (copy), var10 (copy), var9 (copy)
				interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissSuccess, {
					eventType = interventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissSuccess,
					interventionType = p1.interventionTypeForAnalytics,
					placement = var10,
					renderedTimestamp = var9.current,
					eventId = p1.eventId,
					acknowledgeable = p1.acknowledgeable,
					abuseVector = p1.abuseVectorForAnalytics
				})
				
				if p1.onAcknowledgementSuccess then
					p1.onAcknowledgementSuccess()
				end
			end):catch(function(p2)
				-- upvalues: interventionAnalyticsModule (copy), p1 (copy), var10 (copy), var9 (copy)
				interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissFailed, {
					eventType = interventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissFailed,
					interventionType = p1.interventionTypeForAnalytics,
					placement = var10,
					renderedTimestamp = var9.current,
					eventId = p1.eventId,
					error = p2.error,
					acknowledgeable = p1.acknowledgeable,
					abuseVector = p1.abuseVectorForAnalytics
				})
			end)
		end
		p1.onDismiss()
	end, {
		p1.onDismiss, p1.interventionTypeForAnalytics, var10, var9.current,
		p1.eventId, p1.abuseVectorForAnalytics, p1.acknowledgeable, var2, var16,
		p1.onAcknowledgementSuccess
	})
	local var18 = useCallback(function()
		-- upvalues: interventionAnalyticsModule (copy), p1 (ref), var10 (ref), var9 (ref), fFlagUniversalFeatureRestrictionReceivers (copy), var16 (ref), notificationModalsManagerModule (copy), accept (copy), var11 (ref), var1 (ref), VRService (copy), var12 (ref), default (ref), var13 (ref), var14 (ref)
		interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogAppealClicked, {
			eventType = interventionAnalyticsModule.Constants.EventTypes.AppealClicked,
			interventionType = p1.interventionTypeForAnalytics,
			placement = var10,
			renderedTimestamp = var9.current,
			eventId = p1.eventId,
			acknowledgeable = p1.acknowledgeable,
			abuseVector = p1.abuseVectorForAnalytics
		})
		
		if fFlagUniversalFeatureRestrictionReceivers and p1.useDetailedLayout and p1.onAppeal then
			p1.onAppeal()
			
			if not p1.shouldOpenAppealsPortal then
				var16()
				p1.onDismiss()
				notificationModalsManagerModule.SetUIBloxToast({
					iconImage = accept,
					toastTitle = var11.TakeALookText,
					toastSubtitle = var11.FeedbackHelpsText,
					sequenceNumber = DateTime.now().UnixTimestamp,
					iconColorStyle = {
						Transparency = 0,
						Color = var1.Color.System.Success.Color3
					}
				})
				
				return
			elseif VRService.VREnabled or var12 then
				default:openURL(var13)
				
				return
			end
			var14()
		end
	end, {
		var14, default, VRService.VREnabled, var12, p1.interventionTypeForAnalytics,
		var10, var9.current, var13, p1.abuseVectorForAnalytics, p1.acknowledgeable,
		var2, p1.eventId, var11.FeedbackHelpsText, var11.TakeALookText, p1.onAppeal,
		p1.shouldOpenAppealsPortal, p1.onDismiss, p1.useDetailedLayout,
		var1.Color.System.Success.Color3, var16
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
		local var19 = if fFlagUFRImprovementsModule then var7 else var6 or var5
		
		if var4 then
			t_1.EvidenceItem = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-x-medium",
				testId = "dialog-evidence-item",
				LayoutOrder = 1
			}, {
				EvidenceText = reactModule.createElement(text, {
					tag = "auto-xy text-body-medium text-align-x-left text-wrap",
					RichText = true,
					Text = var4
				})
			})
			
			if fFlagUFRImprovementsModule and var19 then
				t_1.DividerBelowEvidence = reactModule.createElement(divider, { LayoutOrder = 2 })
			end
		end
		if var7 then
			if not fFlagUFRImprovementsModule and var4 then
				t_1.DividerAfterEvidence = reactModule.createElement(divider, { LayoutOrder = 2 })
			end
			t_1.ReasonItem = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-x-medium",
				testId = "dialog-reason-item",
				LayoutOrder = 3
			}, {
				ReasonField = reactModule.createElement(evidenceFieldModule, { fieldLabel = var11.ReasonText, fieldValue = var7 })
			})
		end
		if var6 then
			t_1.NoteItem = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-x-medium",
				testId = "dialog-note-item",
				LayoutOrder = 4
			}, {
				NoteText = reactModule.createElement(evidenceFieldModule, {
					fieldLabel = var11.ModeratorNoteLabel,
					fieldValue = var6
				})
			})
		end
		if var5 then
			t_1.EndingOnItem = reactModule.createElement(view, {
				tag = "size-full-0 auto-y row padding-x-medium align-y-center",
				testId = "dialog-ending-on-item",
				LayoutOrder = 5
			}, {
				EndingOnInfo = reactModule.createElement(view, { tag = "auto-y col fill", LayoutOrder = 1 }, {
					EvidenceField = reactModule.createElement(evidenceFieldModule, {
						hasColon = false,
						fieldLabel = var11.EndsOnText,
						fieldValue = var5
					})
				}),
				CountdownBadge = reactModule.createElement(badge, {
					LayoutOrder = 2,
					text = p1.countdownText or var11.CompleteText,
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
	elseif var4 or var7 or p1.isAppealable then
		t.Evidence = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-xxsmall",
			LayoutOrder = 2
		}, {
			reactModule.createElement(view, {
				tag = "size-full-0 auto-y col gap-small padding-medium radius-medium bg-surface-200 stroke-standard stroke-default"
			}, {
				EvidenceText = var4 and reactModule.createElement(text, {
					tag = "auto-xy text-body-medium text-align-x-left text-wrap",
					RichText = true,
					LayoutOrder = 1,
					Text = var4
				}),
				Reason = var7 and reactModule.createElement(text, {
					tag = "auto-xy text-body-medium text-align-x-left text-wrap",
					RichText = true,
					LayoutOrder = 2,
					Text = `<b>{var11.ReasonText}:</b>\n{var7}`
				}),
				AppealButton = p1.isAppealable and reactModule.createElement(button, {
					LayoutOrder = 3,
					text = var11.ReportMistakeText,
					variant = buttonVariant.Standard,
					size = buttonSize.XSmall,
					width = UDim.new(1, 0),
					onActivated = var18
				})
			})
		})
	end
	if var3 and not useDetailedLayout then
		t.DsaMessage = reactModule.createElement(text, {
			tag = "auto-xy text-caption-small content-default text-align-x-left text-wrap",
			LayoutOrder = 3,
			Text = var3
		})
	end
	local var20 = if useDetailedLayout then {
		{
			variant = buttonVariant.Emphasis,
			size = buttonSize.Medium,
			text = var11.OkText,
			onActivated = var17,
			width = UDim.new(1, 0)
		}
	} else {
		{
			variant = buttonVariant.Emphasis,
			size = buttonSize.Small,
			text = var11.OkText,
			onActivated = var17
		}
	}
	
	if useDetailedLayout and p1.isAppealable and not fFlagUFRInlineAppealLinkModule then
		table.insert(var20, {
			variant = buttonVariant.Standard,
			size = buttonSize.Medium,
			text = var11.ReportMistakeText,
			onActivated = var18,
			width = UDim.new(1, 0)
		})
	end
	local createElement = reactModule.createElement
	local root = dialog.Root
	local t_1 = {
		hasCloseButton = false,
		size = dialogSize.Medium,
		ref = var15,
		hasBackdrop = not VRService.VREnabled,
		disablePortal = var10 ~= constantsModule.InterventionPlacementType.InExperience
	}
	local t_2 = {
		DialogTitle = not p1.isLoading and reactModule.createElement(dialog.Title, { text = p1.titleText }),
		DialogContent = reactModule.createElement(dialog.Content, if useDetailedLayout_1 then { LayoutOrder = 2 } else nil, if p1.isLoading then reactModule.createElement(interventionDialogLoadingSkeletonModule) else reactModule.createElement(view, { tag = "size-full-0 auto-y col gap-medium" }, t)),
		DialogFooter = not p1.isLoading and (useDetailedLayout_1 and reactModule.createElement(interventionDialogFooterModule, {
			ctaText = var11.OkText,
			dsaMessage = p1.dsaMessage,
			isAppealable = p1.isAppealable,
			onAppealActivated = var18,
			onCtaActivated = var17
		}))
	}
	local var21 = not p1.isLoading
	
	if var21 then
		var21 = not useDetailedLayout_1
		
		if var21 then
			var21 = reactModule.createElement
			var21 = var21(dialog.Actions, {
				actions = var20,
				label = if useDetailedLayout and p1.useDetailedLayout and var3 then var3 else nil
			})
		end
	end
	t_2.DialogActions = var21
	
	return createElement(root, t_1, t_2)
end)