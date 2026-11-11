local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local React = DependenciesModule.React
local UseLocalizationFunction = DependenciesModule.Localization.Hooks.useLocalization
local Foundation = DependenciesModule.Foundation
local Sheet = Foundation.Sheet
local View = Foundation.View
local Text = Foundation.Text
local Avatar = Foundation.Avatar
local InputSize = Foundation.Enums.InputSize
local ButtonVariant = Foundation.Enums.ButtonVariant
local UseTokensFunction = Foundation.Hooks.useTokens
local EditAccountPicker = DependenciesModule.LandingPage.Components.EditAccountPicker
local AccountSwitchingAddAccountModule = require(script.Parent.AccountSwitchingAddAccount)
local GetFFlagEnableAccountSwitcherManageAccountsFunction = DependenciesModule.SharedFlags.GetFFlagEnableAccountSwitcherManageAccounts
local GetFFlagEnableAccountSwitcherSignedOutAccountsFunction = DependenciesModule.SharedFlags.GetFFlagEnableAccountSwitcherSignedOutAccounts
local GetFIntAccountSwitcherAccountLimitFunction = DependenciesModule.SharedFlags.GetFIntAccountSwitcherAccountLimit
local GetFFlagEnableAccountSwitcherAddWithMaxSignedOutFunction = DependenciesModule.SharedFlags.GetFFlagEnableAccountSwitcherAddWithMaxSignedOut
local GetFFlagEnableLoginDisambiguationFoundationSwitcherFunction = DependenciesModule.SharedFlags.GetFFlagEnableLoginDisambiguationFoundationSwitcher
local GetFFlagEnableAccountSwitcherUncheckedBadgeFunction = DependenciesModule.SharedFlags.GetFFlagEnableAccountSwitcherUncheckedBadge
local UseAppPolicyFunction = DependenciesModule.UniversalAppPolicy.useAppPolicy
local AnalyticsEventsModule = require(Parent.Analytics.AnalyticsEvents)
local EventConstantsModule = require(Parent.Analytics.EventConstants)
local FixManageAccountsUserIdBug = game:DefineFastFlag("FixManageAccountsUserIdBug", false)

