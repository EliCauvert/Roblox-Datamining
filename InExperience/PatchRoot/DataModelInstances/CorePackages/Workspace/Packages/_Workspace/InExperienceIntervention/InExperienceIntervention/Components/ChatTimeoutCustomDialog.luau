local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local ReactModule = require(Parent.React)
local InterventionContestFeedbackFooterModule = require(InExperienceIntervention.Components.InterventionContestFeedbackFooter)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local UseLayerCollectorFunction = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Constants = require(Parent.InterventionShared).Utils.Constants
local InExperienceInterventionAnalyticsModule = require(InExperienceIntervention.InExperienceInterventionAnalytics)
local View = FoundationModule.View
local Button = FoundationModule.Button
local ScrollView = FoundationModule.ScrollView
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UsePropertyFunction = require(Parent.GuiObjectUtils).useProperty
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)

function ChatTimeoutCustomDialog(p1) --[[ Line: 39 ]]
	-- upvalues: UseLayerCollectorFunction (copy), ReactModule (copy), UseTokensFunction (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), Constants (copy), UsePropertyFunction (copy), InExperienceInterventionAnalyticsModule (copy), PartialPageModal (copy), ScrollView (copy), ScrollBarVisibility (copy), ReactFocusNavigationModule (copy), NewResult (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), View (copy), Text (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy), InterventionContestFeedbackFooterModule (copy)
	local UseLayerCollectorResult = UseLayerCollectorFunction()
	local UseRefResult = ReactModule.useRef(DateTime.now().UnixTimestampMillis)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseTokensResult = UseTokensFunction()
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction(Constants.localizationKeys)
	local AbsoluteSize = UsePropertyFunction(UseRefResult1, "AbsoluteSize")
	local UseResult = ReactModule.useCallback(function() --[[ Line: 53 ]]
		-- upvalues: InExperienceInterventionAnalyticsModule (upval), UseRefResult (copy), p1 (copy)
		InExperienceInterventionAnalyticsModule.sendAnalyticsEvent(InExperienceInterventionAnalyticsModule.Constants.EventTypes.CtaClicked, InExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Timeout, UseRefResult.current, p1.eventId, p1.violatingChatLine, p1.duration)
		p1.onDismiss()
	end, { UseRefResult })
	ReactModule.useEffect(function() --[[ Line: 65 ]]
		-- upvalues: InExperienceInterventionAnalyticsModule (upval), UseRefResult (copy), p1 (copy)
		InExperienceInterventionAnalyticsModule.sendAnalyticsEvent(InExperienceInterventionAnalyticsModule.Constants.EventTypes.ModalAppeared, InExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Timeout, UseRefResult.current, p1.eventId, p1.violatingChatLine, p1.duration)
	end, { UseRefResult })
	ReactModule.useEffect(function() --[[ Line: 76 ]]
		-- upvalues: AbsoluteSize (copy), UseLayerCollectorResult (copy), Constants (upval), UseStateResult2 (copy)
		UseStateResult2((math.min(UseLayerCollectorResult.absoluteSize.Y - Constants.UNIBAR_HEIGHT - Constants.DIALOG_HEADER_HEIGHT, if AbsoluteSize then AbsoluteSize.Y else 0)))
	end, { UseLayerCollectorResult.absoluteSize.Y, AbsoluteSize })
	
	return ReactModule.createElement(PartialPageModal, {
		title = UseLocalizationResult.TextChatSuspensionText,
		screenSize = UseLayerCollectorResult.absoluteSize
	}, {
		ScrollView = ReactModule.createElement(ScrollView, {
			Size = UDim2.new(1, 0, 0, UseStateResult),
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 1, 0),
				scrollBarVisibility = ScrollBarVisibility.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			FocusNavigationCoreScriptsProvider = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
				FocusNavigationCoreScriptsWrapper = ReactModule.createElement(FocusRoot, {
					isIsolated = true,
					isAutoFocusRoot = true,
					surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
					frameProps = {
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}
				}, {
					InnerContent = ReactModule.createElement(View, {
						tag = "col gap-large align-x-center align-y-center padding-x-small padding-top-large",
						ref = UseRefResult1,
						Size = UDim2.new(1, -Constants.SCROLL_BAR_WIDTH, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						ChatDisabledText = ReactModule.createElement(Text, {
							LayoutOrder = 1,
							TextWrapped = true,
							Text = if p1.duration <= 60 then UseLocalizationResult.CannotSend1MinText else UseLocalizationFunction({
								value = {
									Constants.localizationKeys.CannotSendText,
									number = math.ceil(p1.duration / 60)
								}
							}).value,
							textStyle = UseStyleResult.Theme.TextEmphasis,
							fontStyle = UseTokensResult.Typography.LabelLarge,
							Size = UDim2.new(1, 0, 0, 0),
							TextXAlignment = Enum.TextXAlignment.Center,
							TextYAlignment = Enum.TextYAlignment.Center,
							AutomaticSize = Enum.AutomaticSize.Y
						}),
						WarningTextLabel = ReactModule.createElement(Text, {
							LayoutOrder = 2,
							tag = "padding-small size-full-800 text-wrap",
							TextWrapped = true,
							Text = UseLocalizationResult.MayLoseAccessText,
							AutomaticSize = Enum.AutomaticSize.Y
						}),
						UnderstandButtonFrame = ReactModule.createElement(View, {
							LayoutOrder = 3,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							UnderstandButton = ReactModule.createElement(Button, {
								text = UseLocalizationResult.IUnderstandText,
								variant = ButtonVariant.Standard,
								onActivated = UseResult,
								fillBehavior = FillBehavior.Fill,
								FillDirection = Enum.FillDirection.Horizontal
							})
						}),
						FeedbackFrame = ReactModule.createElement(View, {
							LayoutOrder = 4,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							FeedbackFooter = ReactModule.createElement(InterventionContestFeedbackFooterModule, {
								onDismiss = p1.onDismiss,
								renderTimestamp = UseRefResult.current,
								interventionType = InExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Timeout,
								eventId = p1.eventId,
								violatingChatLine = p1.violatingChatLine,
								duration = p1.duration
							})
						})
					})
				})
			})
		})
	})
end

return ChatTimeoutCustomDialog