local coreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local parent = coreScriptsPlayerFeedback.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local button = foundationModule.Button
local checkbox = foundationModule.Checkbox
local dropdown = foundationModule.Dropdown
local icon = foundationModule.Icon
local textArea = foundationModule.TextArea
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local inputVariant = foundationModule.Enums.InputVariant
local useTokens = foundationModule.Hooks.useTokens
local builderIconsModule = require(parent.BuilderIcons)
local iconVariant = builderIconsModule.IconVariant
local useLocalization = require(parent.Localization).Hooks.useLocalization
local constantsModule = require(coreScriptsPlayerFeedback.constants)
local useEscapeDismissModule = require(coreScriptsPlayerFeedback.Hooks.useEscapeDismiss)
local fFlagEnablePlayerSupportCaptureAttachmentsModule = require(coreScriptsPlayerFeedback.Flags.FFlagEnablePlayerSupportCaptureAttachments)
local _ = require(coreScriptsPlayerFeedback.CaptureTypes)
local useCaptureUploadsModule = require(coreScriptsPlayerFeedback.Hooks.useCaptureUploads)
local useGalleryCapturesModule = require(coreScriptsPlayerFeedback.Hooks.useGalleryCaptures)
local capturePreviewTileModule = require(coreScriptsPlayerFeedback.Components.CapturePreviewTile)
local capturePickerGridModule = require(coreScriptsPlayerFeedback.Components.CapturePickerGrid)
local capturePickerPreviewModule = require(coreScriptsPlayerFeedback.Components.CapturePickerPreview)
local getCaptureKeyModule = require(coreScriptsPlayerFeedback.Utils.getCaptureKey)
local var13 = reactModule.memo(function(p0) --[[ line: 52 ]]
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), capturePreviewTileModule (ref), icon (ref), builderIconsModule (ref), iconSize (ref), iconVariant (ref), text (ref), view (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local var15 = useTokens()
	local var16 = 0
	
	for i in p0.uploadStatuses do
		var16 += 1
	end
	local var17 = var16 > 0
	local var18 = useLocalization({
		CapturesAdd = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Add",
		CapturesHint = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Hint",
		CapturesEditSelection = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.EditSelection",
		CapturesUploadError = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.UploadError",
		CapturesHeading = {
			"CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Heading",
			count = tostring(var16),
			max = tostring(p0.maxSelections)
		}
	})
	local t = {
		UIGridLayout = reactModule.createElement("UIGridLayout", {
			CellPadding = UDim2.new(0, 6, 0, 6),
			CellSize = UDim2.new(0, 80, 0, 80),
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 2),
			PaddingBottom = UDim.new(0, 2),
			PaddingLeft = UDim.new(0, 2),
			PaddingRight = UDim.new(0, 2)
		})
	}
	local t_1 = {}
	
	for i_1, v in p0.uploadStatuses do
		table.insert(t_1, { key = i_1, captureStatus = v })
	end
	table.sort(t_1, function(p1, p2) --[[ line: 98 ]]
		return (p1.captureStatus.order or 0) < (p2.captureStatus.order or 0)
	end)
	local var21 = 0
	
	for i_2, v_1 in t_1 do
		var21 += 1
		local key = v_1.key
		t[v_1.key] = reactModule.createElement(capturePreviewTileModule, {
			capture = v_1.captureStatus.capture,
			status = v_1.captureStatus.status,
			failureReason = v_1.captureStatus.failureReason,
			layoutOrder = var21,
			onRemove = function() --[[ line: 110 ]]
				-- upvalues: p0 (ref), key (ref)
				p0.onCaptureRemoved(key)
			end
		})
	end
	if var17 then
		t.EditSelectionButton = reactModule.createElement("ImageButton", {
			BackgroundColor3 = var15.Color.Surface.Surface_300.Color3,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Image = "",
			LayoutOrder = var21 + 1,
			Size = UDim2.new(0, 80, 0, 80),
			[reactModule.Event.Activated] = p0.onPickerOpen
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 4),
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			ImageIcon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = builderIconsModule.Icon.Image,
				size = iconSize.Medium,
				variant = iconVariant.Filled,
				style = { Color3 = var15.Color.Content.Muted.Color3 }
			}),
			Label = reactModule.createElement(text, {
				tag = "auto-xy text-caption-small text-wrap content-muted",
				LayoutOrder = 2,
				Text = var18.CapturesEditSelection
			})
		})
	end
	local var22 = false
	
	for i_3, v_2 in p0.uploadStatuses do
		if v_2.status == "failed" and v_2.failureReason ~= Enum.UploadCaptureResult.CaptureModerated then
			var22 = true
		end
	end
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = 3,
		GroupTransparency = if p0.category == "" then 0.75 else 0,
		padding = { top = UDim.new(0, 4), bottom = UDim.new(0, 4) }
	}, {
		Heading = if var17 then reactModule.createElement(text, {
			tag = "size-0 auto-xy text-title-medium text-wrap text-align-x-left text-align-y-top",
			LayoutOrder = 1,
			Text = var18.CapturesHeading,
			textStyle = var15.Color.Content.Emphasis
		}) else nil,
		PreviewGrid = if var17 then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, t) else nil,
		ErrorHint = if var22 then reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-left content-alert",
			LayoutOrder = 3,
			Text = var18.CapturesUploadError
		}) else nil,
		EmptyRow = if not var17 then reactModule.createElement(view, {
			tag = "row align-y-center gap-medium size-full-0 auto-y",
			LayoutOrder = 2
		}, {
			AddButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				text = var18.CapturesAdd,
				variant = buttonVariant.Standard,
				size = inputSize.Medium,
				onActivated = p0.onPickerOpen,
				isDisabled = p0.category == ""
			}),
			Hint = reactModule.createElement(text, {
				tag = "fill size-full-0 text-body-medium text-wrap text-align-x-left content-muted",
				LayoutOrder = 2,
				Text = var18.CapturesHint
			})
		}) else nil
	})
