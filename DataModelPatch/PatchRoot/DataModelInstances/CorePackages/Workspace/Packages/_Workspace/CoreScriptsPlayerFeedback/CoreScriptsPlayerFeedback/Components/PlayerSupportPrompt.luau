local CoreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local Parent = CoreScriptsPlayerFeedback.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local Checkbox = FoundationModule.Checkbox
local Dropdown = FoundationModule.Dropdown
local TextArea = FoundationModule.TextArea
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local InputVariant = FoundationModule.Enums.InputVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(CoreScriptsPlayerFeedback.constants)
local UseEscapeDismissModule = require(CoreScriptsPlayerFeedback.Hooks.useEscapeDismiss)
local config = {
	TICKET_CATEGORY_DATA_RESTORE_REQUEST = true,
	TICKET_CATEGORY_PURCHASING_ISSUE = true
}

return (ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ConstantsModule (copy), UseLocalizationFunction (copy), config (copy), ReactModule (copy), UseEscapeDismissModule (copy), Dialog (copy), View (copy), Text (copy), Dropdown (copy), InputSize (copy), InputVariant (copy), TextArea (copy), Checkbox (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local Description = p1.description
	local SetDescription = p1.setDescription
	local Category = p1.category
	local SetCategoryFunction = p1.setCategory
	local ShareUserId = p1.shareUserId
	local SetShareUserIdFunction = p1.setShareUserId
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
			MAX = tostring(MAXPLAYERSUPPORTLENGTH)
		}
	})
	local Items = {
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
		},
		{
			id = "TICKET_CATEGORY_OTHER",
			text = UseLocalizationResult.CategoryItemOther
		}
	}
	local config1 = {
		TICKET_CATEGORY_BUG_REPORT = UseLocalizationResult.DescriptionPlaceholderBugReport,
		TICKET_CATEGORY_DATA_RESTORE_REQUEST = UseLocalizationResult.DescriptionPlaceholderDataRestoreRequest,
		TICKET_CATEGORY_PURCHASING_ISSUE = UseLocalizationResult.DescriptionPlaceholderPurchasingIssue,
		TICKET_CATEGORY_OTHER = UseLocalizationResult.DescriptionPlaceholderOther
	}
	local IsEntry = config[Category] == true
	local IsEntry1 = IsEntry or ShareUserId
	local IsNotCategoryMatch: boolean = MINFEEDBACKLENGTH <= #Description and #Description <= MAXPLAYERSUPPORTLENGTH and Category ~= ""
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: IsNotCategoryMatch (copy), Description (copy), Category (copy), IsEntry1 (copy), p1 (copy)
		if IsNotCategoryMatch then
			pcall(function()
				-- upvalues: Description (upval), Category (upval), IsEntry1 (upval)
				local SocialService = game:GetService("SocialService")
				
				if SocialService.SignalFeedbackSubmissionCompleted then
					SocialService:SignalFeedbackSubmissionCompleted("", {
						Description = Description,
						Category = Category,
						ShareUserIdPreference = if IsEntry1 then "SHARE_USER_ID_PREFERENCE_SHARE" else "SHARE_USER_ID_PREFERENCE_DO_NOT_SHARE"
					})
				end
			end)
			p1.closePrompt()
			
			return
		end
	end, {
		Description,
		Category,
		IsEntry1,
		IsNotCategoryMatch,
		p1.closePrompt
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		pcall(function()
			local SocialService = game:GetService("SocialService")
			
			if SocialService.SignalFeedbackSubmissionPermissionDenied then
				SocialService:SignalFeedbackSubmissionPermissionDenied()
			end
		end)
		p1.onFormAbandoned()
		p1.closePrompt()
	end, { p1.closePrompt, p1.onFormAbandoned })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		pcall(function()
			local SocialService = game:GetService("SocialService")
			
			if SocialService.SignalFeedbackSubmissionPermissionDenied then
				SocialService:SignalFeedbackSubmissionPermissionDenied()
			end
		end)
		p1.onFormAbandoned()
		p1.closePrompt()
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
	end, { p1.closePrompt, p1.onFormAbandoned })
	UseEscapeDismissModule("PlayerSupportPromptCancel", UseResult1)
	
	return ReactModule.createElement(Dialog.Root, { hasBackdrop = true, onClose = UseResult1 }, {
		Title = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.Title }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 1 }, {
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
						onActivated = UseResult2,
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
							items = Items,
							size = InputSize.Medium,
							variant = InputVariant.Utility,
							width = UDim.new(1, 0),
							onItemChanged = function(p2)
								-- upvalues: SetCategoryFunction (copy)
								SetCategoryFunction((tostring(p2)))
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
								placeholder = config1[Category] or "",
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
				ShareCheckboxRow = ReactModule.createElement(View, {
					tag = "col gap-xsmall size-full-0 auto-y",
					LayoutOrder = 3
				}, {
					Checkbox = ReactModule.createElement(Checkbox, {
						LayoutOrder = 1,
						label = if IsEntry then UseLocalizationResult.ShareUserIdLabelRequired else UseLocalizationResult.ShareUserIdLabel,
						isChecked = IsEntry1,
						isDisabled = IsEntry,
						onActivated = function(p2)
							-- upvalues: SetShareUserIdFunction (copy)
							SetShareUserIdFunction(p2)
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
		}),
		Actions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 2,
			actions = {
				{
					text = UseLocalizationResult.Send,
					variant = if IsNotCategoryMatch then ButtonVariant.Emphasis else ButtonVariant.Standard,
					onActivated = UseResult,
					isDisabled = not IsNotCategoryMatch
				}
			}
		})
	})
end))