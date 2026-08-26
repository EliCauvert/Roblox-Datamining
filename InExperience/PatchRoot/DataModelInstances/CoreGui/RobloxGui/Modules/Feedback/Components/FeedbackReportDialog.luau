local corePackagesService = game:GetService("CorePackages")
local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local verticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local signalsModule = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local reactUtilsModule = require(corePackagesService.Packages.ReactUtils)
local parent = script.Parent.Parent
local constantsModule = require(parent.Resources.Constants)
local sendFeedbackThunkModule = require(parent.Thunks.SendFeedbackThunk)
local getSourceLanguageThunkModule = require(parent.Thunks.GetSourceLanguageThunk)
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
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local getFFlagEnableSendImageFeedbackToBackendModule = require(robloxGui.Modules.Flags.GetFFlagEnableSendImageFeedbackToBackend)
local getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule = require(robloxGui.Modules.Flags.GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovements)
local enableFeedbackSelectionUpdate = game:DefineFastFlag("EnableFeedbackSelectionUpdate", false)
local fFlagTopBarSignalizeScreenSize = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local feedbackReportDialog = roactModule.PureComponent:extend("FeedbackReportDialog")
feedbackReportDialog.validateProps = tModule.strictInterface({
	isReportDialogOpen = tModule.boolean,
	screenSize = if fFlagTopBarSignalizeScreenSize then nil else tModule.Vector2,
	closeDialog = tModule.optional(tModule.callback),
	reportCategory = tModule.optional(tModule.string)
})

function feedbackReportDialog.init(p1)
	-- upvalues: enableFeedbackSelectionUpdate (ref), experienceStateCaptureService (ref), constantsModule (ref), getFFlagEnableSendImageFeedbackToBackendModule (ref), fFlagTopBarSignalizeScreenSize (ref), displayModule (ref), signalsModule (ref)
	if enableFeedbackSelectionUpdate then
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
	function p0.calculateFieldHeight(p2, p3, p4)
		return if p2 < 180 and p4 then p3 * 5 else p3 * (p2 / 45 + 2)
	end
	
	function p0.resetLocalState()
		-- upvalues: enableFeedbackSelectionUpdate (copy), p1 (ref), experienceStateCaptureService (copy)
		if enableFeedbackSelectionUpdate then
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
		experienceStateCaptureService:ResetHighlight()
	end
	
	function p0.setInstanceRelatedReportDialogState(p2)
		-- upvalues: p1 (ref), enableFeedbackSelectionUpdate (copy)
		if p2:IsA("TextBox") then
			p1:setState({
				feedbackText = if p2.PlaceholderText == "" then p2.Text else p2.PlaceholderText,
				feedbackOriginalText = p2.LocalizationMatchedSourceText,
				feedbackIdentifier = p2.LocalizationMatchIdentifier
			})
			
			if enableFeedbackSelectionUpdate then
				p1:setState({ isGenericSelection = false })
				
				return
			end
		elseif p2:IsA("TextLabel") or p2:IsA("TextButton") then
			p1:setState({
				feedbackText = p2.Text,
				feedbackOriginalText = p2.LocalizationMatchedSourceText,
				feedbackIdentifier = p2.LocalizationMatchIdentifier
			})
			
			if enableFeedbackSelectionUpdate then
				p1:setState({ isGenericSelection = false })
				
				return
			end
		elseif p2:IsA("ImageLabel") or p2:IsA("ImageButton") then
			p1:setState({
				shouldDisplayFeedbackImage = true,
				feedbackImageUri = p2.Image
			})
			
			return
		elseif p2:IsA("Decal") then
			p1:setState({
				shouldDisplayFeedbackImage = true,
				feedbackImageUri = p2.Texture
			})
			
			return
		elseif p2:IsA("MeshPart") then
			if p2.TextureContent.SourceType == Enum.ContentSourceType.Uri then
				p1:setState({
					shouldDisplayFeedbackImage = true,
					feedbackImageUri = p2.TextureID
				})
				
				return
			elseif p2.MeshContent.SourceType == Enum.ContentSourceType.Uri then
				p1:setState({
					shouldDisplayFeedbackImage = true,
					feedbackImageUri = p2.MeshId
				})
				
				return
			end
			local surfaceAppearance = p2:FindFirstChildOfClass("SurfaceAppearance")
			
			if surfaceAppearance and surfaceAppearance.ColorMap then
				p1:setState({
					shouldDisplayFeedbackImage = true,
					feedbackImageUri = surfaceAppearance.ColorMap
				})
				
				return
			end
		elseif enableFeedbackSelectionUpdate then
			p1:setState({
				feedbackIdentifier = "",
				isGenericSelection = true,
				feedbackText = p2.ClassName,
				feedbackOriginalText = p2.ClassName
			})
		end
	end
	
	experienceStateCaptureService.ItemSelectedInCaptureMode:Connect(function(p2)
		-- upvalues: p1 (ref), constantsModule (copy)
		p1.resetLocalState()
		p1.setInstanceRelatedReportDialogState(p2)
		p1.props.setFeedbackFlowState(constantsModule.State.CurrentlyLeavingFeedback)
	end)
	
	function p0.onCorrectTranslationTextChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ correctTranslationText = p2 })
	end
	
	function p0.onAdditionalCommentsTextChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ additionalCommentsText = p2 })
	end
	
	function p0.onSubmitFeedback()
		-- upvalues: p1 (ref), constantsModule (copy), getFFlagEnableSendImageFeedbackToBackendModule (copy)
		p1:setState({
			numFeedbackSubmissionAttempts = p1.state.numFeedbackSubmissionAttempts + 1
		})
		local text = constantsModule.ContentType.Text
		local feedbackOriginalText = p1.state.feedbackOriginalText
		local feedbackIdentifier = p1.state.feedbackIdentifier
		
		if getFFlagEnableSendImageFeedbackToBackendModule() and p1.state.shouldDisplayFeedbackImage then
			local match = string.match(p1.state.feedbackImageUri, "rbxassetid://(%d+)")
			
			if not match then
				p1.props.setFeedbackFlowState(constantsModule.State.Default)
				p1.resetLocalState()
				
				return
			end
			feedbackOriginalText = match
			feedbackIdentifier = game.GameId .. "#" .. match
			text = constantsModule.ContentType.Image
		end
		p1.props.sendFeedback(text, feedbackOriginalText, p1.state.feedbackText, feedbackIdentifier, p1.state.correctTranslationText, p1.state.additionalCommentsText, p1.props.feedbackReason, p1.state.numFeedbackSubmissionAttempts)
		p1.props.setFeedbackFlowState(constantsModule.State.Default)
		p1.resetLocalState()
	end
	
	function p0.onCancel()
		-- upvalues: p1 (ref), constantsModule (copy)
		p1.props.setFeedbackFlowState(constantsModule.State.Default)
		p1.resetLocalState()
	end
	
	if fFlagTopBarSignalizeScreenSize then
		local getViewportSize = displayModule.GetDisplayStore(false).getViewportSize
		p1.disposeScreenSize = signalsModule.createEffect(function(p2)
			-- upvalues: p1 (ref), getViewportSize (ref)
			p1:setState({ screenSize = getViewportSize(p2) })
		end)
	end
