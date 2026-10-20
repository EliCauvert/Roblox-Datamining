local PlayerFeedback = script:FindFirstAncestor("PlayerFeedback")
local Parent = PlayerFeedback.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Checkbox = FoundationModule.Checkbox
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local VerticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local SetNetworkingErrorToastFunction = require(Parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local GetFFlagEdpPlayerFeedbackCommentsOnlyFunction = require(Parent.SharedFlags).GetFFlagEdpPlayerFeedbackCommentsOnly
local UserInputService = game:GetService("UserInputService")
local SubmitGamePlayerFeedbackModule = require(PlayerFeedback.Thunks.SubmitGamePlayerFeedback)
local _ = require(PlayerFeedback.Types)
local PlayerFeedbackEventsModule = require(PlayerFeedback.Analytics.Events.PlayerFeedbackEvents)
local AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
local OpenDynamicAbuseReportModule = require(Parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local FFlagEnableAbuseReportRevampFlow = require(Parent.SharedFlags).FFlagEnableAbuseReportRevampFlow
local EnableAbuseReportRevampFeedback = game:DefineFastFlag("EnableAbuseReportRevampFeedback", false)
local FFlagAddThumbnailSelectorReport = require(Parent.SharedFlags).FFlagAddThumbnailSelectorReport
local AddThumbnailReportToPlayerFeedback = game:DefineFastFlag("AddThumbnailReportToPlayerFeedback", false)
local UseStateFunction = ReactModule.useState
local UseEffectFunction = ReactModule.useEffect

local function CategoryCheckboxes(p1)
	-- upvalues: ReactModule (copy), CryoModule (copy), Checkbox (copy)
	local SelectedCategoryIds = p1.selectedCategoryIds
	local OnOptionSelectedFunction = p1.onOptionSelected
	local config = {
		layout = ReactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		padding = ReactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, -8) })
	}
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: CryoModule (upval), SelectedCategoryIds (copy), OnOptionSelectedFunction (copy)
		return function(p3)
			-- upvalues: CryoModule (upval), SelectedCategoryIds (upval), p2 (copy), OnOptionSelectedFunction (upval)
			OnOptionSelectedFunction(if p3 then CryoModule.List.join(SelectedCategoryIds, { p2 }) else CryoModule.List.filter(SelectedCategoryIds, function(p4): boolean
				-- upvalues: p2 (upval)
				return p4 ~= p2
			end))
		end
	end, { SelectedCategoryIds })
	
	for LayoutOrder, option in ipairs(p1.category.options) do
		config["Checkbox" .. LayoutOrder] = ReactModule.createElement(Checkbox, {
			label = option.label,
			isChecked = CryoModule.List.find(SelectedCategoryIds, option.id) ~= nil,
			onActivated = UseResult(option.id),
			LayoutOrder = LayoutOrder
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0)
	}, config)
end

local function _(Text: string): number
	return if utf8.len(Text) then utf8.len(utf8.nfcnormalize(Text)) else string.len(Text)
end

local WrapResult = require(Parent.ArgCheck).wrap(TModule.interface({
	closeCentralOverlayThunk = TModule.callback,
	universeId = TModule.string,
	playerFeedbackMetadata = TModule.strictInterface({
		rootPlaceId = TModule.string,
		canSubmitReview = TModule.boolean,
		canSubmitComment = TModule.boolean,
		categoryType = TModule.string,
		category = TModule.interface({
			type = TModule.string,
			label = TModule.string,
			allows_multiple_selections = TModule.boolean,
			options = TModule.array(TModule.interface({ id = TModule.string, label = TModule.string }))
		}),
		comment = TModule.interface({
			label = TModule.string,
			placeholder_text = TModule.string,
			minimum_length = TModule.number,
			maximum_length = TModule.number
		}),
		metadata = TModule.interface({
			disclaimer_label = TModule.string,
			submit_button_label = TModule.string,
			form_title_label = TModule.string
		})
	}),
	onSubmitted = TModule.optional(TModule.callback)
}))

