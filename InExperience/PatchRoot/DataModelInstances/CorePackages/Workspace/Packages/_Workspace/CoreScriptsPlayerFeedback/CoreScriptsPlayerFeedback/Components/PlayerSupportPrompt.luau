local CoreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local Parent = CoreScriptsPlayerFeedback.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local Button = FoundationModule.Button
local Checkbox = FoundationModule.Checkbox
local Dropdown = FoundationModule.Dropdown
local Icon = FoundationModule.Icon
local TextArea = FoundationModule.TextArea
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local InputVariant = FoundationModule.Enums.InputVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens
local BuilderIconsModule = require(Parent.BuilderIcons)
local IconVariant = BuilderIconsModule.IconVariant
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(CoreScriptsPlayerFeedback.constants)
local UseEscapeDismissModule = require(CoreScriptsPlayerFeedback.Hooks.useEscapeDismiss)
local FFlagPlayerSupportPromptEventIngestModule = require(CoreScriptsPlayerFeedback.Flags.FFlagPlayerSupportPromptEventIngest)
local PlayerSupportPromptTelemetryModule = require(CoreScriptsPlayerFeedback.Telemetry.PlayerSupportPromptTelemetry)
local FFlagEnablePlayerSupportCaptureAttachmentsModule = require(CoreScriptsPlayerFeedback.Flags.FFlagEnablePlayerSupportCaptureAttachments)
local FFlagEnablePlayerSupportSuggestionCategoryModule = require(CoreScriptsPlayerFeedback.Flags.FFlagEnablePlayerSupportSuggestionCategory)
local _ = require(CoreScriptsPlayerFeedback.CaptureTypes)
local UseCaptureUploadsModule = require(CoreScriptsPlayerFeedback.Hooks.useCaptureUploads)
local UseGalleryCapturesModule = require(CoreScriptsPlayerFeedback.Hooks.useGalleryCaptures)
local CapturePreviewTileModule = require(CoreScriptsPlayerFeedback.Components.CapturePreviewTile)
local CapturePickerGridModule = require(CoreScriptsPlayerFeedback.Components.CapturePickerGrid)
local CapturePickerPreviewModule = require(CoreScriptsPlayerFeedback.Components.CapturePickerPreview)
local GetCaptureKeyModule = require(CoreScriptsPlayerFeedback.Utils.getCaptureKey)
local MemoResult = ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), CapturePreviewTileModule (copy), Icon (copy), BuilderIconsModule (copy), IconSize (copy), IconVariant (copy), Text (copy), View (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local UseTokensResult = UseTokensFunction()
	local Count = 0
	
	for _ in p1.uploadStatuses do
		Count += 1
	end
	local IsCountAbove = Count > 0
	local UseLocalizationResult = UseLocalizationFunction({
		CapturesAdd = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Add",
		CapturesHint = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Hint",
		CapturesEditSelection = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.EditSelection",
		CapturesUploadError = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.UploadError",
		CapturesHeading = {
			"CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Heading",
			count = tostring(Count),
			max = tostring(p1.maxSelections)
		}
	})
	local config = {
		UIGridLayout = ReactModule.createElement("UIGridLayout", {
			CellPadding = UDim2.new(0, 6, 0, 6),
			CellSize = UDim2.new(0, 80, 0, 80),
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 2),
			PaddingBottom = UDim.new(0, 2),
			PaddingLeft = UDim.new(0, 2),
			PaddingRight = UDim.new(0, 2)
		})
	}
	local List = {}
	
	for Key, uploadStatus in p1.uploadStatuses do
		table.insert(List, { key = Key, captureStatus = uploadStatus })
	end
	table.sort(List, function(A, B): boolean
		return (A.captureStatus.order or 0) < (B.captureStatus.order or 0)
	end)
	local LayoutOrder = 0
	
	for _, value in List do
		LayoutOrder += 1
		local Key1 = value.key
		config[value.key] = ReactModule.createElement(CapturePreviewTileModule, {
			capture = value.captureStatus.capture,
			status = value.captureStatus.status,
			failureReason = value.captureStatus.failureReason,
			layoutOrder = LayoutOrder,
			onRemove = function()
				-- upvalues: p1 (copy), Key1 (copy)
				p1.onCaptureRemoved(Key1)
			end
		})
	end
	if IsCountAbove then
		config.EditSelectionButton = ReactModule.createElement("ImageButton", {
			BackgroundColor3 = UseTokensResult.Color.Surface.Surface_300.Color3,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Image = "",
			LayoutOrder = LayoutOrder + 1,
			Size = UDim2.new(0, 80, 0, 80),
			[ReactModule.Event.Activated] = p1.onPickerOpen
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 4),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			ImageIcon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = BuilderIconsModule.Icon.Image,
				size = IconSize.Medium,
				variant = IconVariant.Filled,
				style = { Color3 = UseTokensResult.Color.Content.Muted.Color3 }
			}),
			Label = ReactModule.createElement(Text, {
				tag = "auto-xy text-caption-small text-wrap content-muted",
				LayoutOrder = 2,
				Text = UseLocalizationResult.CapturesEditSelection
			})
		})
	end
	local Flag = false
	
	for _, uploadStatus1 in p1.uploadStatuses do
		if uploadStatus1.status == "failed" and uploadStatus1.failureReason ~= Enum.UploadCaptureResult.CaptureModerated then
			Flag = true
		end
	end
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = 3,
		GroupTransparency = if p1.category == "" then 0.75 else 0,
		padding = { top = UDim.new(0, 4), bottom = UDim.new(0, 4) }
	}, {
		Heading = if IsCountAbove then ReactModule.createElement(Text, {
			tag = "size-0 auto-xy text-title-medium text-wrap text-align-x-left text-align-y-top",
			LayoutOrder = 1,
			Text = UseLocalizationResult.CapturesHeading,
			textStyle = UseTokensResult.Color.Content.Emphasis
		}) else nil,
		PreviewGrid = if IsCountAbove then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, config) else nil,
		ErrorHint = if Flag then ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-left content-alert",
			LayoutOrder = 3,
			Text = UseLocalizationResult.CapturesUploadError
		}) else nil,
		EmptyRow = if IsCountAbove then nil else ReactModule.createElement(View, {
			tag = "row align-y-center gap-medium size-full-0 auto-y",
			LayoutOrder = 2
		}, {
			AddButton = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				text = UseLocalizationResult.CapturesAdd,
				variant = ButtonVariant.Standard,
				size = InputSize.Medium,
				onActivated = p1.onPickerOpen,
				isDisabled = p1.category == ""
			}),
			Hint = ReactModule.createElement(Text, {
				tag = "fill size-full-0 text-body-medium text-wrap text-align-x-left content-muted",
				LayoutOrder = 2,
				Text = UseLocalizationResult.CapturesHint
			})
		})
	})
