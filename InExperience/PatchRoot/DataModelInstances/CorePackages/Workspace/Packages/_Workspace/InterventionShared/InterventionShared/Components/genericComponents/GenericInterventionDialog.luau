local InterventionShared = script:FindFirstAncestor("InterventionShared")
local Parent = InterventionShared.Parent
local VRService = game:GetService("VRService")
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local ConstantsModule = require(InterventionShared.Utils.Constants)
local CryoModule = require(Parent.Cryo)
local EvidenceFieldModule = require(InterventionShared.Components.genericComponents.EvidenceField)
local InterventionDialogFooterModule = require(InterventionShared.Components.genericComponents.InterventionDialogFooter)
local InterventionDialogLoadingSkeletonModule = require(InterventionShared.Components.genericComponents.InterventionDialogLoadingSkeleton)
local InterventionAnalyticsModule = require(InterventionShared.InterventionAnalytics)
local LinkingProtocol = require(Parent.LinkingProtocol).LinkingProtocol
local PostDismissInterventionModule = require(InterventionShared.Http.PostDismissIntervention)
local ResponsiveModule = require(Parent.Responsive)
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local FocusNavigableSurfaceIdentifierEnum = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local FoundationModule = require(Parent.Foundation)
local Badge = FoundationModule.Badge
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local Divider = FoundationModule.Divider
local IconName = FoundationModule.Enums.IconName
local IconPosition = FoundationModule.Enums.IconPosition
local IconVariant = FoundationModule.Enums.IconVariant
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseInterventionFocusRootModule = require(InterventionShared.Hooks.useInterventionFocusRoot)
local UseInterventionPlacementModule = require(InterventionShared.Hooks.useInterventionPlacement)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseWebViewModule = require(InterventionShared.Hooks.useWebView)
local FFlagNavigateToSafetyDashboardForAppeals = require(Parent.SharedFlags).FFlagNavigateToSafetyDashboardForAppeals
local FFlagUFRImprovementsModule = require(InterventionShared.Flags.FFlagUFRImprovements)
local FFlagUFRInlineAppealLinkModule = require(InterventionShared.Flags.FFlagUFRInlineAppealLink)
local IconsActionsAccept = require(Parent.FoundationImages).Images["icons/actions/accept"]

