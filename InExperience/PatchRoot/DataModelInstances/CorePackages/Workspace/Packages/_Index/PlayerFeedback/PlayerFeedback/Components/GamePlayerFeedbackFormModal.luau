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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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

local function CategoryCheckboxes(p1)
	-- upvalues: reactModule (ref), cryoModule (ref), checkbox (ref)
	local category = p1.category
	local selectedCategoryIds = p1.selectedCategoryIds
	local onOptionSelected = p1.onOptionSelected
	local t = {
		layout = reactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		padding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, -8) })
	}
	local var2 = reactModule.useCallback(function(p2)
		-- upvalues: cryoModule (copy), selectedCategoryIds (ref), onOptionSelected (ref)
		return function(p3)
			-- upvalues: cryoModule (copy), selectedCategoryIds (copy), p2 (ref), onOptionSelected (copy)
			onOptionSelected(if p3 then cryoModule.List.join(selectedCategoryIds, { p2 }) else cryoModule.List.filter(selectedCategoryIds, function(p4)
				-- upvalues: p2 (copy)
				return p4 ~= p2
			end))
		end
	end, { selectedCategoryIds })
	
	for i, v in ipairs(category.options) do
		t["Checkbox" .. i] = reactModule.createElement(checkbox, {
			label = v.label,
			isChecked = cryoModule.List.find(selectedCategoryIds, v.id) ~= nil,
			onActivated = var2(v.id),
			LayoutOrder = i
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0)
	}, t)
end

local function _(p2)
	return if utf8.len(p2) then utf8.len(utf8.nfcnormalize(p2)) else string.len(p2)
end