end)
local PLAYERSUPPORTCATEGORIESREQUIRINGUSERID = ConstantsModule.PLAYER_SUPPORT_CATEGORIES_REQUIRING_USER_ID

return (ReactModule.memo(function(p2)
	-- upvalues: UseTokensFunction (copy), FFlagEnablePlayerSupportCaptureAttachmentsModule (copy), UseCaptureUploadsModule (copy), UseGalleryCapturesModule (copy), ReactModule (copy), ConstantsModule (copy), UseLocalizationFunction (copy), FFlagEnablePlayerSupportSuggestionCategoryModule (copy), PLAYERSUPPORTCATEGORIESREQUIRINGUSERID (copy), GetCaptureKeyModule (copy), FFlagPlayerSupportPromptEventIngestModule (copy), PlayerSupportPromptTelemetryModule (copy), UseEscapeDismissModule (copy), Dialog (copy), CapturePickerPreviewModule (copy), CapturePickerGridModule (copy), View (copy), Text (copy), Dropdown (copy), InputSize (copy), InputVariant (copy), TextArea (copy), MemoResult (copy), Checkbox (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local Description = p2.description
	local SetDescription = p2.setDescription
	local Category = p2.category
	local SetCategoryFunction = p2.setCategory
	local ShareUserId = p2.shareUserId
	local SetShareUserIdFunction = p2.setShareUserId
	local v1 = nil
	local v2 = nil
	local v3 = nil
	local Callback1 = nil
	local SelectedKeys = nil
	local Callback = nil
	local Capture = nil
	local Callback2 = nil
	
	if FFlagEnablePlayerSupportCaptureAttachmentsModule then
		v1 = UseCaptureUploadsModule()
		v2 = UseGalleryCapturesModule()
		v3, Callback1 = ReactModule.useState(false)
		SelectedKeys, Callback = ReactModule.useState({})
		Capture, Callback2 = ReactModule.useState(nil)
	end
	local MINFEEDBACKLENGTH = ConstantsModule.MIN_FEEDBACK_LENGTH
	local MAXPLAYERSUPPORTLENGTH = ConstantsModule.MAX_PLAYER_SUPPORT_LENGTH
	local UseLocalizationResult = UseLocalizationFunction({
		Title = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Title",
		ReportAbuseLead = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.ReportAbuse.Lead",
		ReportAbuseLink = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.ReportAbuse.Link",
		CategoryLabel = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Category.Label",
		CategoryPlaceholder = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Category.Placeholder",
		CategoryItemBugReport = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Category.BugReport",
		CategoryItemDataRestoreRequest = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Category.DataRestoreRequest",
		CategoryItemPurchasingIssue = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Category.PurchasingIssue",
		CategoryItemSuggestion = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Category.Suggestion",
		CategoryItemOther = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Category.Other",
		DescriptionLabel = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Description.Label",
		DescriptionPlaceholderBugReport = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Placeholder.BugReport",
		DescriptionPlaceholderDataRestoreRequest = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Placeholder.DataRestoreRequest",
		DescriptionPlaceholderPurchasingIssue = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Placeholder.PurchasingIssue",
		DescriptionPlaceholderSuggestion = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Placeholder.Suggestion",
		DescriptionPlaceholderOther = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Placeholder.Other",
		ShareUserIdLabel = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.ShareUserId.Label",
		ShareUserIdLabelRequired = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.ShareUserId.LabelRequired",
		ShareUserIdHint = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.ShareUserId.Hint",
		Send = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Send",
		Add = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Add",
		Cancel = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Cancel",
		Select = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Select",
		Deselect = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Deselect",
		CapturesAdd = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Add",
		DescriptionHint = {
			"CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Description.CharacterLimitHint",
			MAX = tostring(MAXPLAYERSUPPORTLENGTH)
		}
	})
	local List = {
		{
			id = "TICKET_CATEGORY_BUG_REPORT",
			text = UseLocalizationResult.CategoryItemBugReport
		},
		{
			id = "TICKET_CATEGORY_DATA_RESTORE_REQUEST",
			text = UseLocalizationResult.CategoryItemDataRestoreRequest
		},
		{
			id = "TICKET_CATEGORY_PURCHASING_ISSUE",
			text = UseLocalizationResult.CategoryItemPurchasingIssue
		}
	}
	
	if FFlagEnablePlayerSupportSuggestionCategoryModule then
		table.insert(List, {
			id = "TICKET_CATEGORY_SUGGESTION",
			text = UseLocalizationResult.CategoryItemSuggestion
		})
	end
	table.insert(List, {
		id = "TICKET_CATEGORY_OTHER",
		text = UseLocalizationResult.CategoryItemOther
	})
	local config = {
		TICKET_CATEGORY_BUG_REPORT = UseLocalizationResult.DescriptionPlaceholderBugReport,
		TICKET_CATEGORY_DATA_RESTORE_REQUEST = UseLocalizationResult.DescriptionPlaceholderDataRestoreRequest,
		TICKET_CATEGORY_PURCHASING_ISSUE = UseLocalizationResult.DescriptionPlaceholderPurchasingIssue,
		TICKET_CATEGORY_OTHER = UseLocalizationResult.DescriptionPlaceholderOther
	}
	
	if FFlagEnablePlayerSupportSuggestionCategoryModule then
		config.TICKET_CATEGORY_SUGGESTION = UseLocalizationResult.DescriptionPlaceholderSuggestion
	end
	local IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry = PLAYERSUPPORTCATEGORIESREQUIRINGUSERID[Category] == true
	local IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1 = IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry or ShareUserId
	local UseMemoResult = {}
	local Count = 0
	local v4 = false
	local UseResult = nil
	local UseResult1 = nil
	local OnActivated: (() -> ())? = nil
	
	if FFlagEnablePlayerSupportCaptureAttachmentsModule then
		UseResult = ReactModule.useCallback(function()
			-- upvalues: Category (copy), Callback1 (ref)
			if Category ~= "" then
				Callback1(true)
				
				return
			end
		end, { Category })
		ReactModule.useEffect(function()
			-- upvalues: v3 (ref), Callback (ref), Callback2 (ref), v1 (ref), v2 (ref)
			if not v3 then
				Callback({})
				Callback2(nil)
				
				return
			end
			local t = {}
			
			for uploadStatus in v1.uploadStatuses do
				t[uploadStatus] = true
			end
			Callback(t)
			Callback2(nil)
			v2.load()
		end, { v3 })
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: v2 (ref), SelectedKeys (ref), GetCaptureKeyModule (upval)
			local List = {}
			
			for _, capture in v2.captures do
				if SelectedKeys[GetCaptureKeyModule(capture)] then
					table.insert(List, capture)
				end
			end
			return List
		end, { v2.captures, SelectedKeys })
		Count = #UseMemoResult
		v4 = Count >= 5
		UseResult1 = ReactModule.useCallback(function(p3)
			-- upvalues: GetCaptureKeyModule (upval), Callback (ref), v4 (ref)
			local CaptureKeyModule = GetCaptureKeyModule(p3)
			Callback(function(Tbl)
				-- upvalues: CaptureKeyModule (copy), v4 (upval)
				local IsEntry = Tbl[CaptureKeyModule] == true
				
				if not IsEntry and v4 then
					return Tbl
				end
				local Copy = table.clone(Tbl)
				
				if IsEntry then
					Copy[CaptureKeyModule] = nil
					
					return Copy
				else
					Copy[CaptureKeyModule] = true
					
					return Copy
				end
			end)
		end, { v4 })
		local HasNextEntry = next(v1.uploadStatuses) ~= nil
		
		OnActivated = function()
			-- upvalues: Count (ref), HasNextEntry (copy), v1 (ref), UseMemoResult (ref), Callback1 (ref)
			if Count ~= 0 or HasNextEntry then
				v1.onCapturesAdded(UseMemoResult)
				Callback1(false)
				
				return
			end
		end
	end
	local v5 = nil
	
	if FFlagEnablePlayerSupportCaptureAttachmentsModule then
		local CaptureTime = if Capture then Capture.CaptureTime else nil
		local RobloxLocaleId = game:GetService("LocalizationService").RobloxLocaleId
		v5 = UseLocalizationFunction({
			dateTime = {
				"CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Picker.DateTime",
				date = if CaptureTime then CaptureTime:FormatLocalTime("L", RobloxLocaleId) else "",
				time = if CaptureTime then CaptureTime:FormatLocalTime("LT", RobloxLocaleId) else ""
			}
		})
	end
	local NoV47: boolean = MINFEEDBACKLENGTH <= #Description and (#Description <= MAXPLAYERSUPPORTLENGTH and (Category ~= "" and (if v1 then not v1.anyUploading and (not v1 or not v1.hasNonModerationFailure) else not v1 or not v1.hasNonModerationFailure)))
	
	if FFlagPlayerSupportPromptEventIngestModule then
		ReactModule.useEffect(function()
			-- upvalues: PlayerSupportPromptTelemetryModule (upval), Category (copy), IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1 (copy), Description (copy)
			PlayerSupportPromptTelemetryModule.log({
				action = PlayerSupportPromptTelemetryModule.Action.Opened,
				category = Category,
				shareUserId = IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1,
				descriptionLength = #Description
			})
		end, {})
	end
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: NoV47 (copy), FFlagPlayerSupportPromptEventIngestModule (upval), PlayerSupportPromptTelemetryModule (upval), Category (copy), IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1 (copy), IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry (copy), Description (copy), FFlagEnablePlayerSupportCaptureAttachmentsModule (upval), v1 (ref), p2 (copy)
		if not NoV47 then return end
		if FFlagPlayerSupportPromptEventIngestModule then
			PlayerSupportPromptTelemetryModule.log({
				action = PlayerSupportPromptTelemetryModule.Action.Submitted,
				category = Category,
				shareUserId = IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1,
				shareUserIdRequired = IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry,
				descriptionLength = #Description
			})
		end
		pcall(function()
			-- upvalues: Description (upval), Category (upval), IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1 (upval), FFlagEnablePlayerSupportCaptureAttachmentsModule (upval), v1 (upval)
			local SocialService = game:GetService("SocialService")
			
			if SocialService.SignalFeedbackSubmissionCompleted then
				local config = {
					Description = Description,
					Category = Category,
					ShareUserIdPreference = if IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1 then "SHARE_USER_ID_PREFERENCE_SHARE" else "SHARE_USER_ID_PREFERENCE_DO_NOT_SHARE"
				}
				
				if FFlagEnablePlayerSupportCaptureAttachmentsModule then
					local AssetIds = {}
					
					for _, uploadStatus in v1.uploadStatuses do
						if uploadStatus.status == "succeeded" and uploadStatus.assetId ~= nil then
							table.insert(AssetIds, uploadStatus.assetId)
						end
					end
					if #AssetIds > 0 then
						config.AssetIds = AssetIds
					end
				end
				SocialService:SignalFeedbackSubmissionCompleted("", config)
			end
		end)
		p2.closePrompt()
	end, if FFlagPlayerSupportPromptEventIngestModule then {
		Description, Category, IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1,
		IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry, NoV47, v1 or false,
		p2.closePrompt
	} else {
		Description, Category, IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1, NoV47,
		v1 or false, p2.closePrompt
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: p2 (copy)
		pcall(function()
			local SocialService = game:GetService("SocialService")
			
			if SocialService.SignalFeedbackSubmissionPermissionDenied then
				SocialService:SignalFeedbackSubmissionPermissionDenied()
			end
		end)
		p2.onFormAbandoned()
		p2.closePrompt()
	end, { p2.closePrompt, p2.onFormAbandoned })
	local UseResult4 = if FFlagPlayerSupportPromptEventIngestModule then ReactModule.useCallback(function()
		-- upvalues: PlayerSupportPromptTelemetryModule (upval), Category (copy), IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1 (copy), Description (copy), UseResult3 (copy)
		PlayerSupportPromptTelemetryModule.log({
			action = PlayerSupportPromptTelemetryModule.Action.Dismissed,
			dismissMethod = PlayerSupportPromptTelemetryModule.DismissMethod.DialogClose,
			category = Category,
			shareUserId = IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1,
			descriptionLength = #Description
		})
		UseResult3()
	end, {
		UseResult3,
		Category,
		IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1,
		Description
	}) else UseResult3
	local UseResult5 = if FFlagPlayerSupportPromptEventIngestModule then ReactModule.useCallback(function()
		-- upvalues: PlayerSupportPromptTelemetryModule (upval), Category (copy), IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1 (copy), Description (copy), UseResult3 (copy)
		PlayerSupportPromptTelemetryModule.log({
			action = PlayerSupportPromptTelemetryModule.Action.Dismissed,
			dismissMethod = PlayerSupportPromptTelemetryModule.DismissMethod.Escape,
			category = Category,
			shareUserId = IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1,
			descriptionLength = #Description
		})
		UseResult3()
	end, {
		UseResult3,
		Category,
		IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1,
		Description
	}) else UseResult3
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: FFlagPlayerSupportPromptEventIngestModule (upval), PlayerSupportPromptTelemetryModule (upval), Category (copy), IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1 (copy), Description (copy), p2 (copy)
		if FFlagPlayerSupportPromptEventIngestModule then
			PlayerSupportPromptTelemetryModule.log({
				action = PlayerSupportPromptTelemetryModule.Action.ReportAbuseClicked,
				category = Category,
				shareUserId = IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1,
				descriptionLength = #Description
			})
		end
		pcall(function()
			local SocialService = game:GetService("SocialService")
			
			if SocialService.SignalFeedbackSubmissionPermissionDenied then
				SocialService:SignalFeedbackSubmissionPermissionDenied()
			end
		end)
		p2.onFormAbandoned()
		p2.closePrompt()
		pcall(function()
			local RobloxGui = game:GetService("CoreGui"):FindFirstChild("RobloxGui")
			local Modules = RobloxGui and RobloxGui:FindFirstChild("Modules") or nil
			local Settings = Modules and Modules:FindFirstChild("Settings") or nil
			local SettingsHub = Settings and Settings:FindFirstChild("SettingsHub") or nil
			
			if SettingsHub then
				local Module = require(SettingsHub)
				Module:SetVisibility(true, false, Module.Instance.ReportAbusePage)
				
				return
			end
		end)
	end, if FFlagPlayerSupportPromptEventIngestModule then {
		Category,
		IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1,
		Description,
		p2.closePrompt,
		p2.onFormAbandoned
	} else { p2.closePrompt, p2.onFormAbandoned })
	UseEscapeDismissModule("PlayerSupportPromptCancel", if FFlagEnablePlayerSupportCaptureAttachmentsModule then ReactModule.useCallback(function()
		-- upvalues: Capture (ref), Callback2 (ref), v3 (ref), Callback1 (ref), UseResult5 (copy)
		if Capture then
			Callback2(nil)
			
			return
		end
		if v3 then
			Callback1(false)
			
			return
		else
			UseResult5()
		end
	end, { Capture, v3, UseResult5 }) else UseResult5)
	local CreateElementFunction = ReactModule.createElement
	local Root = Dialog.Root
	local config1 = { hasBackdrop = true, onClose = UseResult4 }
	local config2 = {
		Title = ReactModule.createElement(Dialog.Title, {
			text = if FFlagEnablePlayerSupportCaptureAttachmentsModule and v3 and Capture ~= nil then if Capture.CaptureTime == nil then UseLocalizationResult.CapturesAdd else v5.dateTime elseif FFlagEnablePlayerSupportCaptureAttachmentsModule and v3 then UseLocalizationResult.CapturesAdd else UseLocalizationResult.Title
		}),
		Content = if FFlagEnablePlayerSupportCaptureAttachmentsModule and v3 then ReactModule.createElement(Dialog.Content, { LayoutOrder = 1 }, {
			PickerBody = if Capture == nil then ReactModule.createElement(CapturePickerGridModule, {
				maxSelections = 5,
				captures = v2.captures,
				isLoading = v2.isLoading,
				hasMore = v2.hasMore,
				selectedKeys = SelectedKeys,
				onToggle = UseResult1,
				onPreview = function(p3)
					-- upvalues: Callback2 (ref)
					Callback2(p3)
				end,
				onLoadMore = v2.loadMore
			}) else ReactModule.createElement(CapturePickerPreviewModule, { capture = Capture })
		}) else ReactModule.createElement(Dialog.Content, { LayoutOrder = 1 }, {
			Body = ReactModule.createElement(View, {
				tag = "col gap-medium size-full-0 auto-y",
				padding = {
					top = UDim.new(0, -(UseTokensResult.Gap.XLarge - UseTokensResult.Gap.Large))
				}
			}, {
				ReportAbuseRow = ReactModule.createElement(View, { tag = "row gap-small auto-y", LayoutOrder = 0 }, {
					Lead = ReactModule.createElement(Text, {
						tag = "auto-xy",
						LayoutOrder = 1,
						Text = UseLocalizationResult.ReportAbuseLead
					}),
					Link = ReactModule.createElement(Text, {
						RichText = true,
						tag = "auto-xy",
						LayoutOrder = 2,
						Text = UseLocalizationResult.ReportAbuseLink,
						onActivated = UseResult6,
						selection = { Selectable = true }
					})
				}),
				CategorySection = ReactModule.createElement(View, {
					tag = "col gap-small size-full-0 auto-y",
					LayoutOrder = 1
				}, {
					Label = ReactModule.createElement(Text, {
						tag = "size-0 auto-xy text-title-medium text-wrap text-align-x-left text-align-y-top",
						LayoutOrder = 1,
						Text = UseLocalizationResult.CategoryLabel,
						textStyle = UseTokensResult.Color.Content.Emphasis
					}),
					DropdownBorder = ReactModule.createElement(View, {
						tag = "radius-medium",
						LayoutOrder = 2,
						Size = UDim2.new(1, -UseTokensResult.Stroke.Standard * 2, 0, 0),
						Position = UDim2.new(0, UseTokensResult.Stroke.Standard, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						stroke = {
							Color = UseTokensResult.Color.Stroke.Default.Color3,
							Thickness = UseTokensResult.Stroke.Standard,
							Transparency = UseTokensResult.Color.Stroke.Default.Transparency
						},
						cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
					}, {
						Dropdown = ReactModule.createElement(Dropdown.Root, {
							label = "",
							value = if Category == "" then nil else Category,
							placeholder = UseLocalizationResult.CategoryPlaceholder,
							items = List,
							size = InputSize.Medium,
							variant = InputVariant.Utility,
							width = UDim.new(1, 0),
							onItemChanged = function(p3)
								-- upvalues: SetCategoryFunction (copy)
								SetCategoryFunction((tostring(p3)))
							end
						})
					})
				}),
				Description = ReactModule.createElement(View, {
					tag = "col gap-small size-full-0 auto-y",
					LayoutOrder = 2,
					GroupTransparency = if Category == "" then 0.75 else 0
				}, {
					Label = ReactModule.createElement(Text, {
						tag = "size-0 auto-xy text-title-medium text-wrap text-align-x-left text-align-y-top",
						LayoutOrder = 1,
						Text = UseLocalizationResult.DescriptionLabel,
						textStyle = UseTokensResult.Color.Content.Emphasis
					}),
					InputBorderSlot = ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
						InputBorder = ReactModule.createElement(View, {
							tag = "radius-medium",
							Size = UDim2.new(1, -UseTokensResult.Stroke.Standard * 2, 0, 0),
							Position = UDim2.new(0, UseTokensResult.Stroke.Standard, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							stroke = {
								Color = UseTokensResult.Color.Stroke.Default.Color3,
								Thickness = UseTokensResult.Stroke.Standard,
								Transparency = UseTokensResult.Color.Stroke.Default.Transparency
							},
							cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
						}, {
							Input = ReactModule.createElement(TextArea, {
								label = "",
								hint = "",
								numLines = 4,
								text = Description,
								onChanged = SetDescription,
								placeholder = config[Category] or "",
								width = UDim.new(1, 0),
								variant = InputVariant.Utility,
								size = InputSize.Medium,
								isDisabled = Category == ""
							})
						})
					}),
					Hint = ReactModule.createElement(Text, {
						tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-left text-align-y-top",
						LayoutOrder = 3,
						Text = UseLocalizationResult.DescriptionHint,
						textStyle = UseTokensResult.Color.Content.Emphasis
					})
				}),
				CapturesSection = if FFlagEnablePlayerSupportCaptureAttachmentsModule then ReactModule.createElement(MemoResult, {
					maxSelections = 5,
					uploadStatuses = v1.uploadStatuses,
					category = Category,
					onCaptureRemoved = v1.onCaptureRemoved,
					onPickerOpen = UseResult
				}) else nil,
				ShareCheckboxRow = ReactModule.createElement(View, {
					tag = "col gap-xsmall size-full-0 auto-y",
					LayoutOrder = if FFlagEnablePlayerSupportCaptureAttachmentsModule then 4 else 3
				}, {
					Checkbox = ReactModule.createElement(Checkbox, {
						LayoutOrder = 1,
						label = if IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry then UseLocalizationResult.ShareUserIdLabelRequired else UseLocalizationResult.ShareUserIdLabel,
						isChecked = IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry1,
						isDisabled = IsPLAYERSUPPORTCATEGORIESREQUIRINGUSERIDEntry,
						onActivated = function(p3)
							-- upvalues: SetShareUserIdFunction (copy)
							SetShareUserIdFunction(p3)
						end,
						size = InputSize.Medium
					}),
					HintRow = ReactModule.createElement(View, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 2,
						padding = {
							left = UDim.new(0, UseTokensResult.Size.Size_600 + UseTokensResult.Gap.Medium)
						}
					}, {
						Hint = ReactModule.createElement(Text, {
							tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
							Text = UseLocalizationResult.ShareUserIdHint
						})
					})
				})
			})
		})
	}
	local Element = nil
	
	if FFlagEnablePlayerSupportCaptureAttachmentsModule and v3 then
		local CreateElementFunction1 = ReactModule.createElement
		local Actions = Dialog.Actions
		local config3 = { LayoutOrder = 2 }
		local Actions1 = nil
		
		if Capture == nil then
			Actions1 = {
				{
					text = UseLocalizationResult.Add,
					variant = if Count > 0 then ButtonVariant.Emphasis else ButtonVariant.Standard,
					isDisabled = Count == 0 and not next(v1.uploadStatuses),
					onActivated = OnActivated
				},
				{
					text = UseLocalizationResult.Cancel,
					variant = ButtonVariant.Standard,
					onActivated = function()
						-- upvalues: Callback1 (ref)
						Callback1(false)
					end
				}
			}
		else
			local IsSelectedKey = SelectedKeys[GetCaptureKeyModule(Capture)] == true
			local IsSelectedKey1: boolean = IsSelectedKey or not v4
			Actions1 = {
				{
					text = if IsSelectedKey then UseLocalizationResult.Deselect else UseLocalizationResult.Select,
					variant = if IsSelectedKey then ButtonVariant.SoftEmphasis elseif IsSelectedKey1 then ButtonVariant.Emphasis else ButtonVariant.Standard,
					isDisabled = not IsSelectedKey1 and not IsSelectedKey,
					onActivated = function()
						-- upvalues: UseResult1 (ref), Capture (ref), Callback2 (ref)
						UseResult1(Capture)
						Callback2(nil)
					end
				},
				{
					text = UseLocalizationResult.Cancel,
					variant = ButtonVariant.Standard,
					onActivated = function()
						-- upvalues: Callback2 (ref)
						Callback2(nil)
					end
				}
			}
		end
		config3.actions = Actions1
		Element = CreateElementFunction1(Actions, config3)
	else
		Element = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 2,
			actions = {
				{
					text = UseLocalizationResult.Send,
					variant = if NoV47 then ButtonVariant.Emphasis else ButtonVariant.Standard,
					onActivated = UseResult2,
					isDisabled = not NoV47
				}
			}
		})
	end
	config2.Actions = Element
	
	return CreateElementFunction(Root, config1, config2)
end))