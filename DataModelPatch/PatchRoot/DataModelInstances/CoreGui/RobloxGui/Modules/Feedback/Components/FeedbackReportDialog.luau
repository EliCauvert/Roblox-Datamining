local CorePackages = game:GetService("CorePackages")
local ExperienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local VerticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local SignalsModule = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Resources.Constants)
local SendFeedbackThunkModule = require(Parent.Thunks.SendFeedbackThunk)
local SetFeedbackFlowStateModule = require(Parent.Actions.SetFeedbackFlowState)
local SetFeedbackReasonModule = require(Parent.Actions.SetFeedbackReason)
local TextEntryFieldModule = require(Parent.Components.TextEntryField)
local ModalDialogModule = require(Parent.Components.ModalDialog)
local ThemedTextLabelModule = require(Parent.Components.PortedComponents.ThemedTextLabel)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local RadioButtonList = UIBloxModule.App.InputButton.RadioButtonList
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local GetFFlagEnableFeedbackReportDialogAdjustmentsModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.GetFFlagEnableFeedbackReportDialogAdjustments)
local EnableFeedbackSelectionUpdate = game:DefineFastFlag("EnableFeedbackSelectionUpdate", false)
local FFlagTopBarSignalizeScreenSize = require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local FeedbackReportDialog = RoactModule.PureComponent:extend("FeedbackReportDialog")
FeedbackReportDialog.validateProps = TModule.strictInterface({
	isReportDialogOpen = TModule.boolean,
	screenSize = if FFlagTopBarSignalizeScreenSize then nil else TModule.Vector2,
	closeDialog = TModule.optional(TModule.callback),
	reportCategory = TModule.optional(TModule.string)
})

