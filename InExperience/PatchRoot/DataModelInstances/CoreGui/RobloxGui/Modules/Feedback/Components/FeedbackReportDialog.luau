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

function feedbackReportDialog.init(p0)
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
	function p0.calculateFieldHeight(p1, p2, p3)
		return if p1 < 180 and p3 then p2 * 5 else p2 * (p1 / 45 + 2)
	end
	
	function p0.resetLocalState()
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
	
	function p0.setInstanceRelatedReportDialogState(p4)
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
	
	experienceStateCaptureService.ItemSelectedInCaptureMode:Connect(function(p5)
		-- upvalues: p0 (ref), constantsModule (copy)
		p0.resetLocalState()
		p0.setInstanceRelatedReportDialogState(p5)
		p0.props.setFeedbackFlowState(constantsModule.State.CurrentlyLeavingFeedback)
	end)
	
	function p0.onCorrectTranslationTextChanged(p6)
		-- upvalues: p0 (ref)
		p0:setState({ correctTranslationText = p6 })
	end
	
	function p0.onAdditionalCommentsTextChanged(p7)
		-- upvalues: p0 (ref)
		p0:setState({ additionalCommentsText = p7 })
	end
	
	function p0.onSubmitFeedback()
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
			feedbackIdentifier = game.GameId .. "#" .. match
			text = constantsModule.ContentType.Image
		end
		p0.props.sendFeedback(text, feedbackOriginalText, p0.state.feedbackText, feedbackIdentifier, p0.state.correctTranslationText, p0.state.additionalCommentsText, p0.props.feedbackReason, p0.state.numFeedbackSubmissionAttempts)
		p0.props.setFeedbackFlowState(constantsModule.State.Default)
		p0.resetLocalState()
	end
	
	function p0.onCancel()
		-- upvalues: p0 (ref), constantsModule (copy)
		p0.props.setFeedbackFlowState(constantsModule.State.Default)
		p0.resetLocalState()
	end
	
	if fFlagTopBarSignalizeScreenSize then
		local getViewportSize = displayModule.GetDisplayStore(false).getViewportSize
		p0.disposeScreenSize = signalsModule.createEffect(function(p8)
			-- upvalues: p0 (ref), getViewportSize (ref)
			p0:setState({ screenSize = getViewportSize(p8) })
		end)
	end
end