local function _(p1)
	return if p1 == "" then nil else p1
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseRefFunction (copy), UseInterventionPlacementModule (copy), UseLocalizationFunction (copy), ConstantsModule (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), FFlagNavigateToSafetyDashboardForAppeals (copy), UrlBuilder (copy), UseWebViewModule (copy), LinkingProtocol (copy), UseInterventionFocusRootModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseEffectFunction (copy), InterventionAnalyticsModule (copy), UseCallbackFunction (copy), PostDismissInterventionModule (copy), NotificationModalsManagerModule (copy), IconsActionsAccept (copy), VRService (copy), FFlagUFRInlineAppealLinkModule (copy), ReactModule (copy), Text (copy), FFlagUFRImprovementsModule (copy), View (copy), Divider (copy), EvidenceFieldModule (copy), Badge (copy), BadgeVariant (copy), IconName (copy), IconPosition (copy), IconVariant (copy), CryoModule (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy), Dialog (copy), DialogSize (copy), InterventionDialogLoadingSkeletonModule (copy), InterventionDialogFooterModule (copy)
	local UseTokensResult = UseTokensFunction()
	local InterventionId = p1.interventionId
	local InterventionId1 = if InterventionId == "" then nil else InterventionId
	local DsaMessage = p1.dsaMessage
	local DsaMessage1 = if DsaMessage == "" then nil else DsaMessage
	local Evidence = p1.evidence
	local Evidence1 = if Evidence == "" then nil else Evidence
	local FormattedEndDate = p1.formattedEndDate
	local FormattedEndDate1 = if FormattedEndDate == "" then nil else FormattedEndDate
	local UserNote = p1.userNote
	local UserNote1 = if UserNote == "" then nil else UserNote
	local ViolationReason = p1.violationReason
	local ViolationReason1 = if ViolationReason == "" then nil else ViolationReason
	local ViolationUid = p1.violationUid
	local ViolationUid1 = if ViolationUid == "" then nil else ViolationUid
	local UseRefResult = UseRefFunction(DateTime.now().UnixTimestampMillis)
	local UseInterventionPlacementModuleResult = UseInterventionPlacementModule()
	local UseLocalizationResult = UseLocalizationFunction(ConstantsModule.localizationKeys)
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	local ViolationResult = if FFlagNavigateToSafetyDashboardForAppeals then if ViolationUid1 then UrlBuilder.static.safetyDashboard.violation({ id = ViolationUid1 }) else UrlBuilder.static.safetyDashboard.violations() else UrlBuilder.static.appealsPortal.main()
	local UseWebViewModuleResult = UseWebViewModule(ViolationResult, if FFlagNavigateToSafetyDashboardForAppeals then UseLocalizationResult.AccountStatusTitleText else UseLocalizationResult.AppealsPortalTitleText)
	local Default = LinkingProtocol.default
	local UseInterventionFocusRootModuleResult = UseInterventionFocusRootModule({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ModerationOverlay
	})
	UseEffectFunction(function()
		-- upvalues: InterventionAnalyticsModule (upval), p1 (copy), UseInterventionPlacementModuleResult (copy), UseRefResult (copy)
		InterventionAnalyticsModule.sendAnalyticsEvent(InterventionAnalyticsModule.TelemetryConfigs.DialogRendered, {
			eventType = InterventionAnalyticsModule.Constants.EventTypes.ModalAppeared,
			interventionType = p1.interventionTypeForAnalytics,
			placement = UseInterventionPlacementModuleResult,
			renderedTimestamp = UseRefResult.current,
			eventId = p1.eventId,
			evidence = p1.evidence,
			duration = p1.durationForAnalytics,
			acknowledgeable = p1.acknowledgeable,
			abuseVector = p1.abuseVectorForAnalytics
		})
	end, { UseRefResult })
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: p1 (copy), InterventionId1 (copy), PostDismissInterventionModule (upval), InterventionAnalyticsModule (upval), UseInterventionPlacementModuleResult (copy), UseRefResult (copy)
		if p1.acknowledgeable and InterventionId1 then
			PostDismissInterventionModule(InterventionId1):andThen(function(_)
				-- upvalues: InterventionAnalyticsModule (upval), p1 (upval), UseInterventionPlacementModuleResult (upval), UseRefResult (upval)
				InterventionAnalyticsModule.sendAnalyticsEvent(InterventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissSuccess, {
					eventType = InterventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissSuccess,
					interventionType = p1.interventionTypeForAnalytics,
					placement = UseInterventionPlacementModuleResult,
					renderedTimestamp = UseRefResult.current,
					eventId = p1.eventId,
					acknowledgeable = p1.acknowledgeable,
					abuseVector = p1.abuseVectorForAnalytics
				})
				
				if p1.onAcknowledgementSuccess then
					p1.onAcknowledgementSuccess()
				end
			end):catch(function(Err)
				-- upvalues: InterventionAnalyticsModule (upval), p1 (upval), UseInterventionPlacementModuleResult (upval), UseRefResult (upval)
				InterventionAnalyticsModule.sendAnalyticsEvent(InterventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissFailed, {
					eventType = InterventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissFailed,
					interventionType = p1.interventionTypeForAnalytics,
					placement = UseInterventionPlacementModuleResult,
					renderedTimestamp = UseRefResult.current,
					eventId = p1.eventId,
					error = Err.error,
					acknowledgeable = p1.acknowledgeable,
					abuseVector = p1.abuseVectorForAnalytics
				})
			end)
		end
	end, {
		p1.acknowledgeable, InterventionId1, p1.interventionTypeForAnalytics,
		UseInterventionPlacementModuleResult, UseRefResult.current, p1.eventId,
		p1.abuseVectorForAnalytics, p1.onAcknowledgementSuccess
	})
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: InterventionAnalyticsModule (upval), p1 (copy), UseInterventionPlacementModuleResult (copy), UseRefResult (copy), UseCallbackResult (copy)
		InterventionAnalyticsModule.sendAnalyticsEvent(InterventionAnalyticsModule.TelemetryConfigs.DialogCtaClicked, {
			eventType = InterventionAnalyticsModule.Constants.EventTypes.CtaClicked,
			interventionType = p1.interventionTypeForAnalytics,
			placement = UseInterventionPlacementModuleResult,
			renderedTimestamp = UseRefResult.current,
			eventId = p1.eventId,
			acknowledgeable = p1.acknowledgeable,
			abuseVector = p1.abuseVectorForAnalytics
		})
		UseCallbackResult()
		p1.onDismiss()
	end, {
		p1.onDismiss, p1.interventionTypeForAnalytics,
		UseInterventionPlacementModuleResult, UseRefResult.current, p1.eventId,
		p1.abuseVectorForAnalytics, p1.acknowledgeable, InterventionId1,
		UseCallbackResult, p1.onAcknowledgementSuccess
	})
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: InterventionAnalyticsModule (upval), p1 (copy), UseInterventionPlacementModuleResult (copy), UseRefResult (copy), UseCallbackResult (copy), NotificationModalsManagerModule (upval), IconsActionsAccept (upval), UseLocalizationResult (copy), UseTokensResult (copy), VRService (upval), IsUsePreferredInputResultMatch (copy), Default (copy), ViolationResult (copy), UseWebViewModuleResult (copy)
		InterventionAnalyticsModule.sendAnalyticsEvent(InterventionAnalyticsModule.TelemetryConfigs.DialogAppealClicked, {
			eventType = InterventionAnalyticsModule.Constants.EventTypes.AppealClicked,
			interventionType = p1.interventionTypeForAnalytics,
			placement = UseInterventionPlacementModuleResult,
			renderedTimestamp = UseRefResult.current,
			eventId = p1.eventId,
			acknowledgeable = p1.acknowledgeable,
			abuseVector = p1.abuseVectorForAnalytics
		})
		
		if p1.useDetailedLayout and p1.onAppeal then
			p1.onAppeal()
			
			if not p1.shouldOpenAppealsPortal then
				UseCallbackResult()
				p1.onDismiss()
				NotificationModalsManagerModule.SetUIBloxToast({
					iconImage = IconsActionsAccept,
					toastTitle = UseLocalizationResult.TakeALookText,
					toastSubtitle = UseLocalizationResult.FeedbackHelpsText,
					sequenceNumber = DateTime.now().UnixTimestamp,
					iconColorStyle = {
						Transparency = 0,
						Color = UseTokensResult.Color.System.Success.Color3
					}
				})
				
				return
			end
		end
		if VRService.VREnabled or IsUsePreferredInputResultMatch then
			Default:openURL(ViolationResult)
			
			return
		else
			UseWebViewModuleResult()
		end
	end, {
		UseWebViewModuleResult, Default, VRService.VREnabled,
		IsUsePreferredInputResultMatch, p1.interventionTypeForAnalytics,
		UseInterventionPlacementModuleResult, UseRefResult.current, ViolationResult,
		p1.abuseVectorForAnalytics, p1.acknowledgeable, InterventionId1, p1.eventId,
		UseLocalizationResult.FeedbackHelpsText, UseLocalizationResult.TakeALookText,
		p1.onAppeal, p1.shouldOpenAppealsPortal, p1.onDismiss, p1.useDetailedLayout,
		UseTokensResult.Color.System.Success.Color3, UseCallbackResult
	})
	local t = {}
	local UseDetailedLayout = p1.useDetailedLayout
	local UseDetailedLayout1 = FFlagUFRInlineAppealLinkModule and UseDetailedLayout
	
	if p1.bodyText and p1.bodyText ~= "" then
		t.BodyText = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-medium content-default text-align-x-left text-wrap",
			testId = "dialog-body-text",
			LayoutOrder = 1,
			Text = p1.bodyText
		})
	end
	if UseDetailedLayout then
		local t1 = {}
		local ViolationReason1_1 = FFlagUFRImprovementsModule and ViolationReason1 or (UserNote1 or FormattedEndDate1)
		
		if Evidence1 then
			t1.EvidenceItem = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y padding-x-medium",
				testId = "dialog-evidence-item",
				LayoutOrder = 1
			}, {
				EvidenceText = ReactModule.createElement(Text, {
					tag = "auto-xy text-body-medium text-align-x-left text-wrap",
					RichText = true,
					Text = Evidence1
				})
			})
			
			if FFlagUFRImprovementsModule and ViolationReason1_1 then
				t1.DividerBelowEvidence = ReactModule.createElement(Divider, { LayoutOrder = 2 })
			end
		end
		if ViolationReason1 then
			if not FFlagUFRImprovementsModule and Evidence1 then
				t1.DividerAfterEvidence = ReactModule.createElement(Divider, { LayoutOrder = 2 })
			end
			t1.ReasonItem = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y padding-x-medium",
				testId = "dialog-reason-item",
				LayoutOrder = 3
			}, {
				ReasonField = ReactModule.createElement(EvidenceFieldModule, {
					fieldLabel = UseLocalizationResult.ReasonText,
					fieldValue = ViolationReason1
				})
			})
		end
		if UserNote1 then
			t1.NoteItem = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y padding-x-medium",
				testId = "dialog-note-item",
				LayoutOrder = 4
			}, {
				NoteText = ReactModule.createElement(EvidenceFieldModule, {
					fieldLabel = UseLocalizationResult.ModeratorNoteLabel,
					fieldValue = UserNote1
				})
			})
		end
		if FormattedEndDate1 then
			t1.EndingOnItem = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y row padding-x-medium align-y-center",
				testId = "dialog-ending-on-item",
				LayoutOrder = 5
			}, {
				EndingOnInfo = ReactModule.createElement(View, { tag = "auto-y col fill", LayoutOrder = 1 }, {
					EvidenceField = ReactModule.createElement(EvidenceFieldModule, {
						hasColon = false,
						fieldLabel = UseLocalizationResult.EndsOnText,
						fieldValue = FormattedEndDate1
					})
				}),
				CountdownBadge = ReactModule.createElement(Badge, {
					LayoutOrder = 2,
					text = p1.countdownText or UseLocalizationResult.CompleteText,
					variant = BadgeVariant.Neutral,
					icon = if p1.countdownText then {
						name = IconName.Clock,
						position = IconPosition.Left,
						variant = IconVariant.Filled
					} else nil
				})
			})
		end
		if not CryoModule.isEmpty(t1) then
			t.DetailedList = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y padding-top-xxsmall padding-x-xxsmall padding-bottom-medium",
				testId = "dialog-detailed-list",
				LayoutOrder = 2
			}, ReactModule.createElement(View, {
				tag = "col gap-medium size-full-0 auto-y padding-y-large stroke-standard stroke-default radius-large bg-shift-100"
			}, t1))
		end
	elseif Evidence1 or ViolationReason1 or p1.isAppealable then
		t.Evidence = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y padding-xxsmall",
			LayoutOrder = 2
		}, {
			ReactModule.createElement(View, {
				tag = "size-full-0 auto-y col gap-small padding-medium radius-medium bg-surface-200 stroke-standard stroke-default"
			}, {
				EvidenceText = Evidence1 and ReactModule.createElement(Text, {
					tag = "auto-xy text-body-medium text-align-x-left text-wrap",
					RichText = true,
					LayoutOrder = 1,
					Text = Evidence1
				}),
				Reason = ViolationReason1 and ReactModule.createElement(Text, {
					tag = "auto-xy text-body-medium text-align-x-left text-wrap",
					RichText = true,
					LayoutOrder = 2,
					Text = `<b>{UseLocalizationResult.ReasonText}:</b>\n{ViolationReason1}`
				}),
				AppealButton = p1.isAppealable and ReactModule.createElement(Button, {
					LayoutOrder = 3,
					text = UseLocalizationResult.ReportMistakeText,
					variant = ButtonVariant.Standard,
					size = ButtonSize.XSmall,
					width = UDim.new(1, 0),
					onActivated = UseCallbackResult2
				})
			})
		})
	end
	if DsaMessage1 and not UseDetailedLayout then
		t.DsaMessage = ReactModule.createElement(Text, {
			tag = "auto-xy text-caption-small content-default text-align-x-left text-wrap",
			LayoutOrder = 3,
			Text = DsaMessage1
		})
	end
	local List = if UseDetailedLayout then {
		{
			variant = ButtonVariant.Emphasis,
			size = ButtonSize.Medium,
			text = UseLocalizationResult.OkText,
			onActivated = UseCallbackResult1,
			width = UDim.new(1, 0)
		}
	} else {
		{
			variant = ButtonVariant.Emphasis,
			size = ButtonSize.Small,
			text = UseLocalizationResult.OkText,
			onActivated = UseCallbackResult1
		}
	}
	
	if UseDetailedLayout and p1.isAppealable and not FFlagUFRInlineAppealLinkModule then
		table.insert(List, {
			variant = ButtonVariant.Standard,
			size = ButtonSize.Medium,
			text = UseLocalizationResult.ReportMistakeText,
			onActivated = UseCallbackResult2,
			width = UDim.new(1, 0)
		})
	end
	return ReactModule.createElement(Dialog.Root, {
		hasCloseButton = false,
		size = DialogSize.Medium,
		ref = UseInterventionFocusRootModuleResult,
		hasBackdrop = not VRService.VREnabled,
		disablePortal = UseInterventionPlacementModuleResult ~= ConstantsModule.InterventionPlacementType.InExperience
	}, {
		DialogTitle = not p1.isLoading and ReactModule.createElement(Dialog.Title, { text = p1.titleText }),
		DialogContent = ReactModule.createElement(Dialog.Content, if UseDetailedLayout1 then { LayoutOrder = 2 } else nil, if p1.isLoading then ReactModule.createElement(InterventionDialogLoadingSkeletonModule) else ReactModule.createElement(View, { tag = "size-full-0 auto-y col gap-medium" }, t)),
		DialogFooter = not p1.isLoading and (UseDetailedLayout1 and ReactModule.createElement(InterventionDialogFooterModule, {
			ctaText = UseLocalizationResult.OkText,
			dsaMessage = p1.dsaMessage,
			isAppealable = p1.isAppealable,
			onAppealActivated = UseCallbackResult2,
			onCtaActivated = UseCallbackResult1
		})),
		DialogActions = not p1.isLoading and (not UseDetailedLayout1 and ReactModule.createElement(Dialog.Actions, {
			actions = List,
			label = if UseDetailedLayout and p1.useDetailedLayout and DsaMessage1 then DsaMessage1 else nil
		}))
	})
end)