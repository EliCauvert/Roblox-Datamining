local playerFeedback = script:FindFirstAncestor("PlayerFeedback")
local parent = playerFeedback.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local checkbox = require(parent.Foundation).Checkbox
local useStyle = UIBloxModule.Core.Style.useStyle
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local verticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local buttonStack = UIBloxModule.App.Button.ButtonStack
local cryoModule = require(parent.Cryo)
local argCheckModule = require(parent.ArgCheck)
local tModule = require(parent.t)
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactServiceTagsModule = require(parent.RoactServiceTags)
local appEventIngestService = roactServiceTagsModule.AppEventIngestService
local roactNetworking = roactServiceTagsModule.RoactNetworking
local setNetworkingErrorToast = require(parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var7 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appPage = require(parent.RobloxAppEnums).AppPage
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local getFFlagEdpPlayerFeedbackCommentsOnly = require(parent.SharedFlags).GetFFlagEdpPlayerFeedbackCommentsOnly
local userInputService = game:GetService("UserInputService")
local submitGamePlayerFeedbackModule = require(playerFeedback.Thunks.SubmitGamePlayerFeedback)
local _ = require(playerFeedback.Types)
local playerFeedbackEventsModule = require(playerFeedback.Analytics.Events.PlayerFeedbackEvents)
local abuseVectorModule = require(parent.GenericAbuseReporting.AbuseVector)
local openDynamicAbuseReportModule = require(parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local fFlagEnableAbuseReportRevampFlow = require(parent.SharedFlags).FFlagEnableAbuseReportRevampFlow
local enableAbuseReportRevampFeedback = game:DefineFastFlag("EnableAbuseReportRevampFeedback", false)
local fFlagAddThumbnailSelectorReport = require(parent.SharedFlags).FFlagAddThumbnailSelectorReport
local addThumbnailReportToPlayerFeedback = game:DefineFastFlag("AddThumbnailReportToPlayerFeedback", false)
local useState = reactModule.useState
local useEffect = reactModule.useEffect

local function CategoryCheckboxes(p0)
	-- upvalues: reactModule (ref), cryoModule (ref), checkbox (ref)
	local category = p0.category
	local selectedCategoryIds = p0.selectedCategoryIds
	local onOptionSelected = p0.onOptionSelected
	local t = {
		layout = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		padding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, -8) })
	}
	local var18 = reactModule.useCallback(function(p1)
		-- upvalues: cryoModule (copy), selectedCategoryIds (ref), onOptionSelected (ref)
		return function(p2)
			-- upvalues: cryoModule (copy), selectedCategoryIds (copy), p1 (ref), onOptionSelected (copy)
			onOptionSelected(if p2 then cryoModule.List.join(selectedCategoryIds, { p1 }) else cryoModule.List.filter(selectedCategoryIds, function(p3)
				-- upvalues: p1 (copy)
				return p3 ~= p1
			end))
		end
	end, { selectedCategoryIds })
	
	for i, v in ipairs(category.options) do
		t["Checkbox" .. i] = reactModule.createElement(checkbox, {
			label = v.label,
			isChecked = cryoModule.List.find(selectedCategoryIds, v.id) ~= nil,
			onActivated = var18(v.id),
			LayoutOrder = i
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0)
	}, t)
end

local function _(p4)
	return if utf8.len(p4) then utf8.len(utf8.nfcnormalize(p4)) else string.len(p4)
end

local var16 = argCheckModule.wrap(tModule.interface({
	closeCentralOverlayThunk = tModule.callback,
	universeId = tModule.string,
	playerFeedbackMetadata = tModule.strictInterface({
		rootPlaceId = tModule.string,
		canSubmitReview = tModule.boolean,
		canSubmitComment = tModule.boolean,
		categoryType = tModule.string,
		category = tModule.interface({
			type = tModule.string,
			label = tModule.string,
			allows_multiple_selections = tModule.boolean,
			options = tModule.array(tModule.interface({ id = tModule.string, label = tModule.string }))
		}),
		comment = tModule.interface({
			label = tModule.string,
			placeholder_text = tModule.string,
			minimum_length = tModule.number,
			maximum_length = tModule.number
		}),
		metadata = tModule.interface({
			disclaimer_label = tModule.string,
			submit_button_label = tModule.string,
			form_title_label = tModule.string
		})
	}),
	onSubmitted = tModule.optional(tModule.callback)
}))