end

function feedbackReportDialog.renderContents(p1, p2)
	-- upvalues: withStyle (ref), getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (ref), reactUtilsModule (ref), roactModule (ref), styledTextLabel (ref), themedTextLabelModule (ref), enableFeedbackSelectionUpdate (ref), textEntryFieldModule (ref), radioButtonList (ref)
	return withStyle(function(p3)
		-- upvalues: p1 (ref), p2 (ref), getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (copy), reactUtilsModule (copy), roactModule (copy), styledTextLabel (copy), themedTextLabelModule (copy), enableFeedbackSelectionUpdate (copy), textEntryFieldModule (copy), radioButtonList (copy)
		local t
		local theme = p3.Theme
		local font = p3.Font
		local var1 = not p1.state.shouldDisplayFeedbackImage and (not p1.state.isGenericSelection and (p1.state.feedbackOriginalText ~= nil and p1.state.feedbackOriginalText ~= ""))
		local list = {
			p2.untranslated,
			p2.accuracyIssue,
			p2.spellingOrGrammarIssue,
			p2.inappropriateOrDerogatory
		}
		local _ = nil
		
		if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then
			local var2 = reactUtilsModule.createNextOrder()
			t = {
				SelectedTextHeader = var2(),
				SelectedTextLabel = var2(),
				OriginalTextHeader = var2(),
				OriginalTextLabel = var2(),
				CorrectTranslationHeader = var2(),
				CorrectTranslationTextEntryField = var2(),
				TranslationProblemsHeader = var2(),
				TranslationProblemsListFrame = var2(),
				AdditionalCommentsHeader = var2(),
				AdditionalCommentsTextEntryField = var2()
			}
		else
			t = {
				SelectedTextHeader = 1,
				SelectedTextLabel = 2,
				TranslationProblemsHeader = 3,
				TranslationProblemsListFrame = 4,
				CorrectTranslationHeader = 5,
				CorrectTranslationTextEntryField = 6,
				AdditionalCommentsHeader = 7,
				AdditionalCommentsTextEntryField = 8
			}
		end
		return roactModule.createFragment({
			Layout = roactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			SelectedTextHeader = roactModule.createElement(styledTextLabel, {
				richText = true,
				fluidSizing = true,
				text = if p1.state.shouldDisplayFeedbackImage then p2.imageSelectionHeader else p2.textSelectionHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = font.Header2,
				colorStyle = theme.TextEmphasis,
				layoutOrder = t.SelectedTextHeader,
				automaticSize = Enum.AutomaticSize.X
			}),
			SelectedTextLabel = if p1.state.shouldDisplayFeedbackImage then roactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = t.SelectedTextLabel,
				Size = UDim2.new(1, 0, 0, 72),
				Image = p1.state.feedbackImageUri,
				ScaleType = Enum.ScaleType.Fit
			}) else roactModule.createElement(themedTextLabelModule, {
				fontKey = "Body",
				themeKey = "TextDefault",
				TextWrapped = true,
				LayoutOrder = t.SelectedTextLabel,
				Size = UDim2.new(1, 0, 0, p1.calculateFieldHeight(string.len(p1.state.feedbackText), 14, false)),
				Text = if enableFeedbackSelectionUpdate then (if p1.state.isGenericSelection then p2.genericSelectionWrapper else p1.state.feedbackText) or "" else p1.state.feedbackText or "",
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			OriginalTextHeader = if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() and var1 then roactModule.createElement(styledTextLabel, {
				richText = true,
				fluidSizing = true,
				text = p2.originalTextHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = font.Header2,
				colorStyle = theme.TextEmphasis,
				layoutOrder = t.OriginalTextHeader,
				automaticSize = Enum.AutomaticSize.X
			}) else nil,
			OriginalTextLabel = if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() and var1 then roactModule.createElement(themedTextLabelModule, {
				fontKey = "Body",
				themeKey = "TextDefault",
				TextWrapped = true,
				LayoutOrder = t.OriginalTextLabel,
				Size = UDim2.new(1, 0, 0, p1.calculateFieldHeight(string.len(p1.state.feedbackOriginalText), 14, false)),
				Text = p1.state.feedbackOriginalText or "",
				TextXAlignment = Enum.TextXAlignment.Left
			}) else nil,
			CorrectTranslationHeader = roactModule.createElement(styledTextLabel, {
				richText = true,
				fluidSizing = true,
				text = p2.correctTranslationHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = font.Header2,
				colorStyle = theme.TextEmphasis,
				layoutOrder = t.CorrectTranslationHeader,
				automaticSize = Enum.AutomaticSize.X
			}),
			CorrectTranslationTextEntryField = roactModule.createElement(textEntryFieldModule, {
				enabled = true,
				autoFocusOnEnabled = false,
				LayoutOrder = t.CorrectTranslationTextEntryField,
				text = p1.state.correctTranslationText,
				textChanged = p1.onCorrectTranslationTextChanged,
				maxTextLength = math.max(string.len(p1.state.correctTranslationText), 180),
				PlaceholderText = p2.correctTranslationPlaceholder,
				Size = UDim2.new(1, 0, 0, p1.calculateFieldHeight(string.len(p1.state.correctTranslationText), 14, true))
			}),
			TranslationProblemsHeader = roactModule.createElement(styledTextLabel, {
				richText = true,
				fluidSizing = true,
				text = p2.problemDropdownSelectionHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = font.Header2,
				colorStyle = theme.TextEmphasis,
				layoutOrder = t.TranslationProblemsHeader,
				automaticSize = Enum.AutomaticSize.X
			}),
			TranslationProblemsListFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 160),
				LayoutOrder = t.TranslationProblemsListFrame
			}, {
				RadioButtonList = roactModule.createElement(radioButtonList, {
					radioButtons = list,
					onActivated = function(p4)
						-- upvalues: p1 (copy)
						p1.props.setFeedbackReason(p4)
					end,
					currentValue = p1.props.feedbackReason,
					elementSize = UDim2.new(1, 0, 0, 40)
				})
			}),
			AdditionalCommentsHeader = roactModule.createElement(styledTextLabel, {
				richText = true,
				fluidSizing = true,
				text = p2.additionalCommentsHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = font.Header2,
				colorStyle = theme.TextEmphasis,
				layoutOrder = t.AdditionalCommentsHeader,
				automaticSize = Enum.AutomaticSize.X
			}),
			AdditionalCommentsTextEntryField = roactModule.createElement(textEntryFieldModule, {
				enabled = true,
				maxTextLength = 180,
				autoFocusOnEnabled = false,
				LayoutOrder = t.AdditionalCommentsTextEntryField,
				text = p1.state.additionalCommentsText,
				textChanged = p1.onAdditionalCommentsTextChanged,
				PlaceholderText = p2.additionalCommentsPlaceholder,
				Size = UDim2.new(1, 0, 0, 90)
			})
		})
	end)