local var3 = argCheckModule.wrap(tModule.interface({
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

return function(p2)
	-- upvalues: var3 (ref), useStyle (ref), useDispatch (ref), useRoactService (ref), roactNetworking (ref), appEventIngestService (ref), useSelector (ref), useState (ref), reactModule (ref), getFFlagEdpPlayerFeedbackCommentsOnly (ref), useLocalization (ref), useEffect (ref), playerFeedbackEventsModule (ref), submitGamePlayerFeedbackModule (ref), setCurrentToastMessage (ref), setNetworkingErrorToast (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), fFlagAddThumbnailSelectorReport (ref), addThumbnailReportToPlayerFeedback (ref), closeCentralOverlay (ref), appPage (ref), urlBuilder (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), userInputService (ref), partialPageModal (ref), verticalScrollView (ref), CategoryCheckboxes (ref), buttonStack (ref), buttonType (ref), fFlagEnableAbuseReportRevampFlow (ref), enableAbuseReportRevampFeedback (ref)
	assert(var3(p2))
	local var4 = useStyle()
	local var5 = useDispatch()
	local var6 = useRoactService(roactNetworking)
	local var7 = useRoactService(appEventIngestService)
	local tokens = var4.Tokens
	local var8 = useSelector(function(p3)
		return p3.ScreenSize
	end)
	local var9 = useSelector(function(p3)
		local globalGuiInset = p3.GlobalGuiInset
		
		return if globalGuiInset then globalGuiInset.bottom else 0
	end)
	local var10, var11 = useState(false)
	local var12, var13 = useState(0)
	local var14 = if var10 then -var12 + var9 else 0
	local var15 = if var10 then 0 else 48
	local var16, var17 = useState(0)
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useRef(nil)
	local var20 = var8.Y - var12 - 48 - 48 - 48 - var15
	local playerFeedbackMetadata = p2.playerFeedbackMetadata
	local categoryType = playerFeedbackMetadata.categoryType
	local category = playerFeedbackMetadata.category
	local metadata = playerFeedbackMetadata.metadata
	local comment = playerFeedbackMetadata.comment
	local rootPlaceId = playerFeedbackMetadata.rootPlaceId
	local var21, var22 = useState("")
	local var23, var24 = useState(if getFFlagEdpPlayerFeedbackCommentsOnly() then { "Other" } else {})
	local var25 = playerFeedbackMetadata.canSubmitComment and #var23 > 0
	local var26, var27 = useState(nil)
	local var28 = useLocalization({
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
	local var29 = #var23 > 0 and var26 == nil
	
	if getFFlagEdpPlayerFeedbackCommentsOnly() then
		var29 = #var23 > 0 and ((if utf8.len(var21) then utf8.len(utf8.nfcnormalize(var21)) else string.len(var21)) > 0 and var26 == nil)
		local var30, var31 = useState(false)
		useEffect(function()
			-- upvalues: var30 (ref), var19 (ref), var31 (ref)
			task.defer(function()
				-- upvalues: var30 (copy), var19 (copy), var31 (copy)
				if not var30 and var19.current then
					var31(true)
					var19.current:CaptureFocus()
				end
			end)
		end, { var19, var30 })
	end
	local var32 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), p2 (ref)
		var5(p2.closeCentralOverlayThunk())
	end, { p2.closeCentralOverlayThunk })
	local var33 = reactModule.useCallback(function()
		-- upvalues: playerFeedbackEventsModule (copy), var7 (ref), rootPlaceId (ref), categoryType (ref), var32 (ref)
		playerFeedbackEventsModule.DismissPlayerFeedbackFormModal(var7, rootPlaceId, { categoryType = categoryType })
		var32()
	end, { var32, categoryType, rootPlaceId, var7 })
	local var34 = reactModule.useCallback(function(p3)
		-- upvalues: playerFeedbackEventsModule (copy), var7 (ref), rootPlaceId (ref), categoryType (ref), var24 (ref)
		playerFeedbackEventsModule.TogglePlayerFeedbackFormModalReason(var7, rootPlaceId, { categoryType = categoryType })
		var24(p3)
	end, {})
	local var35 = reactModule.useCallback(function()
		-- upvalues: playerFeedbackEventsModule (copy), var7 (ref), rootPlaceId (ref), categoryType (ref), var23 (ref), getFFlagEdpPlayerFeedbackCommentsOnly (copy), var21 (ref), var27 (ref), var28 (ref), comment (ref), var5 (ref), submitGamePlayerFeedbackModule (copy), var6 (ref), setCurrentToastMessage (copy), p2 (ref), var32 (ref), setNetworkingErrorToast (copy)
		playerFeedbackEventsModule.ClickPlayerFeedbackFormModalSubmit(var7, rootPlaceId, { categoryType = categoryType })
		
		if #var23 == 0 then return end
		if getFFlagEdpPlayerFeedbackCommentsOnly() then
			local var36 = var21
			
			if (if utf8.len(var36) then utf8.len(utf8.nfcnormalize(var36)) else string.len(var36)) == 0 then
				playerFeedbackEventsModule.SubmitPlayerFeedbackFailCommentValidation(var7, rootPlaceId, { value = "CommentTooShort", categoryType = categoryType })
				var27(var28.commentTooShortMessage)
				
				return
			elseif (if utf8.len(var21) then utf8.len(utf8.nfcnormalize(var21)) else string.len(var21)) > 0 and (if utf8.len(var21) then utf8.len(utf8.nfcnormalize(var21)) else string.len(var21)) < comment.minimum_length then
				playerFeedbackEventsModule.SubmitPlayerFeedbackFailCommentValidation(var7, rootPlaceId, { value = "CommentTooShort", categoryType = categoryType })
				var27(var28.commentTooShortMessage)
				
				return
			elseif comment.maximum_length < (if utf8.len(var21) then utf8.len(utf8.nfcnormalize(var21)) else string.len(var21)) then
				playerFeedbackEventsModule.SubmitPlayerFeedbackFailCommentValidation(var7, rootPlaceId, { value = "CommentTooLong", categoryType = categoryType })
				var27(var28.commentTooLongMessage)
				
				return
			end
			var5(submitGamePlayerFeedbackModule.Post(var6, rootPlaceId, categoryType, var23, var21)):andThen(function(_)
				-- upvalues: var5 (copy), setCurrentToastMessage (copy), p2 (copy), var32 (copy)
				var5(setCurrentToastMessage({
					toastMessage = "PlayerFeedbacks.VoteForm.Message.SubmitSuccess"
				}))
				
				if p2.onSubmitted then
					p2.onSubmitted()
				end
				var32()
			end, function(p3)
				-- upvalues: var5 (copy), setNetworkingErrorToast (copy)
				var5(setNetworkingErrorToast(p3))
			end)
		end
	end, {
		var6, var7, comment.maximum_length, comment.minimum_length,
		var28.commentTooShortMessage, var28.commentTooLongMessage, rootPlaceId,
		categoryType, var23, var21, p2.onSubmitted, var32
	})
	useEffect(function()
		-- upvalues: playerFeedbackEventsModule (copy), var7 (ref), rootPlaceId (ref), categoryType (ref)
		playerFeedbackEventsModule.PlayerFeedbackFormModalMounted(var7, rootPlaceId, { categoryType = categoryType })
	end, { var7, rootPlaceId, categoryType })
	local var36 = reactModule.useCallback(function()
		-- upvalues: playerFeedbackEventsModule (copy), var7 (ref), rootPlaceId (ref), categoryType (ref)
		playerFeedbackEventsModule.FocusPlayerFeedbackFormModalComment(var7, rootPlaceId, { categoryType = categoryType })
	end, { var7, rootPlaceId, categoryType })
	local var37 = reactModule.useCallback(function()
		-- upvalues: playerFeedbackEventsModule (copy), var7 (ref), rootPlaceId (ref), categoryType (ref), var5 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), fFlagAddThumbnailSelectorReport (copy), addThumbnailReportToPlayerFeedback (copy), p2 (ref), closeCentralOverlay (copy)
		playerFeedbackEventsModule.ClickPlayerFeedbackFormAbuseReportPrompt(var7, rootPlaceId, { categoryType = categoryType })
		var5(openDynamicAbuseReportModule({
			abuseVector = abuseVectorModule.Place,
			targetId = rootPlaceId,
			custom = if fFlagAddThumbnailSelectorReport and addThumbnailReportToPlayerFeedback then { universeId = p2.universeId } else nil,
			onClose = function()
				-- upvalues: var5 (copy), closeCentralOverlay (copy)
				var5(closeCentralOverlay())
			end
		}))
	end, { var7, rootPlaceId, categoryType, rootPlaceId })
	local var38 = reactModule.useCallback(function()
		-- upvalues: playerFeedbackEventsModule (copy), var7 (ref), rootPlaceId (ref), categoryType (ref), appPage (copy), urlBuilder (copy), var28 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var5 (ref), navigateDown (copy), var32 (ref)
		playerFeedbackEventsModule.ClickPlayerFeedbackFormAbuseReportPrompt(var7, rootPlaceId, { categoryType = categoryType })
		local t = {
			name = appPage.GenericWebPage,
			detail = urlBuilder.game.report({ placeId = rootPlaceId }),
			extraProps = { title = var28.reportFlowPageTitle }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
		else
			var5(navigateDown(t))
		end
		var32()
	end, { var7, rootPlaceId, categoryType, var32 })
	local var39 = reactModule.useCallback(function()
		-- upvalues: playerFeedbackEventsModule (copy), var7 (ref), rootPlaceId (ref), categoryType (ref), appPage (copy), urlBuilder (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var5 (ref), navigateDown (copy), var32 (ref)
		playerFeedbackEventsModule.ClickPlayerFeedbackFormModalDisclaimer(var7, rootPlaceId, { categoryType = categoryType })
		local t = {
			name = appPage.GenericWebPage,
			detail = urlBuilder.static.about.terms()
		}
		
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t))
		else
			var5(navigateDown(t))
		end
		var32()
	end, { var7, rootPlaceId, categoryType, var32 })
	local var40 = reactModule.useCallback(function(p3)
		-- upvalues: var22 (ref), comment (ref), var26 (ref), var27 (ref)
		local text = p3.Text
		var22(text)
		local var41 = if utf8.len(text) then utf8.len(utf8.nfcnormalize(text)) else string.len(text)
		
		if var26 and (if var41 ~= 0 then comment.minimum_length <= var41 and var41 <= comment.maximum_length else true) then
			var27(nil)
		end
	end, { var26, comment.minimum_length, comment.maximum_length })
	useEffect(function()
		-- upvalues: var18 (ref), var12 (ref)
		if var18 and var18.current and var12 ~= 0 then
			var18.current.CanvasPosition = Vector2.new(0, var18.current.AbsoluteCanvasSize.Y)
			
			return
		end
	end, { var18, var12 })
	useEffect(function()
		-- upvalues: userInputService (copy), var11 (ref), var13 (ref)
		local var41 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
			-- upvalues: var11 (copy), userInputService (copy), var13 (copy)
			var11(userInputService.OnScreenKeyboardVisible)
			var13(if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0)
		end)
		
		return function()
			-- upvalues: var41 (write)
			if var41 then
				var41:Disconnect()
			end
			var41 = nil
		end
	end, {})
	local createElement = reactModule.createElement
	local t = {
		marginSize = 0,
		title = metadata.form_title_label,
		screenSize = var8,
		onCloseClicked = var33,
		position = var10 and UDim2.new(0.5, 0, 1, var14) or nil,
		anchorPoint = var10 and Vector2.new(0.5, 1) or nil
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		useAutomaticCanvasSize = true,
		size = UDim2.new(1, 0, 0, math.min(var16 + 25, var20)),
		canvasSizeY = UDim.new(),
		elasticBehavior = Enum.ElasticBehavior.Never,
		scrollingFrameRef = var18,
		ref = var18
	}
	local t_3 = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, 16),
			[reactModule.Change.AbsoluteContentSize] = function(p3)
				-- upvalues: var17 (ref)
				var17(p3.AbsoluteContentSize.Y)
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
			TextSize = var4.Font.BaseSize,
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
			selectedCategoryIds = var23,
			onOptionSelected = var34
		}),
		CommmentLabel = if getFFlagEdpPlayerFeedbackCommentsOnly() then nil else var25 and reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 2,
			Text = comment.label,
			TextSize = var4.Font.BaseSize,
			TextColor3 = tokens.Color.Content.Emphasis.Color3,
			TextTransparency = tokens.Color.Content.Emphasis.Transparency,
			Font = tokens.Typography.TitleLarge.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}),
		Commment = var25 and reactModule.createElement("Frame", {
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
				Text = var21,
				PlaceholderText = comment.placeholder_text,
				PlaceholderColor3 = var4.Theme.TextMuted.Color,
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
				ref = var19,
				[reactModule.Change.Text] = var40,
				[reactModule.Event.Focused] = var36
			})
		}),
		HelperText = if var25 and var26 ~= nil then reactModule.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = 1,
			LayoutOrder = 4,
			Text = var26,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextColor3 = var4.Theme.Alert.Color,
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
							onActivated = var35,
							isDisabled = var29 == false,
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
			Font = var4.Font.CaptionHeader.Font,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextWrapped = true,
			Text = metadata.disclaimer_label,
			[reactModule.Event.Activated] = var39,
			RichText = true,
			TextSize = tokens.Typography.CaptionLarge.FontSize,
			TextColor3 = var4.Theme.TextMuted.Color,
			TextTransparency = var4.Theme.TextMuted.Transparency,
			LineHeight = tokens.LineHeight.LineHeight_140,
			LayoutOrder = 6
		})
	}
	local var41 = false
	
	if categoryType == "Downvote" then
		var41 = reactModule.createElement
		var41 = var41("TextButton", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.XY,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextWrapped = true,
			Text = var28.abuseReportPromptText,
			[reactModule.Event.Activated] = if fFlagEnableAbuseReportRevampFlow and enableAbuseReportRevampFeedback then var37 else var38,
			RichText = true,
			TextSize = tokens.Typography.CaptionLarge.FontSize,
			TextColor3 = var4.Theme.TextMuted.Color,
			TextTransparency = var4.Theme.TextMuted.Transparency,
			Font = tokens.Typography.BodyLarge.Font,
			LineHeight = tokens.LineHeight.LineHeight_140,
			LayoutOrder = 7
		})
	end
	t_3.AbuseReportPromptText = var41
	t_1.Content = createElement_1(verticalScrollView, t_2, t_3)
	
	return createElement(partialPageModal, t, t_1)
end