local coreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local parent = coreScriptsPlayerFeedback.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local checkbox = foundationModule.Checkbox
local dropdown = foundationModule.Dropdown
local textArea = foundationModule.TextArea
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local inputVariant = foundationModule.Enums.InputVariant
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local constantsModule = require(coreScriptsPlayerFeedback.constants)
local useEscapeDismissModule = require(coreScriptsPlayerFeedback.Hooks.useEscapeDismiss)
local t = {
	TICKET_CATEGORY_DATA_RESTORE_REQUEST = true,
	TICKET_CATEGORY_PURCHASING_ISSUE = true
}

return reactModule.memo(function(p0) --[[ line: 70 ]]
	-- upvalues: useTokens (ref), constantsModule (ref), useLocalization (ref), t (ref), reactModule (ref), useEscapeDismissModule (ref), dialog (ref), view (ref), text (ref), dropdown (ref), inputSize (ref), inputVariant (ref), textArea (ref), checkbox (ref), buttonVariant (ref)
	local var6 = useTokens()
	local description = p0.description
	local setDescription = p0.setDescription
	local category = p0.category
	local setCategory = p0.setCategory
	local shareUserId = p0.shareUserId
	local setShareUserId = p0.setShareUserId
	local MIN_FEEDBACK_LENGTH = constantsModule.MIN_FEEDBACK_LENGTH
	local MAX_PLAYER_SUPPORT_LENGTH = constantsModule.MAX_PLAYER_SUPPORT_LENGTH
	local var7 = useLocalization({
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
		DescriptionHint = {
			"CoreScripts.FeedbackPrompt.PlayerSupportPrompt.Description.CharacterLimitHint",
			MAX = tostring(MAX_PLAYER_SUPPORT_LENGTH)
		}
	})
	local list = {
		{
			id = "TICKET_CATEGORY_BUG_REPORT",
			text = var7.CategoryItemBugReport
		},
		{
			id = "TICKET_CATEGORY_DATA_RESTORE_REQUEST",
			text = var7.CategoryItemDataRestoreRequest
		},
		{
			id = "TICKET_CATEGORY_PURCHASING_ISSUE",
			text = var7.CategoryItemPurchasingIssue
		},
		{
			id = "TICKET_CATEGORY_OTHER",
			text = var7.CategoryItemOther
		}
	}
	local t_1 = {
		TICKET_CATEGORY_BUG_REPORT = var7.DescriptionPlaceholderBugReport,
		TICKET_CATEGORY_DATA_RESTORE_REQUEST = var7.DescriptionPlaceholderDataRestoreRequest,
		TICKET_CATEGORY_PURCHASING_ISSUE = var7.DescriptionPlaceholderPurchasingIssue,
		TICKET_CATEGORY_OTHER = var7.DescriptionPlaceholderOther
	}
	local var10 = t[category] == true
	local var10_1 = var10 or shareUserId
	local var12 = MIN_FEEDBACK_LENGTH <= #description and (#description <= MAX_PLAYER_SUPPORT_LENGTH and category ~= "")
	local var13 = reactModule.useCallback(function() --[[ line: 142 ]]
		-- upvalues: var12 (ref), description (ref), category (ref), var10_1 (ref), p0 (ref)
		if var12 then
			pcall(function() --[[ line: 146 ]]
				-- upvalues: description (copy), category (copy), var10_1 (copy)
				local socialService = game:GetService("SocialService")
				
				if socialService.SignalFeedbackSubmissionCompleted then
					socialService:SignalFeedbackSubmissionCompleted("", {
						Description = description,
						Category = category,
						ShareUserIdPreference = if var10_1 then "SHARE_USER_ID_PREFERENCE_SHARE" else "SHARE_USER_ID_PREFERENCE_DO_NOT_SHARE"
					})
				end
			end)
			p0.closePrompt()
			
			return
		end
	end, {
		description,
		category,
		var10_1,
		var12,
		p0.closePrompt
	})
	local var14 = reactModule.useCallback(function() --[[ line: 166 ]]
		-- upvalues: p0 (ref)
		pcall(function() --[[ line: 167 ]]
			local socialService = game:GetService("SocialService")
			
			if socialService.SignalFeedbackSubmissionPermissionDenied then
				socialService:SignalFeedbackSubmissionPermissionDenied()
			end
		end)
		p0.onFormAbandoned()
		p0.closePrompt()
	end, { p0.closePrompt, p0.onFormAbandoned })
	local var15 = reactModule.useCallback(function() --[[ line: 182 ]]
		-- upvalues: p0 (ref)
		pcall(function() --[[ line: 183 ]]
			local socialService = game:GetService("SocialService")
			
			if socialService.SignalFeedbackSubmissionPermissionDenied then
				socialService:SignalFeedbackSubmissionPermissionDenied()
			end
		end)
		p0.onFormAbandoned()
		p0.closePrompt()
		pcall(function() --[[ line: 191 ]]
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
	end, { p0.closePrompt, p0.onFormAbandoned })
	useEscapeDismissModule("PlayerSupportPromptCancel", var14)
	
	return reactModule.createElement(dialog.Root, { hasBackdrop = true, onClose = var14 }, {
		Title = reactModule.createElement(dialog.Title, { text = var7.Title }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 1 }, {
			Body = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y",
				padding = { top = UDim.new(0, -(var6.Gap.XLarge - var6.Gap.Large)) }
			}, {
				ReportAbuseRow = reactModule.createElement(view, { tag = "row gap-small auto-y", LayoutOrder = 0 }, {
					Lead = reactModule.createElement(text, {
						tag = "auto-xy",
						LayoutOrder = 1,
						Text = var7.ReportAbuseLead
					}),
					Link = reactModule.createElement(text, {
						RichText = true,
						tag = "auto-xy",
						LayoutOrder = 2,
						Text = var7.ReportAbuseLink,
						onActivated = var15,
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
						Text = var7.CategoryLabel,
						textStyle = var6.Color.Content.Emphasis
					}),
					DropdownBorder = reactModule.createElement(view, {
						tag = "radius-medium",
						LayoutOrder = 2,
						Size = UDim2.new(1, -var6.Stroke.Standard * 2, 0, 0),
						Position = UDim2.new(0, var6.Stroke.Standard, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						stroke = {
							Color = var6.Color.Stroke.Default.Color3,
							Thickness = var6.Stroke.Standard,
							Transparency = var6.Color.Stroke.Default.Transparency
						},
						cornerRadius = UDim.new(0, var6.Radius.Medium)
					}, {
						Dropdown = reactModule.createElement(dropdown.Root, {
							label = "",
							value = if category ~= "" then nil else category,
							placeholder = var7.CategoryPlaceholder,
							items = list,
							size = inputSize.Medium,
							variant = inputVariant.Utility,
							width = UDim.new(1, 0),
							onItemChanged = function(p1) --[[ line: 272 ]]
								-- upvalues: setCategory (ref)
								setCategory(tostring(p1))
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
						Text = var7.DescriptionLabel,
						textStyle = var6.Color.Content.Emphasis
					}),
					InputBorderSlot = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
						InputBorder = reactModule.createElement(view, {
							tag = "radius-medium",
							Size = UDim2.new(1, -var6.Stroke.Standard * 2, 0, 0),
							Position = UDim2.new(0, var6.Stroke.Standard, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							stroke = {
								Color = var6.Color.Stroke.Default.Color3,
								Thickness = var6.Stroke.Standard,
								Transparency = var6.Color.Stroke.Default.Transparency
							},
							cornerRadius = UDim.new(0, var6.Radius.Medium)
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
						Text = var7.DescriptionHint,
						textStyle = var6.Color.Content.Emphasis
					})
				}),
				ShareCheckboxRow = reactModule.createElement(view, {
					tag = "col gap-xsmall size-full-0 auto-y",
					LayoutOrder = 3
				}, {
					Checkbox = reactModule.createElement(checkbox, {
						LayoutOrder = 1,
						label = if var10 then var7.ShareUserIdLabelRequired else var7.ShareUserIdLabel,
						isChecked = var10_1,
						isDisabled = var10,
						onActivated = function(p2) --[[ line: 338 ]]
							-- upvalues: setShareUserId (ref)
							setShareUserId(p2)
						end,
						size = inputSize.Medium
					}),
					HintRow = reactModule.createElement(view, {
						tag = "size-full-0 auto-y",
						LayoutOrder = 2,
						padding = { left = UDim.new(0, var6.Size.Size_600 + var6.Gap.Medium) }
					}, {
						Hint = reactModule.createElement(text, {
							tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-muted",
							Text = var7.ShareUserIdHint
						})
					})
				})
			})
		}),
		Actions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 2,
			actions = {
				{
					text = var7.Send,
					variant = if var12 then buttonVariant.Emphasis else buttonVariant.Standard,
					onActivated = var13,
					isDisabled = not var12
				}
			}
		})
	})
end)