end

function feedbackReportDialog.render(p1)
	-- upvalues: getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (ref), withLocalization (ref), roactModule (ref), modalDialogModule (ref), constantsModule (ref), fFlagTopBarSignalizeScreenSize (ref), verticalScrollView (ref), buttonStack (ref), buttonType (ref)
	local t = {
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
	}
	
	if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then
		t.originalTextHeader = {
			"CoreScripts.Feedback.FeedbackReportDialog.OriginalTextHeader",
			SourceLanguage = p1.props.sourceLanguageName
		}
	end
	return withLocalization(t)(function(p2)
		-- upvalues: roactModule (copy), modalDialogModule (copy), p1 (ref), constantsModule (copy), fFlagTopBarSignalizeScreenSize (copy), verticalScrollView (copy), getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (copy), buttonStack (copy), buttonType (copy)
		local var1
		local createElement = roactModule.createElement
		local t = {
			showCloseButton = true,
			visible = p1.props.feedbackFlowState == constantsModule.State.CurrentlyLeavingFeedback,
			screenSize = if fFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize,
			titleText = p2.mainHeader,
			contents = roactModule.createElement(verticalScrollView, {
				useAutomaticCanvasSize = false,
				canvasSizeY = if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then UDim.new(0, 600 + p1.calculateFieldHeight(string.len(p1.state.feedbackText), 14, false) * 2 + 72 + p1.calculateFieldHeight(string.len(p1.state.feedbackOriginalText), 14, false)) else UDim.new(0, 600 + p1.calculateFieldHeight(string.len(p1.state.feedbackText), 14, false) * 2)
			}, roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				Contents = p1:renderContents(p2)
			}))
		}
		local createElement_1 = roactModule.createElement
		local t_1 = { buttonHeight = 36 }
		local t_2 = {}
		local t_3 = {
			buttonType = buttonType.Secondary,
			props = { onActivated = p1.onCancel, text = p2.cancel }
		}
		local t_4 = { buttonType = buttonType.PrimarySystem }
		local t_5 = {}
		
		if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then
			var1 = p1.state.correctTranslationText:match("%S") == nil
			var1 = nil
		else
			var1 = false
		end
		t_5.isDisabled = var1
		t_5.onActivated = p1.onSubmitFeedback
		t_5.text = p2.submitFeedback
		t_4.props = t_5
		-- Unknown statement at pc 4: <SetList>
		t_1.buttons = t_2
		t.actionButtons = createElement_1(buttonStack, t_1)
		t.onDismiss = p1.onCancel
		t.onBackButtonActivated = if p1.props.canNavigateBack then p1.navigateBack else nil
		
		return createElement(modalDialogModule, t)
	end)