function FeedbackReportDialog.init(p1)
	-- upvalues: EnableFeedbackSelectionUpdate (copy), ExperienceStateCaptureService (copy), ConstantsModule (copy), FFlagTopBarSignalizeScreenSize (copy), DisplayModule (copy), SignalsModule (copy)
	if EnableFeedbackSelectionUpdate then
		p1.state = {
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
		p1.state = {
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
	function p1.calculateFieldHeight(Length: number, p2: number, p3): number
		return if Length < 180 and p3 then p2 * 5 else p2 * (Length / 45 + 2)
	end
	
	function p1.resetLocalState()
		-- upvalues: EnableFeedbackSelectionUpdate (upval), p1 (copy), ExperienceStateCaptureService (upval)
		if EnableFeedbackSelectionUpdate then
			p1:setState({ isGenericSelection = false })
		end
		p1:setState({
			shouldDisplayFeedbackImage = false,
			feedbackImageUri = "",
			correctTranslationText = "",
			additionalCommentsText = "",
			feedbackText = "",
			feedbackOriginalText = "",
			feedbackIdentifier = ""
		})
		p1.props.setFeedbackReason(0)
		ExperienceStateCaptureService:ResetHighlight()
	end
	
	function p1.setInstanceRelatedReportDialogState(Object)
		-- upvalues: p1 (copy), EnableFeedbackSelectionUpdate (upval)
		if Object:IsA("TextBox") then
			p1:setState({
				feedbackText = if Object.PlaceholderText == "" then Object.Text else Object.PlaceholderText,
				feedbackOriginalText = Object.LocalizationMatchedSourceText,
				feedbackIdentifier = Object.LocalizationMatchIdentifier
			})
			
			if EnableFeedbackSelectionUpdate then
				p1:setState({ isGenericSelection = false })
				
				return
			end
		elseif Object:IsA("TextLabel") or Object:IsA("TextButton") then
			p1:setState({
				feedbackText = Object.Text,
				feedbackOriginalText = Object.LocalizationMatchedSourceText,
				feedbackIdentifier = Object.LocalizationMatchIdentifier
			})
			
			if EnableFeedbackSelectionUpdate then
				p1:setState({ isGenericSelection = false })
				
				return
			end
		elseif Object:IsA("ImageLabel") or Object:IsA("ImageButton") then
			p1:setState({
				shouldDisplayFeedbackImage = true,
				feedbackImageUri = Object.Image
			})
			
			return
		else
			if Object:IsA("Decal") then
				p1:setState({
					shouldDisplayFeedbackImage = true,
					feedbackImageUri = Object.Texture
				})
				
				return
			end
			if Object:IsA("MeshPart") then
				if Object.TextureContent.SourceType == Enum.ContentSourceType.Uri then
					p1:setState({
						shouldDisplayFeedbackImage = true,
						feedbackImageUri = Object.TextureID
					})
					
					return
				end
				if Object.MeshContent.SourceType == Enum.ContentSourceType.Uri then
					p1:setState({
						shouldDisplayFeedbackImage = true,
						feedbackImageUri = Object.MeshId
					})
					
					return
				end
				local SurfaceAppearance = Object:FindFirstChildOfClass("SurfaceAppearance")
				
				if SurfaceAppearance and SurfaceAppearance.ColorMap then
					p1:setState({
						shouldDisplayFeedbackImage = true,
						feedbackImageUri = SurfaceAppearance.ColorMap
					})
					
					return
				end
			elseif EnableFeedbackSelectionUpdate then
				p1:setState({
					feedbackIdentifier = "",
					isGenericSelection = true,
					feedbackText = Object.ClassName,
					feedbackOriginalText = Object.ClassName
				})
			end
		end
	end
	
	ExperienceStateCaptureService.ItemSelectedInCaptureMode:Connect(function(p2)
		-- upvalues: p1 (copy), ConstantsModule (upval)
		p1.resetLocalState()
		p1.setInstanceRelatedReportDialogState(p2)
		p1.props.setFeedbackFlowState(ConstantsModule.State.CurrentlyLeavingFeedback)
	end)
	
	function p1.onCorrectTranslationTextChanged(CorrectTranslationText)
		-- upvalues: p1 (copy)
		p1:setState({ correctTranslationText = CorrectTranslationText })
	end
	
	function p1.onAdditionalCommentsTextChanged(AdditionalCommentsText)
		-- upvalues: p1 (copy)
		p1:setState({ additionalCommentsText = AdditionalCommentsText })
	end
	
	function p1.onSubmitFeedback()
		-- upvalues: p1 (copy), ConstantsModule (upval)
		p1:setState({
			numFeedbackSubmissionAttempts = p1.state.numFeedbackSubmissionAttempts + 1
		})
		p1.props.sendFeedback(p1.state.feedbackOriginalText, p1.state.feedbackText, p1.state.feedbackIdentifier, p1.state.correctTranslationText, p1.state.additionalCommentsText, p1.props.feedbackReason, p1.state.numFeedbackSubmissionAttempts)
		p1.props.setFeedbackFlowState(ConstantsModule.State.Default)
		p1.resetLocalState()
	end
	
	function p1.onCancel()
		-- upvalues: p1 (copy), ConstantsModule (upval)
		p1.props.setFeedbackFlowState(ConstantsModule.State.Default)
		p1.resetLocalState()
	end
	
	if FFlagTopBarSignalizeScreenSize then
		local GetViewportSizeFunction = DisplayModule.GetDisplayStore(false).getViewportSize
		p1.disposeScreenSize = SignalsModule.createEffect(function(p2)
			-- upvalues: p1 (copy), GetViewportSizeFunction (copy)
			p1:setState({ screenSize = GetViewportSizeFunction(p2) })
		end)
	end
end

function FeedbackReportDialog.renderContents(p1, p2)
	-- upvalues: WithStyleFunction (copy), GetFFlagEnableFeedbackReportDialogAdjustmentsModule (copy), RoactModule (copy), StyledTextLabel (copy), ThemedTextLabelModule (copy), EnableFeedbackSelectionUpdate (copy), RadioButtonList (copy), TextEntryFieldModule (copy)
	return WithStyleFunction(function(p3)
		-- upvalues: p2 (copy), GetFFlagEnableFeedbackReportDialogAdjustmentsModule (upval), RoactModule (upval), StyledTextLabel (upval), p1 (copy), ThemedTextLabelModule (upval), EnableFeedbackSelectionUpdate (upval), RadioButtonList (upval), TextEntryFieldModule (upval)
		local Theme = p3.Theme
		local _Font = p3.Font
		local RadioButtons = {
			p2.untranslated,
			p2.accuracyIssue,
			p2.spellingOrGrammarIssue,
			p2.inappropriateOrDerogatory
		}
		
		return if GetFFlagEnableFeedbackReportDialogAdjustmentsModule() then RoactModule.createFragment({
			Layout = RoactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			SelectedTextHeader = RoactModule.createElement(StyledTextLabel, {
				richText = true,
				layoutOrder = 1,
				fluidSizing = true,
				text = if p1.state.shouldDisplayFeedbackImage then p2.imageSelectionHeader else p2.textSelectionHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = _Font.Header2,
				colorStyle = Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.X
			}),
			SelectedTextLabel = if p1.state.shouldDisplayFeedbackImage then RoactModule.createElement("ImageLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 72),
				Image = p1.state.feedbackImageUri,
				ScaleType = Enum.ScaleType.Fit
			}) else RoactModule.createElement(ThemedTextLabelModule, {
				LayoutOrder = 2,
				fontKey = "Body",
				themeKey = "TextDefault",
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, p1.calculateFieldHeight(string.len(p1.state.feedbackText), 14, false)),
				Text = (if EnableFeedbackSelectionUpdate then if p1.state.isGenericSelection then p2.genericSelectionWrapper else p1.state.feedbackText else p1.state.feedbackText) or "",
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			TranslationProblemsHeader = RoactModule.createElement(StyledTextLabel, {
				richText = true,
				layoutOrder = 3,
				fluidSizing = true,
				text = p2.problemDropdownSelectionHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = _Font.Header2,
				colorStyle = Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.X
			}),
			TranslationProblemsListFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, 160)
			}, {
				RadioButtonList = RoactModule.createElement(RadioButtonList, {
					radioButtons = RadioButtons,
					onActivated = function(p4)
						-- upvalues: p1 (upval)
						p1.props.setFeedbackReason(p4)
					end,
					currentValue = p1.props.feedbackReason,
					elementSize = UDim2.new(1, 0, 0, 40)
				})
			}),
			CorrectTranslationHeader = RoactModule.createElement(StyledTextLabel, {
				richText = true,
				layoutOrder = 5,
				fluidSizing = true,
				text = p2.correctTranslationHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = _Font.Header2,
				colorStyle = Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.X
			}),
			CorrectTranslationTextEntryField = RoactModule.createElement(TextEntryFieldModule, {
				LayoutOrder = 6,
				enabled = true,
				autoFocusOnEnabled = false,
				text = p1.state.correctTranslationText,
				textChanged = p1.onCorrectTranslationTextChanged,
				maxTextLength = math.max(string.len(p1.state.correctTranslationText), 180),
				PlaceholderText = p2.correctTranslationPlaceholder,
				Size = UDim2.new(1, 0, 0, p1.calculateFieldHeight(string.len(p1.state.correctTranslationText), 14, true))
			}),
			AdditionalCommentsHeader = RoactModule.createElement(StyledTextLabel, {
				richText = true,
				layoutOrder = 7,
				fluidSizing = true,
				text = p2.additionalCommentsHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = _Font.Header2,
				colorStyle = Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.X
			}),
			AdditionalCommentsTextEntryField = RoactModule.createElement(TextEntryFieldModule, {
				LayoutOrder = 8,
				enabled = true,
				maxTextLength = 180,
				autoFocusOnEnabled = false,
				text = p1.state.additionalCommentsText,
				textChanged = p1.onAdditionalCommentsTextChanged,
				PlaceholderText = p2.additionalCommentsPlaceholder,
				Size = UDim2.new(1, 0, 0, 90)
			})
		}) else RoactModule.createFragment({
			Layout = RoactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			SelectedTextHeader = RoactModule.createElement(StyledTextLabel, {
				richText = true,
				layoutOrder = 1,
				fluidSizing = true,
				text = if p1.state.shouldDisplayFeedbackImage then p2.imageSelectionHeader else p2.textSelectionHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = _Font.Header2,
				colorStyle = Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.X
			}),
			SelectedTextLabel = if p1.state.shouldDisplayFeedbackImage then RoactModule.createElement("ImageLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 72),
				Image = p1.state.feedbackImageUri,
				ScaleType = Enum.ScaleType.Fit
			}) else RoactModule.createElement(ThemedTextLabelModule, {
				LayoutOrder = 2,
				fontKey = "Body",
				themeKey = "TextDefault",
				TextWrapped = true,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 76, 0.5, 0),
				Size = UDim2.new(1, 0, 0, p1.calculateFieldHeight(string.len(p1.state.feedbackText), 18, false)),
				Text = (if EnableFeedbackSelectionUpdate then if p1.state.isGenericSelection then p2.genericSelectionWrapper else p1.state.feedbackText else p1.state.feedbackText) or "",
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			CorrectTranslationHeader = RoactModule.createElement(StyledTextLabel, {
				richText = true,
				layoutOrder = 3,
				fluidSizing = true,
				text = p2.correctTranslationHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = _Font.Header2,
				colorStyle = Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.X
			}),
			CorrectTranslationTextEntryField = RoactModule.createElement(TextEntryFieldModule, {
				LayoutOrder = 4,
				enabled = true,
				autoFocusOnEnabled = false,
				text = p1.state.correctTranslationText,
				textChanged = p1.onCorrectTranslationTextChanged,
				maxTextLength = math.max(string.len(p1.state.correctTranslationText), 180),
				PlaceholderText = p2.correctTranslationPlaceholder,
				Size = UDim2.new(1, 0, 0, p1.calculateFieldHeight(string.len(p1.state.correctTranslationText), 18, true))
			}),
			AdditionalCommentsHeader = RoactModule.createElement(StyledTextLabel, {
				richText = true,
				layoutOrder = 5,
				fluidSizing = true,
				text = p2.additionalCommentsHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = _Font.Header2,
				colorStyle = Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.X
			}),
			AdditionalCommentsTextEntryField = RoactModule.createElement(TextEntryFieldModule, {
				LayoutOrder = 6,
				enabled = true,
				maxTextLength = 180,
				autoFocusOnEnabled = false,
				text = p1.state.additionalCommentsText,
				textChanged = p1.onAdditionalCommentsTextChanged,
				PlaceholderText = p2.additionalCommentsPlaceholder,
				Size = UDim2.new(1, 0, 0, 90)
			}),
			TranslationProblemsHeader = RoactModule.createElement(StyledTextLabel, {
				richText = true,
				layoutOrder = 7,
				fluidSizing = true,
				text = p2.problemDropdownSelectionHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = _Font.Header2,
				colorStyle = Theme.TextEmphasis,
				automaticSize = Enum.AutomaticSize.X
			}),
			RadioButtonList = RoactModule.createElement(RadioButtonList, {
				layoutOrder = 8,
				radioButtons = RadioButtons,
				onActivated = function(p4)
					-- upvalues: p1 (upval)
					p1.props.setFeedbackReason(p4)
				end,
				currentValue = p1.props.feedbackReason,
				elementSize = UDim2.new(1, 0, 0, 40)
			})
		})
	end)