return React.memo(function(p1)
	-- upvalues: GetFFlagEnableLoginDisambiguationFoundationSwitcherFunction (copy), UseLocalizationFunction (copy), UseTokensFunction (copy), React (copy), GetFFlagEnableAccountSwitcherSignedOutAccountsFunction (copy), GetFFlagEnableAccountSwitcherUncheckedBadgeFunction (copy), UseAppPolicyFunction (copy), AnalyticsEventsModule (copy), EventConstantsModule (copy), FixManageAccountsUserIdBug (copy), GetFFlagEnableAccountSwitcherAddWithMaxSignedOutFunction (copy), GetFIntAccountSwitcherAccountLimitFunction (copy), Avatar (copy), InputSize (copy), View (copy), Text (copy), Foundation (copy), Sheet (copy), ButtonVariant (copy), GetFFlagEnableAccountSwitcherManageAccountsFunction (copy), AccountSwitchingAddAccountModule (copy), EditAccountPicker (copy)
	local ShowFoundationDisambiguationSelector = GetFFlagEnableLoginDisambiguationFoundationSwitcherFunction() and p1.showFoundationDisambiguationSelector
	local IsHideActions: boolean = ShowFoundationDisambiguationSelector and p1.hideActions == true
	local UseLocalizationResult = UseLocalizationFunction({
		manageAccountsText = "Authentication.AccountPicker.Label.ManageAccounts",
		addAccountText = "Authentication.AccountSwitch.Action.AddAnAccount",
		signedOutText = "Authentication.AccountPicker.Label.SignedOut",
		maxAccountsReachedText = "Authentication.AccountSwitch.Description.AccountLimit.2",
		signedOut = "Authentication.AccountPicker.Label.SignedOut",
		uncheckedLabel = "CommonUI.Features.Label.Unchecked",
		titleText = ShowFoundationDisambiguationSelector and p1.titleTextKey or "Authentication.AccountSwitch.Header.SwitchAccountSentenceCase"
	})
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = React.useState(true)
	local UseStateResult1, UseStateResult2_1 = React.useState(false)
	local UseStateResult3, UseStateResult2_2 = React.useState(false)
	local UseStateResult4, UseStateResult2_3 = React.useState(p1.isMaxAccountsReached)
	local UseRefResult = React.useRef(false)
	local UseRefResult1 = React.useRef(IsHideActions)
	local UseRefResult2 = React.useRef(p1.onAccountSelectionAbandoned)
	UseRefResult1.current = IsHideActions
	UseRefResult2.current = p1.onAccountSelectionAbandoned
	local EnableSignedOutAccounts = GetFFlagEnableAccountSwitcherSignedOutAccountsFunction() and p1.enableSignedOutAccounts
	local UseAppPolicyResult = if GetFFlagEnableAccountSwitcherUncheckedBadgeFunction() then UseAppPolicyFunction(function(p2)
		return p2.getShowUncheckedBadgeForAccountSwitcher()
	end) else false
	React.useEffect(function()
		-- upvalues: p1 (copy), AnalyticsEventsModule (upval)
		local List = {}
		
		for _, user in p1.users do
			table.insert(List, (tostring(user.id)))
		end
		if p1.context and p1.origin then
			AnalyticsEventsModule.sendPageLoadEvent(p1.context, p1.origin, table.concat(List, ","))
		end
	end, {})
	React.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy), UseRefResult2 (copy)
		return function()
			-- upvalues: UseRefResult1 (upval), UseRefResult (upval), UseRefResult2 (upval)
			if UseRefResult1.current and not UseRefResult.current then
				local CurrentFunction: () -> () = UseRefResult2.current
				
				if CurrentFunction then
					CurrentFunction()
				end
			end
		end
	end, {})
	
	local function OnClose()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), p1 (copy)
		UseRefResult.current = true
		UseStateResult2(false)
		
		if p1.onAccountSelectionAbandoned then
			p1.onAccountSelectionAbandoned()
		end
		if p1.onClose then
			p1.onClose()
		end
	end
	
	local function OnActivated()
		-- upvalues: p1 (copy), AnalyticsEventsModule (upval), EventConstantsModule (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
		if p1.context and p1.origin then
			AnalyticsEventsModule.sendButtonClickEvent(p1.context, p1.origin, EventConstantsModule.btn.addAccount)
		end
		UseStateResult2(false)
		UseStateResult2_1(true)
	end
	
	local function OnClose1(p2)
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2 (copy), p1 (copy)
		local P2 = p2 or false
		UseStateResult2_1(false)
		
		if P2 then
			UseStateResult2(true)
			
			return
		end
		if p1.onClose then
			p1.onClose()
		end
	end
	
	local function OnActivated1()
		-- upvalues: p1 (copy), AnalyticsEventsModule (upval), EventConstantsModule (upval), UseStateResult2 (copy), UseStateResult2_2 (copy)
		if p1.context and p1.origin then
			AnalyticsEventsModule.sendButtonClickEvent(p1.context, p1.origin, EventConstantsModule.btn.manageAccounts)
		end
		UseStateResult2(false)
		UseStateResult2_2(true)
	end
	
	local function OnClose2()
		-- upvalues: UseStateResult2_2 (copy), UseStateResult2 (copy)
		UseStateResult2_2(false)
		UseStateResult2(true)
	end
	
	local UseStateResult5, UseStateResult2_4 = React.useState(p1.users)
	
	local function v39()
		-- upvalues: UseStateResult5 (copy)
		local List = {}
		local Iterator = ipairs
		local UseStateResult5_1 = UseStateResult5 or {}
		for _, value in Iterator(UseStateResult5_1) do
			table.insert(List, {
				user_id = tostring(value.id),
				username = value.name,
				display_name = value.displayName,
				has_valid_session = value.hasValidSession,
				is_current_user = value.isUnselectable
			})
		end
		return List
	end
	
	local function OnAccountsUpdated(List)
		-- upvalues: FixManageAccountsUserIdBug (upval), UseStateResult2_4 (copy), GetFFlagEnableAccountSwitcherAddWithMaxSignedOutFunction (upval), UseStateResult4 (copy), GetFIntAccountSwitcherAccountLimitFunction (upval), UseStateResult2_3 (copy)
		local List1 = {}
		
		for _, value in ipairs(List) do
			table.insert(List1, {
				id = if FixManageAccountsUserIdBug then value.user_id else tonumber(value.user_id),
				name = value.username,
				displayName = value.display_name,
				hasValidSession = value.has_valid_session,
				isUnselectable = value.is_current_user
			})
		end
		UseStateResult2_4(List1)
		local CountList1 = #List1
		
		if GetFFlagEnableAccountSwitcherAddWithMaxSignedOutFunction() then
			local Count = 0
			
			for _, value1 in ipairs(List1) do
				if value1.hasValidSession then
					Count += 1
				end
			end
			CountList1 = Count
		end
		if UseStateResult4 and CountList1 < GetFIntAccountSwitcherAccountLimitFunction() then
			UseStateResult2_3(false)
		end
	end
	
	local Elements = {}
	
	local function _(p2)
		-- upvalues: p1 (copy), AnalyticsEventsModule (upval), UseRefResult (copy)
		return function()
			-- upvalues: p2 (copy), p1 (upval), AnalyticsEventsModule (upval), UseRefResult (upval)
			if not p2.isUnselectable then
				if p1.context and p1.origin then
					AnalyticsEventsModule.sendSelectEvent(p1.context, p1.origin, (tostring(p2.id)))
				end
				UseRefResult.current = true
				p1.onAccountSelection(p2.id)
			end
		end
	end
	
	local RowAlignYCenterAlignXRightGapXsmallSizeFull0AutoXy: string = if GetFFlagEnableAccountSwitcherUncheckedBadgeFunction() then "row align-y-center align-x-right gap-xsmall size-full-0 auto-xy" else "col items-end size-full-0 auto-xy"
	for LayoutOrder, value in UseStateResult5 do
		local Name = value.name or ""
		local IsIsUnselectable: boolean = UseAppPolicyResult and value.isUnselectable == true
		Elements[`Row_{LayoutOrder}`] = React.createElement(View, {
			tag = "row wrap align-y-center gap-small size-full-0 auto-y padding-x-large padding-y-medium",
			LayoutOrder = LayoutOrder,
			onActivated = function()
				-- upvalues: value (copy), p1 (copy), AnalyticsEventsModule (upval), UseRefResult (copy)
				if not value.isUnselectable then
					if p1.context and p1.origin then
						AnalyticsEventsModule.sendSelectEvent(p1.context, p1.origin, (tostring(value.id)))
					end
					UseRefResult.current = true
					p1.onAccountSelection(value.id)
				end
			end
		}, {
			Avatar = React.createElement(Avatar, {
				LayoutOrder = 0,
				tag = "auto-y",
				userId = assert(tonumber(value.id), "Expected account user id to be numeric"),
				size = InputSize.Large,
				backgroundStyle = {
					Color3 = UseTokensResult.Color.Shift.Shift_300.Color3,
					Transparency = UseTokensResult.Color.Shift.Shift_300.Transparency
				}
			}),
			AccountInfo = React.createElement(View, { tag = "col items-start fill auto-y", LayoutOrder = 1 }, {
				DisplayName = React.createElement(Text, {
					tag = "size-full-0 auto-y text-title-large text-align-x-left",
					LayoutOrder = 0,
					Text = value.displayName or Name,
					TextTruncate = Enum.TextTruncate.SplitWord
				}),
				Username = React.createElement(Text, {
					tag = "size-full-0 auto-y text-body-small text-align-x-left",
					LayoutOrder = 1,
					Text = "@" .. Name,
					TextTruncate = Enum.TextTruncate.SplitWord
				})
			}),
			RightStatus = React.createElement(View, {
				LayoutOrder = 2,
				tag = RowAlignYCenterAlignXRightGapXsmallSizeFull0AutoXy
			}, {
				UncheckedBadge = if IsIsUnselectable then React.createElement(Foundation.Badge, {
					LayoutOrder = 1,
					testId = "AccountSwitcherActiveUserUncheckedBadge",
					text = UseLocalizationResult.uncheckedLabel,
					variant = Foundation.Enums.BadgeVariant.Neutral
				}) else nil,
				Status = if value.iconKey or value.isUnselectable then React.createElement(Foundation.Icon, {
					name = Foundation.Enums.IconName.CircleCheck,
					size = Foundation.Enums.IconSize.Large,
					variant = Foundation.Enums.IconVariant.Filled,
					LayoutOrder = if GetFFlagEnableAccountSwitcherUncheckedBadgeFunction() then 2 else nil
				}) elseif IsHideActions or value.hasValidSession then nil else React.createElement(Foundation.View, {
					tag = "col auto-xy padding-x-small padding-y-xsmall radius-small bg-action-alert",
					LayoutOrder = 2
				}, {
					PillText = React.createElement(Foundation.Text, {
						tag = "auto-xy text-caption-large text-align-x-center text-title-medium",
						Text = UseLocalizationResult.signedOut
					})
				})
			})
		})
	end
	local NewSmall = UseTokensResult.Padding.Small + UseTokensResult.Padding.Medium
	Elements._NegPadding = React.createElement("UIPadding", {
		PaddingLeft = UDim.new(0, -NewSmall),
		PaddingRight = UDim.new(0, -NewSmall)
	})
	
	return React.createElement(React.Fragment, nil, {
		SelectAccountSheet = UseStateResult and React.createElement(Sheet.Root, {
			preferCenterSheet = true,
			tag = "col auto-y size-full",
			onClose = OnClose
		}, {
			Header = React.createElement(Sheet.Header, { hasCloseAffordance = true }, {
				Title = React.createElement(Text, {
					tag = "auto-xy text-heading-small content-emphasis",
					Text = UseLocalizationResult.titleText
				})
			}),
			Content = React.createElement(Sheet.Content, nil, {
				Accounts = React.createElement(View, { tag = "col size-full-0 auto-y" }, Elements)
			}),
			Actions = if IsHideActions then nil else React.createElement(Sheet.Actions, nil, {
				ActionList = React.createElement(View, { tag = "col auto-y gap-small size-full-0" }, {
					LimitReached = UseStateResult4 and React.createElement(View, {
						tag = "col size-full-0 padding-bottom-small auto-y",
						LayoutOrder = 0
					}, {
						AccountLimitReachedText = React.createElement(Foundation.Text, {
							RichText = true,
							tag = "size-full-0 text-wrap auto-y text-caption-medium content-default text-align-x-left",
							Text = UseLocalizationResult.maxAccountsReachedText
						})
					}),
					AddAccountButton = React.createElement(Foundation.Button, {
						LayoutOrder = 1,
						text = UseLocalizationResult.addAccountText,
						variant = ButtonVariant.Standard,
						onActivated = OnActivated,
						onClose = p1.onClose,
						isDisabled = UseStateResult4,
						width = UDim.new(1, 0)
					}),
					ManageAccountsButton = GetFFlagEnableAccountSwitcherManageAccountsFunction() and EnableSignedOutAccounts and React.createElement(Foundation.Button, {
						tag = "col size-full-0",
						LayoutOrder = 2,
						text = UseLocalizationResult.manageAccountsText,
						variant = ButtonVariant.Standard,
						onActivated = OnActivated1,
						width = UDim.new(1, 0)
					}) or nil
				})
			})
		}),
		AddAccountModal = UseStateResult1 and React.createElement(AccountSwitchingAddAccountModule, { onClose = OnClose1, origin = p1.origin }) or nil,
		ManageAccountsModal = UseStateResult3 and React.createElement(EditAccountPicker, {
			accounts = v39(),
			onClose = OnClose2,
			onAccountsUpdated = OnAccountsUpdated,
			logout = p1.logout,
			enableSignedOutAccounts = p1.enableSignedOutAccounts
		}) or nil
	})
end)