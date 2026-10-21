local CorePackages = game:GetService("CorePackages")
local ExperienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local VerticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local SignalsModule = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local ReactUtilsModule = require(CorePackages.Packages.ReactUtils)
local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Resources.Constants)
local SendFeedbackThunkModule = require(Parent.Thunks.SendFeedbackThunk)
local GetSourceLanguageThunkModule = require(Parent.Thunks.GetSourceLanguageThunk)
local SetFeedbackFlowStateModule = require(Parent.Actions.SetFeedbackFlowState)
local SetFeedbackReasonModule = require(Parent.Actions.SetFeedbackReason)
local TextEntryFieldModule = require(Parent.Components.TextEntryField)
local ModalDialogModule = require(Parent.Components.ModalDialog)
local ThemedTextLabelModule = require(Parent.Components.PortedComponents.ThemedTextLabel)
local BuildImageFeedbackFieldsModule = require(Parent.Components.buildImageFeedbackFields)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local RadioButtonList = UIBloxModule.App.InputButton.RadioButtonList
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local GetFFlagEnableSendImageFeedbackToBackendModule = require(RobloxGui.Modules.Flags.GetFFlagEnableSendImageFeedbackToBackend)
local GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule = require(RobloxGui.Modules.Flags.GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovements)
local EnableFeedbackSelectionUpdate = game:DefineFastFlag("EnableFeedbackSelectionUpdate", false)
local FFlagTopBarSignalizeScreenSize = require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize

local function _(p1)
	return if p1 == nil or p1.SourceType ~= Enum.ContentSourceType.Uri then "" else p1.Uri
end

local FeedbackReportDialog = RoactModule.PureComponent:extend("FeedbackReportDialog")
FeedbackReportDialog.validateProps = TModule.strictInterface({
	isReportDialogOpen = TModule.boolean,
	screenSize = if FFlagTopBarSignalizeScreenSize then nil else TModule.Vector2,
	closeDialog = TModule.optional(TModule.callback),
	reportCategory = TModule.optional(TModule.string)
})