end

function FeedbackReportDialog.render(p1)
	-- upvalues: WithLocalizationFunction (copy), RoactModule (copy), ModalDialogModule (copy), ConstantsModule (copy), FFlagTopBarSignalizeScreenSize (copy), GetFFlagEnableFeedbackReportDialogAdjustmentsModule (copy), VerticalScrollView (copy), ButtonStack (copy), ButtonType (copy)
	return WithLocalizationFunction({
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
			ObjectType = p1.state.feedbackText
		}
	})(function(p2)
		-- upvalues: RoactModule (upval), ModalDialogModule (upval), p1 (copy), ConstantsModule (upval), FFlagTopBarSignalizeScreenSize (upval), GetFFlagEnableFeedbackReportDialogAdjustmentsModule (upval), VerticalScrollView (upval), ButtonStack (upval), ButtonType (upval)
		return RoactModule.createElement(ModalDialogModule, {
			visible = p1.props.feedbackFlowState == ConstantsModule.State.CurrentlyLeavingFeedback,
			screenSize = if FFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize,
			titleText = p2.mainHeader,
			showCloseButton = if GetFFlagEnableFeedbackReportDialogAdjustmentsModule() then true else false,
			contents = RoactModule.createElement(VerticalScrollView, {
				useAutomaticCanvasSize = false,
				canvasSizeY = if GetFFlagEnableFeedbackReportDialogAdjustmentsModule() then UDim.new(0, 600 + p1.calculateFieldHeight(string.len(p1.state.feedbackText), 14, false) * 2) else UDim.new(1, 550)
			}, RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				Contents = p1:renderContents(p2)
			})),
			actionButtons = RoactModule.createElement(ButtonStack, {
				buttonHeight = 36,
				buttons = {
					{
						buttonType = ButtonType.Secondary,
						props = { onActivated = p1.onCancel, text = p2.cancel }
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							isDisabled = false,
							onActivated = p1.onSubmitFeedback,
							text = p2.submitFeedback
						}
					}
				}
			}),
			onDismiss = p1.onCancel,
			onBackButtonActivated = if p1.props.canNavigateBack then p1.navigateBack else nil
		})
	end)