end)
local t = {
	TICKET_CATEGORY_DATA_RESTORE_REQUEST = true,
	TICKET_CATEGORY_PURCHASING_ISSUE = true
}

return reactModule.memo(function(p3) --[[ line: 256 ]]
	-- upvalues: useTokens (ref), fFlagEnablePlayerSupportCaptureAttachmentsModule (ref), useCaptureUploadsModule (ref), useGalleryCapturesModule (ref), reactModule (ref), constantsModule (ref), useLocalization (ref), t (ref), getCaptureKeyModule (ref), useEscapeDismissModule (ref), dialog (ref), capturePickerPreviewModule (ref), capturePickerGridModule (ref), view (ref), text (ref), dropdown (ref), inputSize (ref), inputVariant (ref), textArea (ref), var13 (ref), checkbox (ref), buttonVariant (ref)
	local var23 = useTokens()
	local description = p3.description
	local setDescription = p3.setDescription
	local category = p3.category
	local setCategory = p3.setCategory
	local shareUserId = p3.shareUserId
	local setShareUserId = p3.setShareUserId
	local var24 = nil
	local var25 = nil
	local var26 = nil
	local var27 = nil
	local var28 = nil
	local var29 = nil
	local var30 = nil
	local var31 = nil
	
	if fFlagEnablePlayerSupportCaptureAttachmentsModule then
		var24 = useCaptureUploadsModule()
		var25 = useGalleryCapturesModule()
		local var32, var33 = reactModule.useState(false)
		var26 = var32
		var27 = var33
		local var34, var35 = reactModule.useState({})
		var28 = var34
		var29 = var35
		local var36, var37 = reactModule.useState(nil)
		var30 = var36
		var31 = var37
	end
	local MIN_FEEDBACK_LENGTH = constantsModule.MIN_FEEDBACK_LENGTH
	local MAX_PLAYER_SUPPORT_LENGTH = constantsModule.MAX_PLAYER_SUPPORT_LENGTH
	local var38 = useLocalization({
		Title = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Title",
		ReportAbuseLead = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.ReportAbuse.Lead",
		ReportAbuseLink = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.ReportAbuse.Link",
		CategoryLabel = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Category.Label",
		CategoryPlaceholder = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Category.Placeholder",
		CategoryItemBugReport = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Category.BugReport",
		CategoryItemDataRestoreRequest = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Category.DataRestoreRequest",
		CategoryItemPurchasingIssue = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Category.PurchasingIssue",
		CategoryItemOther = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Category.Other",
		DescriptionLabel = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Description.Label",
		DescriptionPlaceholderBugReport = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Placeholder.BugReport",
		DescriptionPlaceholderDataRestoreRequest = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Placeholder.DataRestoreRequest",
		DescriptionPlaceholderPurchasingIssue = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Placeholder.PurchasingIssue",
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
			MAX = tostring(MAX_PLAYER_SUPPORT_LENGTH)
		}
	})
	local list = {
		{
			id = "TICKET_CATEGORY_BUG_REPORT",
			text = var38.CategoryItemBugReport
		},
		{
			id = "TICKET_CATEGORY_DATA_RESTORE_REQUEST",
			text = var38.CategoryItemDataRestoreRequest
		},
		{
			id = "TICKET_CATEGORY_PURCHASING_ISSUE",
			text = var38.CategoryItemPurchasingIssue
		},
		{
			id = "TICKET_CATEGORY_OTHER",
			text = var38.CategoryItemOther
		}
	}
	local t_1 = {
		TICKET_CATEGORY_BUG_REPORT = var38.DescriptionPlaceholderBugReport,
		TICKET_CATEGORY_DATA_RESTORE_REQUEST = var38.DescriptionPlaceholderDataRestoreRequest,
		TICKET_CATEGORY_PURCHASING_ISSUE = var38.DescriptionPlaceholderPurchasingIssue,
		TICKET_CATEGORY_OTHER = var38.DescriptionPlaceholderOther
	}
	local var41 = t[category] == true
	local var41_1 = var41 or shareUserId
	local _ = {}
	local var43 = 0
	local var44 = false
	local var45 = nil
	local var46 = nil
	local var47 = nil
	
	if fFlagEnablePlayerSupportCaptureAttachmentsModule then
		var45 = reactModule.useCallback(function() --[[ line: 349 ]]
			-- upvalues: category (ref), var27 (write)
			if category == "" then
				return
			end
			var27(true)
		end, { category })
		reactModule.useEffect(function() --[[ line: 356 ]]
			-- upvalues: var26 (write), var29 (write), var31 (write), var24 (write), var25 (write)
			if not var26 then
				var29({})
				var31(nil)
				
				return
			end
			local t = {}
			
			for i in var24.uploadStatuses do
				t[i] = true
			end
			var29(t)
			var31(nil)
			var25.load()
		end, { var26 })
		local var48 = reactModule.useMemo(function() --[[ line: 372 ]]
			-- upvalues: var25 (write), var28 (write), getCaptureKeyModule (copy)
			local t = {}
			
			for i, v in var25.captures do
				if var28[getCaptureKeyModule(v)] then
					table.insert(t, v)
				end
			end
			return t
		end, { var25.captures, var28 })
		var43 = #var48
		var44 = var43 >= 5
		var46 = reactModule.useCallback(function(p4) --[[ line: 385 ]]
			-- upvalues: getCaptureKeyModule (copy), var29 (write), var44 (write)
			local var58 = getCaptureKeyModule(p4)
			var29(function(p5) --[[ line: 387 ]]
				-- upvalues: var58 (ref), var44 (copy)
				local var59 = p5[var58] == true
				
				if not var59 and var44 then
					return p5
				end
				local cloned = table.clone(p5)
				
				if var59 then
					cloned[var58] = nil
					
					return cloned
				end
				cloned[var58] = true
				
				return cloned
			end)
		end, { var44 })
		local var49 = next(var24.uploadStatuses) ~= nil
		
		var47 = function() --[[ line: 403 ]]
			-- upvalues: var43 (write), var49 (ref), var24 (write), var48 (write), var27 (write)
			if var43 == 0 and not var49 then
				return
			end
			var24.onCapturesAdded(var48)
			var27(false)
		end
	end
	local var50 = nil
	
	if fFlagEnablePlayerSupportCaptureAttachmentsModule then
		local var51 = if var30 then var30.CaptureTime else nil
		local robloxLocaleId = game:GetService("LocalizationService").RobloxLocaleId
		var50 = useLocalization({
			dateTime = {
				"CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Picker.DateTime",
				date = if var51 then var51:FormatLocalTime("L", robloxLocaleId) else "",
				time = if var51 then var51:FormatLocalTime("LT", robloxLocaleId) else ""
			}
		})
	end
	local var52 = MIN_FEEDBACK_LENGTH <= #description and (#description <= MAX_PLAYER_SUPPORT_LENGTH and (category ~= "" and (var24 and (not var24.anyUploading and (not var24 or not var24.hasNonModerationFailure)))))
	local var53 = reactModule.useCallback(function() --[[ line: 432 ]]
		-- upvalues: var52 (ref), description (ref), category (ref), var41_1 (ref), fFlagEnablePlayerSupportCaptureAttachmentsModule (copy), var24 (write), p3 (ref)
		if var52 then
			pcall(function() --[[ line: 436 ]]
				-- upvalues: description (copy), category (copy), var41_1 (copy), fFlagEnablePlayerSupportCaptureAttachmentsModule (copy), var24 (copy)
				local socialService = game:GetService("SocialService")
				
				if socialService.SignalFeedbackSubmissionCompleted then
					local t = {
						Description = description,
						Category = category,
						ShareUserIdPreference = if var41_1 then "SHARE_USER_ID_PREFERENCE_SHARE" else "SHARE_USER_ID_PREFERENCE_DO_NOT_SHARE"
					}
					
					if fFlagEnablePlayerSupportCaptureAttachmentsModule then
						local t_1 = {}
						
						for i, v in var24.uploadStatuses do
							if v.status == "succeeded" and v.assetId ~= nil then
								table.insert(t_1, v.assetId)
							end
						end
						if #t_1 > 0 then
							t.AssetIds = t_1
						end
					end
					socialService:SignalFeedbackSubmissionCompleted("", t)
				end
			end)
			p3.closePrompt()
			
			return
		end
	end, {
		description, category, var41_1, var52, var24 or false, p3.closePrompt
	})
	local var54 = reactModule.useCallback(function() --[[ line: 469 ]]
		-- upvalues: p3 (ref)
		pcall(function() --[[ line: 470 ]]
			local socialService = game:GetService("SocialService")
			
			if socialService.SignalFeedbackSubmissionPermissionDenied then
				socialService:SignalFeedbackSubmissionPermissionDenied()
			end
		end)
		p3.onFormAbandoned()
		p3.closePrompt()
	end, { p3.closePrompt, p3.onFormAbandoned })
	local var55 = reactModule.useCallback(function() --[[ line: 485 ]]
		-- upvalues: p3 (ref)
		pcall(function() --[[ line: 486 ]]
			local socialService = game:GetService("SocialService")
			
			if socialService.SignalFeedbackSubmissionPermissionDenied then
				socialService:SignalFeedbackSubmissionPermissionDenied()
			end
		end)
		p3.onFormAbandoned()
		p3.closePrompt()
		pcall(function() --[[ line: 494 ]]
			local robloxGui = game:GetService("CoreGui"):FindFirstChild("RobloxGui")
			local modules = robloxGui and robloxGui:FindFirstChild("Modules") or nil
			local settings = modules and modules:FindFirstChild("Settings") or nil
			local settingsHub = settings and settings:FindFirstChild("SettingsHub") or nil
			
			if settingsHub then
				local unknownModule = require(settingsHub)
				unknownModule:SetVisibility(true, false, unknownModule.Instance.ReportAbusePage)
				
				return
			end
		end)
	end, { p3.closePrompt, p3.onFormAbandoned })
	useEscapeDismissModule("PlayerSupportPromptCancel", if fFlagEnablePlayerSupportCaptureAttachmentsModule then reactModule.useCallback(function() --[[ line: 509 ]]
		-- upvalues: var30 (write), var31 (write), var26 (write), var27 (write), var54 (ref)
		if var30 then
			var31(nil)
			
			return
		elseif var26 then
			var27(false)
			
			return
		end
		var54()
	end, { var30, var26, var54 }) else var54)
	
	return reactModule.createElement(dialog.Root, { hasBackdrop = true, onClose = var54 }, {
		Title = reactModule.createElement(dialog.Title, {
			text = if fFlagEnablePlayerSupportCaptureAttachmentsModule and var26 and var30 ~= nil then if var30.CaptureTime ~= nil then var38.CapturesAdd else var50.dateTime elseif fFlagEnablePlayerSupportCaptureAttachmentsModule and var26 then var38.CapturesAdd else var38.Title
		}),
		Content = if fFlagEnablePlayerSupportCaptureAttachmentsModule and var26 then reactModule.createElement(dialog.Content, { LayoutOrder = 1 }, {
			PickerBody = if var30 ~= nil then reactModule.createElement(capturePickerGridModule, {
				maxSelections = 5,
				captures = var25.captures,
				isLoading = var25.isLoading,
				hasMore = var25.hasMore,
				selectedKeys = var28,
				onToggle = var46,
				onPreview = function(p8) --[[ line: 550 ]]
					-- upvalues: var31 (write)
					var31(p8)
				end,
				onLoadMore = var25.loadMore
			}) else reactModule.createElement(capturePickerPreviewModule, { capture = var30 })
		}) else reactModule.createElement(dialog.Content, { LayoutOrder = 1 }, {
			Body = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y",
				padding = { top = UDim.new(0, -(var23.Gap.XLarge - var23.Gap.Large)) }
			}, {
				ReportAbuseRow = reactModule.createElement(view, { tag = "row gap-small auto-y", LayoutOrder = 0 }, {
					Lead = reactModule.createElement(text, {
						tag = "auto-xy",
						LayoutOrder = 1,
						Text = var38.ReportAbuseLead
					}),
					Link = reactModule.createElement(text, {
						RichText = true,
						tag = "auto-xy",
						LayoutOrder = 2,
						Text = var38.ReportAbuseLink,
						onActivated = var55,
						selection = { Selectable = true }
					})
				}),
				CategorySection = reactModule.createElement(view, {
					tag = "col gap-small size-full-0 auto-y",
					LayoutOrder = 1
				}, {
					Label = reactModule.createElement(text, {
						tag = "size-0 auto-xy text-title-medium text-wrap text-align-x-left text-align-y-top",
						LayoutOrder = 1,
						Text = var38.CategoryLabel,
						textStyle = var23.Color.Content.Emphasis
					}),
					DropdownBorder = reactModule.createElement(view, {
						tag = "radius-medium",
						LayoutOrder = 2,
						Size = UDim2.new(1, -var23.Stroke.Standard * 2, 0, 0),
						Position = UDim2.new(0, var23.Stroke.Standard, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						stroke = {
							Color = var23.Color.Stroke.Default.Color3,
							Thickness = var23.Stroke.Standard,
							Transparency = var23.Color.Stroke.Default.Transparency
						},
						cornerRadius = UDim.new(0, var23.Radius.Medium)
					}, {
						Dropdown = reactModule.createElement(dropdown.Root, {
							label = "",
							value = if category ~= "" then nil else category,
							placeholder = var38.CategoryPlaceholder,
							items = list,
							size = inputSize.Medium,
							variant = inputVariant.Utility,
							width = UDim.new(1, 0),
							onItemChanged = function(p6) --[[ line: 613 ]]
								-- upvalues: setCategory (ref)
								setCategory(tostring(p6))
							end
						})
					})
				}),
				Description = reactModule.createElement(view, {
					tag = "col gap-small size-full-0 auto-y",
					LayoutOrder = 2,
					GroupTransparency = if category == "" then 0.75 else 0
				}, {
					Label = reactModule.createElement(text, {
						tag = "size-0 auto-xy text-title-medium text-wrap text-align-x-left text-align-y-top",
						LayoutOrder = 1,
						Text = var38.DescriptionLabel,
						textStyle = var23.Color.Content.Emphasis
					}),
					InputBorderSlot = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
						InputBorder = reactModule.createElement(view, {
							tag = "radius-medium",
							Size = UDim2.new(1, -var23.Stroke.Standard * 2, 0, 0),
							Position = UDim2.new(0, var23.Stroke.Standard, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							stroke = {
								Color = var23.Color.Stroke.Default.Color3,
								Thickness = var23.Stroke.Standard,
								Transparency = var23.Color.Stroke.Default.Transparency
							},
							cornerRadius = UDim.new(0, var23.Radius.Medium)
						}, {
							Input = reactModule.createElement(textArea, {
								label = "",
								hint = "",
								numLines = 4,
								text = description,
								onChanged = setDescription,
								placeholder = t_1[category] or "",
								width = UDim.new(1, 0),
								variant = inputVariant.Utility,
								size = inputSize.Medium,
								isDisabled = category == ""
							})
						})
					}),
					Hint = reactModule.createElement(text, {
						tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-left text-align-y-top",
						LayoutOrder = 3,
						Text = var38.DescriptionHint,
						textStyle = var23.Color.Content.Emphasis
					})
				}),
				CapturesSection = if fFlagEnablePlayerSupportCaptureAttachmentsModule then reactModule.createElement(var13, {
					maxSelections = 5,
					uploadStatuses = var24.uploadStatuses,
					category = category,
					onCaptureRemoved = var24.onCaptureRemoved,
					onPickerOpen = var45
				}) else nil,
				ShareCheckboxRow = reactModule.createElement(view, {
					tag = "col gap-xsmall size-full-0 auto-y",
					LayoutOrder = if fFlagEnablePlayerSupportCaptureAttachmentsModule then 4 else 3
				}, {
					Checkbox = reactModule.createElement(checkbox, {
						LayoutOrder = 1,
						label = if var41 then var38.ShareUserIdLabelRequired else var38.ShareUserIdLabel,
						isChecked = var41_1,
						isDisabled = var41,
						onActivated = function(p7) --[[ line: 689 ]]
							-- upvalues: setShareUserId (ref)
							setShareUserId(p7)
						end,
						size = inputSize.Medium
					}),
					HintRow = reactModule.createElement(view, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 2,
						padding = {
							left = UDim.new(0, var23.Size.Size_600 + var23.Gap.Medium)
						}
					}, {
						Hint = reactModule.createElement(text, {
							tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
							Text = var38.ShareUserIdHint
						})
					})
				})
			})
		}),
		Actions = if fFlagEnablePlayerSupportCaptureAttachmentsModule and var26 then reactModule.createElement(dialog.Actions, {
			LayoutOrder = 2,
			actions = if var30 ~= nil then {
				{
					text = var38.Add,
					variant = if var43 > 0 then buttonVariant.Emphasis else buttonVariant.Standard,
					isDisabled = var43 == 0 and not next(var24.uploadStatuses),
					onActivated = var47
				},
				{
					text = var38.Cancel,
					variant = buttonVariant.Standard,
					onActivated = function() --[[ line: 751 ]]
						-- upvalues: var27 (write)
						var27(false)
					end
				}
			} else (function() --[[ line: 713 ]]
				-- upvalues: getCaptureKeyModule (copy), var30 (write), var28 (write), var44 (write), var38 (ref), buttonVariant (copy), var46 (write), var31 (write)
				local var71 = var28[getCaptureKeyModule(var30)] == true
				local var71_1 = var71 or not var44
				
				return {
					{
						text = if var71 then var38.Deselect else var38.Select,
						variant = if var71 then buttonVariant.SoftEmphasis elseif var71_1 then buttonVariant.Emphasis else buttonVariant.Standard,
						isDisabled = not var71_1 and not var71,
						onActivated = function() --[[ line: 725 ]]
							-- upvalues: var46 (copy), var30 (copy), var31 (copy)
							var46(var30)
							var31(nil)
						end
					},
					{
						text = var38.Cancel,
						variant = buttonVariant.Standard,
						onActivated = function() --[[ line: 733 ]]
							-- upvalues: var31 (copy)
							var31(nil)
						end
					}
				}
			end)()
		}) else reactModule.createElement(dialog.Actions, {
			LayoutOrder = 2,
			actions = {
				{
					text = var38.Send,
					variant = if var52 then buttonVariant.Emphasis else buttonVariant.Standard,
					onActivated = var53,
					isDisabled = not var52
				}
			}
		})
	})
end)