function FeedbackReportDialog.init(p1)
	-- upvalues: EnableFeedbackSelectionUpdate (copy), ExperienceStateCaptureService (copy), GetFFlagEnableSendImageFeedbackToBackendModule (copy), ConstantsModule (copy), BuildImageFeedbackFieldsModule (copy), FFlagTopBarSignalizeScreenSize (copy), DisplayModule (copy), SignalsModule (copy)
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
			feedbackImageUri = "",
			feedbackTranslatedImageUri = ""
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
			feedbackImageUri = "",
			feedbackTranslatedImageUri = ""
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
			feedbackTranslatedImageUri = "",
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
		-- upvalues: p1 (copy), EnableFeedbackSelectionUpdate (upval), GetFFlagEnableSendImageFeedbackToBackendModule (upval)
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
			local config = {
				shouldDisplayFeedbackImage = true,
				feedbackImageUri = Object.Image
			}
			local Uri = nil
			
			if GetFFlagEnableSendImageFeedbackToBackendModule() then
				local LocalizedImageContent = Object.LocalizedImageContent
				Uri = if LocalizedImageContent == nil or LocalizedImageContent.SourceType ~= Enum.ContentSourceType.Uri then "" else LocalizedImageContent.Uri
			else
				Uri = ""
			end
			config.feedbackTranslatedImageUri = Uri
			p1:setState(config)
			
			return
		else
			if Object:IsA("Decal") then
				local config = {
					shouldDisplayFeedbackImage = true,
					feedbackImageUri = Object.Texture
				}
				local Uri = nil
				
				if GetFFlagEnableSendImageFeedbackToBackendModule() then
					local LocalizedTextureContent = Object.LocalizedTextureContent
					Uri = if LocalizedTextureContent == nil or LocalizedTextureContent.SourceType ~= Enum.ContentSourceType.Uri then "" else LocalizedTextureContent.Uri
				else
					Uri = ""
				end
				config.feedbackTranslatedImageUri = Uri
				p1:setState(config)
				
				return
			elseif Object:IsA("MeshPart") then
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
		-- upvalues: p1 (copy), ConstantsModule (upval), GetFFlagEnableSendImageFeedbackToBackendModule (upval), BuildImageFeedbackFieldsModule (upval)
		p1:setState({
			numFeedbackSubmissionAttempts = p1.state.numFeedbackSubmissionAttempts + 1
		})
		local Text = ConstantsModule.ContentType.Text
		local FeedbackOriginalText = p1.state.feedbackOriginalText
		local FeedbackText = p1.state.feedbackText
		local FeedbackIdentifier = p1.state.feedbackIdentifier
		
		if GetFFlagEnableSendImageFeedbackToBackendModule() and p1.state.shouldDisplayFeedbackImage then
			local ImageFeedbackFieldsModule = BuildImageFeedbackFieldsModule(game.GameId, p1.state.feedbackImageUri, p1.state.feedbackTranslatedImageUri)
			
			if not ImageFeedbackFieldsModule then
				p1.props.setFeedbackFlowState(ConstantsModule.State.Default)
				p1.resetLocalState()
				
				return
			end
			FeedbackOriginalText = ImageFeedbackFieldsModule.source
			Text = ConstantsModule.ContentType.Image
			FeedbackIdentifier = ImageFeedbackFieldsModule.identifier
			FeedbackText = ImageFeedbackFieldsModule.translation
		end
		p1.props.sendFeedback(Text, FeedbackOriginalText, FeedbackText, FeedbackIdentifier, p1.state.correctTranslationText, p1.state.additionalCommentsText, p1.props.feedbackReason, p1.state.numFeedbackSubmissionAttempts)
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
	-- upvalues: WithStyleFunction (copy), GetFFlagEnableSendImageFeedbackToBackendModule (copy), GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (copy), ReactUtilsModule (copy), RoactModule (copy), StyledTextLabel (copy), ThemedTextLabelModule (copy), EnableFeedbackSelectionUpdate (copy), TextEntryFieldModule (copy), RadioButtonList (copy)
	return WithStyleFunction(function(p3)
		-- upvalues: p1 (copy), p2 (copy), GetFFlagEnableSendImageFeedbackToBackendModule (upval), GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (upval), ReactUtilsModule (upval), RoactModule (upval), StyledTextLabel (upval), ThemedTextLabelModule (upval), EnableFeedbackSelectionUpdate (upval), TextEntryFieldModule (upval), RadioButtonList (upval)
		local Theme = p3.Theme
		local _Font = p3.Font
		local IsNotFeedbackOriginalTextMatch: boolean = not p1.state.shouldDisplayFeedbackImage and (not p1.state.isGenericSelection and (p1.state.feedbackOriginalText ~= nil and p1.state.feedbackOriginalText ~= ""))
		local RadioButtons = {
			p2.untranslated,
			p2.accuracyIssue,
			p2.spellingOrGrammarIssue,
			p2.inappropriateOrDerogatory
		}
		
		if GetFFlagEnableSendImageFeedbackToBackendModule() and p1.state.shouldDisplayFeedbackImage then
			table.insert(RadioButtons, p2.imageQuality)
		end
		local config = nil
		if GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then
			local NextOrder = ReactUtilsModule.createNextOrder()
			config = {
				SelectedTextHeader = NextOrder(),
				SelectedTextLabel = NextOrder(),
				OriginalTextHeader = NextOrder(),
				OriginalTextLabel = NextOrder(),
				CorrectTranslationHeader = NextOrder(),
				CorrectTranslationTextEntryField = NextOrder(),
				TranslationProblemsHeader = NextOrder(),
				TranslationProblemsListFrame = NextOrder(),
				AdditionalCommentsHeader = NextOrder(),
				AdditionalCommentsTextEntryField = NextOrder()
			}
		else
			config = {
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
		return RoactModule.createFragment({
			Layout = RoactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			SelectedTextHeader = RoactModule.createElement(StyledTextLabel, {
				richText = true,
				fluidSizing = true,
				text = if p1.state.shouldDisplayFeedbackImage then p2.imageSelectionHeader else p2.textSelectionHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = _Font.Header2,
				colorStyle = Theme.TextEmphasis,
				layoutOrder = config.SelectedTextHeader,
				automaticSize = Enum.AutomaticSize.X
			}),
			SelectedTextLabel = if p1.state.shouldDisplayFeedbackImage then RoactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = config.SelectedTextLabel,
				Size = UDim2.new(1, 0, 0, 72),
				Image = if p1.state.feedbackTranslatedImageUri == nil or p1.state.feedbackTranslatedImageUri == "" then p1.state.feedbackImageUri else p1.state.feedbackTranslatedImageUri,
				ScaleType = Enum.ScaleType.Fit
			}) else RoactModule.createElement(ThemedTextLabelModule, {
				fontKey = "Body",
				themeKey = "TextDefault",
				TextWrapped = true,
				LayoutOrder = config.SelectedTextLabel,
				Size = UDim2.new(1, 0, 0, p1.calculateFieldHeight(string.len(p1.state.feedbackText), 14, false)),
				Text = (if EnableFeedbackSelectionUpdate then if p1.state.isGenericSelection then p2.genericSelectionWrapper else p1.state.feedbackText else p1.state.feedbackText) or "",
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			OriginalTextHeader = if GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() and IsNotFeedbackOriginalTextMatch then RoactModule.createElement(StyledTextLabel, {
				richText = true,
				fluidSizing = true,
				text = p2.originalTextHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = _Font.Header2,
				colorStyle = Theme.TextEmphasis,
				layoutOrder = config.OriginalTextHeader,
				automaticSize = Enum.AutomaticSize.X
			}) else nil,
			OriginalTextLabel = if GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() and IsNotFeedbackOriginalTextMatch then RoactModule.createElement(ThemedTextLabelModule, {
				fontKey = "Body",
				themeKey = "TextDefault",
				TextWrapped = true,
				LayoutOrder = config.OriginalTextLabel,
				Size = UDim2.new(1, 0, 0, p1.calculateFieldHeight(string.len(p1.state.feedbackOriginalText), 14, false)),
				Text = p1.state.feedbackOriginalText or "",
				TextXAlignment = Enum.TextXAlignment.Left
			}) else nil,
			CorrectTranslationHeader = RoactModule.createElement(StyledTextLabel, {
				richText = true,
				fluidSizing = true,
				text = p2.correctTranslationHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = _Font.Header2,
				colorStyle = Theme.TextEmphasis,
				layoutOrder = config.CorrectTranslationHeader,
				automaticSize = Enum.AutomaticSize.X
			}),
			CorrectTranslationTextEntryField = RoactModule.createElement(TextEntryFieldModule, {
				enabled = true,
				autoFocusOnEnabled = false,
				LayoutOrder = config.CorrectTranslationTextEntryField,
				text = p1.state.correctTranslationText,
				textChanged = p1.onCorrectTranslationTextChanged,
				maxTextLength = math.max(string.len(p1.state.correctTranslationText), 180),
				PlaceholderText = p2.correctTranslationPlaceholder,
				Size = UDim2.new(1, 0, 0, p1.calculateFieldHeight(string.len(p1.state.correctTranslationText), 14, true))
			}),
			TranslationProblemsHeader = RoactModule.createElement(StyledTextLabel, {
				richText = true,
				fluidSizing = true,
				text = p2.problemDropdownSelectionHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = _Font.Header2,
				colorStyle = Theme.TextEmphasis,
				layoutOrder = config.TranslationProblemsHeader,
				automaticSize = Enum.AutomaticSize.X
			}),
			TranslationProblemsListFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, #RadioButtons * 40),
				LayoutOrder = config.TranslationProblemsListFrame
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
			AdditionalCommentsHeader = RoactModule.createElement(StyledTextLabel, {
				richText = true,
				fluidSizing = true,
				text = p2.additionalCommentsHeader,
				size = UDim2.new(1, 0, 0, 72),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = Enum.TextXAlignment.Left,
				textYAlignment = Enum.TextYAlignment.Center,
				fontStyle = _Font.Header2,
				colorStyle = Theme.TextEmphasis,
				layoutOrder = config.AdditionalCommentsHeader,
				automaticSize = Enum.AutomaticSize.X
			}),
			AdditionalCommentsTextEntryField = RoactModule.createElement(TextEntryFieldModule, {
				enabled = true,
				maxTextLength = 180,
				autoFocusOnEnabled = false,
				LayoutOrder = config.AdditionalCommentsTextEntryField,
				text = p1.state.additionalCommentsText,
				textChanged = p1.onAdditionalCommentsTextChanged,
				PlaceholderText = p2.additionalCommentsPlaceholder,
				Size = UDim2.new(1, 0, 0, 90)
			})
		})
	end)
end

function FeedbackReportDialog.render(p1)
	-- upvalues: GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (copy), WithLocalizationFunction (copy), RoactModule (copy), ModalDialogModule (copy), ConstantsModule (copy), FFlagTopBarSignalizeScreenSize (copy), VerticalScrollView (copy), GetFFlagEnableSendImageFeedbackToBackendModule (copy), ButtonStack (copy), ButtonType (copy)
	local config = {
		mainHeader = "CoreScripts.Feedback.FeedbackReportDialog.MainHeader",
		cancel = "CoreScripts.Feedback.FeedbackReportDialog.Cancel",
		submitFeedback = "CoreScripts.Feedback.FeedbackReportDialog.SubmitFeedback",
		untranslated = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.Untranslated",
		accuracyIssue = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.AccuracyIssue",
		spellingOrGrammarIssue = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.SpellingOrGrammarIssue",
		inappropriateOrDerogatory = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.InappropriateOrDerogatory",
		imageQuality = "CoreScripts.Feedback.FeedbackReportDialog.ProblemOption.ImageQuality",
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
	
	if GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then
		config.originalTextHeader = {
			"CoreScripts.Feedback.FeedbackReportDialog.OriginalTextHeader",
			SourceLanguage = p1.props.sourceLanguageName
		}
	end
	return WithLocalizationFunction(config)(function(p2)
		-- upvalues: RoactModule (upval), ModalDialogModule (upval), p1 (copy), ConstantsModule (upval), FFlagTopBarSignalizeScreenSize (upval), VerticalScrollView (upval), GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (upval), GetFFlagEnableSendImageFeedbackToBackendModule (upval), ButtonStack (upval), ButtonType (upval)
		return RoactModule.createElement(ModalDialogModule, {
			showCloseButton = true,
			visible = p1.props.feedbackFlowState == ConstantsModule.State.CurrentlyLeavingFeedback,
			screenSize = if FFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize,
			titleText = p2.mainHeader,
			contents = RoactModule.createElement(VerticalScrollView, {
				useAutomaticCanvasSize = false,
				canvasSizeY = if GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then UDim.new(0, 600 + p1.calculateFieldHeight(string.len(p1.state.feedbackText), 14, false) * 2 + 72 + p1.calculateFieldHeight(string.len(p1.state.feedbackOriginalText), 14, false) + (if GetFFlagEnableSendImageFeedbackToBackendModule() and p1.state.shouldDisplayFeedbackImage then 40 else 0)) else UDim.new(0, 600 + p1.calculateFieldHeight(string.len(p1.state.feedbackText), 14, false) * 2 + (if GetFFlagEnableSendImageFeedbackToBackendModule() and p1.state.shouldDisplayFeedbackImage then 40 else 0))
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
							isDisabled = if GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then p1.state.correctTranslationText:match("%S") == nil else false,
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

function FeedbackReportDialog.didMount(p1)
	-- upvalues: GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (copy)
	if GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() and p1.props.sourceLanguageName == "" then
		p1.props.getSourceLanguageName()
	end
end

function FeedbackReportDialog.willUnmount(p1)
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy)
	if FFlagTopBarSignalizeScreenSize then
		p1.disposeScreenSize()
	end
end

return RoactRoduxModule.connect(function(p1)
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy), GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (copy)
	return {
		screenSize = if FFlagTopBarSignalizeScreenSize then nil else p1.displayOptions.screenSize,
		feedbackFlowState = p1.feedbackFlowState.feedbackFlowState,
		feedbackReason = p1.feedbackFlowState.feedbackReason,
		sourceLanguageName = if GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then p1.common.sourceLanguageName else nil
	}
end, function(Callback)
	-- upvalues: SendFeedbackThunkModule (copy), SetFeedbackFlowStateModule (copy), SetFeedbackReasonModule (copy), GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (copy), GetSourceLanguageThunkModule (copy)
	return {
		sendFeedback = function(p1, p2, p3, p4, p5, p6, p7, p8)
			-- upvalues: Callback (copy), SendFeedbackThunkModule (upval)
			Callback(SendFeedbackThunkModule(p1, p2, p3, p4, p5, p6, p7, p8))
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
		end,
		getSourceLanguageName = function()
			-- upvalues: GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule (upval), Callback (copy), GetSourceLanguageThunkModule (upval)
			if GetFFlagEnableFeedbackShowSourceTextAndOtherUXImprovementsModule() then
				Callback(GetSourceLanguageThunkModule())
			end
		end
	}
end)(FeedbackReportDialog)