function feedbackReportDialog.renderContents(p9, p10)
	-- upvalues: withStyle (ref), getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (ref), reactUtilsModule (ref), roactModule (ref), styledTextLabel (ref), themedTextLabelModule (ref), enableFeedbackSelectionUpdate (ref), textEntryFieldModule (ref), radioButtonList (ref)
	return withStyle(function(p11)
		-- upvalues: p9 (ref), p10 (ref), getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (copy), reactUtilsModule (copy), roactModule (copy), styledTextLabel (copy), themedTextLabelModule (copy), enableFeedbackSelectionUpdate (copy), textEntryFieldModule (copy), radioButtonList (copy)
		local t
		local theme = p11.Theme
		local font = p11.Font
		local var24 = not p9.state.shouldDisplayFeedbackImage and (not p9.state.isGenericSelection and (p9.state.feedbackOriginalText ~= nil and p9.state.feedbackOriginalText ~= ""))
		local list = {
			p10.untranslated,
			p10.accuracyIssue,
			p10.spellingOrGrammarIssue,
			p10.inappropriateOrDerogatory
		}
		local _ = nil
		
		if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then
			local var27 = reactUtilsModule.createNextOrder()
			t = {
				SelectedTextHeader = var27(),
				SelectedTextLabel = var27(),
				OriginalTextHeader = var27(),
				OriginalTextLabel = var27(),
				CorrectTranslationHeader = var27(),
				CorrectTranslationTextEntryField = var27(),
				TranslationProblemsHeader = var27(),
				TranslationProblemsListFrame = var27(),
				AdditionalCommentsHeader = var27(),
				AdditionalCommentsTextEntryField = var27()
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
				text = if p9.state.shouldDisplayFeedbackImage then p10.imageSelectionHeader else p10.textSelectionHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = font.Header2,
				colorStyle = theme.TextEmphasis,
				layoutOrder = t.SelectedTextHeader,
				automaticSize = Enum.AutomaticSize.X
			}),
			SelectedTextLabel = if p9.state.shouldDisplayFeedbackImage then roactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = t.SelectedTextLabel,
				Size = UDim2.new(1, 0, 0, 72),
				Image = p9.state.feedbackImageUri,
				ScaleType = Enum.ScaleType.Fit
			}) else roactModule.createElement(themedTextLabelModule, {
				fontKey = "Body",
				themeKey = "TextDefault",
				TextWrapped = true,
				LayoutOrder = t.SelectedTextLabel,
				Size = UDim2.new(1, 0, 0, p9.calculateFieldHeight(string.len(p9.state.feedbackText), 14, false)),
				Text = if enableFeedbackSelectionUpdate then (if p9.state.isGenericSelection then p10.genericSelectionWrapper else p9.state.feedbackText) or "" else p9.state.feedbackText or "",
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			OriginalTextHeader = if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() and var24 then roactModule.createElement(styledTextLabel, {
				richText = true,
				fluidSizing = true,
				text = p10.originalTextHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = font.Header2,
				colorStyle = theme.TextEmphasis,
				layoutOrder = t.OriginalTextHeader,
				automaticSize = Enum.AutomaticSize.X
			}) else nil,
			OriginalTextLabel = if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() and var24 then roactModule.createElement(themedTextLabelModule, {
				fontKey = "Body",
				themeKey = "TextDefault",
				TextWrapped = true,
				LayoutOrder = t.OriginalTextLabel,
				Size = UDim2.new(1, 0, 0, p9.calculateFieldHeight(string.len(p9.state.feedbackOriginalText), 14, false)),
				Text = p9.state.feedbackOriginalText or "",
				TextXAlignment = Enum.TextXAlignment.Left
			}) else nil,
			CorrectTranslationHeader = roactModule.createElement(styledTextLabel, {
				richText = true,
				fluidSizing = true,
				text = p10.correctTranslationHeader,
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
				text = p9.state.correctTranslationText,
				textChanged = p9.onCorrectTranslationTextChanged,
				maxTextLength = math.max(string.len(p9.state.correctTranslationText), 180),
				PlaceholderText = p10.correctTranslationPlaceholder,
				Size = UDim2.new(1, 0, 0, p9.calculateFieldHeight(string.len(p9.state.correctTranslationText), 14, true))
			}),
			TranslationProblemsHeader = roactModule.createElement(styledTextLabel, {
				richText = true,
				fluidSizing = true,
				text = p10.problemDropdownSelectionHeader,
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
					onActivated = function(p12)
						-- upvalues: p9 (copy)
						p9.props.setFeedbackReason(p12)
					end,
					currentValue = p9.props.feedbackReason,
					elementSize = UDim2.new(1, 0, 0, 40)
				})
			}),
			AdditionalCommentsHeader = roactModule.createElement(styledTextLabel, {
				richText = true,
				fluidSizing = true,
				text = p10.additionalCommentsHeader,
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
				text = p9.state.additionalCommentsText,
				textChanged = p9.onAdditionalCommentsTextChanged,
				PlaceholderText = p10.additionalCommentsPlaceholder,
				Size = UDim2.new(1, 0, 0, 90)
			})
		})
	end)
end

