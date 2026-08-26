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
local var1 = reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), capturePreviewTileModule (ref), icon (ref), builderIconsModule (ref), iconSize (ref), iconVariant (ref), text (ref), view (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local var2 = useTokens()
	local var3 = 0
	
	for i in p1.uploadStatuses do
		var3 += 1
	end
	local var4 = var3 > 0
	local var5 = useLocalization({
		CapturesAdd = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Add",
		CapturesHint = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Hint",
		CapturesEditSelection = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.EditSelection",
		CapturesUploadError = "CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.UploadError",
		CapturesHeading = {
			"CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Heading",
			count = tostring(var3),
			max = tostring(p1.maxSelections)
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
	
	for i_1, v in p1.uploadStatuses do
		table.insert(t_1, { key = i_1, captureStatus = v })
	end
	table.sort(t_1, function(p2, p3)
		return (p2.captureStatus.order or 0) < (p3.captureStatus.order or 0)
	end)
	local var6 = 0
	
	for i_2, v_1 in t_1 do
		var6 += 1
		local key = v_1.key
		t[v_1.key] = reactModule.createElement(capturePreviewTileModule, {
			capture = v_1.captureStatus.capture,
			status = v_1.captureStatus.status,
			failureReason = v_1.captureStatus.failureReason,
			layoutOrder = var6,
			onRemove = function()
				-- upvalues: p1 (ref), key (ref)
				p1.onCaptureRemoved(key)
			end
		})
	end
	if var4 then
		t.EditSelectionButton = reactModule.createElement("ImageButton", {
			BackgroundColor3 = var2.Color.Surface.Surface_300.Color3,
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Image = "",
			LayoutOrder = var6 + 1,
			Size = UDim2.new(0, 80, 0, 80),
			[reactModule.Event.Activated] = p1.onPickerOpen
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
				style = { Color3 = var2.Color.Content.Muted.Color3 }
			}),
			Label = reactModule.createElement(text, {
				tag = "auto-xy text-caption-small text-wrap content-muted",
				LayoutOrder = 2,
				Text = var5.CapturesEditSelection
			})
		})
	end
	local var7 = false
	
	for i_3, v_2 in p1.uploadStatuses do
		if v_2.status == "failed" and v_2.failureReason ~= Enum.UploadCaptureResult.CaptureModerated then
			var7 = true
		end
	end
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = 3,
		GroupTransparency = if p1.category == "" then 0.75 else 0,
		padding = { top = UDim.new(0, 4), bottom = UDim.new(0, 4) }
	}, {
		Heading = if var4 then reactModule.createElement(text, {
			tag = "size-0 auto-xy text-title-medium text-wrap text-align-x-left text-align-y-top",
			LayoutOrder = 1,
			Text = var5.CapturesHeading,
			textStyle = var2.Color.Content.Emphasis
		}) else nil,
		PreviewGrid = if var4 then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, t) else nil,
		ErrorHint = if var7 then reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-caption-small text-wrap text-align-x-left content-alert",
			LayoutOrder = 3,
			Text = var5.CapturesUploadError
		}) else nil,
		EmptyRow = if not var4 then reactModule.createElement(view, {
			tag = "row align-y-center gap-medium size-full-0 auto-y",
			LayoutOrder = 2
		}, {
			AddButton = reactModule.createElement(button, {
				LayoutOrder = 1,
				text = var5.CapturesAdd,
				variant = buttonVariant.Standard,
				size = inputSize.Medium,
				onActivated = p1.onPickerOpen,
				isDisabled = p1.category == ""
			}),
			Hint = reactModule.createElement(text, {
				tag = "fill size-full-0 text-body-medium text-wrap text-align-x-left content-muted",
				LayoutOrder = 2,
				Text = var5.CapturesHint
			})
		}) else nil
	})
end)
local t = {
	TICKET_CATEGORY_DATA_RESTORE_REQUEST = true,
	TICKET_CATEGORY_PURCHASING_ISSUE = true
}

