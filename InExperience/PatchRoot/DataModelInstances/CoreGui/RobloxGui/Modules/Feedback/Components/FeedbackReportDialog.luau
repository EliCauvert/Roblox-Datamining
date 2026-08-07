local corePackagesService = game:GetService("CorePackages")
local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local verticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local signalsModule = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local parent = script.Parent.Parent
local constantsModule = require(parent.Resources.Constants)
local sendFeedbackThunkModule = require(parent.Thunks.SendFeedbackThunk)
local setFeedbackFlowStateModule = require(parent.Actions.SetFeedbackFlowState)
local setFeedbackReasonModule = require(parent.Actions.SetFeedbackReason)
local textEntryFieldModule = require(parent.Components.TextEntryField)
local modalDialogModule = require(parent.Components.ModalDialog)
local themedTextLabelModule = require(parent.Components.PortedComponents.ThemedTextLabel)
local withLocalization = require(corePackagesService.Workspace.Packages.Localization).withLocalization
local radioButtonList = UIBloxModule.App.InputButton.RadioButtonList
local buttonStack = UIBloxModule.App.Button.ButtonStack
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local withStyle = UIBloxModule.Core.Style.withStyle
local getFFlagEnableSendImageFeedbackToBackendModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.GetFFlagEnableSendImageFeedbackToBackend)
local enableFeedbackSelectionUpdate = game:DefineFastFlag("EnableFeedbackSelectionUpdate", false)
local fFlagTopBarSignalizeScreenSize = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local feedbackReportDialog = roactModule.PureComponent:extend("FeedbackReportDialog")
feedbackReportDialog.validateProps = tModule.strictInterface({
	isReportDialogOpen = tModule.boolean,
	screenSize = if fFlagTopBarSignalizeScreenSize then nil else tModule.Vector2,
	closeDialog = tModule.optional(tModule.callback),
	reportCategory = tModule.optional(tModule.string)
})