return function(p2)
	-- upvalues: WrapResult (copy), UseStyleFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AppEventIngestService (copy), UseSelectorFunction (copy), UseStateFunction (copy), ReactModule (copy), GetFFlagEdpPlayerFeedbackCommentsOnlyFunction (copy), UseLocalizationFunction (copy), UseEffectFunction (copy), PlayerFeedbackEventsModule (copy), SubmitGamePlayerFeedbackModule (copy), SetCurrentToastMessageFunction (copy), SetNetworkingErrorToastFunction (copy), OpenDynamicAbuseReportModule (copy), AbuseVectorModule (copy), FFlagAddThumbnailSelectorReport (copy), AddThumbnailReportToPlayerFeedback (copy), CloseCentralOverlayFunction (copy), AppPage (copy), UrlBuilder (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), UserInputService (copy), PartialPageModal (copy), VerticalScrollView (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), CategoryCheckboxes (copy), ButtonStack (copy), ButtonType (copy), FFlagEnableAbuseReportRevampFlow (copy), EnableAbuseReportRevampFeedback (copy)
	assert(WrapResult(p2))
	local UseStyleResult = UseStyleFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppEventIngestService)
	local Tokens = UseStyleResult.Tokens
	local UseSelectorResult = UseSelectorFunction(function(p3)
		return p3.ScreenSize
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p3)
		local GlobalGuiInset = p3.GlobalGuiInset
		
		return GlobalGuiInset and GlobalGuiInset.bottom or 0
	end)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(0)
	local YOffset = UseStateResult and -UseStateResult1 + UseSelectorResult1 or 0
	local v1: number = if UseStateResult then 0 else 48
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(0)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local YDelta = UseSelectorResult.Y - UseStateResult1 - 48 - 48 - 48 - v1
	local PlayerFeedbackMetadata = p2.playerFeedbackMetadata
	local CategoryType = PlayerFeedbackMetadata.categoryType
	local Category = PlayerFeedbackMetadata.category
	local Metadata = PlayerFeedbackMetadata.metadata
	local Comment = PlayerFeedbackMetadata.comment
	local RootPlaceId = PlayerFeedbackMetadata.rootPlaceId
	local UseStateResult4, UseStateResult2_3 = UseStateFunction("")
	local UseStateResult5, UseStateResult2_4 = UseStateFunction(if GetFFlagEdpPlayerFeedbackCommentsOnlyFunction() then { "Other" } else {})
	local v2: boolean = PlayerFeedbackMetadata.canSubmitComment and #UseStateResult5 > 0
	local UseStateResult6, UseStateResult2_5 = UseStateFunction(nil)
	local UseLocalizationResult = UseLocalizationFunction({
		abuseReportPromptText = "PlayerFeedbacks.VoteForm.Message.ReportAbuseInsteadLong",
		reportFlowPageTitle = "PlayerFeedbacks.VoteForm.Message.Action.Report",
		commentTooLongMessage = {
			"PlayerFeedbacks.VoteForm.Message.MaxLengthCharacters",
			count = Comment.maximum_length
		},
		commentTooShortMessage = {
			"PlayerFeedbacks.VoteForm.Message.MinLengthCharacters",
			count = Comment.minimum_length
		}
	})
	local NoUseStateResult: boolean = #UseStateResult5 > 0 and UseStateResult6 == nil
	
	if GetFFlagEdpPlayerFeedbackCommentsOnlyFunction() then
		NoUseStateResult = #UseStateResult5 > 0 and (if utf8.len(UseStateResult4) then utf8.len(utf8.nfcnormalize(UseStateResult4)) else string.len(UseStateResult4)) > 0 and UseStateResult6 == nil
		local UseStateResult7, UseStateResult2_6 = UseStateFunction(false)
		UseEffectFunction(function()
			-- upvalues: UseStateResult7 (copy), UseRefResult1 (copy), UseStateResult2_6 (copy)
			task.defer(function()
				-- upvalues: UseStateResult7 (upval), UseRefResult1 (upval), UseStateResult2_6 (upval)
				if not UseStateResult7 and UseRefResult1.current then
					UseStateResult2_6(true)
					UseRefResult1.current:CaptureFocus()
				end
			end)
		end, { UseRefResult1, UseStateResult7 })
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), p2 (copy)
		UseDispatchResult(p2.closeCentralOverlayThunk())
	end, { p2.closeCentralOverlayThunk })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: PlayerFeedbackEventsModule (upval), UseRoactServiceResult1 (copy), RootPlaceId (copy), CategoryType (copy), UseResult (copy)
		PlayerFeedbackEventsModule.DismissPlayerFeedbackFormModal(UseRoactServiceResult1, RootPlaceId, { categoryType = CategoryType })
		UseResult()
	end, {
		UseResult,
		CategoryType,
		RootPlaceId,
		UseRoactServiceResult1
	})
	local UseResult2 = ReactModule.useCallback(function(p3)
		-- upvalues: PlayerFeedbackEventsModule (upval), UseRoactServiceResult1 (copy), RootPlaceId (copy), CategoryType (copy), UseStateResult2_4 (copy)
		PlayerFeedbackEventsModule.TogglePlayerFeedbackFormModalReason(UseRoactServiceResult1, RootPlaceId, { categoryType = CategoryType })
		UseStateResult2_4(p3)
	end, {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: PlayerFeedbackEventsModule (upval), UseRoactServiceResult1 (copy), RootPlaceId (copy), CategoryType (copy), UseStateResult5 (copy), GetFFlagEdpPlayerFeedbackCommentsOnlyFunction (upval), UseStateResult4 (copy), UseStateResult2_5 (copy), UseLocalizationResult (copy), Comment (copy), UseDispatchResult (copy), SubmitGamePlayerFeedbackModule (upval), UseRoactServiceResult (copy), SetCurrentToastMessageFunction (upval), p2 (copy), UseResult (copy), SetNetworkingErrorToastFunction (upval)
		PlayerFeedbackEventsModule.ClickPlayerFeedbackFormModalSubmit(UseRoactServiceResult1, RootPlaceId, { categoryType = CategoryType })
		
		if #UseStateResult5 == 0 then return end
		if GetFFlagEdpPlayerFeedbackCommentsOnlyFunction() and (if utf8.len(UseStateResult4) then utf8.len(utf8.nfcnormalize(UseStateResult4)) else string.len(UseStateResult4)) == 0 then
			PlayerFeedbackEventsModule.SubmitPlayerFeedbackFailCommentValidation(UseRoactServiceResult1, RootPlaceId, { value = "CommentTooShort", categoryType = CategoryType })
			UseStateResult2_5(UseLocalizationResult.commentTooShortMessage)
			
			return
		end
		if (if utf8.len(UseStateResult4) then utf8.len(utf8.nfcnormalize(UseStateResult4)) else string.len(UseStateResult4)) > 0 and (if utf8.len(UseStateResult4) then utf8.len(utf8.nfcnormalize(UseStateResult4)) else string.len(UseStateResult4)) < Comment.minimum_length then
			PlayerFeedbackEventsModule.SubmitPlayerFeedbackFailCommentValidation(UseRoactServiceResult1, RootPlaceId, { value = "CommentTooShort", categoryType = CategoryType })
			UseStateResult2_5(UseLocalizationResult.commentTooShortMessage)
			
			return
		end
		if Comment.maximum_length < (if utf8.len(UseStateResult4) then utf8.len(utf8.nfcnormalize(UseStateResult4)) else string.len(UseStateResult4)) then
			PlayerFeedbackEventsModule.SubmitPlayerFeedbackFailCommentValidation(UseRoactServiceResult1, RootPlaceId, { value = "CommentTooLong", categoryType = CategoryType })
			UseStateResult2_5(UseLocalizationResult.commentTooLongMessage)
			
			return
		else
			UseDispatchResult(SubmitGamePlayerFeedbackModule.Post(UseRoactServiceResult, RootPlaceId, CategoryType, UseStateResult5, UseStateResult4)):andThen(function(_)
				-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), p2 (upval), UseResult (upval)
				UseDispatchResult(SetCurrentToastMessageFunction({
					toastMessage = "PlayerFeedbacks.VoteForm.Message.SubmitSuccess"
				}))
				
				if p2.onSubmitted then
					p2.onSubmitted()
				end
				UseResult()
			end, function(p3)
				-- upvalues: UseDispatchResult (upval), SetNetworkingErrorToastFunction (upval)
				UseDispatchResult(SetNetworkingErrorToastFunction(p3))
			end)
		end
	end, {
		UseRoactServiceResult, UseRoactServiceResult1, Comment.maximum_length,
		Comment.minimum_length, UseLocalizationResult.commentTooShortMessage,
		UseLocalizationResult.commentTooLongMessage, RootPlaceId, CategoryType,
		UseStateResult5, UseStateResult4, p2.onSubmitted, UseResult
	})
	UseEffectFunction(function()
		-- upvalues: PlayerFeedbackEventsModule (upval), UseRoactServiceResult1 (copy), RootPlaceId (copy), CategoryType (copy)
		PlayerFeedbackEventsModule.PlayerFeedbackFormModalMounted(UseRoactServiceResult1, RootPlaceId, { categoryType = CategoryType })
	end, { UseRoactServiceResult1, RootPlaceId, CategoryType })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: PlayerFeedbackEventsModule (upval), UseRoactServiceResult1 (copy), RootPlaceId (copy), CategoryType (copy)
		PlayerFeedbackEventsModule.FocusPlayerFeedbackFormModalComment(UseRoactServiceResult1, RootPlaceId, { categoryType = CategoryType })
	end, { UseRoactServiceResult1, RootPlaceId, CategoryType })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: PlayerFeedbackEventsModule (upval), UseRoactServiceResult1 (copy), RootPlaceId (copy), CategoryType (copy), UseDispatchResult (copy), OpenDynamicAbuseReportModule (upval), AbuseVectorModule (upval), FFlagAddThumbnailSelectorReport (upval), AddThumbnailReportToPlayerFeedback (upval), p2 (copy), CloseCentralOverlayFunction (upval)
		PlayerFeedbackEventsModule.ClickPlayerFeedbackFormAbuseReportPrompt(UseRoactServiceResult1, RootPlaceId, { categoryType = CategoryType })
		UseDispatchResult(OpenDynamicAbuseReportModule({
			abuseVector = AbuseVectorModule.Place,
			targetId = RootPlaceId,
			custom = if FFlagAddThumbnailSelectorReport and AddThumbnailReportToPlayerFeedback then { universeId = p2.universeId } else nil,
			onClose = function()
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
				UseDispatchResult(CloseCentralOverlayFunction())
			end
		}))
	end, {
		UseRoactServiceResult1,
		RootPlaceId,
		CategoryType,
		RootPlaceId
	})
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: PlayerFeedbackEventsModule (upval), UseRoactServiceResult1 (copy), RootPlaceId (copy), CategoryType (copy), AppPage (upval), UrlBuilder (upval), UseLocalizationResult (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval), UseResult (copy)
		PlayerFeedbackEventsModule.ClickPlayerFeedbackFormAbuseReportPrompt(UseRoactServiceResult1, RootPlaceId, { categoryType = CategoryType })
		local config = {
			name = AppPage.GenericWebPage,
			detail = UrlBuilder.game.report({ placeId = RootPlaceId }),
			extraProps = { title = UseLocalizationResult.reportFlowPageTitle }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
		UseResult()
	end, {
		UseRoactServiceResult1,
		RootPlaceId,
		CategoryType,
		UseResult
	})
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: PlayerFeedbackEventsModule (upval), UseRoactServiceResult1 (copy), RootPlaceId (copy), CategoryType (copy), AppPage (upval), UrlBuilder (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval), UseResult (copy)
		PlayerFeedbackEventsModule.ClickPlayerFeedbackFormModalDisclaimer(UseRoactServiceResult1, RootPlaceId, { categoryType = CategoryType })
		local config = {
			name = AppPage.GenericWebPage,
			detail = UrlBuilder.static.about.terms()
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
		UseResult()
	end, {
		UseRoactServiceResult1,
		RootPlaceId,
		CategoryType,
		UseResult
	})
	local UseResult8 = ReactModule.useCallback(function(p3)
		-- upvalues: UseStateResult2_3 (copy), Comment (copy), UseStateResult6 (copy), UseStateResult2_5 (copy)
		local Text: string = p3.Text
		UseStateResult2_3(Text)
		local Length: number = if utf8.len(Text) then utf8.len(utf8.nfcnormalize(Text)) else string.len(Text)
		local IsLengthMatch: boolean = Length == 0 or Comment.minimum_length <= Length and Length <= Comment.maximum_length
		
		if UseStateResult6 and IsLengthMatch then
			UseStateResult2_5(nil)
		end
	end, {
		UseStateResult6,
		Comment.minimum_length,
		Comment.maximum_length
	})
	UseEffectFunction(function()
		-- upvalues: UseRefResult (copy), UseStateResult1 (copy)
		if UseRefResult and UseRefResult.current and UseStateResult1 ~= 0 then
			UseRefResult.current.CanvasPosition = Vector2.new(0, UseRefResult.current.AbsoluteCanvasSize.Y)
			
			return
		end
	end, { UseRefResult, UseStateResult1 })
	UseEffectFunction(function()
		-- upvalues: UserInputService (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
		local Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
			-- upvalues: UseStateResult2 (upval), UserInputService (upval), UseStateResult2_1 (upval)
			UseStateResult2(UserInputService.OnScreenKeyboardVisible)
			UseStateResult2_1(UserInputService.OnScreenKeyboardVisible and UserInputService.OnScreenKeyboardSize.Y or 0)
		end)
		
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
			Connection = nil
		end
	end, {})
	
	return ReactModule.createElement(PartialPageModal, {
		marginSize = 0,
		title = Metadata.form_title_label,
		screenSize = UseSelectorResult,
		onCloseClicked = UseResult1,
		position = UseStateResult and UDim2.new(0.5, 0, 1, YOffset) or nil,
		anchorPoint = UseStateResult and Vector2.new(0.5, 1) or nil
	}, {
		Content = ReactModule.createElement(VerticalScrollView, {
			useAutomaticCanvasSize = true,
			size = UDim2.new(1, 0, 0, (math.min(UseStateResult3 + 25, YDelta))),
			canvasSizeY = UDim.new(),
			elasticBehavior = Enum.ElasticBehavior.Never,
			scrollingFrameRef = UseRefResult,
			ref = UseRefResult
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, 16),
				[ReactModule.Change.AbsoluteContentSize] = function(p3)
					-- upvalues: UseStateResult2_2 (copy)
					UseStateResult2_2(p3.AbsoluteContentSize.Y)
				end
			}),
			ContentPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 24),
				PaddingLeft = UDim.new(0, 24),
				PaddingRight = UDim.new(0, 24)
			}),
			CheckboxesLabel = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 0,
				Text = Category.label,
				TextSize = UseStyleResult.Font.BaseSize,
				TextColor3 = Tokens.Color.Content.Emphasis.Color3,
				TextTransparency = Tokens.Color.Content.Emphasis.Transparency,
				Font = if FoundationFontFaceMigration then nil else Tokens.Typography.TitleLarge.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.TitleLarge.Font) else nil,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}),
			CategoryCheckboxes = if GetFFlagEdpPlayerFeedbackCommentsOnlyFunction() then nil else ReactModule.createElement(CategoryCheckboxes, {
				layoutOrder = 1,
				category = Category,
				selectedCategoryIds = UseStateResult5,
				onOptionSelected = UseResult2
			}),
			CommmentLabel = if GetFFlagEdpPlayerFeedbackCommentsOnlyFunction() then nil else v2 and ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 2,
				Text = Comment.label,
				TextSize = UseStyleResult.Font.BaseSize,
				TextColor3 = Tokens.Color.Content.Emphasis.Color3,
				TextTransparency = Tokens.Color.Content.Emphasis.Transparency,
				Font = if FoundationFontFaceMigration then nil else Tokens.Typography.TitleLarge.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.TitleLarge.Font) else nil,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}),
			Commment = v2 and ReactModule.createElement("Frame", {
				BorderSizePixel = 1,
				LayoutOrder = 3,
				BackgroundColor3 = Tokens.Color.Surface.Surface_200.Color3,
				BackgroundTransparency = Tokens.Color.Surface.Surface_200.Transparency,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Tokens.Radius.Small) }),
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 8),
					PaddingBottom = UDim.new(0, 8),
					PaddingLeft = UDim.new(0, 8),
					PaddingRight = UDim.new(0, 8)
				}),
				TextBox = ReactModule.createElement("TextBox", {
					Text = UseStateResult4,
					PlaceholderText = Comment.placeholder_text,
					PlaceholderColor3 = UseStyleResult.Theme.TextMuted.Color,
					Size = UDim2.new(1, 0, 0, 100),
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					ClearTextOnFocus = false,
					MultiLine = true,
					TextWrapped = true,
					ClipsDescendants = true,
					OverlayNativeInput = true,
					TextColor3 = Tokens.Color.Content.Emphasis.Color3,
					TextTransparency = Tokens.Color.Content.Emphasis.Transparency,
					BackgroundColor3 = Tokens.Color.Surface.Surface_200.Color3,
					BackgroundTransparency = Tokens.Color.Surface.Surface_200.Transparency,
					Font = if FoundationFontFaceMigration then nil else Tokens.Typography.BodyLarge.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.BodyLarge.Font) else nil,
					TextSize = Tokens.Typography.BodyLarge.FontSize,
					AutomaticSize = Enum.AutomaticSize.Y,
					BorderSizePixel = 0,
					ref = UseRefResult1,
					[ReactModule.Change.Text] = UseResult8,
					[ReactModule.Event.Focused] = UseResult4
				})
			}),
			HelperText = if v2 and UseStateResult6 ~= nil then ReactModule.createElement("TextLabel", {
				TextWrapped = true,
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Text = UseStateResult6,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextColor3 = UseStyleResult.Theme.Alert.Color,
				Font = if FoundationFontFaceMigration then nil else Tokens.Typography.CaptionSmall.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.CaptionSmall.Font) else nil,
				TextSize = Tokens.Typography.CaptionLarge.FontSize,
				LineHeight = Tokens.Typography.CaptionSmall.LineHeight,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}) else nil,
			Buttons = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 5,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0)
			}, {
				ButtonStack = ReactModule.createElement(ButtonStack, {
					buttons = {
						{
							buttonType = ButtonType.PrimaryContextual,
							props = {
								onActivated = UseResult3,
								isDisabled = NoUseStateResult == false,
								text = Metadata.submit_button_label
							}
						}
					}
				})
			}),
			DisclaimerText = ReactModule.createElement("TextButton", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, 0, 0, 0),
				Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.CaptionHeader.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.CaptionLarge.Font) else nil,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextWrapped = true,
				Text = Metadata.disclaimer_label,
				[ReactModule.Event.Activated] = UseResult7,
				RichText = true,
				TextSize = Tokens.Typography.CaptionLarge.FontSize,
				TextColor3 = UseStyleResult.Theme.TextMuted.Color,
				TextTransparency = UseStyleResult.Theme.TextMuted.Transparency,
				LineHeight = Tokens.LineHeight.LineHeight_140,
				LayoutOrder = 6
			}),
			AbuseReportPromptText = CategoryType == "Downvote" and ReactModule.createElement("TextButton", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextWrapped = true,
				Text = UseLocalizationResult.abuseReportPromptText,
				[ReactModule.Event.Activated] = if FFlagEnableAbuseReportRevampFlow and EnableAbuseReportRevampFeedback then UseResult5 else UseResult6,
				RichText = true,
				TextSize = Tokens.Typography.CaptionLarge.FontSize,
				TextColor3 = UseStyleResult.Theme.TextMuted.Color,
				TextTransparency = UseStyleResult.Theme.TextMuted.Transparency,
				Font = if FoundationFontFaceMigration then nil else Tokens.Typography.BodyLarge.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(Tokens.Typography.BodyLarge.Font) else nil,
				LineHeight = Tokens.LineHeight.LineHeight_140,
				LayoutOrder = 7
			})
		})
	})
end