return reactModule.memo(function(p2)
	-- upvalues: useTokens (ref), fFlagEnablePlayerSupportCaptureAttachmentsModule (ref), useCaptureUploadsModule (ref), useGalleryCapturesModule (ref), reactModule (ref), constantsModule (ref), useLocalization (ref), t (ref), getCaptureKeyModule (ref), useEscapeDismissModule (ref), dialog (ref), capturePickerPreviewModule (ref), capturePickerGridModule (ref), view (ref), text (ref), dropdown (ref), inputSize (ref), inputVariant (ref), textArea (ref), var1 (ref), checkbox (ref), buttonVariant (ref)
	local var8 = useTokens()
	local description = p2.description
	local setDescription = p2.setDescription
	local category = p2.category
	local setCategory = p2.setCategory
	local shareUserId = p2.shareUserId
	local setShareUserId = p2.setShareUserId
	local var9 = nil
	local var10 = nil
	local var11 = nil
	local var12 = nil
	local var13 = nil
	local var14 = nil
	local var15 = nil
	local var16 = nil
	
	if fFlagEnablePlayerSupportCaptureAttachmentsModule then
		var9 = useCaptureUploadsModule()
		var10 = useGalleryCapturesModule()
		local var17, var18 = reactModule.useState(false)
		var11 = var17
		var12 = var18
		local var19, var20 = reactModule.useState({})
		var13 = var19
		var14 = var20
		local var21, var22 = reactModule.useState(nil)
		var15 = var21
		var16 = var22
	end
	local MIN_FEEDBACK_LENGTH = constantsModule.MIN_FEEDBACK_LENGTH
	local MAX_PLAYER_SUPPORT_LENGTH = constantsModule.MAX_PLAYER_SUPPORT_LENGTH
	local var23 = useLocalization({
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
			text = var23.CategoryItemBugReport
		},
		{
			id = "TICKET_CATEGORY_DATA_RESTORE_REQUEST",
			text = var23.CategoryItemDataRestoreRequest
		},
		{
			id = "TICKET_CATEGORY_PURCHASING_ISSUE",
			text = var23.CategoryItemPurchasingIssue
		},
		{
			id = "TICKET_CATEGORY_OTHER",
			text = var23.CategoryItemOther
		}
	}
	local t_1 = {
		TICKET_CATEGORY_BUG_REPORT = var23.DescriptionPlaceholderBugReport,
		TICKET_CATEGORY_DATA_RESTORE_REQUEST = var23.DescriptionPlaceholderDataRestoreRequest,
		TICKET_CATEGORY_PURCHASING_ISSUE = var23.DescriptionPlaceholderPurchasingIssue,
		TICKET_CATEGORY_OTHER = var23.DescriptionPlaceholderOther
	}
	local var24 = t[category] == true
	local var25 = var24 or shareUserId
	local _ = {}
	local var26 = 0
	local var27 = false
	local var28 = nil
	local var29 = nil
	local var30 = nil
	
	if fFlagEnablePlayerSupportCaptureAttachmentsModule then
		var28 = reactModule.useCallback(function()
			-- upvalues: category (ref), var12 (write)
			if category == "" then
				return
			end
			var12(true)
		end, { category })
		reactModule.useEffect(function()
			-- upvalues: var11 (write), var14 (write), var16 (write), var9 (write), var10 (write)
			if not var11 then
				var14({})
				var16(nil)
				
				return
			end
			local t = {}
			
			for i in var9.uploadStatuses do
				t[i] = true
			end
			var14(t)
			var16(nil)
			var10.load()
		end, { var11 })
		local var31 = reactModule.useMemo(function()
			-- upvalues: var10 (write), var13 (write), getCaptureKeyModule (copy)
			local t = {}
			
			for i, v in var10.captures do
				if var13[getCaptureKeyModule(v)] then
					table.insert(t, v)
				end
			end
			return t
		end, { var10.captures, var13 })
		var26 = #var31
		var27 = var26 >= 5
		var29 = reactModule.useCallback(function(p3)
			-- upvalues: getCaptureKeyModule (copy), var14 (write), var27 (write)
			local var32 = getCaptureKeyModule(p3)
			var14(function(p4)
				-- upvalues: var32 (ref), var27 (copy)
				local var33 = p4[var32] == true
				
				if not var33 and var27 then
					return p4
				end
				local cloned = table.clone(p4)
				
				if var33 then
					cloned[var32] = nil
					
					return cloned
				end
				cloned[var32] = true
				
				return cloned
			end)
		end, { var27 })
		local var32 = next(var9.uploadStatuses) ~= nil
		
		var30 = function()
			-- upvalues: var26 (write), var32 (ref), var9 (write), var31 (write), var12 (write)
			if var26 == 0 and not var32 then
				return
			end
			var9.onCapturesAdded(var31)
			var12(false)
		end
	end
	local var32 = nil
	
	if fFlagEnablePlayerSupportCaptureAttachmentsModule then
		local var33 = if var15 then var15.CaptureTime else nil
		local robloxLocaleId = game:GetService("LocalizationService").RobloxLocaleId
		var32 = useLocalization({
			dateTime = {
				"CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Captures.Picker.DateTime",
				date = if var33 then var33:FormatLocalTime("L", robloxLocaleId) else "",
				time = if var33 then var33:FormatLocalTime("LT", robloxLocaleId) else ""
			}
		})
	end
	local var34 = MIN_FEEDBACK_LENGTH <= #description and (#description <= MAX_PLAYER_SUPPORT_LENGTH and (category ~= "" and (var9 and (not var9.anyUploading and (not var9 or not var9.hasNonModerationFailure)))))
	local var35 = reactModule.useCallback(function()
		-- upvalues: var34 (ref), description (ref), category (ref), var25 (ref), fFlagEnablePlayerSupportCaptureAttachmentsModule (copy), var9 (write), p2 (ref)
		if var34 then
			pcall(function()
				-- upvalues: description (copy), category (copy), var25 (copy), fFlagEnablePlayerSupportCaptureAttachmentsModule (copy), var9 (copy)
				local socialService = game:GetService("SocialService")
				
				if socialService.SignalFeedbackSubmissionCompleted then
					local t = {
						Description = description,
						Category = category,
						ShareUserIdPreference = if var25 then "SHARE_USER_ID_PREFERENCE_SHARE" else "SHARE_USER_ID_PREFERENCE_DO_NOT_SHARE"
					}
					
					if fFlagEnablePlayerSupportCaptureAttachmentsModule then
						local t_1 = {}
						
						for i, v in var9.uploadStatuses do
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
			p2.closePrompt()
			
			return
		end
	end, {
		description, category, var25, var34, var9 or false, p2.closePrompt
	})
	local var36 = reactModule.useCallback(function()
		-- upvalues: p2 (ref)
		pcall(function()
			local socialService = game:GetService("SocialService")
			
			if socialService.SignalFeedbackSubmissionPermissionDenied then
				socialService:SignalFeedbackSubmissionPermissionDenied()
			end
		end)
		p2.onFormAbandoned()
		p2.closePrompt()
	end, { p2.closePrompt, p2.onFormAbandoned })
	local var37 = reactModule.useCallback(function()
		-- upvalues: p2 (ref)
		pcall(function()
			local socialService = game:GetService("SocialService")
			
			if socialService.SignalFeedbackSubmissionPermissionDenied then
				socialService:SignalFeedbackSubmissionPermissionDenied()
			end
		end)
		p2.onFormAbandoned()
		p2.closePrompt()
		pcall(function()
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
	end, { p2.closePrompt, p2.onFormAbandoned })
	useEscapeDismissModule("PlayerSupportPromptCancel", if fFlagEnablePlayerSupportCaptureAttachmentsModule then reactModule.useCallback(function()
		-- upvalues: var15 (write), var16 (write), var11 (write), var12 (write), var36 (ref)
		if var15 then
			var16(nil)
			
			return
		elseif var11 then
			var12(false)
			
			return
		end
		var36()
	end, { var15, var11, var36 }) else var36)
	
	return reactModule.createElement(dialog.Root, { hasBackdrop = true, onClose = var36 }, {
		Title = reactModule.createElement(dialog.Title, {
			text = if fFlagEnablePlayerSupportCaptureAttachmentsModule and var11 and var15 ~= nil then if var15.CaptureTime ~= nil then var23.CapturesAdd else var32.dateTime elseif fFlagEnablePlayerSupportCaptureAttachmentsModule and var11 then var23.CapturesAdd else var23.Title
		}),
		Content = if fFlagEnablePlayerSupportCaptureAttachmentsModule and var11 then reactModule.createElement(dialog.Content, { LayoutOrder = 1 }, {
			PickerBody = if var15 ~= nil then reactModule.createElement(capturePickerGridModule, {
				maxSelections = 5,
				captures = var10.captures,
				isLoading = var10.isLoading,
				hasMore = var10.hasMore,
				selectedKeys = var13,
				onToggle = var29,
				onPreview = function(p3)
					-- upvalues: var16 (write)
					var16(p3)
				end,
				onLoadMore = var10.loadMore
			}) else reactModule.createElement(capturePickerPreviewModule, { capture = var15 })
		}) else reactModule.createElement(dialog.Content, { LayoutOrder = 1 }, {
			Body = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y",
				padding = { top = UDim.new(0, -(var8.Gap.XLarge - var8.Gap.Large)) }
			}, {
				ReportAbuseRow = reactModule.createElement(view, { tag = "row gap-small auto-y", LayoutOrder = 0 }, {
					Lead = reactModule.createElement(text, {
						tag = "auto-xy",
						LayoutOrder = 1,
						Text = var23.ReportAbuseLead
					}),
					Link = reactModule.createElement(text, {
						RichText = true,
						tag = "auto-xy",
						LayoutOrder = 2,
						Text = var23.ReportAbuseLink,
						onActivated = var37,
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
						Text = var23.CategoryLabel,
						textStyle = var8.Color.Content.Emphasis
					}),
					DropdownBorder = reactModule.createElement(view, {
						tag = "radius-medium",
						LayoutOrder = 2,
						Size = UDim2.new(1, -var8.Stroke.Standard * 2, 0, 0),
						Position = UDim2.new(0, var8.Stroke.Standard, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						stroke = {
							Color = var8.Color.Stroke.Default.Color3,
							Thickness = var8.Stroke.Standard,
							Transparency = var8.Color.Stroke.Default.Transparency
						},
						cornerRadius = UDim.new(0, var8.Radius.Medium)
					}, {
						Dropdown = reactModule.createElement(dropdown.Root, {
							label = "",
							value = if category ~= "" then nil else category,
							placeholder = var23.CategoryPlaceholder,
							items = list,
							size = inputSize.Medium,
							variant = inputVariant.Utility,
							width = UDim.new(1, 0),
							onItemChanged = function(p3)
								-- upvalues: setCategory (ref)
								setCategory(tostring(p3))
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
						Text = var23.DescriptionLabel,
						textStyle = var8.Color.Content.Emphasis
					}),
					InputBorderSlot = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
						InputBorder = reactModule.createElement(view, {
							tag = "radius-medium",
							Size = UDim2.new(1, -var8.Stroke.Standard * 2, 0, 0),
							Position = UDim2.new(0, var8.Stroke.Standard, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							stroke = {
								Color = var8.Color.Stroke.Default.Color3,
								Thickness = var8.Stroke.Standard,
								Transparency = var8.Color.Stroke.Default.Transparency
							},
							cornerRadius = UDim.new(0, var8.Radius.Medium)
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
						Text = var23.DescriptionHint,
						textStyle = var8.Color.Content.Emphasis
					})
				}),
				CapturesSection = if fFlagEnablePlayerSupportCaptureAttachmentsModule then reactModule.createElement(var1, {
					maxSelections = 5,
					uploadStatuses = var9.uploadStatuses,
					category = category,
					onCaptureRemoved = var9.onCaptureRemoved,
					onPickerOpen = var28
				}) else nil,
				ShareCheckboxRow = reactModule.createElement(view, {
					tag = "col gap-xsmall size-full-0 auto-y",
					LayoutOrder = if fFlagEnablePlayerSupportCaptureAttachmentsModule then 4 else 3
				}, {
					Checkbox = reactModule.createElement(checkbox, {
						LayoutOrder = 1,
						label = if var24 then var23.ShareUserIdLabelRequired else var23.ShareUserIdLabel,
						isChecked = var25,
						isDisabled = var24,
						onActivated = function(p3)
							-- upvalues: setShareUserId (ref)
							setShareUserId(p3)
						end,
						size = inputSize.Medium
					}),
					HintRow = reactModule.createElement(view, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 2,
						padding = {
							left = UDim.new(0, var8.Size.Size_600 + var8.Gap.Medium)
						}
					}, {
						Hint = reactModule.createElement(text, {
							tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
							Text = var23.ShareUserIdHint
						})
					})
				})
			})
		}),
		Actions = if fFlagEnablePlayerSupportCaptureAttachmentsModule and var11 then reactModule.createElement(dialog.Actions, {
			LayoutOrder = 2,
			actions = if var15 ~= nil then {
				{
					text = var23.Add,
					variant = if var26 > 0 then buttonVariant.Emphasis else buttonVariant.Standard,
					isDisabled = var26 == 0 and not next(var9.uploadStatuses),
					onActivated = var30
				},
				{
					text = var23.Cancel,
					variant = buttonVariant.Standard,
					onActivated = function()
						-- upvalues: var12 (write)
						var12(false)
					end
				}
			} else (function()
				-- upvalues: getCaptureKeyModule (copy), var15 (write), var13 (write), var27 (write), var23 (ref), buttonVariant (copy), var29 (write), var16 (write)
				local var38 = var13[getCaptureKeyModule(var15)] == true
				local var39 = var38 or not var27
				
				return {
					{
						text = if var38 then var23.Deselect else var23.Select,
						variant = if var38 then buttonVariant.SoftEmphasis elseif var39 then buttonVariant.Emphasis else buttonVariant.Standard,
						isDisabled = not var39 and not var38,
						onActivated = function()
							-- upvalues: var29 (copy), var15 (copy), var16 (copy)
							var29(var15)
							var16(nil)
						end
					},
					{
						text = var23.Cancel,
						variant = buttonVariant.Standard,
						onActivated = function()
							-- upvalues: var16 (copy)
							var16(nil)
						end
					}
				}
			end)()
		}) else reactModule.createElement(dialog.Actions, {
			LayoutOrder = 2,
			actions = {
				{
					text = var23.Send,
					variant = if var34 then buttonVariant.Emphasis else buttonVariant.Standard,
					onActivated = var35,
					isDisabled = not var34
				}
			}
		})
	})
end)