end

function feedbackReportDialog.didMount(p1)
	-- upvalues: getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (ref)
	if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() and p1.props.sourceLanguageName == "" then
		p1.props.getSourceLanguageName()
	end
end

function feedbackReportDialog.willUnmount(p1)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	if fFlagTopBarSignalizeScreenSize then
		p1.disposeScreenSize()
	end
end

return roactRoduxModule.connect(function(p1)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref), getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (ref)
	return {
		screenSize = if fFlagTopBarSignalizeScreenSize then nil else p1.displayOptions.screenSize,
		feedbackFlowState = p1.feedbackFlowState.feedbackFlowState,
		feedbackReason = p1.feedbackFlowState.feedbackReason,
		sourceLanguageName = if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then p1.common.sourceLanguageName else nil
	}
end, function(p1)
	-- upvalues: sendFeedbackThunkModule (ref), setFeedbackFlowStateModule (ref), setFeedbackReasonModule (ref), getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (ref), getSourceLanguageThunkModule (ref)
	return {
		sendFeedback = function(p2, p3, p4, p5, p6, p7, p8, p9)
			-- upvalues: p1 (ref), sendFeedbackThunkModule (copy)
			p1(sendFeedbackThunkModule(p2, p3, p4, p5, p6, p7, p8, p9))
		end,
		setFeedbackFlowState = function(value)
			-- upvalues: p1 (ref), setFeedbackFlowStateModule (copy)
			p1(function(p2)
				-- upvalues: setFeedbackFlowStateModule (copy), value (ref)
				p2:dispatch(setFeedbackFlowStateModule(value))
			end)
		end,
		setFeedbackReason = function(value)
			-- upvalues: p1 (ref), setFeedbackReasonModule (copy)
			p1(function(p2)
				-- upvalues: setFeedbackReasonModule (copy), value (ref)
				p2:dispatch(setFeedbackReasonModule(value))
			end)
		end,
		getSourceLanguageName = function()
			-- upvalues: getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (copy), p1 (ref), getSourceLanguageThunkModule (copy)
			if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then
				p1(getSourceLanguageThunkModule())
			end
		end
	}
end)(feedbackReportDialog)