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
local var1 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)

function ChatNudgeCustomDialog(p1)
	-- upvalues: reactModule (ref), inExperienceInterventionAnalyticsModule (ref), useLocalization (ref), constants (ref), useStyle (ref), useLayerCollector (ref), useTokens (ref), useProperty (ref), localPlayer (ref), view (ref), text (ref), partialPageModal (ref), scrollView (ref), scrollBarVisibility (ref), reactFocusNavigationModule (ref), var1 (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), button (ref), buttonVariant (ref), fillBehavior (ref), interventionContestFeedbackFooterModule (ref)
	local var2 = reactModule.useRef(DateTime.now().UnixTimestampMillis)
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useState(0)
	reactModule.useEffect(function()
		-- upvalues: inExperienceInterventionAnalyticsModule (copy), var2 (ref), p1 (ref)
		inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(inExperienceInterventionAnalyticsModule.Constants.EventTypes.ModalAppeared, inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Nudge, var2.current, p1.eventId, p1.violatingChatLine, nil)
	end, { var2 })
	local var6 = useLocalization(constants.localizationKeys)
	local var7 = useStyle()
	local var8 = useLayerCollector()
	local var9 = useTokens()
	local var10 = useProperty(var3, "AbsoluteSize")
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var8 (ref), constants (copy), var5 (ref)
		var5(math.min(var8.absoluteSize.Y - constants.UNIBAR_HEIGHT - constants.DIALOG_HEADER_HEIGHT, if var10 then var10.Y else 0))
	end, { var8.absoluteSize.Y, var10 })
	
	return reactModule.createElement(partialPageModal, {
		title = var6.ChatBreaksRulesText,
		screenSize = var8.absoluteSize
	}, {
		ScrollView = reactModule.createElement(scrollView, {
			Size = UDim2.new(1, 0, 0, var4),
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 1, 0),
				scrollBarVisibility = scrollBarVisibility.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			FocusNavigationCoreScriptsProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var1 }, {
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
						ref = var3,
						Size = UDim2.new(1, -constants.SCROLL_BAR_WIDTH, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						MiddleContent = if p1.violatingChatLine then reactModule.createElement(view, {
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
									Text = var6.ChatIncludesText,
									fontStyle = var9.Typography.BodySmall,
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
								BackgroundColor3 = var7.Theme.BackgroundUIDefault.Color
							}, {
								ViolationText = reactModule.createElement(text, {
									LayoutOrder = 2,
									TextWrapped = true,
									Text = if localPlayer then `{localPlayer.DisplayName}: {p1.violatingChatLine}` else p1.violatingChatLine,
									textStyle = var7.Theme.TextMuted,
									fontStyle = var7.Font.Body,
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
							Text = var6.TextChatMayBeSuspendedText,
							textStyle = var7.Theme.TextEmphasis,
							fontStyle = var7.Font.Body,
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
								text = var6.IUnderstandText,
								variant = buttonVariant.Standard,
								onActivated = reactModule.useCallback(function()
									-- upvalues: inExperienceInterventionAnalyticsModule (copy), var2 (ref), p1 (ref)
									inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(inExperienceInterventionAnalyticsModule.Constants.EventTypes.CtaClicked, inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Nudge, var2.current, p1.eventId, p1.violatingChatLine, nil)
									p1.onDismiss()
								end, { var2 }),
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
								onDismiss = p1.onDismiss,
								renderTimestamp = var2.current,
								interventionType = inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Nudge,
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