function feedbackReportDialog.init(p0) --[[ line: 66 ]]
	-- upvalues: enableFeedbackSelectionUpdate (ref), experienceStateCaptureService (ref), constantsModule (ref), getFFlagEnableSendImageFeedbackToBackendModule (ref), fFlagTopBarSignalizeScreenSize (ref), displayModule (ref), signalsModule (ref)
	if enableFeedbackSelectionUpdate then
		p0.state = {
			feedbackText = "",
			feedbackOriginalText = "",
			feedbackIdentifier = "",
			correctTranslationText = "",
			additionalCommentsText = "",
			numFeedbackSubmissionAttempts = 0,
			isGenericSelection = false,
			shouldDisplayFeedbackImage = false,
			feedbackImageUri = ""
		}
	else
		p0.state = {
			feedbackText = "",
			feedbackOriginalText = "",
			feedbackIdentifier = "",
			correctTranslationText = "",
			additionalCommentsText = "",
			numFeedbackSubmissionAttempts = 0,
			shouldDisplayFeedbackImage = false,
			feedbackImageUri = ""
		}
	end
	function p0.calculateFieldHeight(p1, p2, p3) --[[ line: 93 ]]
		return if p1 < 180 and p3 then p2 * 5 else p2 * (p1 / 45 + 2)
	end
	
	function p0.resetLocalState() --[[ line: 102 ]]
		-- upvalues: enableFeedbackSelectionUpdate (copy), p0 (ref), experienceStateCaptureService (copy)
		if enableFeedbackSelectionUpdate then
			p0:setState({ isGenericSelection = false })
		end
		p0:setState({
			shouldDisplayFeedbackImage = false,
			feedbackImageUri = "",
			correctTranslationText = "",
			additionalCommentsText = "",
			feedbackText = "",
			feedbackOriginalText = "",
			feedbackIdentifier = ""
		})
		p0.props.setFeedbackReason(0)
		experienceStateCaptureService:ResetHighlight()
	end
	
	function p0.setInstanceRelatedReportDialogState(p4) --[[ line: 123 ]]
		-- upvalues: p0 (ref), enableFeedbackSelectionUpdate (copy)
		if p4:IsA("TextBox") then
			p0:setState({
				feedbackText = if p4.PlaceholderText == "" then p4.Text else p4.PlaceholderText,
				feedbackOriginalText = p4.LocalizationMatchedSourceText,
				feedbackIdentifier = p4.LocalizationMatchIdentifier
			})
			
			if enableFeedbackSelectionUpdate then
				p0:setState({ isGenericSelection = false })
				
				return
			end
		elseif p4:IsA("TextLabel") or p4:IsA("TextButton") then
			p0:setState({
				feedbackText = p4.Text,
				feedbackOriginalText = p4.LocalizationMatchedSourceText,
				feedbackIdentifier = p4.LocalizationMatchIdentifier
			})
			
			if enableFeedbackSelectionUpdate then
				p0:setState({ isGenericSelection = false })
				
				return
			end
		elseif p4:IsA("ImageLabel") or p4:IsA("ImageButton") then
			p0:setState({
				shouldDisplayFeedbackImage = true,
				feedbackImageUri = p4.Image
			})
			
			return
		elseif p4:IsA("Decal") then
			p0:setState({
				shouldDisplayFeedbackImage = true,
				feedbackImageUri = p4.Texture
			})
			
			return
		elseif p4:IsA("MeshPart") then
			if p4.TextureContent.SourceType == Enum.ContentSourceType.Uri then
				p0:setState({
					shouldDisplayFeedbackImage = true,
					feedbackImageUri = p4.TextureID
				})
				
				return
			elseif p4.MeshContent.SourceType == Enum.ContentSourceType.Uri then
				p0:setState({
					shouldDisplayFeedbackImage = true,
					feedbackImageUri = p4.MeshId
				})
				
				return
			end
			local surfaceAppearance = p4:FindFirstChildOfClass("SurfaceAppearance")
			
			if surfaceAppearance and surfaceAppearance.ColorMap then
				p0:setState({
					shouldDisplayFeedbackImage = true,
					feedbackImageUri = surfaceAppearance.ColorMap
				})
				
				return
			end
		elseif enableFeedbackSelectionUpdate then
			p0:setState({
				feedbackIdentifier = "",
				isGenericSelection = true,
				feedbackText = p4.ClassName,
				feedbackOriginalText = p4.ClassName
			})
		end
	end
	
	experienceStateCaptureService.ItemSelectedInCaptureMode:Connect(function(p5) --[[ line: 191 ]]
		-- upvalues: p0 (ref), constantsModule (copy)
		p0.resetLocalState()
		p0.setInstanceRelatedReportDialogState(p5)
		p0.props.setFeedbackFlowState(constantsModule.State.CurrentlyLeavingFeedback)
	end)
	
	function p0.onCorrectTranslationTextChanged(p6) --[[ line: 198 ]]
		-- upvalues: p0 (ref)
		p0:setState({ correctTranslationText = p6 })
	end
	
	function p0.onAdditionalCommentsTextChanged(p7) --[[ line: 204 ]]
		-- upvalues: p0 (ref)
		p0:setState({ additionalCommentsText = p7 })
	end
	
	function p0.onSubmitFeedback() --[[ line: 210 ]]
		-- upvalues: p0 (ref), constantsModule (copy), getFFlagEnableSendImageFeedbackToBackendModule (copy)
		p0:setState({
			numFeedbackSubmissionAttempts = p0.state.numFeedbackSubmissionAttempts + 1
		})
		local text = constantsModule.ContentType.Text
		local feedbackOriginalText = p0.state.feedbackOriginalText
		local feedbackIdentifier = p0.state.feedbackIdentifier
		
		if getFFlagEnableSendImageFeedbackToBackendModule() and p0.state.shouldDisplayFeedbackImage then
			local match = string.match(p0.state.feedbackImageUri, "rbxassetid://(%d+)")
			
			if not match then
				p0.props.setFeedbackFlowState(constantsModule.State.Default)
				p0.resetLocalState()
				
				return
			end
			feedbackOriginalText = match
			feedbackIdentifier = game.GameId .. ":" .. match
			text = constantsModule.ContentType.Image
		end
		p0.props.sendFeedback(text, feedbackOriginalText, p0.state.feedbackText, feedbackIdentifier, p0.state.correctTranslationText, p0.state.additionalCommentsText, p0.props.feedbackReason, p0.state.numFeedbackSubmissionAttempts)
		p0.props.setFeedbackFlowState(constantsModule.State.Default)
		p0.resetLocalState()
	end
	
	function p0.onCancel() --[[ line: 249 ]]
		-- upvalues: p0 (ref), constantsModule (copy)
		p0.props.setFeedbackFlowState(constantsModule.State.Default)
		p0.resetLocalState()
	end
	
	if fFlagTopBarSignalizeScreenSize then
		local getViewportSize = displayModule.GetDisplayStore(false).getViewportSize
		p0.disposeScreenSize = signalsModule.createEffect(function(p8) --[[ line: 257 ]]
			-- upvalues: p0 (ref), getViewportSize (ref)
			p0:setState({ screenSize = getViewportSize(p8) })
		end)
	end
end

