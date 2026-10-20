local Parent = script:FindFirstAncestor("LandingPage").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Enums = FoundationModule.Enums
local UserLibModule = require(Parent.UserLib)
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = UserLibModule.Utils.Constants
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.AccountCarouselAvatar)
local GetFFlagEnableManageAccountsRedesignFunction = require(Parent.SharedFlags).GetFFlagEnableManageAccountsRedesign

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), GetFFlagEnableManageAccountsRedesignFunction (copy), ReactModule (copy), FoundationModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy), Enums (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		signedOut = "Authentication.AccountPicker.Label.SignedOut"
	})
	local EnableSignedOutAccounts = GetFFlagEnableManageAccountsRedesignFunction() and p1.enableSignedOutAccounts
	local Elements = {}
	
	if #p1.accounts == 0 then
		p1.onClose()
	end
	for LayoutOrder, account in ipairs(p1.accounts) do
		local Username = account.username
		
		if Username == nil then
			Username = ""
		end
		Elements[LayoutOrder] = ReactModule.createElement(FoundationModule.View, {
			tag = {
				["size-full-0 auto-y items-center padding-bottom-small"] = true,
				col = EnableSignedOutAccounts,
				["row padding-x-small"] = not EnableSignedOutAccounts
			},
			LayoutOrder = LayoutOrder
		}, {
			AccountCard = ReactModule.createElement(FoundationModule.View, {
				BackgroundTransparency = 1,
				tag = {
					["row size-full-0 auto-y wrap gap-medium radius-medium align-y-center"] = true,
					["padding-y-small padding-left-small"] = EnableSignedOutAccounts,
					["padding-y-medium padding-left-medium"] = not EnableSignedOutAccounts
				}
			}, {
				Avatar = ReactModule.createElement(FoundationModule.View, {
					tag = "col shrink size-1200-1200 radius-full self-center",
					LayoutOrder = 0
				}, {
					AvatarContainer = ReactModule.createElement(FoundationModule.View, {
						tag = "radius-circle bg-surface-200",
						Size = UDim2.new(0, 48, 0, 48)
					}, {
						AvatarImage = ReactModule.createElement(FoundationModule.Image, {
							tag = "radius-circle",
							Size = UDim2.new(1, 0, 1, 0),
							Image = GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(account.user_id), Constants.RbxthumbTypes.AvatarHeadShot, 150)
						})
					})
				}),
				AccountInfo = ReactModule.createElement(FoundationModule.View, { tag = "col fill auto-y items-start", LayoutOrder = 1 }, {
					DisplayName = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-y size-full-0 text-title-large text-align-x-left",
						LayoutOrder = 0,
						Text = account.display_name or Username,
						TextTruncate = Enum.TextTruncate.SplitWord
					}),
					Username = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-y size-full-0 text-body-small text-align-x-left",
						LayoutOrder = 1,
						Text = "@" .. Username,
						TextTruncate = Enum.TextTruncate.SplitWord
					})
				}),
				SignedOutPill = if EnableSignedOutAccounts and not account.has_valid_session then ReactModule.createElement(FoundationModule.View, {
					tag = "col auto-xy padding-x-small padding-y-xsmall radius-small bg-action-alert",
					LayoutOrder = 2
				}, {
					PillText = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy text-caption-large text-align-x-center text-title-medium",
						Text = UseLocalizationResult.signedOut
					})
				}) else nil,
				DeleteButton = ReactModule.createElement(FoundationModule.View, {
					tag = "col auto-xy size-full-0 items-end",
					LayoutOrder = 3
				}, {
					DeleteIcon = ReactModule.createElement(FoundationModule.IconButton, {
						icon = Enums.IconName.TrashCan,
						size = Enums.InputSize.Medium,
						onActivated = function()
							-- upvalues: p1 (copy), account (copy)
							p1.setRemoveAccount(account)
						end
					})
				})
			})
		})
	end
	return if EnableSignedOutAccounts then ReactModule.createElement(ReactModule.Fragment, nil, Elements) else ReactModule.createElement(FoundationModule.View, { tag = "col auto-xy size-full-0 auto-y padding-small" }, {
		ScrollView = ReactModule.createElement(FoundationModule.ScrollView, {
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.XY,
				CanvasSize = UDim2.fromOffset(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y,
				scrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility.None
			},
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			AccountElements = ReactModule.createElement(FoundationModule.View, { tag = "col auto-x size-full-0", LayoutOrder = 2 }, Elements)
		})
	})
end