local InExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local Parent = InExperienceIntervention.Parent
local Constants = require(Parent.InterventionShared).Utils.Constants
local ReactModule = require(Parent.React)
local InterventionContestFeedbackFooterModule = require(InExperienceIntervention.Components.InterventionContestFeedbackFooter)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local Text = FoundationModule.Text
local View = FoundationModule.View
local Button = FoundationModule.Button
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLayerCollectorFunction = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local LocalPlayer = game:GetService("Players").LocalPlayer
local InExperienceInterventionAnalyticsModule = require(InExperienceIntervention.InExperienceInterventionAnalytics)
local ScrollView = FoundationModule.ScrollView
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local UsePropertyFunction = require(Parent.GuiObjectUtils).useProperty
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local NewResult = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)

function ChatNudgeCustomDialog(p1)
	-- upvalues: ReactModule (copy), InExperienceInterventionAnalyticsModule (copy), UseLocalizationFunction (copy), Constants (copy), UseStyleFunction (copy), UseLayerCollectorFunction (copy), UseTokensFunction (copy), UsePropertyFunction (copy), LocalPlayer (copy), View (copy), Text (copy), PartialPageModal (copy), ScrollView (copy), ScrollBarVisibility (copy), ReactFocusNavigationModule (copy), NewResult (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy), InterventionContestFeedbackFooterModule (copy)
	local UseRefResult = ReactModule.useRef(DateTime.now().UnixTimestampMillis)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	ReactModule.useEffect(function()
		-- upvalues: InExperienceInterventionAnalyticsModule (upval), UseRefResult (copy), p1 (copy)
		InExperienceInterventionAnalyticsModule.sendAnalyticsEvent(InExperienceInterventionAnalyticsModule.Constants.EventTypes.ModalAppeared, InExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Nudge, UseRefResult.current, p1.eventId, p1.violatingChatLine, nil)
	end, { UseRefResult })
	local UseLocalizationResult = UseLocalizationFunction(Constants.localizationKeys)
	local UseStyleResult = UseStyleFunction()
	local UseLayerCollectorResult = UseLayerCollectorFunction()
	local UseTokensResult = UseTokensFunction()
	local AbsoluteSize = UsePropertyFunction(UseRefResult1, "AbsoluteSize")
	ReactModule.useEffect(function()
		-- upvalues: AbsoluteSize (copy), UseLayerCollectorResult (copy), Constants (upval), UseStateResult2 (copy)
		UseStateResult2((math.min(UseLayerCollectorResult.absoluteSize.Y - Constants.UNIBAR_HEIGHT - Constants.DIALOG_HEADER_HEIGHT, if AbsoluteSize then AbsoluteSize.Y else 0)))
	end, { UseLayerCollectorResult.absoluteSize.Y, AbsoluteSize })
	local Text1 = if LocalPlayer then `{LocalPlayer.DisplayName}: {p1.violatingChatLine}` else p1.violatingChatLine
	
	return ReactModule.createElement(PartialPageModal, {
		title = UseLocalizationResult.ChatBreaksRulesText,
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
						MiddleContent = if p1.violatingChatLine then ReactModule.createElement(View, {
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							Layout = ReactModule.createElement("UIListLayout", {
								HorizontalAlignment = Enum.HorizontalAlignment.Center,
								FillDirection = Enum.FillDirection.Vertical,
								SortOrder = Enum.SortOrder.LayoutOrder,
								Padding = UDim.new(0, Constants.STANDARD_PADDING / 2)
							}),
							ChatIncludesTextFrame = ReactModule.createElement(View, {
								LayoutOrder = 1,
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y
							}, {
								ChatIncludesText = ReactModule.createElement(Text, {
									Text = UseLocalizationResult.ChatIncludesText,
									fontStyle = UseTokensResult.Typography.BodySmall,
									TextXAlignment = Enum.TextXAlignment.Left,
									AnchorPoint = Vector2.new(0, 0),
									AutomaticSize = Enum.AutomaticSize.XY
								})
							}),
							ViolatingTextFrame = ReactModule.createElement(View, {
								LayoutOrder = 2,
								BackgroundTransparency = 0,
								tag = "col gap-small align-x-center align-y-center padding-x-large radius-medium stroke-default",
								Size = UDim2.new(1, 0, 0, Constants.VIOLATION_HEIGHT),
								BackgroundColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color
							}, {
								ViolationText = ReactModule.createElement(Text, {
									LayoutOrder = 2,
									TextWrapped = true,
									Text = Text1,
									textStyle = UseStyleResult.Theme.TextMuted,
									fontStyle = UseStyleResult.Font.Body,
									Size = UDim2.new(1, 0, 0, 0),
									TextXAlignment = Enum.TextXAlignment.Left,
									TextYAlignment = Enum.TextYAlignment.Center,
									AutomaticSize = Enum.AutomaticSize.Y,
									TextTruncate = Enum.TextTruncate.AtEnd
								})
							})
						}) else nil,
						WarningText = ReactModule.createElement(Text, {
							LayoutOrder = 3,
							TextWrapped = true,
							Text = UseLocalizationResult.TextChatMayBeSuspendedText,
							textStyle = UseStyleResult.Theme.TextEmphasis,
							fontStyle = UseStyleResult.Font.Body,
							Size = UDim2.new(1, 0, 0, 0),
							TextXAlignment = Enum.TextXAlignment.Center,
							TextYAlignment = Enum.TextYAlignment.Center,
							AutomaticSize = Enum.AutomaticSize.Y
						}),
						UnderstandButtonFrame = ReactModule.createElement(View, {
							LayoutOrder = 4,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							UnderstandButton = ReactModule.createElement(Button, {
								text = UseLocalizationResult.IUnderstandText,
								variant = ButtonVariant.Standard,
								onActivated = ReactModule.useCallback(function()
									-- upvalues: InExperienceInterventionAnalyticsModule (upval), UseRefResult (copy), p1 (copy)
									InExperienceInterventionAnalyticsModule.sendAnalyticsEvent(InExperienceInterventionAnalyticsModule.Constants.EventTypes.CtaClicked, InExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Nudge, UseRefResult.current, p1.eventId, p1.violatingChatLine, nil)
									p1.onDismiss()
								end, { UseRefResult }),
								fillBehavior = FillBehavior.Fill,
								FillDirection = Enum.FillDirection.Horizontal
							})
						}),
						FeedbackFrame = ReactModule.createElement(View, {
							LayoutOrder = 5,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							FeedbackFooter = ReactModule.createElement(InterventionContestFeedbackFooterModule, {
								duration = nil,
								onDismiss = p1.onDismiss,
								renderTimestamp = UseRefResult.current,
								interventionType = InExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Nudge,
								eventId = p1.eventId,
								violatingChatLine = p1.violatingChatLine
							})
						})
					})
				})
			})
		})
	})
end

return ChatNudgeCustomDialog