function feedbackReportDialog.renderContents(p9, p10) --[[ line: 265 ]]
	-- upvalues: withStyle (ref), roactModule (ref), styledTextLabel (ref), themedTextLabelModule (ref), enableFeedbackSelectionUpdate (ref), radioButtonList (ref), textEntryFieldModule (ref)
	return withStyle(function(p11) --[[ line: 266 ]]
		-- upvalues: p10 (ref), roactModule (copy), styledTextLabel (copy), p9 (ref), themedTextLabelModule (copy), enableFeedbackSelectionUpdate (copy), radioButtonList (copy), textEntryFieldModule (copy)
		local theme = p11.Theme
		local font = p11.Font
		
		return roactModule.createFragment({
			Layout = roactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			SelectedTextHeader = roactModule.createElement(styledTextLabel, {
				richText = true,
				layoutOrder = 1,
				fluidSizing = true,
				text = if p9.state.shouldDisplayFeedbackImage then p10.imageSelectionHeader else p10.textSelectionHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = font.Header2,
				colorStyle = theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.X
			}),
			SelectedTextLabel = if p9.state.shouldDisplayFeedbackImage then roactModule.createElement("ImageLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 72),
				Image = p9.state.feedbackImageUri,
				ScaleType = Enum.ScaleType.Fit
			}) else roactModule.createElement(themedTextLabelModule, {
				LayoutOrder = 2,
				fontKey = "Body",
				themeKey = "TextDefault",
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, p9.calculateFieldHeight(string.len(p9.state.feedbackText), 14, false)),
				Text = if enableFeedbackSelectionUpdate then (if p9.state.isGenericSelection then p10.genericSelectionWrapper else p9.state.feedbackText) or "" else p9.state.feedbackText or "",
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			TranslationProblemsHeader = roactModule.createElement(styledTextLabel, {
				richText = true,
				layoutOrder = 3,
				fluidSizing = true,
				text = p10.problemDropdownSelectionHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = font.Header2,
				colorStyle = theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.X
			}),
			TranslationProblemsListFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, 160)
			}, {
				RadioButtonList = roactModule.createElement(radioButtonList, {
					radioButtons = {
						p10.untranslated,
						p10.accuracyIssue,
						p10.spellingOrGrammarIssue,
						p10.inappropriateOrDerogatory
					},
					onActivated = function(p12) --[[ line: 344 ]]
						-- upvalues: p9 (copy)
						p9.props.setFeedbackReason(p12)
					end,
					currentValue = p9.props.feedbackReason,
					elementSize = UDim2.new(1, 0, 0, 40)
				})
			}),
			CorrectTranslationHeader = roactModule.createElement(styledTextLabel, {
				richText = true,
				layoutOrder = 5,
				fluidSizing = true,
				text = p10.correctTranslationHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = font.Header2,
				colorStyle = theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.X
			}),
			CorrectTranslationTextEntryField = roactModule.createElement(textEntryFieldModule, {
				LayoutOrder = 6,
				enabled = true,
				autoFocusOnEnabled = false,
				text = p9.state.correctTranslationText,
				textChanged = p9.onCorrectTranslationTextChanged,
				maxTextLength = math.max(string.len(p9.state.correctTranslationText), 180),
				PlaceholderText = p10.correctTranslationPlaceholder,
				Size = UDim2.new(1, 0, 0, p9.calculateFieldHeight(string.len(p9.state.correctTranslationText), 14, true))
			}),
			AdditionalCommentsHeader = roactModule.createElement(styledTextLabel, {
				richText = true,
				layoutOrder = 7,
				fluidSizing = true,
				text = p10.additionalCommentsHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = font.Header2,
				colorStyle = theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.X
			}),
			AdditionalCommentsTextEntryField = roactModule.createElement(textEntryFieldModule, {
				LayoutOrder = 8,
				enabled = true,
				maxTextLength = 180,
				autoFocusOnEnabled = false,
				text = p9.state.additionalCommentsText,
				textChanged = p9.onAdditionalCommentsTextChanged,
				PlaceholderText = p10.additionalCommentsPlaceholder,
				Size = UDim2.new(1, 0, 0, 90)
			})
		})
	end)
end