function feedbackReportDialog.render(p13)
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
			ObjectType = p13.state.feedbackText
		}
	}
	
	if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then
		t.originalTextHeader = {
			"CoreScripts.Feedback.FeedbackReportDialog.OriginalTextHeader",
			SourceLanguage = p13.props.sourceLanguageName
		}
	end
	return withLocalization(t)(function(p14)
		-- upvalues: roactModule (copy), modalDialogModule (copy), p13 (ref), constantsModule (copy), fFlagTopBarSignalizeScreenSize (copy), verticalScrollView (copy), getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (copy), buttonStack (copy), buttonType (copy)
		local var35
		local createElement = roactModule.createElement
		local t = {
			showCloseButton = true,
			visible = p13.props.feedbackFlowState == constantsModule.State.CurrentlyLeavingFeedback,
			screenSize = if fFlagTopBarSignalizeScreenSize then p13.state.screenSize else p13.props.screenSize,
			titleText = p14.mainHeader,
			contents = roactModule.createElement(verticalScrollView, {
				useAutomaticCanvasSize = false,
				canvasSizeY = if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then UDim.new(0, 600 + p13.calculateFieldHeight(string.len(p13.state.feedbackText), 14, false) * 2 + 72 + p13.calculateFieldHeight(string.len(p13.state.feedbackOriginalText), 14, false)) else UDim.new(0, 600 + p13.calculateFieldHeight(string.len(p13.state.feedbackText), 14, false) * 2)
			}, roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				Contents = p13:renderContents(p14)
			}))
		}
		local createElement_1 = roactModule.createElement
		local t_1 = { buttonHeight = 36 }
		local t_2 = {}
		local t_3 = {
			buttonType = buttonType.Secondary,
			props = { onActivated = p13.onCancel, text = p14.cancel }
		}
		local t_4 = { buttonType = buttonType.PrimarySystem }
		local t_5 = {}
		
		if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then
			var35 = p13.state.correctTranslationText:match("%S") == nil
			var35 = nil
		else
			var35 = false
		end
		t_5.isDisabled = var35
		t_5.onActivated = p13.onSubmitFeedback
		t_5.text = p14.submitFeedback
		t_4.props = t_5
		-- Unknown statement at pc 4: <SetList>
		t_1.buttons = t_2
		t.actionButtons = createElement_1(buttonStack, t_1)
		t.onDismiss = p13.onCancel
		t.onBackButtonActivated = if p13.props.canNavigateBack then p13.navigateBack else nil
		
		return createElement(modalDialogModule, t)
	end)
end

function feedbackReportDialog.didMount(p15)
	-- upvalues: getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (ref)
	if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() and p15.props.sourceLanguageName == "" then
		p15.props.getSourceLanguageName()
	end
end

function feedbackReportDialog.willUnmount(p16)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	if fFlagTopBarSignalizeScreenSize then
		p16.disposeScreenSize()
	end
end

return roactRoduxModule.connect(function(p17)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref), getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (ref)
	return {
		screenSize = if fFlagTopBarSignalizeScreenSize then nil else p17.displayOptions.screenSize,
		feedbackFlowState = p17.feedbackFlowState.feedbackFlowState,
		feedbackReason = p17.feedbackFlowState.feedbackReason,
		sourceLanguageName = if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then p17.common.sourceLanguageName else nil
	}
end, function(p18)
	-- upvalues: sendFeedbackThunkModule (ref), setFeedbackFlowStateModule (ref), setFeedbackReasonModule (ref), getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (ref), getSourceLanguageThunkModule (ref)
	return {
		sendFeedback = function(p19, p20, p21, p22, p23, p24, p25, p26)
			-- upvalues: p18 (ref), sendFeedbackThunkModule (copy)
			p18(sendFeedbackThunkModule(p19, p20, p21, p22, p23, p24, p25, p26))
		end,
		setFeedbackFlowState = function(value)
			-- upvalues: p18 (ref), setFeedbackFlowStateModule (copy)
			p18(function(p27)
				-- upvalues: setFeedbackFlowStateModule (copy), value (ref)
				p27:dispatch(setFeedbackFlowStateModule(value))
			end)
		end,
		setFeedbackReason = function(value)
			-- upvalues: p18 (ref), setFeedbackReasonModule (copy)
			p18(function(p28)
				-- upvalues: setFeedbackReasonModule (copy), value (ref)
				p28:dispatch(setFeedbackReasonModule(value))
			end)
		end,
		getSourceLanguageName = function()
			-- upvalues: getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (copy), p18 (ref), getSourceLanguageThunkModule (copy)
			if getFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then
				p18(getSourceLanguageThunkModule())
			end
		end
	}
end)(feedbackReportDialog)