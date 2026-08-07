local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local playersService = game:GetService("Players")
local parent = inExperienceIntervention.Parent
local constants = require(parent.InterventionShared).Utils.Constants
local reactModule = require(parent.React)
local interventionContestFeedbackFooterModule = require(inExperienceIntervention.Components.InterventionContestFeedbackFooter)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local text = foundationModule.Text
local view = foundationModule.View
local button = foundationModule.Button
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useStyle = UIBloxModule.Core.Style.useStyle
local useLayerCollector = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local localPlayer = playersService.LocalPlayer
local inExperienceInterventionAnalyticsModule = require(inExperienceIntervention.InExperienceInterventionAnalytics)
local scrollView = foundationModule.ScrollView
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local useProperty = require(parent.GuiObjectUtils).useProperty
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local var9 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)

function ChatNudgeCustomDialog(p0) --[[ line: 41 ]]
	-- upvalues: reactModule (ref), inExperienceInterventionAnalyticsModule (ref), useLocalization (ref), constants (ref), useStyle (ref), useLayerCollector (ref), useTokens (ref), useProperty (ref), localPlayer (ref), view (ref), text (ref), partialPageModal (ref), scrollView (ref), scrollBarVisibility (ref), reactFocusNavigationModule (ref), var9 (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), button (ref), buttonVariant (ref), fillBehavior (ref), interventionContestFeedbackFooterModule (ref)
	local var10 = reactModule.useRef(DateTime.now().UnixTimestampMillis)
	local var11 = reactModule.useRef(nil)
	local var12, var13 = reactModule.useState(0)
	reactModule.useEffect(function() --[[ line: 45 ]]
		-- upvalues: inExperienceInterventionAnalyticsModule (copy), var10 (ref), p0 (ref)
		inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(inExperienceInterventionAnalyticsModule.Constants.EventTypes.ModalAppeared, inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Nudge, var10.current, p0.eventId, p0.violatingChatLine, nil)
	end, { var10 })
	local var14 = useLocalization(constants.localizationKeys)
	local var15 = useStyle()
	local var16 = useLayerCollector()
	local var17 = useTokens()
	local var18 = useProperty(var11, "AbsoluteSize")
	reactModule.useEffect(function() --[[ line: 64 ]]
		-- upvalues: var18 (ref), var16 (ref), constants (copy), var13 (ref)
		var13(math.min(var16.absoluteSize.Y - constants.UNIBAR_HEIGHT - constants.DIALOG_HEADER_HEIGHT, if var18 then var18.Y else 0))
	end, { var16.absoluteSize.Y, var18 })
	
	return reactModule.createElement(partialPageModal, {
		title = var14.ChatBreaksRulesText,
		screenSize = var16.absoluteSize
	}, {
		ScrollView = reactModule.createElement(scrollView, {
			Size = UDim2.new(1, 0, 0, var12),
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 1, 0),
				scrollBarVisibility = scrollBarVisibility.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			FocusNavigationCoreScriptsProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var9 }, {
				FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
					isIsolated = true,
					isAutoFocusRoot = true,
					surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
					frameProps = {
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}
				}, {
					InnerContent = reactModule.createElement(view, {
						tag = "col gap-large align-x-center align-y-center padding-x-small padding-top-large",
						ref = var11,
						Size = UDim2.new(1, -constants.SCROLL_BAR_WIDTH, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						MiddleContent = if p0.violatingChatLine then reactModule.createElement(view, {
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							Layout = reactModule.createElement("UIListLayout", {
								HorizontalAlignment = Enum.HorizontalAlignment.Center,
								FillDirection = Enum.FillDirection.Vertical,
								SortOrder = Enum.SortOrder.LayoutOrder,
								Padding = UDim.new(0, constants.STANDARD_PADDING / 2)
							}),
							ChatIncludesTextFrame = reactModule.createElement(view, {
								LayoutOrder = 1,
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y
							}, {
								ChatIncludesText = reactModule.createElement(text, {
									Text = var14.ChatIncludesText,
									fontStyle = var17.Typography.BodySmall,
									TextXAlignment = Enum.TextXAlignment.Left,
									AnchorPoint = Vector2.new(0, 0),
									AutomaticSize = Enum.AutomaticSize.XY
								})
							}),
							ViolatingTextFrame = reactModule.createElement(view, {
								LayoutOrder = 2,
								BackgroundTransparency = 0,
								tag = "col gap-small align-x-center align-y-center padding-x-large radius-medium stroke-default",
								Size = UDim2.new(1, 0, 0, constants.VIOLATION_HEIGHT),
								BackgroundColor3 = var15.Theme.BackgroundUIDefault.Color
							}, {
								ViolationText = reactModule.createElement(text, {
									LayoutOrder = 2,
									TextWrapped = true,
									Text = if localPlayer then `{localPlayer.DisplayName}: {p0.violatingChatLine}` else p0.violatingChatLine,
									textStyle = var15.Theme.TextMuted,
									fontStyle = var15.Font.Body,
									Size = UDim2.new(1, 0, 0, 0),
									TextXAlignment = Enum.TextXAlignment.Left,
									TextYAlignment = Enum.TextYAlignment.Center,
									AutomaticSize = Enum.AutomaticSize.Y,
									TextTruncate = Enum.TextTruncate.AtEnd
								})
							})
						}) else nil,
						WarningText = reactModule.createElement(text, {
							LayoutOrder = 3,
							TextWrapped = true,
							Text = var14.TextChatMayBeSuspendedText,
							textStyle = var15.Theme.TextEmphasis,
							fontStyle = var15.Font.Body,
							Size = UDim2.new(1, 0, 0, 0),
							TextXAlignment = Enum.TextXAlignment.Center,
							TextYAlignment = Enum.TextYAlignment.Center,
							AutomaticSize = Enum.AutomaticSize.Y
						}),
						UnderstandButtonFrame = reactModule.createElement(view, {
							LayoutOrder = 4,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							UnderstandButton = reactModule.createElement(button, {
								text = var14.IUnderstandText,
								variant = buttonVariant.Standard,
								onActivated = reactModule.useCallback(function() --[[ line: 75 ]]
									-- upvalues: inExperienceInterventionAnalyticsModule (copy), var10 (ref), p0 (ref)
									inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(inExperienceInterventionAnalyticsModule.Constants.EventTypes.CtaClicked, inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Nudge, var10.current, p0.eventId, p0.violatingChatLine, nil)
									p0.onDismiss()
								end, { var10 }),
								fillBehavior = fillBehavior.Fill,
								FillDirection = Enum.FillDirection.Horizontal
							})
						}),
						FeedbackFrame = reactModule.createElement(view, {
							LayoutOrder = 5,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							FeedbackFooter = reactModule.createElement(interventionContestFeedbackFooterModule, {
								duration = nil,
								onDismiss = p0.onDismiss,
								renderTimestamp = var10.current,
								interventionType = inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Nudge,
								eventId = p0.eventId,
								violatingChatLine = p0.violatingChatLine
							})
						})
					})
				})
			})
		})
	})
end

return ChatNudgeCustomDialog