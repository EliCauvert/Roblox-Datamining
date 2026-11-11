local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = require(Parent.AppCommonLib).Text
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetSelectedUsersStoreModule = require(AppChat.Stores.GetSelectedUsersStore)
local UseUserDataModule = require(AppChat.Hooks.useUserData)
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local UseIsRobloxSubscriberFunction = require(Parent.UserProfiles).Hooks.useIsRobloxSubscriber
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)

local function noOp() end

local Repeated = string.rep("W", 20)

return ReactModule.memo(function(p1)
	-- upvalues: UseUserDataModule (copy), FoundationModule (copy), UseIsRobloxSubscriberFunction (copy), FFlagEnableBlackbirdCheck (copy), GetSelectedUsersStoreModule (copy), UseSignalStateFunction (copy), ReactModule (copy), Text (copy), Repeated (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), noOp (copy)
	local UseUserDataModuleResult = UseUserDataModule(p1.userId)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseIsRobloxSubscriberResult = UseIsRobloxSubscriberFunction(if FFlagEnableBlackbirdCheck then p1.userId else nil)
	local SelectedUsersStoreModule = GetSelectedUsersStoreModule(false)
	local UseSignalStateResult = UseSignalStateFunction(SelectedUsersStoreModule.getIsUserSelected(p1.userId))
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: SelectedUsersStoreModule (copy), p1 (copy)
		SelectedUsersStoreModule.toggleUserId(p1.userId)
	end, { p1.userId })
	local UseMemoResult = ReactModule.useMemo(function(): UDim2
		-- upvalues: Text (upval), Repeated (upval), UseTokensResult (copy)
		local TextBounds = Text.GetTextBounds(Repeated, UseTokensResult.Typography.TitleLarge.Font, UseTokensResult.Typography.TitleLarge.FontSize, Vector2.zero)
		
		return UDim2.fromOffset(TextBounds.X, TextBounds.Y)
	end, {
		UseTokensResult.Typography.TitleLarge.Font,
		UseTokensResult.Typography.TitleLarge.FontSize
	})
	local UseMemoResult1 = ReactModule.useMemo(function(): UDim2
		-- upvalues: Text (upval), UseTokensResult (copy)
		local RobloxStudioTextBounds = Text.GetTextBounds("Roblox Studio", UseTokensResult.Typography.CaptionMedium.Font, UseTokensResult.Typography.CaptionMedium.FontSize, Vector2.zero)
		
		return UDim2.fromOffset(RobloxStudioTextBounds.X, RobloxStudioTextBounds.Y)
	end, {
		UseTokensResult.Typography.CaptionMedium.Font,
		UseTokensResult.Typography.CaptionMedium.FontSize
	})
	local v1 = nil
	local UseStateResult2 = nil
	
	if FFlagDebugAppChatEnableDomLocatorsModule then
		v1, UseStateResult2 = ReactModule.useState("")
		ReactModule.__subscribeToBinding(UseUserDataModuleResult.username, function(p2)
			-- upvalues: UseStateResult2 (ref)
			UseStateResult2(p2)
		end)
	end
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row size-full-0 auto-y stroke-muted stroke-thin gap-medium padding-x-medium padding-y-small align-y-center",
		onActivated = UseResult,
		testId = if FFlagDebugAppChatEnableDomLocatorsModule then DomLocatorsModule.selectChatMembersUserCellWithCheckbox(v1, UseSignalStateResult) else nil
	}, {
		Avatar = ReactModule.createElement(FoundationModule.Avatar, {
			LayoutOrder = 1,
			userId = UseUserDataModuleResult.id,
			userPresence = UseUserDataModuleResult.presence,
			size = FoundationModule.Enums.InputSize.Medium,
			backgroundStyle = UseTokensResult.Color.Shift.Shift_300
		}),
		UserInfo = ReactModule.createElement(FoundationModule.View, { tag = "col fill auto-y clip", LayoutOrder = 2 }, {
			UserDataSkeleton = ReactModule.createElement(FoundationModule.Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(UseMemoResult.X, UseMemoResult.Y + UseMemoResult1.Y),
				Visible = UseUserDataModuleResult.isLoading
			}),
			DisplayNameRow = if FFlagEnableBlackbirdCheck then ReactModule.createElement(FoundationModule.View, {
				tag = "row auto-xy align-y-center gap-xsmall",
				LayoutOrder = 1,
				Visible = UseUserDataModuleResult.isLoading:map(function(p2): boolean
					return not p2
				end)
			}, {
				DisplayName = ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-xy text-title-large text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = UseUserDataModuleResult.combinedName
				}),
				SubscriptionBadge = if UseIsRobloxSubscriberResult then ReactModule.createElement(FoundationModule.Icon, {
					LayoutOrder = 2,
					name = FoundationModule.Enums.IconName.RobloxPlus,
					size = FoundationModule.Enums.IconSize.Small,
					style = UseTokensResult.Color.Content.Emphasis
				}) else nil
			}) else nil,
			DisplayName = if FFlagEnableBlackbirdCheck then nil else ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-title-large text-truncate-end content-emphasis",
				LayoutOrder = 1,
				Text = UseUserDataModuleResult.combinedName,
				Visible = UseUserDataModuleResult.isLoading:map(function(p2): boolean
					return not p2
				end)
			}),
			PresenceText = ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-caption-medium text-truncate-end content-muted",
				LayoutOrder = 3,
				Text = UseUserDataModuleResult.presenceText,
				Visible = UseUserDataModuleResult.isLoading:map(function(p2): boolean
					return not p2
				end)
			})
		}),
		CheckboxContainer = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy padding-x-medium",
			isDisabled = true,
			LayoutOrder = 3,
			onActivated = noOp,
			selection = { Selectable = false }
		}, {
			checkbox = ReactModule.createElement(FoundationModule.Checkbox, {
				label = "",
				Selectable = false,
				isChecked = UseSignalStateResult,
				size = FoundationModule.Enums.InputSize.XSmall,
				onActivated = noOp
			})
		})
	})
end)