end

function FeedbackReportDialog.willUnmount(p1)
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy)
	if FFlagTopBarSignalizeScreenSize then
		p1.disposeScreenSize()
	end
end

return RoactRoduxModule.connect(function(p1)
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy)
	return {
		screenSize = if FFlagTopBarSignalizeScreenSize then nil else p1.displayOptions.screenSize,
		feedbackFlowState = p1.feedbackFlowState.feedbackFlowState,
		feedbackReason = p1.feedbackFlowState.feedbackReason
	}
end, function(Callback)
	-- upvalues: SendFeedbackThunkModule (copy), SetFeedbackFlowStateModule (copy), SetFeedbackReasonModule (copy)
	return {
		sendFeedback = function(p1, p2, p3, p4, p5, p6, p7)
			-- upvalues: Callback (copy), SendFeedbackThunkModule (upval)
			Callback(SendFeedbackThunkModule(p1, p2, p3, p4, p5, p6, p7))
		end,
		setFeedbackFlowState = function(p1)
			-- upvalues: Callback (copy), SetFeedbackFlowStateModule (upval)
			Callback(function(p2)
				-- upvalues: SetFeedbackFlowStateModule (upval), p1 (copy)
				p2:dispatch(SetFeedbackFlowStateModule(p1))
			end)
		end,
		setFeedbackReason = function(p1)
			-- upvalues: Callback (copy), SetFeedbackReasonModule (upval)
			Callback(function(p2)
				-- upvalues: SetFeedbackReasonModule (upval), p1 (copy)
				p2:dispatch(SetFeedbackReasonModule(p1))
			end)
		end
	}
end)(FeedbackReportDialog)