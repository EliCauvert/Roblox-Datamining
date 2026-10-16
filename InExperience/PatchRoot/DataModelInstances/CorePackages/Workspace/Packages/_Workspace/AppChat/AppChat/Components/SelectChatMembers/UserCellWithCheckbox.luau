local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FFlagAppChatUseProfileFrameThumbnailModule = require(AppChat.Flags.FFlagAppChatUseProfileFrameThumbnail)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = require(Parent.AppCommonLib).Text
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetSelectedUsersStoreModule = require(AppChat.Stores.GetSelectedUsersStore)
local UseUserDataModule = require(AppChat.Hooks.useUserData)
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local UseIsRobloxSubscriberFunction = require(Parent.UserProfiles).Hooks.useIsRobloxSubscriber
local FFlagDebugAppChatEnableDomLocatorsModule = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocatorsModule = require(AppChat.Utils.DomLocators)

local function noOp() --[[ Line: 32 ]] end

local Repeated = string.rep("W", 20)

return ReactModule.memo(function(p1) --[[ Line: 38 ]]
	-- upvalues: UseUserDataModule (copy), FoundationModule (copy), UseIsRobloxSubscriberFunction (copy), FFlagEnableBlackbirdCheck (copy), GetSelectedUsersStoreModule (copy), UseSignalStateFunction (copy), ReactModule (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), Repeated (copy), Text (copy), FFlagDebugAppChatEnableDomLocatorsModule (copy), DomLocatorsModule (copy), FFlagAppChatUseProfileFrameThumbnailModule (copy), noOp (copy)
	local UseUserDataModuleResult = UseUserDataModule(p1.userId)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseIsRobloxSubscriberResult = UseIsRobloxSubscriberFunction(if FFlagEnableBlackbirdCheck then p1.userId else nil)
	local SelectedUsersStoreModule = GetSelectedUsersStoreModule(false)
	local UseSignalStateResult = UseSignalStateFunction(SelectedUsersStoreModule.getIsUserSelected(p1.userId))
	local UseResult = ReactModule.useCallback(function() --[[ Line: 47 ]]
		-- upvalues: SelectedUsersStoreModule (copy), p1 (copy)
		SelectedUsersStoreModule.toggleUserId(p1.userId)
	end, { p1.userId })
	local UseMemoResult = ReactModule.useMemo(function(): UDim2 --[[ Line: 51 ]]
		-- upvalues: FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), Repeated (upval), UseTokensResult (copy), Text (upval)
		local TextSize = if FoundationFontFaceMigration then GetTextSizeFunction(Repeated, UseTokensResult.Typography.TitleLarge.FontSize, UseTokensResult.Typography.TitleLarge.Font, Vector2.zero) else Text.GetTextBounds(Repeated, UseTokensResult.Typography.TitleLarge.Font, UseTokensResult.Typography.TitleLarge.FontSize, Vector2.zero)
		
		return UDim2.fromOffset(TextSize.X, TextSize.Y)
	end, {
		UseTokensResult.Typography.TitleLarge.Font,
		UseTokensResult.Typography.TitleLarge.FontSize
	})
	local UseMemoResult1 = ReactModule.useMemo(function(): UDim2 --[[ Line: 68 ]]
		-- upvalues: FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), UseTokensResult (copy), Text (upval)
		local RobloxStudio = if FoundationFontFaceMigration then GetTextSizeFunction("Roblox Studio", UseTokensResult.Typography.CaptionMedium.FontSize, UseTokensResult.Typography.CaptionMedium.Font, Vector2.zero) else Text.GetTextBounds("Roblox Studio", UseTokensResult.Typography.CaptionMedium.Font, UseTokensResult.Typography.CaptionMedium.FontSize, Vector2.zero)
		
		return UDim2.fromOffset(RobloxStudio.X, RobloxStudio.Y)
	end, {
		UseTokensResult.Typography.CaptionMedium.Font,
		UseTokensResult.Typography.CaptionMedium.FontSize
	})
	local v1 = nil
	local UseStateResult2 = nil
	
	if FFlagDebugAppChatEnableDomLocatorsModule then
		v1, UseStateResult2 = ReactModule.useState("")
		ReactModule.__subscribeToBinding(UseUserDataModuleResult.username, function(p2) --[[ Line: 88 ]]
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
			backgroundStyle = UseTokensResult.Color.Shift.Shift_300,
			includeProfileFrame = FFlagAppChatUseProfileFrameThumbnailModule
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
				Visible = UseUserDataModuleResult.isLoading:map(function(p2): boolean --[[ Line: 122 ]]
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
				Visible = UseUserDataModuleResult.isLoading:map(function(p2): boolean --[[ Line: 146 ]]
					return not p2
				end)
			}),
			PresenceText = ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-caption-medium text-truncate-end content-muted",
				LayoutOrder = 3,
				Text = UseUserDataModuleResult.presenceText,
				Visible = UseUserDataModuleResult.isLoading:map(function(p2): boolean --[[ Line: 155 ]]
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