function feedbackReportDialog.render(p13) --[[ line: 407 ]]
	-- upvalues: withLocalization (ref), roactModule (ref), modalDialogModule (ref), constantsModule (ref), fFlagTopBarSignalizeScreenSize (ref), verticalScrollView (ref), buttonStack (ref), buttonType (ref)
	return withLocalization({
		mainHeader = "CoreScripts.Feedback.FeedbackReportDialog.MainHeader",
		cancel = "CoreScripts.Feedback.FeedbackReportDialog.Cancel",
		submitFeedback = "CoreScripts.Feedback.FeedbackReportDialog.SubmitFeedback",
		untranslated = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.Untranslated",
		accuracyIssue = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.AccuracyIssue",
		spellingOrGrammarIssue = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.SpellingOrGrammarIssue",
		inappropriateOrDerogatory = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.InappropriateOrDerogatory",
		textSelectionHeader = "CoreScripts.Feedback.FeedbackReportDialog.TextSelectionHeader",
		correctTranslationHeader = "CoreScripts.Feedback.FeedbackReportDialog.CorrectTranslationHeader",
		correctTranslationPlaceholder = "CoreScripts.Feedback.FeedbackReportDialog.CorrectTranslationPlaceholder",
		additionalCommentsHeader = "CoreScripts.Feedback.FeedbackReportDialog.AdditionalCommentsHeader",
		additionalCommentsPlaceholder = "CoreScripts.Feedback.FeedbackReportDialog.AdditionalCommentsPlaceholder",
		problemDropdownSelectionHeader = "CoreScripts.Feedback.FeedbackReportDialog.ProblemDropdownSelectionHeader",
		imageSelectionHeader = "CoreScripts.Feedback.FeedbackReportDialog.ImageSelectionHeader",
		genericSelectionWrapper = {
			"CoreScripts.Feedback.FeedbackReportDialog.CorrectTranslationObjectPlaceholder",
			ObjectType = p13.state.feedbackText
		}
	})(function(p14) --[[ line: 427 ]]
		-- upvalues: roactModule (copy), modalDialogModule (copy), p13 (ref), constantsModule (copy), fFlagTopBarSignalizeScreenSize (copy), verticalScrollView (copy), buttonStack (copy), buttonType (copy)
		return roactModule.createElement(modalDialogModule, {
			showCloseButton = true,
			visible = p13.props.feedbackFlowState == constantsModule.State.CurrentlyLeavingFeedback,
			screenSize = if fFlagTopBarSignalizeScreenSize then p13.state.screenSize else p13.props.screenSize,
			titleText = p14.mainHeader,
			contents = roactModule.createElement(verticalScrollView, {
				useAutomaticCanvasSize = false,
				canvasSizeY = UDim.new(0, 600 + p13.calculateFieldHeight(string.len(p13.state.feedbackText), 14, false) * 2)
			}, roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				Contents = p13:renderContents(p14)
			})),
			actionButtons = roactModule.createElement(buttonStack, {
				buttonHeight = 36,
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = { onActivated = p13.onCancel, text = p14.cancel }
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							isDisabled = false,
							onActivated = p13.onSubmitFeedback,
							text = p14.submitFeedback
						}
					}
				}
			}),
			onDismiss = p13.onCancel,
			onBackButtonActivated = if p13.props.canNavigateBack then p13.navigateBack else nil
		})
	end)
end

function feedbackReportDialog.willUnmount(p15) --[[ line: 482 ]]
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	if fFlagTopBarSignalizeScreenSize then
		p15.disposeScreenSize()
	end
end

return roactRoduxModule.connect(function(p16) --[[ line: 489 ]]
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	return {
		screenSize = if fFlagTopBarSignalizeScreenSize then nil else p16.displayOptions.screenSize,
		feedbackFlowState = p16.feedbackFlowState.feedbackFlowState,
		feedbackReason = p16.feedbackFlowState.feedbackReason
	}
end, function(p17) --[[ line: 495 ]]
	-- upvalues: sendFeedbackThunkModule (ref), setFeedbackFlowStateModule (ref), setFeedbackReasonModule (ref)
	return {
		sendFeedback = function(p18, p19, p20, p21, p22, p23, p24, p25) --[[ line: 497 ]]
			-- upvalues: p17 (ref), sendFeedbackThunkModule (copy)
			p17(sendFeedbackThunkModule(p18, p19, p20, p21, p22, p23, p24, p25))
		end,
		setFeedbackFlowState = function(value) --[[ line: 520 ]]
			-- upvalues: p17 (ref), setFeedbackFlowStateModule (copy)
			p17(function(p26) --[[ line: 521 ]]
				-- upvalues: setFeedbackFlowStateModule (copy), value (ref)
				p26:dispatch(setFeedbackFlowStateModule(value))
			end)
		end,
		setFeedbackReason = function(value) --[[ line: 525 ]]
			-- upvalues: p17 (ref), setFeedbackReasonModule (copy)
			p17(function(p27) --[[ line: 526 ]]
				-- upvalues: setFeedbackReasonModule (copy), value (ref)
				p27:dispatch(setFeedbackReasonModule(value))
			end)
		end
	}
end)(feedbackReportDialog)