return function(p5)
	-- upvalues: var16 (ref), useStyle (ref), useDispatch (ref), useRoactService (ref), roactNetworking (ref), appEventIngestService (ref), useSelector (ref), useState (ref), reactModule (ref), getFFlagEdpPlayerFeedbackCommentsOnly (ref), useLocalization (ref), useEffect (ref), playerFeedbackEventsModule (ref), submitGamePlayerFeedbackModule (ref), setCurrentToastMessage (ref), setNetworkingErrorToast (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), fFlagAddThumbnailSelectorReport (ref), addThumbnailReportToPlayerFeedback (ref), closeCentralOverlay (ref), appPage (ref), urlBuilder (ref), fFlagSignalsNavP3Dispatch (ref), var7 (ref), navigateDown (ref), userInputService (ref), partialPageModal (ref), verticalScrollView (ref), CategoryCheckboxes (ref), buttonStack (ref), buttonType (ref), fFlagEnableAbuseReportRevampFlow (ref), enableAbuseReportRevampFeedback (ref)
	assert(var16(p5))
	local var19 = useStyle()
	local var20 = useDispatch()
	local var21 = useRoactService(roactNetworking)
	local var22 = useRoactService(appEventIngestService)
	local tokens = var19.Tokens
	local var23 = useSelector(function(p6)
		return p6.ScreenSize
	end)
	local var24 = useSelector(function(p7)
		local globalGuiInset = p7.GlobalGuiInset
		
		return if globalGuiInset then globalGuiInset.bottom else 0
	end)
	local var25, var26 = useState(false)
	local var27, var28 = useState(0)
	local var29 = if var25 then -var27 + var24 else 0
	local var30 = if var25 then 0 else 48
	local var31, var32 = useState(0)
	local var33 = reactModule.useRef(nil)
	local var34 = reactModule.useRef(nil)
	local var35 = var23.Y - var27 - 48 - 48 - 48 - var30
	local playerFeedbackMetadata = p5.playerFeedbackMetadata
	local categoryType = playerFeedbackMetadata.categoryType
	local category = playerFeedbackMetadata.category
	local metadata = playerFeedbackMetadata.metadata
	local comment = playerFeedbackMetadata.comment
	local rootPlaceId = playerFeedbackMetadata.rootPlaceId
	local var36, var37 = useState("")
	local var38, var39 = useState(if getFFlagEdpPlayerFeedbackCommentsOnly() then { "Other" } else {})
	local var40 = playerFeedbackMetadata.canSubmitComment and #var38 > 0
	local var41, var42 = useState(nil)
	local var43 = useLocalization({
		abuseReportPromptText = "PlayerFeedbacks.VoteForm.Message.ReportAbuseInsteadLong",
		reportFlowPageTitle = "PlayerFeedbacks.VoteForm.Message.Action.Report",
		commentTooLongMessage = {
			"PlayerFeedbacks.VoteForm.Message.MaxLengthCharacters",
			count = comment.maximum_length
		},
		commentTooShortMessage = {
			"PlayerFeedbacks.VoteForm.Message.MinLengthCharacters",
			count = comment.minimum_length
		}
	})
	local var44 = #var38 > 0 and var41 == nil
	
	if getFFlagEdpPlayerFeedbackCommentsOnly() then
		var44 = #var38 > 0 and ((if utf8.len(var36) then utf8.len(utf8.nfcnormalize(var36)) else string.len(var36)) > 0 and var41 == nil)
		local var45, var46 = useState(false)
		useEffect(function()
			-- upvalues: var45 (ref), var34 (ref), var46 (ref)
			task.defer(function()
				-- upvalues: var45 (copy), var34 (copy), var46 (copy)
				if not var45 and var34.current then
					var46(true)
					var34.current:CaptureFocus()
				end
			end)
		end, { var34, var45 })
	end
	local var47 = reactModule.useCallback(function()
		-- upvalues: var20 (ref), p5 (ref)
		var20(p5.closeCentralOverlayThunk())
	end, { p5.closeCentralOverlayThunk })
	local var48 = reactModule.useCallback(function()
		-- upvalues: playerFeedbackEventsModule (copy), var22 (ref), rootPlaceId (ref), categoryType (ref), var47 (ref)
		playerFeedbackEventsModule.DismissPlayerFeedbackFormModal(var22, rootPlaceId, { categoryType = categoryType })
		var47()
	end, { var47, categoryType, rootPlaceId, var22 })
	local var49 = reactModule.useCallback(function(p8)
		-- upvalues: playerFeedbackEventsModule (copy), var22 (ref), rootPlaceId (ref), categoryType (ref), var39 (ref)
		playerFeedbackEventsModule.TogglePlayerFeedbackFormModalReason(var22, rootPlaceId, { categoryType = categoryType })
		var39(p8)
	end, {})
	local var50 = reactModule.useCallback(function()
		-- upvalues: playerFeedbackEventsModule (copy), var22 (ref), rootPlaceId (ref), categoryType (ref), var38 (ref), getFFlagEdpPlayerFeedbackCommentsOnly (copy), var36 (ref), var42 (ref), var43 (ref), comment (ref), var20 (ref), submitGamePlayerFeedbackModule (copy), var21 (ref), setCurrentToastMessage (copy), p5 (ref), var47 (ref), setNetworkingErrorToast (copy)
		playerFeedbackEventsModule.ClickPlayerFeedbackFormModalSubmit(var22, rootPlaceId, { categoryType = categoryType })
		
		if #var38 == 0 then return end
		if getFFlagEdpPlayerFeedbackCommentsOnly() then
			local var61 = var36
			
			if (if utf8.len(var61) then utf8.len(utf8.nfcnormalize(var61)) else string.len(var61)) == 0 then
				playerFeedbackEventsModule.SubmitPlayerFeedbackFailCommentValidation(var22, rootPlaceId, { value = "CommentTooShort", categoryType = categoryType })
				var42(var43.commentTooShortMessage)
				
				return
			elseif (if utf8.len(var36) then utf8.len(utf8.nfcnormalize(var36)) else string.len(var36)) > 0 and (if utf8.len(var36) then utf8.len(utf8.nfcnormalize(var36)) else string.len(var36)) < comment.minimum_length then
				playerFeedbackEventsModule.SubmitPlayerFeedbackFailCommentValidation(var22, rootPlaceId, { value = "CommentTooShort", categoryType = categoryType })
				var42(var43.commentTooShortMessage)
				
				return
			elseif comment.maximum_length < (if utf8.len(var36) then utf8.len(utf8.nfcnormalize(var36)) else string.len(var36)) then
				playerFeedbackEventsModule.SubmitPlayerFeedbackFailCommentValidation(var22, rootPlaceId, { value = "CommentTooLong", categoryType = categoryType })
				var42(var43.commentTooLongMessage)
				
				return
			end
			var20(submitGamePlayerFeedbackModule.Post(var21, rootPlaceId, categoryType, var38, var36)):andThen(function(_)
				-- upvalues: var20 (copy), setCurrentToastMessage (copy), p5 (copy), var47 (copy)
				var20(setCurrentToastMessage({
					toastMessage = "PlayerFeedbacks.VoteForm.Message.SubmitSuccess"
				}))
				
				if p5.onSubmitted then
					p5.onSubmitted()
				end
				var47()
			end, function(p9)
				-- upvalues: var20 (copy), setNetworkingErrorToast (copy)
				var20(setNetworkingErrorToast(p9))
			end)
		end
	end, {
		var21, var22, comment.maximum_length, comment.minimum_length,
		var43.commentTooShortMessage, var43.commentTooLongMessage, rootPlaceId,
		categoryType, var38, var36, p5.onSubmitted, var47
	})
	useEffect(function()
		-- upvalues: playerFeedbackEventsModule (copy), var22 (ref), rootPlaceId (ref), categoryType (ref)
		playerFeedbackEventsModule.PlayerFeedbackFormModalMounted(var22, rootPlaceId, { categoryType = categoryType })
	end, { var22, rootPlaceId, categoryType })
	local var51 = reactModule.useCallback(function()
		-- upvalues: playerFeedbackEventsModule (copy), var22 (ref), rootPlaceId (ref), categoryType (ref)
		playerFeedbackEventsModule.FocusPlayerFeedbackFormModalComment(var22, rootPlaceId, { categoryType = categoryType })
	end, { var22, rootPlaceId, categoryType })
	local var52 = reactModule.useCallback(function()
		-- upvalues: playerFeedbackEventsModule (copy), var22 (ref), rootPlaceId (ref), categoryType (ref), var20 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), fFlagAddThumbnailSelectorReport (copy), addThumbnailReportToPlayerFeedback (copy), p5 (ref), closeCentralOverlay (copy)
		playerFeedbackEventsModule.ClickPlayerFeedbackFormAbuseReportPrompt(var22, rootPlaceId, { categoryType = categoryType })
		var20(openDynamicAbuseReportModule({
			abuseVector = abuseVectorModule.Place,
			targetId = rootPlaceId,
			custom = if fFlagAddThumbnailSelectorReport and addThumbnailReportToPlayerFeedback then { universeId = p5.universeId } else nil,
			onClose = function()
				-- upvalues: var20 (copy), closeCentralOverlay (copy)
				var20(closeCentralOverlay())
			end
		}))
	end, { var22, rootPlaceId, categoryType, rootPlaceId })
	local var53 = reactModule.useCallback(function()
		-- upvalues: playerFeedbackEventsModule (copy), var22 (ref), rootPlaceId (ref), categoryType (ref), appPage (copy), urlBuilder (copy), var43 (ref), fFlagSignalsNavP3Dispatch (copy), var7 (copy), var20 (ref), navigateDown (copy), var47 (ref)
		playerFeedbackEventsModule.ClickPlayerFeedbackFormAbuseReportPrompt(var22, rootPlaceId, { categoryType = categoryType })
		local t = {
			name = appPage.GenericWebPage,
			detail = urlBuilder.game.report({ placeId = rootPlaceId }),
			extraProps = { title = var43.reportFlowPageTitle }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var7.down(var7.fromLegacyPage(t))
		else
			var20(navigateDown(t))
		end
		var47()
	end, { var22, rootPlaceId, categoryType, var47 })
	local var54 = reactModule.useCallback(function()
		-- upvalues: playerFeedbackEventsModule (copy), var22 (ref), rootPlaceId (ref), categoryType (ref), appPage (copy), urlBuilder (copy), fFlagSignalsNavP3Dispatch (copy), var7 (copy), var20 (ref), navigateDown (copy), var47 (ref)
		playerFeedbackEventsModule.ClickPlayerFeedbackFormModalDisclaimer(var22, rootPlaceId, { categoryType = categoryType })
		local t = {
			name = appPage.GenericWebPage,
			detail = urlBuilder.static.about.terms()
		}
		
		if fFlagSignalsNavP3Dispatch then
			var7.down(var7.fromLegacyPage(t))
		else
			var20(navigateDown(t))
		end
		var47()
	end, { var22, rootPlaceId, categoryType, var47 })
	local var55 = reactModule.useCallback(function(p10)
		-- upvalues: var37 (ref), comment (ref), var41 (ref), var42 (ref)
		local text = p10.Text
		var37(text)
		local var64 = if utf8.len(text) then utf8.len(utf8.nfcnormalize(text)) else string.len(text)
		
		if var41 and (if var64 ~= 0 then comment.minimum_length <= var64 and var64 <= comment.maximum_length else true) then
			var42(nil)
		end
	end, { var41, comment.minimum_length, comment.maximum_length })
	useEffect(function()
		-- upvalues: var33 (ref), var27 (ref)
		if var33 and var33.current and var27 ~= 0 then
			var33.current.CanvasPosition = Vector2.new(0, var33.current.AbsoluteCanvasSize.Y)
			
			return
		end
	end, { var33, var27 })
	useEffect(function()
		-- upvalues: userInputService (copy), var26 (ref), var28 (ref)
		local var65 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
			-- upvalues: var26 (copy), userInputService (copy), var28 (copy)
			var26(userInputService.OnScreenKeyboardVisible)
			var28(if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0)
		end)
		
		return function()
			-- upvalues: var65 (write)
			if var65 then
				var65:Disconnect()
			end
			var65 = nil
		end
	end, {})
	local createElement = reactModule.createElement
	local t = {
		marginSize = 0,
		title = metadata.form_title_label,
		screenSize = var23,
		onCloseClicked = var48,
		position = var25 and UDim2.new(0.5, 0, 1, var29) or nil,
		anchorPoint = var25 and Vector2.new(0.5, 1) or nil
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		useAutomaticCanvasSize = true,
		size = UDim2.new(1, 0, 0, math.min(var31 + 25, var35)),
		canvasSizeY = UDim.new(),
		elasticBehavior = Enum.ElasticBehavior.Never,
		scrollingFrameRef = var33,
		ref = var33
	}
	local t_3 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, 16),
			[reactModule.Change.AbsoluteContentSize] = function(p11)
				-- upvalues: var32 (ref)
				var32(p11.AbsoluteContentSize.Y)
			end
		}),
		ContentPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 24),
			PaddingLeft = UDim.new(0, 24),
			PaddingRight = UDim.new(0, 24)
		}),
		CheckboxesLabel = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 0,
			Text = category.label,
			TextSize = var19.Font.BaseSize,
			TextColor3 = tokens.Color.Content.Emphasis.Color3,
			TextTransparency = tokens.Color.Content.Emphasis.Transparency,
			Font = tokens.Typography.TitleLarge.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}),
		CategoryCheckboxes = if getFFlagEdpPlayerFeedbackCommentsOnly() then nil else reactModule.createElement(CategoryCheckboxes, {
			layoutOrder = 1,
			category = category,
			selectedCategoryIds = var38,
			onOptionSelected = var49
		}),
		CommmentLabel = if getFFlagEdpPlayerFeedbackCommentsOnly() then nil else var40 and reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 2,
			Text = comment.label,
			TextSize = var19.Font.BaseSize,
			TextColor3 = tokens.Color.Content.Emphasis.Color3,
			TextTransparency = tokens.Color.Content.Emphasis.Transparency,
			Font = tokens.Typography.TitleLarge.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}),
		Commment = var40 and reactModule.createElement("Frame", {
			BorderSizePixel = 1,
			LayoutOrder = 3,
			BackgroundColor3 = tokens.Color.Surface.Surface_200.Color3,
			BackgroundTransparency = tokens.Color.Surface.Surface_200.Transparency,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, tokens.Radius.Small) }),
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 8),
				PaddingBottom = UDim.new(0, 8),
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 8)
			}),
			TextBox = reactModule.createElement("TextBox", {
				Text = var36,
				PlaceholderText = comment.placeholder_text,
				PlaceholderColor3 = var19.Theme.TextMuted.Color,
				Size = UDim2.new(1, 0, 0, 100),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				ClearTextOnFocus = false,
				MultiLine = true,
				TextWrapped = true,
				ClipsDescendants = true,
				OverlayNativeInput = true,
				TextColor3 = tokens.Color.Content.Emphasis.Color3,
				TextTransparency = tokens.Color.Content.Emphasis.Transparency,
				BackgroundColor3 = tokens.Color.Surface.Surface_200.Color3,
				BackgroundTransparency = tokens.Color.Surface.Surface_200.Transparency,
				Font = tokens.Typography.BodyLarge.Font,
				TextSize = tokens.Typography.BodyLarge.FontSize,
				AutomaticSize = Enum.AutomaticSize.Y,
				BorderSizePixel = 0,
				ref = var34,
				[reactModule.Change.Text] = var55,
				[reactModule.Event.Focused] = var51
			})
		}),
		HelperText = if var40 and var41 ~= nil then reactModule.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = 1,
			LayoutOrder = 4,
			Text = var41,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextColor3 = var19.Theme.Alert.Color,
			Font = tokens.Typography.CaptionSmall.Font,
			TextSize = tokens.Typography.CaptionLarge.FontSize,
			LineHeight = tokens.Typography.CaptionSmall.LineHeight,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}) else nil,
		Buttons = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 5,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			ButtonStack = reactModule.createElement(buttonStack, {
				buttons = {
					{
						buttonType = buttonType.PrimaryContextual,
						props = {
							onActivated = var50,
							isDisabled = var44 == false,
							text = metadata.submit_button_label
						}
					}
				}
			})
		}),
		DisclaimerText = reactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0),
			Font = var19.Font.CaptionHeader.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextWrapped = true,
			Text = metadata.disclaimer_label,
			[reactModule.Event.Activated] = var54,
			RichText = true,
			TextSize = tokens.Typography.CaptionLarge.FontSize,
			TextColor3 = var19.Theme.TextMuted.Color,
			TextTransparency = var19.Theme.TextMuted.Transparency,
			LineHeight = tokens.LineHeight.LineHeight_140,
			LayoutOrder = 6
		})
	}
	local var60 = false
	
	if categoryType == "Downvote" then
		var60 = reactModule.createElement
		var60 = var60("TextButton", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextWrapped = true,
			Text = var43.abuseReportPromptText,
			[reactModule.Event.Activated] = if fFlagEnableAbuseReportRevampFlow and enableAbuseReportRevampFeedback then var52 else var53,
			RichText = true,
			TextSize = tokens.Typography.CaptionLarge.FontSize,
			TextColor3 = var19.Theme.TextMuted.Color,
			TextTransparency = var19.Theme.TextMuted.Transparency,
			Font = tokens.Typography.BodyLarge.Font,
			LineHeight = tokens.LineHeight.LineHeight_140,
			LayoutOrder = 7
		})
	end
	t_3.AbuseReportPromptText = var60
	t_1.Content = createElement_1(verticalScrollView, t_2, t_3)
	
	return createElement(partialPageModal, t, t_1)
end